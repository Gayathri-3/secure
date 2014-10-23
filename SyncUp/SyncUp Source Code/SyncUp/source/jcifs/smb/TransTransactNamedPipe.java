package jcifs.smb;

import jcifs.util.*;

class TransTransactNamedPipe extends SmbComTransaction
{
    private byte[] pipeData;
    private int pipeDataLen;
    private int pipeDataOff;
    private int pipeFid;
    
    TransTransactNamedPipe(final int pipeFid, final byte[] pipeData, final int pipeDataOff, final int pipeDataLen) {
        super();
        this.pipeFid = pipeFid;
        this.pipeData = pipeData;
        this.pipeDataOff = pipeDataOff;
        this.pipeDataLen = pipeDataLen;
        this.command = 37;
        this.subCommand = 38;
        this.maxParameterCount = 0;
        this.maxDataCount = 65535;
        this.maxSetupCount = 0;
        this.setupCount = 2;
        this.name = "\\PIPE\\";
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
        return new String("TransTransactNamedPipe[" + super.toString() + ",pipeFid=" + this.pipeFid + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        int pipeDataLen;
        if (array.length - n < this.pipeDataLen) {
            final LogStream log = TransTransactNamedPipe.log;
            if (LogStream.level >= 3) {
                TransTransactNamedPipe.log.println("TransTransactNamedPipe data too long for buffer");
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
        ServerMessageBlock.writeInt2(this.pipeFid, array, n3);
        return 4;
    }
}
