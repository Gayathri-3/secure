package jcifs.smb;

import jcifs.*;
import java.util.*;
import jcifs.util.*;
import java.io.*;
import java.net.*;
import jcifs.util.transport.*;
import jcifs.netbios.*;

public class SmbTransport extends Transport implements SmbConstants
{
    static final byte[] BUF;
    static final SmbComNegotiate NEGOTIATE_REQUEST;
    static HashMap dfsRoots;
    static LogStream log;
    UniAddress address;
    int capabilities;
    SigningDigest digest;
    int flags2;
    InputStream in;
    SmbComBlankResponse key;
    InetAddress localAddr;
    int localPort;
    int maxMpxCount;
    int mid;
    OutputStream out;
    int port;
    int rcv_buf_size;
    LinkedList referrals;
    byte[] sbuf;
    ServerData server;
    long sessionExpiration;
    int sessionKey;
    LinkedList sessions;
    int snd_buf_size;
    Socket socket;
    String tconHostName;
    boolean useUnicode;
    
    static {
        BUF = new byte[65535];
        NEGOTIATE_REQUEST = new SmbComNegotiate();
        SmbTransport.log = LogStream.getInstance();
        SmbTransport.dfsRoots = null;
    }
    
    SmbTransport(final UniAddress address, final int port, final InetAddress localAddr, final int localPort) {
        super();
        this.sbuf = new byte[512];
        this.key = new SmbComBlankResponse();
        this.sessionExpiration = System.currentTimeMillis() + SmbTransport.SO_TIMEOUT;
        this.referrals = new LinkedList();
        this.digest = null;
        this.sessions = new LinkedList();
        this.server = new ServerData();
        this.flags2 = SmbTransport.FLAGS2;
        this.maxMpxCount = SmbTransport.MAX_MPX_COUNT;
        this.snd_buf_size = SmbTransport.SND_BUF_SIZE;
        this.rcv_buf_size = SmbTransport.RCV_BUF_SIZE;
        this.capabilities = SmbTransport.CAPABILITIES;
        this.sessionKey = 0;
        this.useUnicode = SmbTransport.USE_UNICODE;
        this.tconHostName = null;
        this.address = address;
        this.port = port;
        this.localAddr = localAddr;
        this.localPort = localPort;
    }
    
    static SmbTransport getSmbTransport(final UniAddress uniAddress, final int n) {
        synchronized (SmbTransport.class) {
            return getSmbTransport(uniAddress, n, SmbTransport.LADDR, SmbTransport.LPORT, null);
        }
    }
    
    static SmbTransport getSmbTransport(final UniAddress uniAddress, final int n, final InetAddress inetAddress, final int n2, final String s) {
        synchronized (SmbTransport.class) {
            synchronized (SmbTransport.CONNECTIONS) {
                if (SmbTransport.SSN_LIMIT != 1) {
                    final ListIterator listIterator = SmbTransport.CONNECTIONS.listIterator();
                    while (listIterator.hasNext()) {
                        final SmbTransport smbTransport = listIterator.next();
                        if (smbTransport.matches(uniAddress, n, inetAddress, n2, s) && (SmbTransport.SSN_LIMIT == 0 || smbTransport.sessions.size() < SmbTransport.SSN_LIMIT)) {
                            // monitorexit(SmbTransport.CONNECTIONS)
                            return smbTransport;
                        }
                    }
                }
                final SmbTransport smbTransport3 = new SmbTransport(uniAddress, n, inetAddress, n2);
                SmbTransport.CONNECTIONS.add(0, smbTransport3);
                // monitorexit(SmbTransport.CONNECTIONS)
                return smbTransport3;
            }
        }
    }
    
