package jcifs.smb;

class SmbComFindClose2 extends ServerMessageBlock
{
    private int sid;
    
    SmbComFindClose2(final int sid) {
        super();
        this.sid = sid;
        this.command = 52;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("SmbComFindClose2[" + super.toString() + ",sid=" + this.sid + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.sid, array, n);
        return 2;
    }
}
