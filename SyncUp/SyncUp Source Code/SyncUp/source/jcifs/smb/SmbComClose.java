package jcifs.smb;

class SmbComClose extends ServerMessageBlock
{
    private int fid;
    private long lastWriteTime;
    
    SmbComClose(final int fid, final long lastWriteTime) {
        super();
        this.fid = fid;
        this.lastWriteTime = lastWriteTime;
        this.command = 4;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("SmbComClose[" + super.toString() + ",fid=" + this.fid + ",lastWriteTime=" + this.lastWriteTime + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.fid, array, n);
        ServerMessageBlock.writeUTime(this.lastWriteTime, array, n + 2);
        return 6;
    }
}
