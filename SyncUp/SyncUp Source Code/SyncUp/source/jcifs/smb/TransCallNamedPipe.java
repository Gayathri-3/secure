package jcifs.smb;

import jcifs.util.*;

class TransCallNamedPipe extends SmbComTransaction
{
    private byte[] pipeData;
    private int pipeDataLen;
    private int pipeDataOff;
    
    TransCallNamedPipe(final String name, final byte[] pipeData, final int pipeDataOff, final int pipeDataLen) {
        super();
        this.name = name;
        this.pipeData = pipeData;
        this.pipeDataOff = pipeDataOff;
        this.pipeDataLen = pipeDataLen;
        this.command = 37;
        this.subCommand = 84;
        this.timeout = -1;
        this.maxParameterCount = 0;
        this.maxDataCount = 65535;
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
        return new String("TransCallNamedPipe[" + super.toString() + ",pipeName=" + this.name + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        int pipeDataLen;
        if (array.length - n < this.pipeDataLen) {
            final LogStream log = TransCallNamedPipe.log;
            if (LogStream.level >= 3) {
                TransCallNamedPipe.log.println("TransCallNamedPipe data too long for buffer");
            }
            pipeDataLen = 0;
        }
        else {
            System.arraycopy(this.pipeData, this.pipeDataOff, array, n, this.pipeDataLen);
            pipeDataLen = this.pipeDataLen;
        }
        return pipeDataLen;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = this.subCommand;
        final int n3 = n2 + 1;
        array[n2] = 0;
        array[n3 + 1] = (array[n3] = 0);
        return 4;
    }
}
