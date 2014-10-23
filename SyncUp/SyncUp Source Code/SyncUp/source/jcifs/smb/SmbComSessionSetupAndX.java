package jcifs.smb;

import jcifs.*;

class SmbComSessionSetupAndX extends AndXServerMessageBlock
{
    private static final int BATCH_LIMIT;
    private static final boolean DISABLE_PLAIN_TEXT_PASSWORDS;
    private String accountName;
    private byte[] blob;
    private int capabilities;
    Object cred;
    private byte[] lmHash;
    private byte[] ntHash;
    private String primaryDomain;
    SmbSession session;
    private int sessionKey;
    
    static {
        BATCH_LIMIT = Config.getInt("jcifs.smb.client.SessionSetupAndX.TreeConnectAndX", 1);
        DISABLE_PLAIN_TEXT_PASSWORDS = Config.getBoolean("jcifs.smb.client.disablePlainTextPasswords", true);
    }
    
    SmbComSessionSetupAndX(final SmbSession session, final ServerMessageBlock serverMessageBlock, final Object cred) throws SmbException {
        super(serverMessageBlock);
        this.blob = null;
        this.command = 115;
        this.session = session;
        this.cred = cred;
        this.sessionKey = session.transport.sessionKey;
        this.capabilities = session.transport.capabilities;
        if (session.transport.server.security == 1) {
            if (cred instanceof NtlmPasswordAuthentication) {
                final NtlmPasswordAuthentication ntlmPasswordAuthentication = (NtlmPasswordAuthentication)cred;
                if (ntlmPasswordAuthentication == NtlmPasswordAuthentication.ANONYMOUS) {
                    this.lmHash = new byte[0];
                    this.ntHash = new byte[0];
                    this.capabilities &= Integer.MAX_VALUE;
                }
                else if (session.transport.server.encryptedPasswords) {
                    this.lmHash = ntlmPasswordAuthentication.getAnsiHash(session.transport.server.encryptionKey);
                    this.ntHash = ntlmPasswordAuthentication.getUnicodeHash(session.transport.server.encryptionKey);
                    if (this.lmHash.length == 0 && this.ntHash.length == 0) {
                        throw new RuntimeException("Null setup prohibited.");
                    }
                }
                else {
                    if (SmbComSessionSetupAndX.DISABLE_PLAIN_TEXT_PASSWORDS) {
                        throw new RuntimeException("Plain text passwords are disabled");
                    }
                    if (this.useUnicode) {
                        final String password = ntlmPasswordAuthentication.getPassword();
                        this.lmHash = new byte[0];
                        this.writeString(password, this.ntHash = new byte[2 * (1 + password.length())], 0);
                    }
                    else {
                        final String password2 = ntlmPasswordAuthentication.getPassword();
                        this.lmHash = new byte[2 * (1 + password2.length())];
                        this.ntHash = new byte[0];
                        this.writeString(password2, this.lmHash, 0);
                    }
                }
                this.accountName = ntlmPasswordAuthentication.username;
                if (this.useUnicode) {
                    this.accountName = this.accountName.toUpperCase();
                }
                this.primaryDomain = ntlmPasswordAuthentication.domain.toUpperCase();
            }
            else {
                if (!(cred instanceof byte[])) {
                    throw new SmbException("Unsupported credential type");
                }
                this.blob = (byte[])cred;
            }
        }
        else {
            if (session.transport.server.security != 0) {
                throw new SmbException("Unsupported");
            }
            if (!(cred instanceof NtlmPasswordAuthentication)) {
                throw new SmbException("Unsupported credential type");
            }
            final NtlmPasswordAuthentication ntlmPasswordAuthentication2 = (NtlmPasswordAuthentication)cred;
            this.lmHash = new byte[0];
            this.ntHash = new byte[0];
            this.accountName = ntlmPasswordAuthentication2.username;
            if (this.useUnicode) {
                this.accountName = this.accountName.toUpperCase();
            }
            this.primaryDomain = ntlmPasswordAuthentication2.domain.toUpperCase();
        }
    }
    
