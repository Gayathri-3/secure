package jcifs.smb;

import jcifs.util.*;

class Trans2QueryFSInformation extends SmbComTransaction
{
    private int informationLevel;
    
    Trans2QueryFSInformation(final int informationLevel) {
        super();
        this.command = 50;
        this.subCommand = 3;
        this.informationLevel = informationLevel;
        this.totalParameterCount = 2;
        this.totalDataCount = 0;
        this.maxParameterCount = 0;
        this.maxDataCount = 800;
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
        return new String("Trans2QueryFSInformation[" + super.toString() + ",informationLevel=0x" + Hexdump.toHexString(this.informationLevel, 3) + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.informationLevel, array, n);
        return n + 2 - n;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = this.subCommand;
        array[n2] = 0;
        return 2;
    }
}
