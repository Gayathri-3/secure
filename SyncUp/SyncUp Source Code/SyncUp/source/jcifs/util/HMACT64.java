package jcifs.util;

import java.security.*;

public class HMACT64 extends MessageDigest implements Cloneable
{
    private static final int BLOCK_LENGTH = 64;
    private static final byte IPAD = 54;
    private static final byte OPAD = 92;
    private byte[] ipad;
    private MessageDigest md5;
    private byte[] opad;
    
    private HMACT64(final HMACT64 hmact64) throws CloneNotSupportedException {
        super("HMACT64");
        this.ipad = new byte[64];
        this.opad = new byte[64];
        this.ipad = hmact64.ipad;
        this.opad = hmact64.opad;
        this.md5 = (MessageDigest)hmact64.md5.clone();
    }
    
    public HMACT64(final byte[] array) {
        super("HMACT64");
        this.ipad = new byte[64];
        this.opad = new byte[64];
        final int min = Math.min(array.length, 64);
        int n = 0;
        while (true) {
            Label_0061: {
                if (n < min) {
                    break Label_0061;
                }
                int n2 = min;
                while (true) {
                    Label_0093: {
                        if (n2 < 64) {
                            break Label_0093;
                        }
                        try {
                            this.md5 = MessageDigest.getInstance("MD5");
                            this.engineReset();
                            return;
                            this.ipad[n2] = 54;
                            this.opad[n2] = 92;
                            ++n2;
                            continue;
                            this.ipad[n] = (0x36 ^ array[n]);
                            this.opad[n] = (0x5C ^ array[n]);
                            ++n;
                        }
                        catch (Exception ex) {
                            throw new IllegalStateException(ex.getMessage());
                        }
                    }
                    break;
                }
            }
        }
    }
    
    public Object clone() {
        try {
            return new HMACT64(this);
        }
        catch (CloneNotSupportedException ex) {
            throw new IllegalStateException(ex.getMessage());
        }
    }
    
    protected int engineDigest(final byte[] array, final int n, final int n2) {
        final byte[] digest = this.md5.digest();
        this.md5.update(this.opad);
        this.md5.update(digest);
        try {
            return this.md5.digest(array, n, n2);
        }
        catch (Exception ex) {
            throw new IllegalStateException();
        }
    }
    
    protected byte[] engineDigest() {
        final byte[] digest = this.md5.digest();
        this.md5.update(this.opad);
        return this.md5.digest(digest);
    }
    
    protected int engineGetDigestLength() {
        return this.md5.getDigestLength();
    }
    
    protected void engineReset() {
        this.md5.reset();
        this.md5.update(this.ipad);
    }
    
    protected void engineUpdate(final byte b) {
        this.md5.update(b);
    }
    
    protected void engineUpdate(final byte[] array, final int n, final int n2) {
        this.md5.update(array, n, n2);
    }
}