    int getBatchLimit(final byte b) {
        int batch_LIMIT;
        if (b == 117) {
            batch_LIMIT = SmbComSessionSetupAndX.BATCH_LIMIT;
        }
        else {
            batch_LIMIT = 0;
        }
        return batch_LIMIT;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        final StringBuilder append = new StringBuilder("SmbComSessionSetupAndX[").append(super.toString()).append(",snd_buf_size=").append(this.session.transport.snd_buf_size).append(",maxMpxCount=").append(this.session.transport.maxMpxCount).append(",VC_NUMBER=");
        final SmbTransport transport = this.session.transport;
        final StringBuilder append2 = append.append(1).append(",sessionKey=").append(this.sessionKey).append(",lmHash.length=");
        int length;
        if (this.lmHash == null) {
            length = 0;
        }
        else {
            length = this.lmHash.length;
        }
        final StringBuilder append3 = append2.append(length).append(",ntHash.length=");
        final byte[] ntHash = this.ntHash;
        int length2 = 0;
        if (ntHash != null) {
            length2 = this.ntHash.length;
        }
        final StringBuilder append4 = append3.append(length2).append(",capabilities=").append(this.capabilities).append(",accountName=").append(this.accountName).append(",primaryDomain=").append(this.primaryDomain).append(",NATIVE_OS=");
        final SmbTransport transport2 = this.session.transport;
        final StringBuilder append5 = append4.append(SmbTransport.NATIVE_OS).append(",NATIVE_LANMAN=");
        final SmbTransport transport3 = this.session.transport;
        return new String(append5.append(SmbTransport.NATIVE_LANMAN).append("]").toString());
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        int n2;
        if (this.blob != null) {
            System.arraycopy(this.blob, 0, array, n, this.blob.length);
            n2 = n + this.blob.length;
        }
        else {
            System.arraycopy(this.lmHash, 0, array, n, this.lmHash.length);
            final int n3 = n + this.lmHash.length;
            System.arraycopy(this.ntHash, 0, array, n3, this.ntHash.length);
            final int n4 = n3 + this.ntHash.length;
            final int n5 = n4 + this.writeString(this.accountName, array, n4);
            n2 = n5 + this.writeString(this.primaryDomain, array, n5);
        }
        final SmbTransport transport = this.session.transport;
        final int n6 = n2 + this.writeString(SmbTransport.NATIVE_OS, array, n2);
        final SmbTransport transport2 = this.session.transport;
        return n6 + this.writeString(SmbTransport.NATIVE_LANMAN, array, n6) - n;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.session.transport.snd_buf_size, array, n);
        final int n2 = n + 2;
        ServerMessageBlock.writeInt2(this.session.transport.maxMpxCount, array, n2);
        final int n3 = n2 + 2;
        final SmbTransport transport = this.session.transport;
        ServerMessageBlock.writeInt2(1L, array, n3);
        final int n4 = n3 + 2;
        ServerMessageBlock.writeInt4(this.sessionKey, array, n4);
        final int n5 = n4 + 4;
        int n6;
        if (this.blob != null) {
            ServerMessageBlock.writeInt2(this.blob.length, array, n5);
            n6 = n5 + 2;
        }
        else {
            ServerMessageBlock.writeInt2(this.lmHash.length, array, n5);
            final int n7 = n5 + 2;
            ServerMessageBlock.writeInt2(this.ntHash.length, array, n7);
            n6 = n7 + 2;
        }
        final int n8 = n6 + 1;
        array[n6] = 0;
        final int n9 = n8 + 1;
        array[n8] = 0;
        final int n10 = n9 + 1;
        array[n9] = 0;
        final int n11 = n10 + 1;
        array[n10] = 0;
        ServerMessageBlock.writeInt4(this.capabilities, array, n11);
        return n11 + 4 - n;
    }
}
