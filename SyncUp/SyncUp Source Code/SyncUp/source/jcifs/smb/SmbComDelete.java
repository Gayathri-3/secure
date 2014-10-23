package jcifs.smb;

import jcifs.util.*;

class SmbComDelete extends ServerMessageBlock
{
    private int searchAttributes;
    
    SmbComDelete(final String path) {
        super();
        this.path = path;
        this.command = 6;
        this.searchAttributes = 6;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("SmbComDelete[" + super.toString() + ",searchAttributes=0x" + Hexdump.toHexString(this.searchAttributes, 4) + ",fileName=" + this.path + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = 4;
        return n2 + this.writeString(this.path, array, n2) - n;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.searchAttributes, array, n);
        return 2;
    }
}
