package jcifs.smb;

class SmbComWriteResponse extends ServerMessageBlock
{
    long count;
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        this.count = (0xFFFFL & ServerMessageBlock.readInt2(array, n));
        return 8;
    }
    
    public String toString() {
        return new String("SmbComWriteResponse[" + super.toString() + ",count=" + this.count + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