    private void negotiate(int n, final ServerMessageBlock serverMessageBlock) throws IOException {
        final byte[] sbuf = this.sbuf;
        // monitorenter(sbuf)
        // monitorexit(sbuf)
        while (true) {
            Label_0166: {
                if (n != 139) {
                    break Label_0166;
                }
                int encode = 0;
                Label_0274: {
                    try {
                        this.ssn139();
                        final int mid = 1 + this.mid;
                        this.mid = mid;
                        if (mid == 32000) {
                            this.mid = 1;
                        }
                        SmbTransport.NEGOTIATE_REQUEST.mid = this.mid;
                        encode = SmbTransport.NEGOTIATE_REQUEST.encode(this.sbuf, 4);
                        Encdec.enc_uint32be(encode & 0xFFFF, this.sbuf, 0);
                        if (LogStream.level >= 4) {
                            SmbTransport.log.println(SmbTransport.NEGOTIATE_REQUEST);
                            if (LogStream.level >= 6) {
                                Hexdump.hexdump(SmbTransport.log, this.sbuf, 4, encode);
                            }
                        }
                        this.out.write(this.sbuf, 0, encode + 4);
                        this.out.flush();
                        if (this.peekKey() == null) {
                            throw new IOException("Connection negotiation failed");
                        }
                        break Label_0274;
                    }
                    finally {}
                    // monitorexit(sbuf)
                    break Label_0166;
                }
                final int n2 = 0xFFFF & Encdec.dec_uint16be(this.sbuf, 2);
                if (n2 < 33 || n2 + 4 > this.sbuf.length) {
                    throw new IOException("Invalid payload size: " + n2);
                }
                Transport.readn(this.in, this.sbuf, 36, n2 - 32);
                serverMessageBlock.decode(this.sbuf, 4);
                if (LogStream.level >= 4) {
                    SmbTransport.log.println(serverMessageBlock);
                    if (LogStream.level >= 6) {
                        Hexdump.hexdump(SmbTransport.log, this.sbuf, 4, encode);
                    }
                }
                this.checkStatus(SmbTransport.NEGOTIATE_REQUEST, serverMessageBlock);
                return;
            }
            if (n == 0) {
                n = 445;
            }
            this.socket = new Socket();
            if (this.localAddr != null) {
                this.socket.bind(new InetSocketAddress(this.localAddr, this.localPort));
            }
            this.socket.connect(new InetSocketAddress(this.address.getHostAddress(), n), SmbTransport.SO_TIMEOUT);
            this.socket.setSoTimeout(SmbTransport.SO_TIMEOUT);
            this.out = this.socket.getOutputStream();
            this.in = this.socket.getInputStream();
            continue;
        }
    }
    
    DfsReferral[] __getDfsReferrals(final NtlmPasswordAuthentication ntlmPasswordAuthentication, final String s, int numReferrals) throws SmbException {
        final SmbTree smbTree = this.getSmbSession(ntlmPasswordAuthentication).getSmbTree("IPC$", null);
        final Trans2GetDfsReferralResponse trans2GetDfsReferralResponse = new Trans2GetDfsReferralResponse();
        smbTree.send(new Trans2GetDfsReferral(s), trans2GetDfsReferralResponse);
        if (numReferrals == 0 || trans2GetDfsReferralResponse.numReferrals < numReferrals) {
            numReferrals = trans2GetDfsReferralResponse.numReferrals;
        }
        final DfsReferral[] array = new DfsReferral[numReferrals];
        final String[] array2 = new String[4];
        final long expiration = System.currentTimeMillis() + 1000L * Dfs.TTL;
        for (int i = 0; i < array.length; ++i) {
            final DfsReferral dfsReferral = new DfsReferral();
            dfsReferral.resolveHashes = ntlmPasswordAuthentication.hashesExternal;
            dfsReferral.ttl = trans2GetDfsReferralResponse.referrals[i].ttl;
            dfsReferral.expiration = expiration;
            if (s.equals("")) {
                dfsReferral.server = trans2GetDfsReferralResponse.referrals[i].path.substring(1).toLowerCase();
            }
            else {
                this.dfsPathSplit(trans2GetDfsReferralResponse.referrals[i].node, array2);
                dfsReferral.server = array2[1];
                dfsReferral.share = array2[2];
                dfsReferral.path = array2[3];
            }
            dfsReferral.pathConsumed = trans2GetDfsReferralResponse.pathConsumed;
            array[i] = dfsReferral;
        }
        return array;
    }
    
    void checkStatus(final ServerMessageBlock serverMessageBlock, final ServerMessageBlock serverMessageBlock2) throws SmbException {
        switch (serverMessageBlock2.errorCode = SmbException.getStatusByCode(serverMessageBlock2.errorCode)) {
            default: {
                throw new SmbException(serverMessageBlock2.errorCode, null);
            }
            case -1073741790:
            case -1073741718:
            case -1073741715:
            case -1073741714:
            case -1073741713:
            case -1073741712:
            case -1073741711:
            case -1073741710:
            case -1073741428:
            case -1073741260: {
                throw new SmbAuthException(serverMessageBlock2.errorCode);
            }
            case -1073741225: {
                if (serverMessageBlock.auth == null) {
                    throw new SmbException(serverMessageBlock2.errorCode, null);
                }
                final DfsReferral dfsReferrals = this.getDfsReferrals(serverMessageBlock.auth, serverMessageBlock.path, 1);
                if (dfsReferrals == null) {
                    throw new SmbException(serverMessageBlock2.errorCode, null);
                }
                SmbFile.dfs.insert(serverMessageBlock.path, dfsReferrals);
                throw dfsReferrals;
            }
            case -2147483643:
            case -1073741802:
            case 0: {
                if (serverMessageBlock2.verifyFailed) {
                    throw new SmbException("Signature verification failed.");
                }
            }
        }
    }
    
