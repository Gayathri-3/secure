package jcifs.smb;

import java.io.*;

class SmbComTreeConnectAndXResponse extends AndXServerMessageBlock
{
    private static final int SMB_SHARE_IS_IN_DFS = 2;
    private static final int SMB_SUPPORT_SEARCH_BITS = 1;
    String nativeFileSystem;
    String service;
    boolean shareIsInDfs;
    boolean supportSearchBits;
    
    SmbComTreeConnectAndXResponse(final ServerMessageBlock serverMessageBlock) {
        super(serverMessageBlock);
        this.nativeFileSystem = "";
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        final int stringLength = this.readStringLength(array, n, 32);
        try {
            this.service = new String(array, n, stringLength, "ASCII");
            return n + (stringLength + 1) - n;
        }
        catch (UnsupportedEncodingException ex) {
            return 0;
        }
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        boolean shareIsInDfs = true;
        this.supportSearchBits = ((0x1 & array[n]) == shareIsInDfs && shareIsInDfs);
        if ((0x2 & array[n]) != 0x2) {
            shareIsInDfs = false;
        }
        this.shareIsInDfs = shareIsInDfs;
        return 2;
    }
    
    public String toString() {
        return new String("SmbComTreeConnectAndXResponse[" + super.toString() + ",supportSearchBits=" + this.supportSearchBits + ",shareIsInDfs=" + this.shareIsInDfs + ",service=" + this.service + ",nativeFileSystem=" + this.nativeFileSystem + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
