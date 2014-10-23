package jcifs.util;

public class RC4
{
    int i;
    int j;
    byte[] s;
    
    public RC4() {
        super();
    }
    
    public RC4(final byte[] array) {
        super();
        this.init(array, 0, array.length);
    }
    
    public void init(final byte[] array, final int n, final int n2) {
        this.s = new byte[256];
        this.i = 0;
        while (this.i < 256) {
            this.s[this.i] = (byte)this.i;
            this.i += 1;
        }
        this.j = 0;
        this.i = 0;
        while (this.i < 256) {
            this.j = (0xFF & this.j + array[n + this.i % n2] + this.s[this.i]);
            final byte b = this.s[this.i];
            this.s[this.i] = this.s[this.j];
            this.s[this.j] = b;
            this.i += 1;
        }
        this.j = 0;
        this.i = 0;
    }
    
    public void update(final byte[] array, final int n, final int n2, final byte[] array2, final int n3) {
        final int n4 = n + n2;
        int n5 = n3;
        int n7;
        for (int i = n; i < n4; i = n7) {
            this.i = (0xFF & 1 + this.i);
            this.j = (0xFF & this.j + this.s[this.i]);
            final byte b = this.s[this.i];
            this.s[this.i] = this.s[this.j];
            this.s[this.j] = b;
            final int n6 = n5 + 1;
            n7 = i + 1;
            array2[n5] = (array[i] ^ this.s[0xFF & this.s[this.i] + this.s[this.j]]);
            n5 = n6;
        }
    }
}