    public void connect() throws SmbException {
        try {
            super.connect(SmbTransport.RESPONSE_TIMEOUT);
        }
        catch (TransportException readError) {
            final String string = "Failed to connect: " + this.address;
            if (this.readError != null) {
                readError = this.readError;
            }
            throw new SmbException(string, readError);
        }
    }
    
    void dfsPathSplit(final String s, final String[] array) {
        final int n = -1 + array.length;
        int n2 = 0;
        final int length = s.length();
        int n3 = 0;
        int j;
        for (int i = 0; i != n; i = j) {
            if (n3 == length || s.charAt(n3) == '\\') {
                j = i + 1;
                array[i] = s.substring(n2, n3);
                n2 = n3 + 1;
            }
            else {
                j = i;
            }
            final int n4 = n3 + 1;
            if (n3 >= length) {
                while (j < array.length) {
                    final int n5 = j + 1;
                    array[j] = "";
                    j = n5;
                }
                return;
            }
            n3 = n4;
        }
        array[n] = s.substring(n2);
    }
    
    protected void doConnect() throws IOException {
        int n = 445;
        final SmbComNegotiateResponse smbComNegotiateResponse = new SmbComNegotiateResponse(this.server);
        while (true) {
            try {
                this.negotiate(this.port, smbComNegotiateResponse);
                if (smbComNegotiateResponse.dialectIndex > 10) {
                    throw new SmbException("This client does not support the negotiated dialect.");
                }
            }
            catch (ConnectException ex) {
                if (this.port == 0 || this.port == n) {
                    n = 139;
                }
                this.negotiate(this.port = n, smbComNegotiateResponse);
                continue;
            }
            catch (NoRouteToHostException ex2) {
                if (this.port == 0 || this.port == n) {
                    n = 139;
                }
                this.negotiate(this.port = n, smbComNegotiateResponse);
                continue;
            }
            break;
        }
        if ((Integer.MIN_VALUE & this.server.capabilities) != Integer.MIN_VALUE && this.server.encryptionKeyLength != 8 && SmbTransport.LM_COMPATIBILITY == 0) {
            throw new SmbException("Unexpected encryption key length: " + this.server.encryptionKeyLength);
        }
        this.tconHostName = this.address.getHostName();
        if (this.server.signaturesRequired || (this.server.signaturesEnabled && SmbTransport.SIGNPREF)) {
            this.flags2 |= 0x4;
        }
        else {
            this.flags2 &= 0xFFFB;
        }
        this.maxMpxCount = Math.min(this.maxMpxCount, this.server.maxMpxCount);
        if (this.maxMpxCount < 1) {
            this.maxMpxCount = 1;
        }
        this.snd_buf_size = Math.min(this.snd_buf_size, this.server.maxBufferSize);
        this.capabilities &= this.server.capabilities;
        if ((Integer.MIN_VALUE & this.server.capabilities) == Integer.MIN_VALUE) {
            this.capabilities |= Integer.MIN_VALUE;
        }
        if ((0x4 & this.capabilities) == 0x0) {
            if (SmbTransport.FORCE_UNICODE) {
                this.capabilities |= 0x4;
            }
            else {
                this.useUnicode = false;
                this.flags2 &= 0x7FFF;
            }
        }
    }
    
    protected void doDisconnect(final boolean b) throws IOException {
        final ListIterator listIterator = this.sessions.listIterator();
        try {
            while (listIterator.hasNext()) {
                listIterator.next().logoff(b);
            }
            if (this.socket != null) {
                this.socket.shutdownOutput();
            }
            if (this.out != null) {
                this.out.close();
            }
            if (this.in != null) {
                this.in.close();
            }
            if (this.socket != null) {
                this.socket.close();
            }
        }
        finally {
            this.digest = null;
            this.socket = null;
            this.tconHostName = null;
        }
    }
    
