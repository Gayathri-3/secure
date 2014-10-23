package jcifs.smb;

class TransCallNamedPipeResponse extends SmbComTransactionResponse
{
    private SmbNamedPipe pipe;
    
    TransCallNamedPipeResponse(final SmbNamedPipe pipe) {
        super();
        this.pipe = pipe;
    }
    
    int readDataWireFormat(final byte[] array, final int n, final int n2) {
        if (this.pipe.pipeIn != null) {
            final TransactNamedPipeInputStream transactNamedPipeInputStream = (TransactNamedPipeInputStream)this.pipe.pipeIn;
            synchronized (transactNamedPipeInputStream.lock) {
                transactNamedPipeInputStream.receive(array, n, n2);
                transactNamedPipeInputStream.lock.notify();
            }
        }
        return n2;
    }
    
    int readParametersWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    public String toString() {
        return new String("TransCallNamedPipeResponse[" + super.toString() + "]");
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
