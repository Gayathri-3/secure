package jcifs.smb;

import jcifs.util.*;

class NtTransQuerySecurityDesc extends SmbComNtTransaction
{
    int fid;
    int securityInformation;
    
    NtTransQuerySecurityDesc(final int fid, final int securityInformation) {
        super();
        this.fid = fid;
        this.securityInformation = securityInformation;
        this.command = -96;
        this.function = 6;
        this.setupCount = 0;
        this.totalDataCount = 0;
        this.maxParameterCount = 4;
        this.maxDataCount = 32768;
        this.maxSetupCount = 0;
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
    
    public String toString() {
        return new String("NtTransQuerySecurityDesc[" + super.toString() + ",fid=0x" + Hexdump.toHexString(this.fid, 4) + ",securityInformation=0x" + Hexdump.toHexString(this.securityInformation, 8) + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.fid, array, n);
        final int n2 = n + 2;
        final int n3 = n2 + 1;
        array[n2] = 0;
        final int n4 = n3 + 1;
        array[n3] = 0;
        ServerMessageBlock.writeInt4(this.securityInformation, array, n4);
        return n4 + 4 - n;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
