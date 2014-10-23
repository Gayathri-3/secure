package jcifs.smb;

class TransPeekNamedPipe extends SmbComTransaction
{
    private int fid;
    
    TransPeekNamedPipe(final String name, final int fid) {
        super();
        this.name = name;
        this.fid = fid;
        this.command = 37;
        this.subCommand = 35;
        this.timeout = -1;
        this.maxParameterCount = 6;
        this.maxDataCount = 1;
        this.maxSetupCount = 0;
        this.setupCount = 2;
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
        return new String("TransPeekNamedPipe[" + super.toString() + ",pipeName=" + this.name + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = this.subCommand;
        final int n3 = n2 + 1;
        array[n2] = 0;
        ServerMessageBlock.writeInt2(this.fid, array, n3);
        return 4;
    }
}