    protected void doRecv(final Response response) throws IOException {
        if (LogStream.level >= 3) {
            SmbTransport.log.println("Enter doRecv");
        }
        final ServerMessageBlock serverMessageBlock = (ServerMessageBlock)response;
        serverMessageBlock.useUnicode = this.useUnicode;
        final int n = Integer.MIN_VALUE & this.capabilities;
        boolean extendedSecurity = false;
        if (n == Integer.MIN_VALUE) {
            extendedSecurity = true;
        }
        serverMessageBlock.extendedSecurity = extendedSecurity;
        final int n2;
        synchronized (SmbTransport.BUF) {
            System.arraycopy(this.sbuf, 0, SmbTransport.BUF, 0, 36);
            n2 = (0xFFFF & Encdec.dec_uint16be(SmbTransport.BUF, 2));
            if (n2 < 33 || n2 + 4 > this.rcv_buf_size) {
                throw new IOException("Invalid payload size: " + n2);
            }
        }
        final int n3 = -1 & Encdec.dec_uint32le(SmbTransport.BUF, 9);
        if (serverMessageBlock.command == 46 && (n3 == 0 || n3 == -2147483643)) {
            final SmbComReadAndXResponse smbComReadAndXResponse = (SmbComReadAndXResponse)serverMessageBlock;
            Transport.readn(this.in, SmbTransport.BUF, 36, 27);
            serverMessageBlock.decode(SmbTransport.BUF, 4);
            final int n4 = -59 + smbComReadAndXResponse.dataOffset;
            if (smbComReadAndXResponse.byteCount > 0 && n4 > 0 && n4 < 4) {
                Transport.readn(this.in, SmbTransport.BUF, 63, n4);
            }
            if (smbComReadAndXResponse.dataLength > 0) {
                Transport.readn(this.in, smbComReadAndXResponse.b, smbComReadAndXResponse.off, smbComReadAndXResponse.dataLength);
            }
        }
        else {
            Transport.readn(this.in, SmbTransport.BUF, 36, n2 - 32);
            serverMessageBlock.decode(SmbTransport.BUF, 4);
            if (serverMessageBlock instanceof SmbComTransactionResponse) {
                ((SmbComTransactionResponse)serverMessageBlock).nextElement();
            }
        }
        if (this.digest != null && serverMessageBlock.errorCode == 0) {
            this.digest.verify(SmbTransport.BUF, 4, serverMessageBlock);
        }
        if (LogStream.level >= 4) {
            SmbTransport.log.println(response);
            if (LogStream.level >= 6) {
                Hexdump.hexdump(SmbTransport.log, SmbTransport.BUF, 4, n2);
            }
        }
        // monitorexit(array)
        if (LogStream.level >= 3) {
            SmbTransport.log.println("Exit doRecv");
        }
    }
    
    protected void doSend(final Request request) throws IOException {
        if (LogStream.level >= 3) {
            SmbTransport.log.println("Enter doSend");
        }
        synchronized (SmbTransport.BUF) {
            ServerMessageBlock andx = (ServerMessageBlock)request;
            final int encode = andx.encode(SmbTransport.BUF, 4);
            Encdec.enc_uint32be(0xFFFF & encode, SmbTransport.BUF, 0);
            if (LogStream.level >= 4) {
                do {
                    SmbTransport.log.println(andx);
                    if (!(andx instanceof AndXServerMessageBlock)) {
                        break;
                    }
                    andx = ((AndXServerMessageBlock)andx).andx;
                } while (andx != null);
                if (LogStream.level >= 6) {
                    Hexdump.hexdump(SmbTransport.log, SmbTransport.BUF, 4, encode);
                }
            }
            this.out.write(SmbTransport.BUF, 0, encode + 4);
            this.out.flush();
            // monitorexit(SmbTransport.BUF)
            if (LogStream.level >= 3) {
                SmbTransport.log.println("Exit doSend");
            }
        }
    }
    
    protected void doSend0(final Request request) throws IOException {
        try {
            this.doSend(request);
        }
        catch (IOException ex) {
            if (LogStream.level > 2) {
                ex.printStackTrace(SmbTransport.log);
            }
            try {
                this.disconnect(true);
                throw ex;
            }
            catch (IOException ex2) {
                ex2.printStackTrace(SmbTransport.log);
            }
        }
    }
    
    protected void doSkip() throws IOException {
        final int n = 0xFFFF & Encdec.dec_uint16be(this.sbuf, 2);
        if (n < 33 || n + 4 > this.rcv_buf_size) {
            this.in.skip(this.in.available());
        }
        else {
            this.in.skip(n - 32);
        }
    }
    
    DfsReferral getDfsReferrals(final NtlmPasswordAuthentication ntlmPasswordAuthentication, final String s, int numReferrals) throws SmbException {
        final SmbTree smbTree = this.getSmbSession(ntlmPasswordAuthentication).getSmbTree("IPC$", null);
        final Trans2GetDfsReferralResponse trans2GetDfsReferralResponse = new Trans2GetDfsReferralResponse();
        smbTree.send(new Trans2GetDfsReferral(s), trans2GetDfsReferralResponse);
        DfsReferral next;
        if (trans2GetDfsReferralResponse.numReferrals == 0) {
            next = null;
        }
        else {
            if (numReferrals == 0 || trans2GetDfsReferralResponse.numReferrals < numReferrals) {
                numReferrals = trans2GetDfsReferralResponse.numReferrals;
            }
            DfsReferral next2 = new DfsReferral();
            final String[] array = new String[4];
            final long expiration = System.currentTimeMillis() + 1000L * Dfs.TTL;
            int n = 0;
            while (true) {
                next2.resolveHashes = ntlmPasswordAuthentication.hashesExternal;
                next2.ttl = trans2GetDfsReferralResponse.referrals[n].ttl;
                next2.expiration = expiration;
                if (s.equals("")) {
                    next2.server = trans2GetDfsReferralResponse.referrals[n].path.substring(1).toLowerCase();
                }
                else {
                    this.dfsPathSplit(trans2GetDfsReferralResponse.referrals[n].node, array);
                    next2.server = array[1];
                    next2.share = array[2];
                    next2.path = array[3];
                }
                next2.pathConsumed = trans2GetDfsReferralResponse.pathConsumed;
                if (++n == numReferrals) {
                    break;
                }
                next2.append(new DfsReferral());
                next2 = next2.next;
            }
            next = next2.next;
        }
        return next;
    }
    
