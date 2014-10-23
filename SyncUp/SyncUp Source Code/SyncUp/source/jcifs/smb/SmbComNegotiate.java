package jcifs.smb;

import java.io.*;

class SmbComNegotiate extends ServerMessageBlock
{
    private static final String DIALECTS = "\u0002NT LM 0.12\0";
    
    SmbComNegotiate() {
        super();
        this.command = 114;
        this.flags2 = SmbComNegotiate.DEFAULT_FLAGS2;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("SmbComNegotiate[" + super.toString() + ",wordCount=" + this.wordCount + ",dialects=NT LM 0.12]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        try {
            final byte[] bytes = "\u0002NT LM 0.12\0".getBytes("ASCII");
            System.arraycopy(bytes, 0, array, n, bytes.length);
            return bytes.length;
        }
        catch (UnsupportedEncodingException ex) {
            return 0;
        }
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
