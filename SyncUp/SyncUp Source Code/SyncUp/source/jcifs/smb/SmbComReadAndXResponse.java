package jcifs.smb;

class SmbComReadAndXResponse extends AndXServerMessageBlock
{
    byte[] b;
    int dataCompactionMode;
    int dataLength;
    int dataOffset;
    int off;
    
    SmbComReadAndXResponse() {
        super();
    }
    
    SmbComReadAndXResponse(final byte[] b, final int off) {
        super();
        this.b = b;
        this.off = off;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        final int n2 = n + 2;
        this.dataCompactionMode = ServerMessageBlock.readInt2(array, n2);
        final int n3 = n2 + 4;
        this.dataLength = ServerMessageBlock.readInt2(array, n3);
        final int n4 = n3 + 2;
        this.dataOffset = ServerMessageBlock.readInt2(array, n4);
        return n4 + 12 - n;
    }
    
    void setParam(final byte[] b, final int off) {
        this.b = b;
        this.off = off;
    }
    
    public String toString() {
        return new String("SmbComReadAndXResponse[" + super.toString() + ",dataCompactionMode=" + this.dataCompactionMode + ",dataLength=" + this.dataLength + ",dataOffset=" + this.dataOffset + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
