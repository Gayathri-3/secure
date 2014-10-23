package jcifs.smb;

class TransPeekNamedPipeResponse extends SmbComTransactionResponse
{
    static final int STATUS_CONNECTION_OK = 3;
    static final int STATUS_DISCONNECTED = 1;
    static final int STATUS_LISTENING = 2;
    static final int STATUS_SERVER_END_CLOSED = 4;
    int available;
    private int head;
    private SmbNamedPipe pipe;
    int status;
    
    TransPeekNamedPipeResponse(final SmbNamedPipe pipe) {
        super();
        this.pipe = pipe;
    }
    
    int readDataWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readParametersWireFormat(final byte[] array, final int n, final int n2) {
        this.available = ServerMessageBlock.readInt2(array, n);
        final int n3 = n + 2;
        this.head = ServerMessageBlock.readInt2(array, n3);
        this.status = ServerMessageBlock.readInt2(array, n3 + 2);
        return 6;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    public String toString() {
        return new String("TransPeekNamedPipeResponse[" + super.toString() + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
