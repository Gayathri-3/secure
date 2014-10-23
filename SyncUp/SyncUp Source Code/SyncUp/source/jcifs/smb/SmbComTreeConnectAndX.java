package jcifs.smb;

import jcifs.*;
import jcifs.util.*;
import java.io.*;

class SmbComTreeConnectAndX extends AndXServerMessageBlock
{
    private static final boolean DISABLE_PLAIN_TEXT_PASSWORDS;
    private static byte[] batchLimits;
    private boolean disconnectTid;
    private byte[] password;
    private int passwordLength;
    String path;
    private String service;
    private SmbSession session;
    
    static {
        DISABLE_PLAIN_TEXT_PASSWORDS = Config.getBoolean("jcifs.smb.client.disablePlainTextPasswords", true);
        SmbComTreeConnectAndX.batchLimits = new byte[] { 1, 1, 1, 1, 1, 1, 1, 1, 0 };
        final String property = Config.getProperty("jcifs.smb.client.TreeConnectAndX.CheckDirectory");
        if (property != null) {
            SmbComTreeConnectAndX.batchLimits[0] = Byte.parseByte(property);
        }
        final String property2 = Config.getProperty("jcifs.smb.client.TreeConnectAndX.CreateDirectory");
        if (property2 != null) {
            SmbComTreeConnectAndX.batchLimits[2] = Byte.parseByte(property2);
        }
        final String property3 = Config.getProperty("jcifs.smb.client.TreeConnectAndX.Delete");
        if (property3 != null) {
            SmbComTreeConnectAndX.batchLimits[3] = Byte.parseByte(property3);
        }
        final String property4 = Config.getProperty("jcifs.smb.client.TreeConnectAndX.DeleteDirectory");
        if (property4 != null) {
            SmbComTreeConnectAndX.batchLimits[4] = Byte.parseByte(property4);
        }
        final String property5 = Config.getProperty("jcifs.smb.client.TreeConnectAndX.OpenAndX");
        if (property5 != null) {
            SmbComTreeConnectAndX.batchLimits[5] = Byte.parseByte(property5);
        }
        final String property6 = Config.getProperty("jcifs.smb.client.TreeConnectAndX.Rename");
        if (property6 != null) {
            SmbComTreeConnectAndX.batchLimits[6] = Byte.parseByte(property6);
        }
        final String property7 = Config.getProperty("jcifs.smb.client.TreeConnectAndX.Transaction");
        if (property7 != null) {
            SmbComTreeConnectAndX.batchLimits[7] = Byte.parseByte(property7);
        }
        final String property8 = Config.getProperty("jcifs.smb.client.TreeConnectAndX.QueryInformation");
        if (property8 != null) {
            SmbComTreeConnectAndX.batchLimits[8] = Byte.parseByte(property8);
        }
    }
    
    SmbComTreeConnectAndX(final SmbSession session, final String path, final String service, final ServerMessageBlock serverMessageBlock) {
        super(serverMessageBlock);
        this.disconnectTid = false;
        this.session = session;
        this.path = path;
        this.service = service;
        this.command = 117;
    }
    
    int getBatchLimit(final byte b) {
        final int n = b & 0xFF;
        int n2 = 0;
        switch (n) {
            case 16: {
                n2 = SmbComTreeConnectAndX.batchLimits[0];
                break;
            }
            case 0: {
                n2 = SmbComTreeConnectAndX.batchLimits[2];
                break;
            }
            case 6: {
                n2 = SmbComTreeConnectAndX.batchLimits[3];
                break;
            }
            case 1: {
                n2 = SmbComTreeConnectAndX.batchLimits[4];
                break;
            }
            case 45: {
                n2 = SmbComTreeConnectAndX.batchLimits[5];
                break;
            }
            case 7: {
                n2 = SmbComTreeConnectAndX.batchLimits[6];
                break;
            }
            case 37: {
                n2 = SmbComTreeConnectAndX.batchLimits[7];
                break;
            }
            case 8: {
                n2 = SmbComTreeConnectAndX.batchLimits[8];
                break;
            }
        }
        return n2;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("SmbComTreeConnectAndX[" + super.toString() + ",disconnectTid=" + this.disconnectTid + ",passwordLength=" + this.passwordLength + ",password=" + Hexdump.toHexString(this.password, this.passwordLength, 0) + ",path=" + this.path + ",service=" + this.service + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        Label_0138: {
            if (this.session.transport.server.security != 0 || (!this.session.auth.hashesExternal && this.session.auth.password.length() <= 0)) {
                break Label_0138;
            }
            System.arraycopy(this.password, 0, array, n, this.passwordLength);
            int n2 = n + this.passwordLength;
            while (true) {
                final int n3 = n2 + this.writeString(this.path, array, n2);
                try {
                    System.arraycopy(this.service.getBytes("ASCII"), 0, array, n3, this.service.length());
                    final int n4 = n3 + this.service.length();
                    final int n5 = n4 + 1;
                    array[n4] = 0;
                    return n5 - n;
                    final int n7 = n + 1;
                    array[n] = 0;
                    n2 = n7;
                }
                catch (UnsupportedEncodingException ex) {
                    return 0;
                }
            }
        }
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        byte passwordLength = 1;
        if (this.session.transport.server.security == 0 && (this.session.auth.hashesExternal || this.session.auth.password.length() > 0)) {
            if (this.session.transport.server.encryptedPasswords) {
                this.password = this.session.auth.getAnsiHash(this.session.transport.server.encryptionKey);
                this.passwordLength = this.password.length;
            }
            else {
                if (SmbComTreeConnectAndX.DISABLE_PLAIN_TEXT_PASSWORDS) {
                    throw new RuntimeException("Plain text passwords are disabled");
                }
                this.password = new byte[2 * (1 + this.session.auth.password.length())];
                this.passwordLength = this.writeString(this.session.auth.password, this.password, 0);
            }
        }
        else {
            this.passwordLength = passwordLength;
        }
        final int n2 = n + 1;
        if (!this.disconnectTid) {
            passwordLength = 0;
        }
        array[n] = passwordLength;
        final int n3 = n2 + 1;
        array[n2] = 0;
        ServerMessageBlock.writeInt2(this.passwordLength, array, n3);
        return 4;
    }
}
