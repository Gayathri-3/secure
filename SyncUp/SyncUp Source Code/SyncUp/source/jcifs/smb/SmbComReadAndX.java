package jcifs.smb;

import jcifs.*;

class SmbComReadAndX extends AndXServerMessageBlock
{
    private static final int BATCH_LIMIT;
    private int fid;
    int maxCount;
    int minCount;
    private long offset;
    private int openTimeout;
    int remaining;
    
    static {
        BATCH_LIMIT = Config.getInt("jcifs.smb.client.ReadAndX.Close", 1);
    }
    
    SmbComReadAndX() {
        super(null);
        this.command = 46;
        this.openTimeout = -1;
    }
    
    SmbComReadAndX(final int fid, final long offset, final int n, final ServerMessageBlock serverMessageBlock) {
        super(serverMessageBlock);
        this.fid = fid;
        this.offset = offset;
        this.minCount = n;
        this.maxCount = n;
        this.command = 46;
        this.openTimeout = -1;
    }
    
    int getBatchLimit(final byte b) {
        int batch_LIMIT;
        if (b == 4) {
            batch_LIMIT = SmbComReadAndX.BATCH_LIMIT;
        }
        else {
            batch_LIMIT = 0;
        }
        return batch_LIMIT;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    void setParam(final int fid, final long offset, final int n) {
        this.fid = fid;
        this.offset = offset;
        this.minCount = n;
        this.maxCount = n;
    }
    
    public String toString() {
        return new String("SmbComReadAndX[" + super.toString() + ",fid=" + this.fid + ",offset=" + this.offset + ",maxCount=" + this.maxCount + ",minCount=" + this.minCount + ",openTimeout=" + this.openTimeout + ",remaining=" + this.remaining + ",offset=" + this.offset + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.fid, array, n);
        final int n2 = n + 2;
        ServerMessageBlock.writeInt4(this.offset, array, n2);
        final int n3 = n2 + 4;
        ServerMessageBlock.writeInt2(this.maxCount, array, n3);
        final int n4 = n3 + 2;
        ServerMessageBlock.writeInt2(this.minCount, array, n4);
        final int n5 = n4 + 2;
        ServerMessageBlock.writeInt4(this.openTimeout, array, n5);
        final int n6 = n5 + 4;
        ServerMessageBlock.writeInt2(this.remaining, array, n6);
        final int n7 = n6 + 2;
        ServerMessageBlock.writeInt4(this.offset >> 32, array, n7);
        return n7 + 4 - n;
    }
}