    SmbSession getSmbSession() {
        synchronized (this) {
            return this.getSmbSession(new NtlmPasswordAuthentication(null, null, null));
        }
    }
    
    SmbSession getSmbSession(final NtlmPasswordAuthentication auth) {
        synchronized (this) {
            final ListIterator listIterator = this.sessions.listIterator();
            while (listIterator.hasNext()) {
                final SmbSession smbSession = listIterator.next();
                if (smbSession.matches(auth)) {
                    smbSession.auth = auth;
                    return smbSession;
                }
            }
            if (SmbTransport.SO_TIMEOUT > 0) {
                final long sessionExpiration = this.sessionExpiration;
                final long currentTimeMillis = System.currentTimeMillis();
                if (sessionExpiration < currentTimeMillis) {
                    this.sessionExpiration = currentTimeMillis + SmbTransport.SO_TIMEOUT;
                    final ListIterator listIterator2 = this.sessions.listIterator();
                    while (listIterator2.hasNext()) {
                        final SmbSession smbSession3 = listIterator2.next();
                        if (smbSession3.expiration < currentTimeMillis) {
                            smbSession3.logoff(false);
                        }
                    }
                }
            }
            final SmbSession smbSession4 = new SmbSession(this.address, this.port, this.localAddr, this.localPort, auth);
            smbSession4.transport = this;
            this.sessions.add(smbSession4);
            return smbSession4;
        }
    }
    
    boolean hasCapability(final int n) throws SmbException {
        while (true) {
            try {
                this.connect(SmbTransport.RESPONSE_TIMEOUT);
                if ((n & this.capabilities) == n) {
                    return true;
                }
            }
            catch (IOException ex) {
                throw new SmbException(ex.getMessage(), ex);
            }
            return false;
        }
    }
    
    boolean isSignatureSetupRequired(final NtlmPasswordAuthentication ntlmPasswordAuthentication) {
        return (0x4 & this.flags2) != 0x0 && this.digest == null && ntlmPasswordAuthentication != NtlmPasswordAuthentication.NULL && !NtlmPasswordAuthentication.NULL.equals(ntlmPasswordAuthentication);
    }
    
    protected void makeKey(final Request request) throws IOException {
        final int mid = 1 + this.mid;
        this.mid = mid;
        if (mid == 32000) {
            this.mid = 1;
        }
        ((ServerMessageBlock)request).mid = this.mid;
    }
    
    boolean matches(final UniAddress uniAddress, final int n, final InetAddress inetAddress, final int n2, String hostName) {
        if (hostName == null) {
            hostName = uniAddress.getHostName();
        }
        return (this.tconHostName == null || hostName.equalsIgnoreCase(this.tconHostName)) && uniAddress.equals(this.address) && (n == 0 || n == this.port || (n == 445 && this.port == 139)) && (inetAddress == this.localAddr || (inetAddress != null && inetAddress.equals(this.localAddr))) && n2 == this.localPort;
    }
    
    protected Request peekKey() throws IOException {
        do {
            final int readn = Transport.readn(this.in, this.sbuf, 0, 4);
            final Request key = null;
            if (readn < 4) {
                return key;
            }
        } while (this.sbuf[0] == -123);
        final int readn2 = Transport.readn(this.in, this.sbuf, 4, 32);
        Request key = null;
        if (readn2 >= 32) {
            if (LogStream.level >= 4) {
                SmbTransport.log.println("New data read: " + this);
                Hexdump.hexdump(SmbTransport.log, this.sbuf, 4, 32);
            }
            while (this.sbuf[0] != 0 || this.sbuf[1] != 0 || this.sbuf[4] != -1 || this.sbuf[5] != 83 || this.sbuf[6] != 77 || this.sbuf[7] != 66) {
                for (int i = 0; i < 35; ++i) {
                    this.sbuf[i] = this.sbuf[i + 1];
                }
                final int read = this.in.read();
                key = null;
                if (read == -1) {
                    return key;
                }
                this.sbuf[35] = (byte)read;
            }
            this.key.mid = (0xFFFF & Encdec.dec_uint16le(this.sbuf, 34));
            key = this.key;
            return key;
        }
        return key;
    }
    
