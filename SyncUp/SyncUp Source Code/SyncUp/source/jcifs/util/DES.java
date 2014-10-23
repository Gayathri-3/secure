package jcifs.util;

public class DES
{
    private static int[] SP1;
    private static int[] SP2;
    private static int[] SP3;
    private static int[] SP4;
    private static int[] SP5;
    private static int[] SP6;
    private static int[] SP7;
    private static int[] SP8;
    private static int[] bigbyte;
    private static byte[] bytebit;
    private static byte[] pc1;
    private static byte[] pc2;
    private static int[] totrot;
    private int[] decryptKeys;
    private int[] encryptKeys;
    private int[] tempInts;
    
    static {
        DES.bytebit = new byte[] { Byte.MIN_VALUE, 64, 32, 16, 8, 4, 2, 1 };
        DES.bigbyte = new int[] { 8388608, 4194304, 2097152, 1048576, 524288, 262144, 131072, 65536, 32768, 16384, 8192, 4096, 2048, 1024, 512, 256, 128, 64, 32, 16, 8, 4, 2, 1 };
        DES.pc1 = new byte[] { 56, 48, 40, 32, 24, 16, 8, 0, 57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34, 26, 18, 10, 2, 59, 51, 43, 35, 62, 54, 46, 38, 30, 22, 14, 6, 61, 53, 45, 37, 29, 21, 13, 5, 60, 52, 44, 36, 28, 20, 12, 4, 27, 19, 11, 3 };
        DES.totrot = new int[] { 1, 2, 4, 6, 8, 10, 12, 14, 15, 17, 19, 21, 23, 25, 27, 28 };
        DES.pc2 = new byte[] { 13, 16, 10, 23, 0, 4, 2, 27, 14, 5, 20, 9, 22, 18, 11, 3, 25, 7, 15, 6, 26, 19, 12, 1, 40, 51, 30, 36, 46, 54, 29, 39, 50, 44, 32, 47, 43, 48, 38, 55, 33, 52, 45, 41, 49, 35, 28, 31 };
        DES.SP1 = new int[] { 16843776, 0, 65536, 16843780, 16842756, 66564, 4, 65536, 1024, 16843776, 16843780, 1024, 16778244, 16842756, 16777216, 4, 1028, 16778240, 16778240, 66560, 66560, 16842752, 16842752, 16778244, 65540, 16777220, 16777220, 65540, 0, 1028, 66564, 16777216, 65536, 16843780, 4, 16842752, 16843776, 16777216, 16777216, 1024, 16842756, 65536, 66560, 16777220, 1024, 4, 16778244, 66564, 16843780, 65540, 16842752, 16778244, 16777220, 1028, 66564, 16843776, 1028, 16778240, 16778240, 0, 65540, 66560, 0, 16842756 };
        DES.SP2 = new int[] { -2146402272, -2147450880, 32768, 1081376, 1048576, 32, -2146435040, -2147450848, -2147483616, -2146402272, -2146402304, Integer.MIN_VALUE, -2147450880, 1048576, 32, -2146435040, 1081344, 1048608, -2147450848, 0, Integer.MIN_VALUE, 32768, 1081376, -2146435072, 1048608, -2147483616, 0, 1081344, 32800, -2146402304, -2146435072, 32800, 0, 1081376, -2146435040, 1048576, -2147450848, -2146435072, -2146402304, 32768, -2146435072, -2147450880, 32, -2146402272, 1081376, 32, 32768, Integer.MIN_VALUE, 32800, -2146402304, 1048576, -2147483616, 1048608, -2147450848, -2147483616, 1048608, 1081344, 0, -2147450880, 32800, Integer.MIN_VALUE, -2146435040, -2146402272, 1081344 };
        DES.SP3 = new int[] { 520, 134349312, 0, 134348808, 134218240, 0, 131592, 134218240, 131080, 134217736, 134217736, 131072, 134349320, 131080, 134348800, 520, 134217728, 8, 134349312, 512, 131584, 134348800, 134348808, 131592, 134218248, 131584, 131072, 134218248, 8, 134349320, 512, 134217728, 134349312, 134217728, 131080, 520, 131072, 134349312, 134218240, 0, 512, 131080, 134349320, 134218240, 134217736, 512, 0, 134348808, 134218248, 131072, 134217728, 134349320, 8, 131592, 131584, 134217736, 134348800, 134218248, 520, 134348800, 131592, 8, 134348808, 131584 };
        DES.SP4 = new int[] { 8396801, 8321, 8321, 128, 8396928, 8388737, 8388609, 8193, 0, 8396800, 8396800, 8396929, 129, 0, 8388736, 8388609, 1, 8192, 8388608, 8396801, 128, 8388608, 8193, 8320, 8388737, 1, 8320, 8388736, 8192, 8396928, 8396929, 129, 8388736, 8388609, 8396800, 8396929, 129, 0, 0, 8396800, 8320, 8388736, 8388737, 1, 8396801, 8321, 8321, 128, 8396929, 129, 1, 8192, 8388609, 8193, 8396928, 8388737, 8193, 8320, 8388608, 8396801, 128, 8388608, 8192, 8396928 };
        DES.SP5 = new int[] { 256, 34078976, 34078720, 1107296512, 524288, 256, 1073741824, 34078720, 1074266368, 524288, 33554688, 1074266368, 1107296512, 1107820544, 524544, 1073741824, 33554432, 1074266112, 1074266112, 0, 1073742080, 1107820800, 1107820800, 33554688, 1107820544, 1073742080, 0, 1107296256, 34078976, 33554432, 1107296256, 524544, 524288, 1107296512, 256, 33554432, 1073741824, 34078720, 1107296512, 1074266368, 33554688, 1073741824, 1107820544, 34078976, 1074266368, 256, 33554432, 1107820544, 1107820800, 524544, 1107296256, 1107820800, 34078720, 0, 1074266112, 1107296256, 524544, 33554688, 1073742080, 524288, 0, 1074266112, 34078976, 1073742080 };
        DES.SP6 = new int[] { 536870928, 541065216, 16384, 541081616, 541065216, 16, 541081616, 4194304, 536887296, 4210704, 4194304, 536870928, 4194320, 536887296, 536870912, 16400, 0, 4194320, 536887312, 16384, 4210688, 536887312, 16, 541065232, 541065232, 0, 4210704, 541081600, 16400, 4210688, 541081600, 536870912, 536887296, 16, 541065232, 4210688, 541081616, 4194304, 16400, 536870928, 4194304, 536887296, 536870912, 16400, 536870928, 541081616, 4210688, 541065216, 4210704, 541081600, 0, 541065232, 16, 16384, 541065216, 4210704, 16384, 4194320, 536887312, 0, 541081600, 536870912, 4194320, 536887312 };
        DES.SP7 = new int[] { 2097152, 69206018, 67110914, 0, 2048, 67110914, 2099202, 69208064, 69208066, 2097152, 0, 67108866, 2, 67108864, 69206018, 2050, 67110912, 2099202, 2097154, 67110912, 67108866, 69206016, 69208064, 2097154, 69206016, 2048, 2050, 69208066, 2099200, 2, 67108864, 2099200, 67108864, 2099200, 2097152, 67110914, 67110914, 69206018, 69206018, 2, 2097154, 67108864, 67110912, 2097152, 69208064, 2050, 2099202, 69208064, 2050, 67108866, 69208066, 69206016, 2099200, 0, 2, 69208066, 0, 2099202, 69206016, 2048, 67108866, 67110912, 2048, 2097154 };
        DES.SP8 = new int[] { 268439616, 4096, 262144, 268701760, 268435456, 268439616, 64, 268435456, 262208, 268697600, 268701760, 266240, 268701696, 266304, 4096, 64, 268697600, 268435520, 268439552, 4160, 266240, 262208, 268697664, 268701696, 4160, 0, 0, 268697664, 268435520, 268439552, 266304, 262144, 266304, 262144, 268701696, 4096, 64, 268697664, 4096, 266304, 268439552, 64, 268435520, 268697600, 268697664, 268435456, 262144, 268439616, 0, 268701760, 262208, 268435520, 268697600, 268439552, 268439616, 0, 268701760, 266240, 266240, 4160, 4160, 262208, 268435456, 268701696 };
    }
    
