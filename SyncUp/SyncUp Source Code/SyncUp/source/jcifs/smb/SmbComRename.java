package jcifs.smb;

import jcifs.util.*;

class SmbComRename extends ServerMessageBlock
{
    private String newFileName;
    private String oldFileName;
    private int searchAttributes;
    
    SmbComRename(final String oldFileName, final String newFileName) {
        super();
        this.command = 7;
        this.oldFileName = oldFileName;
        this.newFileName = newFileName;
        this.searchAttributes = 22;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("SmbComRename[" + super.toString() + ",searchAttributes=0x" + Hexdump.toHexString(this.searchAttributes, 4) + ",oldFileName=" + this.oldFileName + ",newFileName=" + this.newFileName + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = 4;
        final int n3 = n2 + this.writeString(this.oldFileName, array, n2);
        final int n4 = n3 + 1;
        array[n3] = 4;
        int n5;
        if (this.useUnicode) {
            n5 = n4 + 1;
            array[n4] = 0;
        }
        else {
            n5 = n4;
        }
        return n5 + this.writeString(this.newFileName, array, n5) - n;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.searchAttributes, array, n);
        return 2;
    }
}