    void send(final ServerMessageBlock p0, final ServerMessageBlock p1) throws SmbException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: invokevirtual   jcifs/smb/SmbTransport.connect:()V
        //     4: aload_1        
        //     5: aload_1        
        //     6: getfield        jcifs/smb/ServerMessageBlock.flags2:I
        //     9: aload_0        
        //    10: getfield        jcifs/smb/SmbTransport.flags2:I
        //    13: ior            
        //    14: putfield        jcifs/smb/ServerMessageBlock.flags2:I
        //    17: aload_1        
        //    18: aload_0        
        //    19: getfield        jcifs/smb/SmbTransport.useUnicode:Z
        //    22: putfield        jcifs/smb/ServerMessageBlock.useUnicode:Z
        //    25: aload_1        
        //    26: aload_2        
        //    27: putfield        jcifs/smb/ServerMessageBlock.response:Ljcifs/smb/ServerMessageBlock;
        //    30: aload_1        
        //    31: getfield        jcifs/smb/ServerMessageBlock.digest:Ljcifs/smb/SigningDigest;
        //    34: ifnonnull       45
        //    37: aload_1        
        //    38: aload_0        
        //    39: getfield        jcifs/smb/SmbTransport.digest:Ljcifs/smb/SigningDigest;
        //    42: putfield        jcifs/smb/ServerMessageBlock.digest:Ljcifs/smb/SigningDigest;
        //    45: aload_2        
        //    46: ifnonnull       57
        //    49: aload_0        
        //    50: aload_1        
        //    51: invokevirtual   jcifs/smb/SmbTransport.doSend0:(Ljcifs/util/transport/Request;)V
        //    54: goto            429
        //    57: aload_1        
        //    58: instanceof      Ljcifs/smb/SmbComTransaction;
        //    61: ifeq            394
        //    64: aload_2        
        //    65: aload_1        
        //    66: getfield        jcifs/smb/ServerMessageBlock.command:B
        //    69: putfield        jcifs/smb/ServerMessageBlock.command:B
        //    72: aload_1        
        //    73: checkcast       Ljcifs/smb/SmbComTransaction;
        //    76: astore          5
        //    78: aload_2        
        //    79: checkcast       Ljcifs/smb/SmbComTransactionResponse;
        //    82: astore          6
        //    84: aload           5
        //    86: aload_0        
        //    87: getfield        jcifs/smb/SmbTransport.snd_buf_size:I
        //    90: putfield        jcifs/smb/SmbComTransaction.maxBufferSize:I
        //    93: aload           6
        //    95: invokevirtual   jcifs/smb/SmbComTransactionResponse.reset:()V
        //    98: aload           5
        //   100: aload           6
        //   102: invokestatic    jcifs/smb/BufferCache.getBuffers:(Ljcifs/smb/SmbComTransaction;Ljcifs/smb/SmbComTransactionResponse;)V
        //   105: aload           5
        //   107: invokevirtual   jcifs/smb/SmbComTransaction.nextElement:()Ljava/lang/Object;
        //   110: pop            
        //   111: aload           5
        //   113: invokevirtual   jcifs/smb/SmbComTransaction.hasMoreElements:()Z
        //   116: ifeq            286
        //   119: new             Ljcifs/smb/SmbComBlankResponse;
        //   122: dup            
        //   123: invokespecial   jcifs/smb/SmbComBlankResponse.<init>:()V
        //   126: astore          9
        //   128: aload_0        
        //   129: aload           5
        //   131: aload           9
        //   133: getstatic       jcifs/smb/SmbTransport.RESPONSE_TIMEOUT:I
        //   136: i2l            
        //   137: invokespecial   jcifs/util/transport/Transport.sendrecv:(Ljcifs/util/transport/Request;Ljcifs/util/transport/Response;J)V
        //   140: aload           9
        //   142: getfield        jcifs/smb/SmbComBlankResponse.errorCode:I
        //   145: ifeq            156
        //   148: aload_0        
        //   149: aload           5
        //   151: aload           9
        //   153: invokevirtual   jcifs/smb/SmbTransport.checkStatus:(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
        //   156: aload           5
        //   158: invokevirtual   jcifs/smb/SmbComTransaction.nextElement:()Ljava/lang/Object;
        //   161: pop            
        //   162: aload_0        
        //   163: monitorenter   
        //   164: aload_2        
        //   165: iconst_0       
        //   166: putfield        jcifs/smb/ServerMessageBlock.received:Z
        //   169: aload           6
        //   171: iconst_0       
        //   172: putfield        jcifs/smb/SmbComTransactionResponse.isReceived:Z
        //   175: aload_0        
        //   176: getfield        jcifs/smb/SmbTransport.response_map:Ljava/util/HashMap;
        //   179: aload           5
        //   181: aload           6
        //   183: invokevirtual   java/util/HashMap.put:(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   186: pop            
        //   187: aload_0        
        //   188: aload           5
        //   190: invokevirtual   jcifs/smb/SmbTransport.doSend0:(Ljcifs/util/transport/Request;)V
        //   193: aload           5
        //   195: invokevirtual   jcifs/smb/SmbComTransaction.hasMoreElements:()Z
        //   198: ifeq            209
        //   201: aload           5
        //   203: invokevirtual   jcifs/smb/SmbComTransaction.nextElement:()Ljava/lang/Object;
        //   206: ifnonnull       187
        //   209: getstatic       jcifs/smb/SmbTransport.RESPONSE_TIMEOUT:I
        //   212: i2l            
        //   213: lstore          16
        //   215: aload           6
        //   217: lload           16
        //   219: invokestatic    java/lang/System.currentTimeMillis:()J
        //   222: ladd           
        //   223: putfield        jcifs/smb/SmbComTransactionResponse.expiration:J
        //   226: aload           6
        //   228: invokevirtual   jcifs/smb/SmbComTransactionResponse.hasMoreElements:()Z
        //   231: ifne            321
        //   234: aload_2        
        //   235: getfield        jcifs/smb/ServerMessageBlock.errorCode:I
        //   238: ifeq            249
        //   241: aload_0        
        //   242: aload           5
        //   244: aload           6
        //   246: invokevirtual   jcifs/smb/SmbTransport.checkStatus:(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
        //   249: aload_0        
        //   250: getfield        jcifs/smb/SmbTransport.response_map:Ljava/util/HashMap;
        //   253: aload           5
        //   255: invokevirtual   java/util/HashMap.remove:(Ljava/lang/Object;)Ljava/lang/Object;
        //   258: pop            
        //   259: aload_0        
        //   260: monitorexit    
        //   261: aload           5
        //   263: getfield        jcifs/smb/SmbComTransaction.txn_buf:[B
        //   266: invokestatic    jcifs/smb/BufferCache.releaseBuffer:([B)V
        //   269: aload           6
        //   271: getfield        jcifs/smb/SmbComTransactionResponse.txn_buf:[B
        //   274: invokestatic    jcifs/smb/BufferCache.releaseBuffer:([B)V
        //   277: aload_0        
        //   278: aload_1        
        //   279: aload_2        
        //   280: invokevirtual   jcifs/smb/SmbTransport.checkStatus:(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
        //   283: goto            429
        //   286: aload_0        
        //   287: aload           5
        //   289: invokevirtual   jcifs/smb/SmbTransport.makeKey:(Ljcifs/util/transport/Request;)V
        //   292: goto            162
        //   295: astore          7
        //   297: aload           5
        //   299: getfield        jcifs/smb/SmbComTransaction.txn_buf:[B
        //   302: invokestatic    jcifs/smb/BufferCache.releaseBuffer:([B)V
        //   305: aload           6
        //   307: getfield        jcifs/smb/SmbComTransactionResponse.txn_buf:[B
        //   310: invokestatic    jcifs/smb/BufferCache.releaseBuffer:([B)V
        //   313: aload           7
        //   315: athrow         
        //   316: astore          4
        //   318: aload           4
        //   320: athrow         
        //   321: aload_0        
        //   322: lload           16
        //   324: invokevirtual   java/lang/Object.wait:(J)V
        //   327: aload           6
        //   329: getfield        jcifs/smb/SmbComTransactionResponse.expiration:J
        //   332: invokestatic    java/lang/System.currentTimeMillis:()J
        //   335: lsub           
        //   336: lstore          16
        //   338: lload           16
        //   340: lconst_0       
        //   341: lcmp           
        //   342: ifgt            226
        //   345: new             Ljcifs/util/transport/TransportException;
        //   348: dup            
        //   349: ldc_w           "Timeout waiting for response from computer"
        //   352: aload_0        
        //   353: getfield        jcifs/smb/SmbTransport.readError:Ljava/lang/Exception;
        //   356: invokespecial   jcifs/util/transport/TransportException.<init>:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   359: athrow         
        //   360: astore          14
        //   362: new             Ljcifs/util/transport/TransportException;
        //   365: dup            
        //   366: aload           14
        //   368: invokespecial   jcifs/util/transport/TransportException.<init>:(Ljava/lang/Throwable;)V
        //   371: athrow         
        //   372: astore          12
        //   374: aload_0        
        //   375: getfield        jcifs/smb/SmbTransport.response_map:Ljava/util/HashMap;
        //   378: aload           5
        //   380: invokevirtual   java/util/HashMap.remove:(Ljava/lang/Object;)Ljava/lang/Object;
        //   383: pop            
        //   384: aload           12
        //   386: athrow         
        //   387: astore          11
        //   389: aload_0        
        //   390: monitorexit    
        //   391: aload           11
        //   393: athrow         
        //   394: aload_2        
        //   395: aload_1        
        //   396: getfield        jcifs/smb/ServerMessageBlock.command:B
        //   399: putfield        jcifs/smb/ServerMessageBlock.command:B
        //   402: aload_0        
        //   403: aload_1        
        //   404: aload_2        
        //   405: getstatic       jcifs/smb/SmbTransport.RESPONSE_TIMEOUT:I
        //   408: i2l            
        //   409: invokespecial   jcifs/util/transport/Transport.sendrecv:(Ljcifs/util/transport/Request;Ljcifs/util/transport/Response;J)V
        //   412: goto            277
        //   415: astore_3       
        //   416: new             Ljcifs/smb/SmbException;
        //   419: dup            
        //   420: aload_3        
        //   421: invokevirtual   java/io/IOException.getMessage:()Ljava/lang/String;
        //   424: aload_3        
        //   425: invokespecial   jcifs/smb/SmbException.<init>:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   428: athrow         
        //   429: return         
        //    Exceptions:
        //  throws jcifs.smb.SmbException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                            
        //  -----  -----  -----  -----  --------------------------------
        //  49     98     316    321    Ljcifs/smb/SmbException;
        //  49     98     415    429    Ljava/io/IOException;
        //  98     164    295    316    Any
        //  164    175    387    394    Any
        //  175    249    360    372    Ljava/lang/InterruptedException;
        //  175    249    372    387    Any
        //  249    261    387    394    Any
        //  261    277    316    321    Ljcifs/smb/SmbException;
        //  261    277    415    429    Ljava/io/IOException;
        //  286    292    295    316    Any
        //  297    316    316    321    Ljcifs/smb/SmbException;
        //  297    316    415    429    Ljava/io/IOException;
        //  321    360    360    372    Ljava/lang/InterruptedException;
        //  321    360    372    387    Any
        //  362    372    372    387    Any
        //  374    391    387    394    Any
        //  391    394    295    316    Any
        //  394    412    316    321    Ljcifs/smb/SmbException;
        //  394    412    415    429    Ljava/io/IOException;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0187:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2607)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:100)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:668)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:567)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:493)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:460)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:105)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:55)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:271)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:203)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:103)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
    