    public DES() {
        super();
        this.encryptKeys = new int[32];
        this.decryptKeys = new int[32];
        this.tempInts = new int[2];
    }
    
    public DES(final byte[] key) {
        super();
        this.encryptKeys = new int[32];
        this.decryptKeys = new int[32];
        this.tempInts = new int[2];
        if (key.length == 7) {
            final byte[] key2 = new byte[8];
            makeSMBKey(key, key2);
            this.setKey(key2);
        }
        else {
            this.setKey(key);
        }
    }
    
    private void cookey(final int[] array, final int[] array2) {
        int i = 0;
        int n = 0;
        int n2 = 0;
        while (i < 16) {
            final int n3 = n2 + 1;
            final int n4 = array[n2];
            n2 = n3 + 1;
            final int n5 = array[n3];
            array2[n] = (n4 & 0xFC0000) << 6;
            array2[n] |= (n4 & 0xFC0) << 10;
            array2[n] |= (n5 & 0xFC0000) >>> 10;
            array2[n] |= (n5 & 0xFC0) >>> 6;
            final int n6 = n + 1;
            array2[n6] = (n4 & 0x3F000) << 12;
            array2[n6] |= (n4 & 0x3F) << 16;
            array2[n6] |= (n5 & 0x3F000) >>> 4;
            array2[n6] |= (n5 & 0x3F);
            n = n6 + 1;
            ++i;
        }
    }
    
