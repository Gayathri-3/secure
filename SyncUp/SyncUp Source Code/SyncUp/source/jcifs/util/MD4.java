package jcifs.util;

import java.security.*;

public class MD4 extends MessageDigest implements Cloneable
{
    private static final int BLOCK_LENGTH = 64;
    private int[] X;
    private byte[] buffer;
    private int[] context;
    private long count;
    
    public MD4() {
        super("MD4");
        this.context = new int[4];
        this.buffer = new byte[64];
        this.X = new int[16];
        this.engineReset();
    }
    
    private MD4(final MD4 md4) {
        this();
        this.context = md4.context.clone();
        this.buffer = md4.buffer.clone();
        this.count = md4.count;
    }
    
    private int FF(final int n, final int n2, final int n3, final int n4, final int n5, final int n6) {
        final int n7 = n5 + (n + ((n2 & n3) | (n4 & (n2 ^ -1))));
        return n7 << n6 | n7 >>> 32 - n6;
    }
    
    private int GG(final int n, final int n2, final int n3, final int n4, final int n5, final int n6) {
        final int n7 = 1518500249 + (n5 + (n + ((n2 & (n3 | n4)) | (n3 & n4))));
        return n7 << n6 | n7 >>> 32 - n6;
    }
    
    private int HH(final int n, final int n2, final int n3, final int n4, final int n5, final int n6) {
        final int n7 = 1859775393 + (n5 + (n + (n4 ^ (n2 ^ n3))));
        return n7 << n6 | n7 >>> 32 - n6;
    }
    
    private void transform(final byte[] array, final int n) {
        int i = 0;
        int n2 = n;
        while (i < 16) {
            final int[] x = this.X;
            final int n3 = n2 + 1;
            final int n4 = 0xFF & array[n2];
            final int n5 = n3 + 1;
            final int n6 = n4 | (0xFF & array[n3]) << 8;
            final int n7 = n5 + 1;
            final int n8 = n6 | (0xFF & array[n5]) << 16;
            n2 = n7 + 1;
            x[i] = (n8 | (0xFF & array[n7]) << 24);
            ++i;
        }
        final int n9 = this.context[0];
        final int n10 = this.context[1];
        final int n11 = this.context[2];
        final int n12 = this.context[3];
        final int ff = this.FF(n9, n10, n11, n12, this.X[0], 3);
        final int ff2 = this.FF(n12, ff, n10, n11, this.X[1], 7);
        final int ff3 = this.FF(n11, ff2, ff, n10, this.X[2], 11);
        final int ff4 = this.FF(n10, ff3, ff2, ff, this.X[3], 19);
        final int ff5 = this.FF(ff, ff4, ff3, ff2, this.X[4], 3);
        final int ff6 = this.FF(ff2, ff5, ff4, ff3, this.X[5], 7);
        final int ff7 = this.FF(ff3, ff6, ff5, ff4, this.X[6], 11);
        final int ff8 = this.FF(ff4, ff7, ff6, ff5, this.X[7], 19);
        final int ff9 = this.FF(ff5, ff8, ff7, ff6, this.X[8], 3);
        final int ff10 = this.FF(ff6, ff9, ff8, ff7, this.X[9], 7);
        final int ff11 = this.FF(ff7, ff10, ff9, ff8, this.X[10], 11);
        final int ff12 = this.FF(ff8, ff11, ff10, ff9, this.X[11], 19);
        final int ff13 = this.FF(ff9, ff12, ff11, ff10, this.X[12], 3);
        final int ff14 = this.FF(ff10, ff13, ff12, ff11, this.X[13], 7);
        final int ff15 = this.FF(ff11, ff14, ff13, ff12, this.X[14], 11);
        final int ff16 = this.FF(ff12, ff15, ff14, ff13, this.X[15], 19);
        final int gg = this.GG(ff13, ff16, ff15, ff14, this.X[0], 3);
        final int gg2 = this.GG(ff14, gg, ff16, ff15, this.X[4], 5);
        final int gg3 = this.GG(ff15, gg2, gg, ff16, this.X[8], 9);
        final int gg4 = this.GG(ff16, gg3, gg2, gg, this.X[12], 13);
        final int gg5 = this.GG(gg, gg4, gg3, gg2, this.X[1], 3);
        final int gg6 = this.GG(gg2, gg5, gg4, gg3, this.X[5], 5);
        final int gg7 = this.GG(gg3, gg6, gg5, gg4, this.X[9], 9);
        final int gg8 = this.GG(gg4, gg7, gg6, gg5, this.X[13], 13);
        final int gg9 = this.GG(gg5, gg8, gg7, gg6, this.X[2], 3);
        final int gg10 = this.GG(gg6, gg9, gg8, gg7, this.X[6], 5);
        final int gg11 = this.GG(gg7, gg10, gg9, gg8, this.X[10], 9);
        final int gg12 = this.GG(gg8, gg11, gg10, gg9, this.X[14], 13);
        final int gg13 = this.GG(gg9, gg12, gg11, gg10, this.X[3], 3);
        final int gg14 = this.GG(gg10, gg13, gg12, gg11, this.X[7], 5);
        final int gg15 = this.GG(gg11, gg14, gg13, gg12, this.X[11], 9);
        final int gg16 = this.GG(gg12, gg15, gg14, gg13, this.X[15], 13);
        final int hh = this.HH(gg13, gg16, gg15, gg14, this.X[0], 3);
        final int hh2 = this.HH(gg14, hh, gg16, gg15, this.X[8], 9);
        final int hh3 = this.HH(gg15, hh2, hh, gg16, this.X[4], 11);
        final int hh4 = this.HH(gg16, hh3, hh2, hh, this.X[12], 15);
        final int hh5 = this.HH(hh, hh4, hh3, hh2, this.X[2], 3);
        final int hh6 = this.HH(hh2, hh5, hh4, hh3, this.X[10], 9);
        final int hh7 = this.HH(hh3, hh6, hh5, hh4, this.X[6], 11);
        final int hh8 = this.HH(hh4, hh7, hh6, hh5, this.X[14], 15);
        final int hh9 = this.HH(hh5, hh8, hh7, hh6, this.X[1], 3);
        final int hh10 = this.HH(hh6, hh9, hh8, hh7, this.X[9], 9);
        final int hh11 = this.HH(hh7, hh10, hh9, hh8, this.X[5], 11);
        final int hh12 = this.HH(hh8, hh11, hh10, hh9, this.X[13], 15);
        final int hh13 = this.HH(hh9, hh12, hh11, hh10, this.X[3], 3);
        final int hh14 = this.HH(hh10, hh13, hh12, hh11, this.X[11], 9);
        final int hh15 = this.HH(hh11, hh14, hh13, hh12, this.X[7], 11);
        final int hh16 = this.HH(hh12, hh15, hh14, hh13, this.X[15], 15);
        final int[] context = this.context;
        context[0] += hh13;
        final int[] context2 = this.context;
        context2[1] += hh16;
        final int[] context3 = this.context;
        context3[2] += hh15;
        final int[] context4 = this.context;
        context4[3] += hh14;
    }
    