    void ssn139() throws IOException {
        final Name name = new Name(this.address.firstCalledName(), 32, null);
    Label_0018:
        while (true) {
            this.socket = new Socket();
            if (this.localAddr != null) {
                this.socket.bind(new InetSocketAddress(this.localAddr, this.localPort));
            }
            this.socket.connect(new InetSocketAddress(this.address.getHostAddress(), 139), SmbTransport.SO_TIMEOUT);
            this.socket.setSoTimeout(SmbTransport.SO_TIMEOUT);
            this.out = this.socket.getOutputStream();
            this.in = this.socket.getInputStream();
            this.out.write(this.sbuf, 0, new SessionRequestPacket(name, NbtAddress.getLocalName()).writeWireFormat(this.sbuf, 0));
            Label_0185: {
                if (Transport.readn(this.in, this.sbuf, 0, 4) >= 4) {
                    break Label_0185;
                }
                try {
                    this.socket.close();
                    throw new SmbException("EOF during NetBIOS session request");
                    // switch([Lcom.strobel.decompiler.ast.Label;@19bc16bf, n)
                    // iftrue(Label_0276:, LogStream.level < 4)
                    while (true) {
                        SmbTransport.log.println("session established ok with " + this.address);
                        return;
                        Label_0276: {
                            return;
                        }
                        Label_0386:
                        this.disconnect(true);
                        throw new NbtException(2, -1);
                        Label_0277:
                        final int n = 0xFF & this.in.read();
                        Label_0316:
                        this.disconnect(true);
                        throw new NbtException(2, n);
                        Label_0243:
                        continue;
                    }
                    Label_0331: {
                        this.socket.close();
                    }
                    final String nextCalledName = this.address.nextCalledName();
                    name.name = nextCalledName;
                    // iftrue(Label_0018:, nextCalledName != null)
                    throw new IOException("Failed to establish session with " + this.address);
                    // switch([Lcom.strobel.decompiler.ast.Label;@b7962cc, 0xFF & this.sbuf[0])
                    Label_0228:
                    this.disconnect(true);
                    throw new NbtException(2, 0);
                }
                catch (IOException ex) {
                    throw new SmbException("EOF during NetBIOS session request");
                }
            }
        }
    }
    
    public String toString() {
        return String.valueOf(super.toString()) + "[" + this.address + ":" + this.port + "]";
    }
    
    class ServerData
    {
        int capabilities;
        boolean encryptedPasswords;
        byte[] encryptionKey;
        int encryptionKeyLength;
        byte flags;
        int flags2;
        byte[] guid;
        int maxBufferSize;
        int maxMpxCount;
        int maxNumberVcs;
        int maxRawSize;
        String oemDomainName;
        int security;
        int securityMode;
        long serverTime;
        short serverTimeZone;
        int sessionKey;
        boolean signaturesEnabled;
        boolean signaturesRequired;
    }
}