    private void decrypt(final byte[] array, final int n, final byte[] array2, final int n2) {
        squashBytesToInts(array, n, this.tempInts, 0, 2);
        this.des(this.tempInts, this.tempInts, this.decryptKeys);
        spreadIntsToBytes(this.tempInts, 0, array2, n2, 2);
    }
    
    private void des(final int[] array, final int[] array2, final int[] array3) {
        final int n = array[0];
        final int n2 = array[1];
        final int n3 = 0xF0F0F0F & (n2 ^ n >>> 4);
        final int n4 = n2 ^ n3;
        final int n5 = n ^ n3 << 4;
        final int n6 = 0xFFFF & (n4 ^ n5 >>> 16);
        final int n7 = n4 ^ n6;
        final int n8 = n5 ^ n6 << 16;
        final int n9 = 0x33333333 & (n8 ^ n7 >>> 2);
        final int n10 = n8 ^ n9;
        final int n11 = n7 ^ n9 << 2;
        final int n12 = 0xFF00FF & (n10 ^ n11 >>> 8);
        final int n13 = n10 ^ n12;
        final int n14 = n11 ^ n12 << 8;
        final int n15 = n14 << 1 | (0x1 & n14 >>> 31);
        final int n16 = 0xAAAAAAAA & (n13 ^ n15);
        final int n17 = n13 ^ n16;
        int n18 = n15 ^ n16;
        int n19 = n17 << 1 | (0x1 & n17 >>> 31);
        int i = 0;
        int n20 = 0;
        while (i < 8) {
            final int n21 = n18 << 28 | n18 >>> 4;
            final int n22 = n20 + 1;
            final int n23 = n21 ^ array3[n20];
            final int n24 = DES.SP7[n23 & 0x3F] | DES.SP5[0x3F & n23 >>> 8] | DES.SP3[0x3F & n23 >>> 16] | DES.SP1[0x3F & n23 >>> 24];
            final int n25 = n22 + 1;
            final int n26 = n18 ^ array3[n22];
            n19 ^= (n24 | DES.SP8[n26 & 0x3F] | DES.SP6[0x3F & n26 >>> 8] | DES.SP4[0x3F & n26 >>> 16] | DES.SP2[0x3F & n26 >>> 24]);
            final int n27 = n19 << 28 | n19 >>> 4;
            final int n28 = n25 + 1;
            final int n29 = n27 ^ array3[n25];
            final int n30 = DES.SP7[n29 & 0x3F] | DES.SP5[0x3F & n29 >>> 8] | DES.SP3[0x3F & n29 >>> 16] | DES.SP1[0x3F & n29 >>> 24];
            n20 = n28 + 1;
            final int n31 = n19 ^ array3[n28];
            n18 ^= (n30 | DES.SP8[n31 & 0x3F] | DES.SP6[0x3F & n31 >>> 8] | DES.SP4[0x3F & n31 >>> 16] | DES.SP2[0x3F & n31 >>> 24]);
            ++i;
        }
        final int n32 = n18 << 31 | n18 >>> 1;
        final int n33 = 0xAAAAAAAA & (n19 ^ n32);
        final int n34 = n19 ^ n33;
        final int n35 = n32 ^ n33;
        final int n36 = n34 << 31 | n34 >>> 1;
        final int n37 = 0xFF00FF & (n35 ^ n36 >>> 8);
        final int n38 = n35 ^ n37;
        final int n39 = n36 ^ n37 << 8;
        final int n40 = 0x33333333 & (n38 ^ n39 >>> 2);
        final int n41 = n38 ^ n40;
        final int n42 = n39 ^ n40 << 2;
        final int n43 = 0xFFFF & (n42 ^ n41 >>> 16);
        final int n44 = n42 ^ n43;
        final int n45 = n41 ^ n43 << 16;
        final int n46 = 0xF0F0F0F & (n44 ^ n45 >>> 4);
        final int n47 = n44 ^ n46;
        array2[0] = (n45 ^ n46 << 4);
        array2[1] = n47;
    }
    
