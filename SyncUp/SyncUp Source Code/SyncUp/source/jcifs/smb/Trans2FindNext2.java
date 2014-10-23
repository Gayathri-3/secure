package jcifs.smb;

import jcifs.util.*;

class Trans2FindNext2 extends SmbComTransaction
{
    private String filename;
    private int flags;
    private int informationLevel;
    private int resumeKey;
    private int sid;
    
    Trans2FindNext2(final int sid, final int resumeKey, final String filename) {
        super();
        this.sid = sid;
        this.resumeKey = resumeKey;
        this.filename = filename;
        this.command = 50;
        this.subCommand = 2;
        this.informationLevel = 260;
        this.flags = 0;
        this.maxParameterCount = 8;
        this.maxDataCount = Trans2FindFirst2.LIST_SIZE;
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
    
    void reset(final int resumeKey, final String filename) {
        super.reset();
        this.resumeKey = resumeKey;
        this.filename = filename;
        this.flags2 = 0;
    }
    
    public String toString() {
        return new String("Trans2FindNext2[" + super.toString() + ",sid=" + this.sid + ",searchCount=" + Trans2FindFirst2.LIST_SIZE + ",informationLevel=0x" + Hexdump.toHexString(this.informationLevel, 3) + ",resumeKey=0x" + Hexdump.toHexString(this.resumeKey, 4) + ",flags=0x" + Hexdump.toHexString(this.flags, 2) + ",filename=" + this.filename + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.sid, array, n);
        final int n2 = n + 2;
        ServerMessageBlock.writeInt2(Trans2FindFirst2.LIST_COUNT, array, n2);
        final int n3 = n2 + 2;
        ServerMessageBlock.writeInt2(this.informationLevel, array, n3);
        final int n4 = n3 + 2;
        ServerMessageBlock.writeInt4(this.resumeKey, array, n4);
        final int n5 = n4 + 4;
        ServerMessageBlock.writeInt2(this.flags, array, n5);
        final int n6 = n5 + 2;
        return n6 + this.writeString(this.filename, array, n6) - n;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = this.subCommand;
        array[n2] = 0;
        return 2;
    }
}
