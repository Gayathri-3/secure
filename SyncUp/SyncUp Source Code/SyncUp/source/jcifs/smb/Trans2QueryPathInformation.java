package jcifs.smb;

import jcifs.util.*;

class Trans2QueryPathInformation extends SmbComTransaction
{
    private int informationLevel;
    
    Trans2QueryPathInformation(final String path, final int informationLevel) {
        super();
        this.path = path;
        this.informationLevel = informationLevel;
        this.command = 50;
        this.subCommand = 5;
        this.totalDataCount = 0;
        this.maxParameterCount = 2;
        this.maxDataCount = 40;
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
        return new String("Trans2QueryPathInformation[" + super.toString() + ",informationLevel=0x" + Hexdump.toHexString(this.informationLevel, 3) + ",filename=" + this.path + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.informationLevel, array, n);
        final int n2 = n + 2;
        final int n3 = n2 + 1;
        array[n2] = 0;
        final int n4 = n3 + 1;
        array[n3] = 0;
        final int n5 = n4 + 1;
        array[n4] = 0;
        final int n6 = n5 + 1;
        array[n5] = 0;
        return n6 + this.writeString(this.path, array, n6) - n;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = this.subCommand;
        array[n2] = 0;
        return 2;
    }
}
