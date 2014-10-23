package jcifs.smb;

class SmbComLogoffAndX extends AndXServerMessageBlock
{
    SmbComLogoffAndX(final ServerMessageBlock serverMessageBlock) {
        super(serverMessageBlock);
        this.command = 116;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("SmbComLogoffAndX[" + super.toString() + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
