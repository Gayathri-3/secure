package jcifs.smb;

class SmbComWrite extends ServerMessageBlock
{
    private byte[] b;
    private int count;
    private int fid;
    private int off;
    private int offset;
    private int remaining;
    
    SmbComWrite() {
        super();
        this.command = 11;
    }
    
    SmbComWrite(final int fid, final int offset, final int remaining, final byte[] b, final int off, final int count) {
        super();
        this.fid = fid;
        this.count = count;
        this.offset = offset;
        this.remaining = remaining;
        this.b = b;
        this.off = off;
        this.command = 11;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    void setParam(final int fid, final long n, final int remaining, final byte[] b, final int off, final int count) {
        this.fid = fid;
        this.offset = (int)(0xFFFFFFFFL & n);
        this.remaining = remaining;
        this.b = b;
        this.off = off;
        this.count = count;
        this.digest = null;
    }
    
    public String toString() {
        return new String("SmbComWrite[" + super.toString() + ",fid=" + this.fid + ",count=" + this.count + ",offset=" + this.offset + ",remaining=" + this.remaining + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = 1;
        ServerMessageBlock.writeInt2(this.count, array, n2);
        final int n3 = n2 + 2;
        System.arraycopy(this.b, this.off, array, n3, this.count);
        return n3 + this.count - n;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.fid, array, n);
        final int n2 = n + 2;
        ServerMessageBlock.writeInt2(this.count, array, n2);
        final int n3 = n2 + 2;
        ServerMessageBlock.writeInt4(this.offset, array, n3);
        final int n4 = n3 + 4;
        ServerMessageBlock.writeInt2(this.remaining, array, n4);
        return n4 + 2 - n;
    }
}
