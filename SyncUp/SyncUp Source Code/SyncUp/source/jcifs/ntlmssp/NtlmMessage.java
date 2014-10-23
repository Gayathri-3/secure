package jcifs.ntlmssp;

import jcifs.*;

public abstract class NtlmMessage implements NtlmFlags
{
    protected static final byte[] NTLMSSP_SIGNATURE;
    private static final String OEM_ENCODING;
    protected static final String UNI_ENCODING = "UTF-16LE";
    private int flags;
    
    static {
        NTLMSSP_SIGNATURE = new byte[] { 78, 84, 76, 77, 83, 83, 80, 0 };
        OEM_ENCODING = Config.DEFAULT_OEM_ENCODING;
    }
    
    static String getOEMEncoding() {
        return NtlmMessage.OEM_ENCODING;
    }
    
    static byte[] readSecurityBuffer(final byte[] array, final int n) {
        final int uShort = readUShort(array, n);
        final int uLong = readULong(array, n + 4);
        final byte[] array2 = new byte[uShort];
        System.arraycopy(array, uLong, array2, 0, uShort);
        return array2;
    }
    
    static int readULong(final byte[] array, final int n) {
        return (0xFF & array[n]) | (0xFF & array[n + 1]) << 8 | (0xFF & array[n + 2]) << 16 | (0xFF & array[n + 3]) << 24;
    }
    
    static int readUShort(final byte[] array, final int n) {
        return (0xFF & array[n]) | (0xFF & array[n + 1]) << 8;
    }
    
    static void writeSecurityBuffer(final byte[] array, final int n, final int n2, final byte[] array2) {
        int length;
        if (array2 != null) {
            length = array2.length;
        }
        else {
            length = 0;
        }
        if (length != 0) {
            writeUShort(array, n, length);
            writeUShort(array, n + 2, length);
            writeULong(array, n + 4, n2);
            System.arraycopy(array2, 0, array, n2, length);
        }
    }
    
    static void writeULong(final byte[] array, final int n, final int n2) {
        array[n] = (byte)(n2 & 0xFF);
        array[n + 1] = (byte)(0xFF & n2 >> 8);
        array[n + 2] = (byte)(0xFF & n2 >> 16);
        array[n + 3] = (byte)(0xFF & n2 >> 24);
    }
    
    static void writeUShort(final byte[] array, final int n, final int n2) {
        array[n] = (byte)(n2 & 0xFF);
        array[n + 1] = (byte)(0xFF & n2 >> 8);
    }
    
    public boolean getFlag(final int n) {
        return (n & this.getFlags()) != 0x0;
    }
    
    public int getFlags() {
        return this.flags;
    }
    
    public void setFlag(final int n, final boolean b) {
        int flags;
        if (b) {
            flags = (n | this.getFlags());
        }
        else {
            flags = (this.getFlags() & (n ^ -1));
        }
        this.setFlags(flags);
    }
    
    public void setFlags(final int flags) {
        this.flags = flags;
    }
    
    public abstract byte[] toByteArray();
}
