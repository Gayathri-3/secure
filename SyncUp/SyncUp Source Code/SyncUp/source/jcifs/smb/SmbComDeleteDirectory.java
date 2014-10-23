package jcifs.smb;

class SmbComDeleteDirectory extends ServerMessageBlock
{
    SmbComDeleteDirectory(final String path) {
        super();
        this.path = path;
        this.command = 1;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("SmbComDeleteDirectory[" + super.toString() + ",directoryName=" + this.path + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = 4;
        return n2 + this.writeString(this.path, array, n2) - n;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
