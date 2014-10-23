package jcifs.smb;

class SmbComSessionSetupAndXResponse extends AndXServerMessageBlock
{
    byte[] blob;
    boolean isLoggedInAsGuest;
    private String nativeLanMan;
    private String nativeOs;
    private String primaryDomain;
    
    SmbComSessionSetupAndXResponse(final ServerMessageBlock serverMessageBlock) {
        super(serverMessageBlock);
        this.nativeOs = "";
        this.nativeLanMan = "";
        this.primaryDomain = "";
        this.blob = null;
    }
    
    int readBytesWireFormat(final byte[] array, int n) {
        final int n2 = n;
        if (this.extendedSecurity) {
            System.arraycopy(array, n, this.blob, 0, this.blob.length);
            n += this.blob.length;
        }
        this.nativeOs = this.readString(array, n);
        final int n3 = n + this.stringWireLength(this.nativeOs, n);
        this.nativeLanMan = this.readString(array, n3, n2 + this.byteCount, 255, this.useUnicode);
        int n4 = n3 + this.stringWireLength(this.nativeLanMan, n3);
        if (!this.extendedSecurity) {
            this.primaryDomain = this.readString(array, n4, n2 + this.byteCount, 255, this.useUnicode);
            n4 += this.stringWireLength(this.primaryDomain, n4);
        }
        return n4 - n2;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        boolean isLoggedInAsGuest = true;
        if ((0x1 & array[n]) != isLoggedInAsGuest) {
            isLoggedInAsGuest = false;
        }
        this.isLoggedInAsGuest = isLoggedInAsGuest;
        int n2 = n + 2;
        if (this.extendedSecurity) {
            final int int2 = ServerMessageBlock.readInt2(array, n2);
            n2 += 2;
            this.blob = new byte[int2];
        }
        return n2 - n;
    }
    
    public String toString() {
        return new String("SmbComSessionSetupAndXResponse[" + super.toString() + ",isLoggedInAsGuest=" + this.isLoggedInAsGuest + ",nativeOs=" + this.nativeOs + ",nativeLanMan=" + this.nativeLanMan + ",primaryDomain=" + this.primaryDomain + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
