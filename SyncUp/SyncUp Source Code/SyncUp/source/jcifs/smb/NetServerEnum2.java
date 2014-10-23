package jcifs.smb;

import java.io.*;

class NetServerEnum2 extends SmbComTransaction
{
    static final String[] DESCR;
    static final int SV_TYPE_ALL = -1;
    static final int SV_TYPE_DOMAIN_ENUM = Integer.MIN_VALUE;
    String domain;
    String lastName;
    int serverTypes;
    
    static {
        DESCR = new String[] { "WrLehDO\0B16BBDz\0", "WrLehDz\0B16BBDz\0" };
    }
    
    NetServerEnum2(final String domain, final int serverTypes) {
        super();
        this.lastName = null;
        this.domain = domain;
        this.serverTypes = serverTypes;
        this.command = 37;
        this.subCommand = 104;
        this.name = "\\PIPE\\LANMAN";
        this.maxParameterCount = 8;
        this.maxDataCount = 16384;
        this.maxSetupCount = 0;
        this.setupCount = 0;
        this.timeout = 5000;
    }
    
    int readDataWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readParametersWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    void reset(final int n, final String lastName) {
        super.reset();
        this.lastName = lastName;
    }
    
    public String toString() {
        final StringBuilder append = new StringBuilder("NetServerEnum2[").append(super.toString()).append(",name=").append(this.name).append(",serverTypes=");
        String s;
        if (this.serverTypes == -1) {
            s = "SV_TYPE_ALL";
        }
        else {
            s = "SV_TYPE_DOMAIN_ENUM";
        }
        return new String(append.append(s).append("]").toString());
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        Label_0163: {
            if (this.subCommand != 104) {
                break Label_0163;
            }
            int n2 = 0;
            try {
                while (true) {
                    final byte[] bytes = NetServerEnum2.DESCR[n2].getBytes("ASCII");
                    ServerMessageBlock.writeInt2(0xFF & this.subCommand, array, n);
                    final int n3 = n + 2;
                    System.arraycopy(bytes, 0, array, n3, bytes.length);
                    final int n4 = n3 + bytes.length;
                    ServerMessageBlock.writeInt2(1L, array, n4);
                    final int n5 = n4 + 2;
                    ServerMessageBlock.writeInt2(this.maxDataCount, array, n5);
                    final int n6 = n5 + 2;
                    ServerMessageBlock.writeInt4(this.serverTypes, array, n6);
                    final int n7 = n6 + 4;
                    int n8 = n7 + this.writeString(this.domain.toUpperCase(), array, n7, false);
                    if (n2 == 1) {
                        n8 += this.writeString(this.lastName.toUpperCase(), array, n8, false);
                    }
                    return n8 - n;
                    n2 = 1;
                    continue;
                }
            }
            catch (UnsupportedEncodingException ex) {
                return 0;
            }
        }
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