    private void deskey(final byte[] array, final boolean b, final int[] array2) {
        final int[] array3 = new int[56];
        final int[] array4 = new int[56];
        final int[] array5 = new int[32];
        for (int i = 0; i < 56; ++i) {
            final byte b2 = DES.pc1[i];
            int n;
            if ((array[b2 >>> 3] & DES.bytebit[b2 & 0x7]) != 0x0) {
                n = 1;
            }
            else {
                n = 0;
            }
            array3[i] = n;
        }
        for (int j = 0; j < 16; ++j) {
            int n2;
            if (b) {
                n2 = j << 1;
            }
            else {
                n2 = 15 - j << 1;
            }
            final int n3 = n2 + 1;
            array5[n2] = (array5[n3] = 0);
            for (int k = 0; k < 28; ++k) {
                final int n4 = k + DES.totrot[j];
                if (n4 < 28) {
                    array4[k] = array3[n4];
                }
                else {
                    array4[k] = array3[n4 - 28];
                }
            }
            for (int l = 28; l < 56; ++l) {
                final int n5 = l + DES.totrot[j];
                if (n5 < 56) {
                    array4[l] = array3[n5];
                }
                else {
                    array4[l] = array3[n5 - 28];
                }
            }
            for (int n6 = 0; n6 < 24; ++n6) {
                if (array4[DES.pc2[n6]] != 0) {
                    array5[n2] |= DES.bigbyte[n6];
                }
                if (array4[DES.pc2[n6 + 24]] != 0) {
                    array5[n3] |= DES.bigbyte[n6];
                }
            }
        }
        this.cookey(array5, array2);
    }
    
    private void encrypt(final byte[] array, final int n, final byte[] array2, final int n2) {
        squashBytesToInts(array, n, this.tempInts, 0, 2);
        this.des(this.tempInts, this.tempInts, this.encryptKeys);
        spreadIntsToBytes(this.tempInts, 0, array2, n2, 2);
    }
    
    public static void makeSMBKey(final byte[] array, final byte[] array2) {
        array2[0] = (byte)(0xFF & array[0] >> 1);
        array2[1] = (byte)(0xFF & ((0x1 & array[0]) << 6 | (0xFF & (0xFF & array[1]) >> 2)));
        array2[2] = (byte)(0xFF & ((0x3 & array[1]) << 5 | (0xFF & (0xFF & array[2]) >> 3)));
        array2[3] = (byte)(0xFF & ((0x7 & array[2]) << 4 | (0xFF & (0xFF & array[3]) >> 4)));
        array2[4] = (byte)(0xFF & ((0xF & array[3]) << 3 | (0xFF & (0xFF & array[4]) >> 5)));
        array2[5] = (byte)(0xFF & ((0x1F & array[4]) << 2 | (0xFF & (0xFF & array[5]) >> 6)));
        array2[6] = (byte)(0xFF & ((0x3F & array[5]) << 1 | (0xFF & (0xFF & array[6]) >> 7)));
        array2[7] = (Byte.MAX_VALUE & array[6]);
        for (int i = 0; i < 8; ++i) {
            array2[i] <<= (byte)1;
        }
    }
    
    public static void spreadIntsToBytes(final int[] array, final int n, final byte[] array2, final int n2, final int n3) {
        for (int i = 0; i < n3; ++i) {
            array2[n2 + i * 4] = (byte)(array[n + i] >>> 24);
            array2[1 + (n2 + i * 4)] = (byte)(array[n + i] >>> 16);
            array2[2 + (n2 + i * 4)] = (byte)(array[n + i] >>> 8);
            array2[3 + (n2 + i * 4)] = (byte)array[n + i];
        }
    }
    
    public static void squashBytesToInts(final byte[] array, final int n, final int[] array2, final int n2, final int n3) {
        for (int i = 0; i < n3; ++i) {
            array2[n2 + i] = ((0xFF & array[n + i * 4]) << 24 | (0xFF & array[1 + (n + i * 4)]) << 16 | (0xFF & array[2 + (n + i * 4)]) << 8 | (0xFF & array[3 + (n + i * 4)]));
        }
    }
    
    public void decrypt(final byte[] array, final byte[] array2) {
        this.decrypt(array, 0, array2, 0);
    }
    
    public byte[] decrypt(final byte[] array) {
        final int length = array.length;
        byte[] array2;
        if (length % 8 != 0) {
            System.out.println("Array must be a multiple of 8");
            array2 = null;
        }
        else {
            array2 = new byte[length];
            for (int n = length / 8, i = 0; i < n; ++i) {
                this.encrypt(array, i * 8, array2, i * 8);
            }
        }
        return array2;
    }
    
    public void encrypt(final byte[] array, final byte[] array2) {
        this.encrypt(array, 0, array2, 0);
    }
    
    public byte[] encrypt(final byte[] array) {
        final int length = array.length;
        byte[] array2;
        if (length % 8 != 0) {
            System.out.println("Array must be a multiple of 8");
            array2 = null;
        }
        else {
            array2 = new byte[length];
            for (int n = length / 8, i = 0; i < n; ++i) {
                this.encrypt(array, i * 8, array2, i * 8);
            }
        }
        return array2;
    }
    
    public void setKey(final byte[] array) {
        this.deskey(array, true, this.encryptKeys);
        this.deskey(array, false, this.decryptKeys);
    }
}
