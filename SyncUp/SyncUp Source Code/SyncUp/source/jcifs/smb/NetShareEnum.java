package jcifs.smb;

import java.io.*;

class NetShareEnum extends SmbComTransaction
{
    private static final String DESCR = "WrLeh\0B13BWz\0";
    
    NetShareEnum() {
        super();
        this.command = 37;
        this.subCommand = 0;
        this.name = new String("\\PIPE\\LANMAN");
        this.maxParameterCount = 8;
        this.maxSetupCount = 0;
        this.setupCount = 0;
        this.timeout = 5000;
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
        return new String("NetShareEnum[" + super.toString() + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        try {
            final byte[] bytes = "WrLeh\0B13BWz\0".getBytes("ASCII");
            ServerMessageBlock.writeInt2(0L, array, n);
            final int n2 = n + 2;
            System.arraycopy(bytes, 0, array, n2, bytes.length);
            final int n3 = n2 + bytes.length;
            ServerMessageBlock.writeInt2(1L, array, n3);
            final int n4 = n3 + 2;
            ServerMessageBlock.writeInt2(this.maxDataCount, array, n4);
            return n4 + 2 - n;
        }
        catch (UnsupportedEncodingException ex) {
            return 0;
        }
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
