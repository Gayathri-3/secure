package jcifs.smb;

import java.net.*;
import jcifs.util.*;
import jcifs.util.transport.*;
import java.io.*;

public class SmbFileInputStream extends InputStream
{
    private int access;
    SmbFile file;
    private long fp;
    private int openFlags;
    private int readSize;
    private int readSizeFile;
    private byte[] tmp;
    
    public SmbFileInputStream(final String s) throws SmbException, MalformedURLException, UnknownHostException {
        this(new SmbFile(s));
    }
    
    public SmbFileInputStream(final SmbFile smbFile) throws SmbException, MalformedURLException, UnknownHostException {
        this(smbFile, 1);
    }
    
    SmbFileInputStream(final SmbFile file, final int n) throws SmbException, MalformedURLException, UnknownHostException {
        super();
        this.tmp = new byte[1];
        this.file = file;
        this.openFlags = (n & 0xFFFF);
        this.access = (0xFFFF & n >>> 16);
        if (file.type != 16) {
            file.open(n, this.access, 128, 0);
            this.openFlags &= 0xFFFFFFAF;
        }
        else {
            file.connect0();
        }
        this.readSize = Math.min(-70 + file.tree.session.transport.rcv_buf_size, -70 + file.tree.session.transport.server.maxBufferSize);
        if ((0x4000 & file.tree.session.transport.server.capabilities) == 0x4000 && !file.tree.session.transport.server.signaturesRequired) {
            this.readSizeFile = Math.min(SmbConstants.RCV_BUF_SIZE, 65535);
        }
        else {
            this.readSizeFile = this.readSize;
        }
    }
    
    public int available() throws IOException {
        final int type = this.file.type;
        int available = 0;
        if (type == 16) {
            TransPeekNamedPipeResponse transPeekNamedPipeResponse;
            try {
                final SmbNamedPipe smbNamedPipe = (SmbNamedPipe)this.file;
                this.file.open(32, 0xFF0000 & smbNamedPipe.pipeType, 128, 0);
                final TransPeekNamedPipe transPeekNamedPipe = new TransPeekNamedPipe(this.file.unc, this.file.fid);
                transPeekNamedPipeResponse = new TransPeekNamedPipeResponse(smbNamedPipe);
                smbNamedPipe.send(transPeekNamedPipe, transPeekNamedPipeResponse);
                if (transPeekNamedPipeResponse.status == 1 || transPeekNamedPipeResponse.status == 4) {
                    this.file.opened = false;
                    available = 0;
                    return available;
                }
            }
            catch (SmbException ex) {
                throw this.seToIoe(ex);
            }
            available = transPeekNamedPipeResponse.available;
        }
        return available;
    }
    
    public void close() throws IOException {
        try {
            this.file.close();
            this.tmp = null;
        }
        catch (SmbException ex) {
            throw this.seToIoe(ex);
        }
    }
    
    public int read() throws IOException {
        int n = -1;
        if (this.read(this.tmp, 0, 1) != n) {
            n = (0xFF & this.tmp[0]);
        }
        return n;
    }
    
    public int read(final byte[] array) throws IOException {
        return this.read(array, 0, array.length);
    }
    
    public int read(final byte[] array, final int n, final int n2) throws IOException {
        return this.readDirect(array, n, n2);
    }
    
    public int readDirect(final byte[] array, final int n, int n2) throws IOException {
        int n3;
        if (n2 <= 0) {
            n3 = 0;
        }
        else {
            final long fp = this.fp;
            if (this.tmp == null) {
                throw new IOException("Bad file descriptor");
            }
            this.file.open(this.openFlags, this.access, 128, 0);
            final LogStream log = SmbFile.log;
            if (LogStream.level >= 4) {
                SmbFile.log.println("read: fid=" + this.file.fid + ",off=" + n + ",len=" + n2);
            }
            final SmbComReadAndXResponse smbComReadAndXResponse = new SmbComReadAndXResponse(array, n);
            if (this.file.type == 16) {
                smbComReadAndXResponse.responseTimeout = 0L;
            }
            int dataLength = 0;
            int n4 = 0;
        Label_0220_Outer:
            do {
            Label_0340_Outer:
                while (true) {
                    Label_0165: {
                        int n5 = 0;
                        while (true) {
                            Label_0155: {
                                if (this.file.getType() == 1) {
                                    n5 = this.readSizeFile;
                                    break Label_0155;
                                }
                                Label_0331: {
                                    break Label_0331;
                                    while (true) {
                                        while (true) {
                                            Label_0383: {
                                                try {
                                                    final SmbComReadAndX smbComReadAndX = new SmbComReadAndX(this.file.fid, this.fp, n4, null);
                                                    if (this.file.type == 16) {
                                                        smbComReadAndX.remaining = 1024;
                                                        smbComReadAndX.maxCount = 1024;
                                                        smbComReadAndX.minCount = 1024;
                                                    }
                                                    this.file.send(smbComReadAndX, smbComReadAndXResponse);
                                                    dataLength = smbComReadAndXResponse.dataLength;
                                                    if (dataLength > 0) {
                                                        break;
                                                    }
                                                    if (this.fp - fp > 0L) {
                                                        final long n6 = this.fp - fp;
                                                        n3 = (int)n6;
                                                        return n3;
                                                    }
                                                    break Label_0383;
                                                    n5 = this.readSize;
                                                    break Label_0155;
                                                    n4 = n2;
                                                    break Label_0165;
                                                }
                                                catch (SmbException ex) {
                                                    if (this.file.type == 16 && ex.getNtStatus() == -1073741493) {
                                                        n3 = -1;
                                                        return n3;
                                                    }
                                                    throw this.seToIoe(ex);
                                                }
                                            }
                                            final long n6 = -1L;
                                            continue Label_0340_Outer;
                                        }
                                    }
                                }
                                this.fp += dataLength;
                                n2 -= dataLength;
                                smbComReadAndXResponse.off += dataLength;
                                continue Label_0220_Outer;
                            }
                            if (n2 <= n5) {
                                continue;
                            }
                            break;
                        }
                        n4 = n5;
                    }
                    final LogStream log2 = SmbFile.log;
                    if (LogStream.level >= 4) {
                        SmbFile.log.println("read: len=" + n2 + ",r=" + n4 + ",fp=" + this.fp);
                    }
                    continue Label_0340_Outer;
                }
            } while (n2 > 0 && dataLength == n4);
            n3 = (int)(this.fp - fp);
        }
        return n3;
    }
    
    protected IOException seToIoe(final SmbException ex) {
        IOException ex2 = ex;
        Throwable t = ex.getRootCause();
        if (t instanceof TransportException) {
            ex2 = (TransportException)t;
            t = ((TransportException)ex2).getRootCause();
        }
        if (t instanceof InterruptedException) {
            ex2 = new InterruptedIOException(t.getMessage());
            ex2.initCause(t);
        }
        return ex2;
    }
    
    public long skip(long n) throws IOException {
        if (n > 0L) {
            this.fp += n;
        }
        else {
            n = 0L;
        }
        return n;
    }
}