    public Object clone() {
        return new MD4(this);
    }
    
    public byte[] engineDigest() {
        final int n = (int)(this.count % 64L);
        int n2;
        if (n < 56) {
            n2 = 56 - n;
        }
        else {
            n2 = 120 - n;
        }
        final byte[] array = new byte[n2 + 8];
        array[0] = Byte.MIN_VALUE;
        for (int i = 0; i < 8; ++i) {
            array[n2 + i] = (byte)(8L * this.count >>> i * 8);
        }
        this.engineUpdate(array, 0, array.length);
        final byte[] array2 = new byte[16];
        for (int j = 0; j < 4; ++j) {
            for (int k = 0; k < 4; ++k) {
                array2[k + j * 4] = (byte)(this.context[j] >>> k * 8);
            }
        }
        this.engineReset();
        return array2;
    }
    
    public void engineReset() {
        this.context[0] = 1732584193;
        this.context[1] = -271733879;
        this.context[2] = -1732584194;
        this.context[3] = 271733878;
        this.count = 0L;
        for (int i = 0; i < 64; ++i) {
            this.buffer[i] = 0;
        }
    }
    
    public void engineUpdate(final byte b) {
        final int n = (int)(this.count % 64L);
        this.count += 1L;
        this.buffer[n] = b;
        if (n == 63) {
            this.transform(this.buffer, 0);
        }
    }
    
    public void engineUpdate(final byte[] array, final int n, final int n2) {
        if (n < 0 || n2 < 0 || n + n2 > array.length) {
            throw new ArrayIndexOutOfBoundsException();
        }
        int n3 = (int)(this.count % 64L);
        this.count += n2;
        final int n4 = 64 - n3;
        int n5 = 0;
        if (n2 >= n4) {
            System.arraycopy(array, n, this.buffer, n3, n4);
            this.transform(this.buffer, 0);
            for (n5 = n4; -1 + (n5 + 64) < n2; n5 += 64) {
                this.transform(array, n + n5);
            }
            n3 = 0;
        }
        if (n5 < n2) {
            System.arraycopy(array, n + n5, this.buffer, n3, n2 - n5);
        }
    }
}
