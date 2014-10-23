package jcifs.smb;

import jcifs.*;

class SmbComWriteAndX extends AndXServerMessageBlock
{
    private static final int CLOSE_BATCH_LIMIT;
    private static final int READ_ANDX_BATCH_LIMIT;
    private byte[] b;
    private int dataLength;
    private int dataOffset;
    private int fid;
    private int off;
    private long offset;
    private int pad;
    private int remaining;
    int writeMode;
    
    static {
        READ_ANDX_BATCH_LIMIT = Config.getInt("jcifs.smb.client.WriteAndX.ReadAndX", 1);
        CLOSE_BATCH_LIMIT = Config.getInt("jcifs.smb.client.WriteAndX.Close", 1);
    }
    
    SmbComWriteAndX() {
        super(null);
        this.command = 47;
    }
    
    SmbComWriteAndX(final int fid, final long offset, final int remaining, final byte[] b, final int off, final int dataLength, final ServerMessageBlock serverMessageBlock) {
        super(serverMessageBlock);
        this.fid = fid;
        this.offset = offset;
        this.remaining = remaining;
        this.b = b;
        this.off = off;
        this.dataLength = dataLength;
        this.command = 47;
    }
    
    int getBatchLimit(final byte b) {
        int n;
        if (b == 46) {
            n = SmbComWriteAndX.READ_ANDX_BATCH_LIMIT;
        }
        else if (b == 4) {
            n = SmbComWriteAndX.CLOSE_BATCH_LIMIT;
        }
        else {
            n = 0;
        }
        return n;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    void setParam(final int fid, final long offset, final int remaining, final byte[] b, final int off, final int dataLength) {
        this.fid = fid;
        this.offset = offset;
        this.remaining = remaining;
        this.b = b;
        this.off = off;
        this.dataLength = dataLength;
        this.digest = null;
    }
    
    public String toString() {
        return new String("SmbComWriteAndX[" + super.toString() + ",fid=" + this.fid + ",offset=" + this.offset + ",writeMode=" + this.writeMode + ",remaining=" + this.remaining + ",dataLength=" + this.dataLength + ",dataOffset=" + this.dataOffset + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, int n) {
        final int n2 = n;
        while (this.pad-- > 0) {
            final int n3 = n + 1;
            array[n] = -18;
            n = n3;
        }
        System.arraycopy(this.b, this.off, array, n, this.dataLength);
        return n + this.dataLength - n2;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        this.dataOffset = 26 + (n - this.headerStart);
        this.pad = (this.dataOffset - this.headerStart) % 4;
        int pad;
        if (this.pad == 0) {
            pad = 0;
        }
        else {
            pad = 4 - this.pad;
        }
        this.pad = pad;
        this.dataOffset += this.pad;
        ServerMessageBlock.writeInt2(this.fid, array, n);
        final int n2 = n + 2;
        ServerMessageBlock.writeInt4(this.offset, array, n2);
        final int n3 = n2 + 4;
        int i = 0;
        int n4 = n3;
        while (i < 4) {
            final int n5 = n4 + 1;
            array[n4] = -1;
            ++i;
            n4 = n5;
        }
        ServerMessageBlock.writeInt2(this.writeMode, array, n4);
        final int n6 = n4 + 2;
        ServerMessageBlock.writeInt2(this.remaining, array, n6);
        final int n7 = n6 + 2;
        final int n8 = n7 + 1;
        array[n7] = 0;
        final int n9 = n8 + 1;
        array[n8] = 0;
        ServerMessageBlock.writeInt2(this.dataLength, array, n9);
        final int n10 = n9 + 2;
        ServerMessageBlock.writeInt2(this.dataOffset, array, n10);
        final int n11 = n10 + 2;
        ServerMessageBlock.writeInt4(this.offset >> 32, array, n11);
        return n11 + 4 - n;
    }
}
