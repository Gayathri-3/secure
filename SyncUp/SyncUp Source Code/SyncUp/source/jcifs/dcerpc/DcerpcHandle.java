package jcifs.dcerpc;

import java.net.*;
import java.io.*;
import java.security.*;
import jcifs.smb.*;
import jcifs.dcerpc.ndr.*;

public abstract class DcerpcHandle implements DcerpcConstants
{
    private static int call_id;
    protected DcerpcBinding binding;
    protected int max_recv;
    protected int max_xmit;
    protected DcerpcSecurityProvider securityProvider;
    protected int state;
    
    static {
        DcerpcHandle.call_id = 1;
    }
    
    public DcerpcHandle() {
        super();
        this.max_xmit = 4280;
        this.max_recv = this.max_xmit;
        this.state = 0;
        this.securityProvider = null;
    }
    
    public static DcerpcHandle getHandle(final String s, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws UnknownHostException, MalformedURLException, DcerpcException {
        if (s.startsWith("ncacn_np:")) {
            return new DcerpcPipeHandle(s, ntlmPasswordAuthentication);
        }
        throw new DcerpcException("DCERPC transport not supported: " + s);
    }
    
    protected static DcerpcBinding parseBinding(final String s) throws DcerpcException {
        final char[] charArray = s.toCharArray();
        String substring = null;
        String trim = null;
        DcerpcBinding dcerpcBinding = null;
        int length = 0;
        int n = 0;
        int n2 = 0;
        do {
            final char c = charArray[length];
            switch (n2) {
                default: {
                    length = charArray.length;
                    break;
                }
                case 0: {
                    if (c == ':') {
                        substring = s.substring(n, length);
                        n = length + 1;
                        n2 = 1;
                        break;
                    }
                    break;
                }
                case 1: {
                    if (c == '\\') {
                        n = length + 1;
                        break;
                    }
                    n2 = 2;
                }
                case 2: {
                    if (c != '[') {
                        break;
                    }
                    while (true) {
                        if (s.substring(n, length).trim().length() == 0) {
                            dcerpcBinding = new DcerpcBinding(substring, s.substring(n, length));
                            n = length + 1;
                            n2 = 5;
                            break;
                        }
                        continue;
                    }
                }
                case 5: {
                    if (c == '=') {
                        trim = s.substring(n, length).trim();
                        n = length + 1;
                        break;
                    }
                    if (c == ',' || c == ']') {
                        final String trim2 = s.substring(n, length).trim();
                        if (trim == null) {
                            trim = "endpoint";
                        }
                        dcerpcBinding.setOption(trim, trim2);
                        trim = null;
                        break;
                    }
                    break;
                }
            }
        } while (++length < charArray.length);
        if (dcerpcBinding == null || dcerpcBinding.endpoint == null) {
            throw new DcerpcException("Invalid binding URL: " + s);
        }
        return dcerpcBinding;
    }
    
    public void bind() throws DcerpcException, IOException {
        synchronized (this) {
            try {
                this.state = 1;
                this.sendrecv(new DcerpcBind(this.binding, this));
            }
            catch (IOException ex) {
                this.state = 0;
                throw ex;
            }
        }
    }
    
    public abstract void close() throws IOException;
    
    protected abstract void doReceiveFragment(final byte[] p0, final boolean p1) throws IOException;
    
    protected abstract void doSendFragment(final byte[] p0, final int p1, final int p2, final boolean p3) throws IOException;
    
    public Principal getPrincipal() {
        Principal principal;
        if (this instanceof DcerpcPipeHandle) {
            principal = ((DcerpcPipeHandle)this).pipe.getPrincipal();
        }
        else {
            principal = null;
        }
        return principal;
    }
    
    public String getServer() {
        String server;
        if (this instanceof DcerpcPipeHandle) {
            server = ((DcerpcPipeHandle)this).pipe.getServer();
        }
        else {
            server = null;
        }
        return server;
    }
    
    public void sendrecv(final DcerpcMessage dcerpcMessage) throws DcerpcException, IOException {
        if (this.state == 0) {
            this.bind();
        }
        while (true) {
            boolean b = true;
            byte[] buffer = BufferCache.getBuffer();
            while (true) {
                Label_0546: {
                    int length;
                    try {
                        final NdrBuffer ndrBuffer = new NdrBuffer(buffer, 0);
                        dcerpcMessage.flags = 3;
                        final int call_id = DcerpcHandle.call_id;
                        DcerpcHandle.call_id = call_id + 1;
                        dcerpcMessage.call_id = call_id;
                        dcerpcMessage.encode(ndrBuffer);
                        if (this.securityProvider != null) {
                            ndrBuffer.setIndex(0);
                            this.securityProvider.wrap(ndrBuffer);
                        }
                        int alloc_hint;
                        for (int n = -24 + ndrBuffer.getLength(), i = 0; i < n; i += alloc_hint) {
                            alloc_hint = n - i;
                            if (alloc_hint + 24 > this.max_xmit) {
                                dcerpcMessage.flags &= 0xFFFFFFFD;
                                alloc_hint = -24 + this.max_xmit;
                            }
                            else {
                                dcerpcMessage.flags |= 0x2;
                                dcerpcMessage.alloc_hint = alloc_hint;
                                b = false;
                            }
                            dcerpcMessage.length = alloc_hint + 24;
                            if (i > 0) {
                                dcerpcMessage.flags &= 0xFFFFFFFE;
                            }
                            if ((0x3 & dcerpcMessage.flags) != 0x3) {
                                ndrBuffer.start = i;
                                ndrBuffer.reset();
                                dcerpcMessage.encode_header(ndrBuffer);
                                ndrBuffer.enc_ndr_long(dcerpcMessage.alloc_hint);
                                ndrBuffer.enc_ndr_short(0);
                                ndrBuffer.enc_ndr_short(dcerpcMessage.getOpnum());
                            }
                            this.doSendFragment(buffer, i, dcerpcMessage.length, b);
                        }
                        this.doReceiveFragment(buffer, b);
                        ndrBuffer.reset();
                        ndrBuffer.setIndex(8);
                        ndrBuffer.setLength(ndrBuffer.dec_ndr_short());
                        if (this.securityProvider != null) {
                            this.securityProvider.unwrap(ndrBuffer);
                        }
                        ndrBuffer.setIndex(0);
                        dcerpcMessage.decode_header(ndrBuffer);
                        length = 24;
                        if (dcerpcMessage.ptype == 2 && !dcerpcMessage.isFlagSet(2)) {
                            length = dcerpcMessage.length;
                        }
                        break Label_0546;
                        // iftrue(Label_0399:, !dcerpcMessage.isFlagSet(2))
                        dcerpcMessage.decode(new NdrBuffer(buffer, 0));
                        BufferCache.releaseBuffer(buffer);
                        // iftrue(Label_0545:, result == null)
                        throw dcerpcMessage.getResult();
                    }
                    finally {
                        BufferCache.releaseBuffer(buffer);
                    }
                    final byte[] array;
                    final NdrBuffer ndrBuffer2;
                    Label_0399: {
                        if (array == null) {
                            array = new byte[this.max_recv];
                            ndrBuffer2 = new NdrBuffer(array, 0);
                        }
                    }
                    this.doReceiveFragment(array, b);
                    ndrBuffer2.reset();
                    ndrBuffer2.setIndex(8);
                    ndrBuffer2.setLength(ndrBuffer2.dec_ndr_short());
                    if (this.securityProvider != null) {
                        this.securityProvider.unwrap(ndrBuffer2);
                    }
                    ndrBuffer2.reset();
                    dcerpcMessage.decode_header(ndrBuffer2);
                    final int n2 = -24 + dcerpcMessage.length;
                    if (length + n2 > buffer.length) {
                        final byte[] array2 = new byte[length + n2];
                        System.arraycopy(buffer, 0, array2, 0, length);
                        buffer = array2;
                    }
                    System.arraycopy(array, 24, buffer, length, n2);
                    length += n2;
                    continue;
                }
                NdrBuffer ndrBuffer2 = null;
                byte[] array = null;
                continue;
            }
        }
        Label_0545:;
    }
    
    public void setDcerpcSecurityProvider(final DcerpcSecurityProvider securityProvider) {
        this.securityProvider = securityProvider;
    }
    
    public String toString() {
        return this.binding.toString();
    }
}
