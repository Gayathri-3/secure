package jcifs.smb;

class Trans2SetFileInformation extends SmbComTransaction
{
    static final int SMB_FILE_BASIC_INFO = 257;
    private int attributes;
    private long createTime;
    private int fid;
    private long lastWriteTime;
    
    Trans2SetFileInformation(final int fid, final int attributes, final long createTime, final long lastWriteTime) {
        super();
        this.fid = fid;
        this.attributes = attributes;
        this.createTime = createTime;
        this.lastWriteTime = lastWriteTime;
        this.command = 50;
        this.subCommand = 8;
        this.maxParameterCount = 6;
        this.maxDataCount = 0;
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
        return new String("Trans2SetFileInformation[" + super.toString() + ",fid=" + this.fid + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeTime(this.createTime, array, n);
        final int n2 = n + 8;
        ServerMessageBlock.writeInt8(0L, array, n2);
        final int n3 = n2 + 8;
        ServerMessageBlock.writeTime(this.lastWriteTime, array, n3);
        final int n4 = n3 + 8;
        ServerMessageBlock.writeInt8(0L, array, n4);
        final int n5 = n4 + 8;
        ServerMessageBlock.writeInt2(0x80 | this.attributes, array, n5);
        final int n6 = n5 + 2;
        ServerMessageBlock.writeInt8(0L, array, n6);
        return n6 + 6 - n;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.fid, array, n);
        final int n2 = n + 2;
        ServerMessageBlock.writeInt2(257L, array, n2);
        final int n3 = n2 + 2;
        ServerMessageBlock.writeInt2(0L, array, n3);
        return n3 + 2 - n;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = this.subCommand;
        array[n2] = 0;
        return 2;
    }
}
