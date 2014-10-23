package jcifs.util;

import java.util.*;
import java.io.*;

public class Encdec
{
    public static final long MILLISECONDS_BETWEEN_1970_AND_1601 = 11644473600000L;
    public static final long SEC_BETWEEEN_1904_AND_1970 = 2082844800L;
    public static final int TIME_1601_NANOS_64BE = 6;
    public static final int TIME_1601_NANOS_64LE = 5;
    public static final int TIME_1904_SEC_32BE = 3;
    public static final int TIME_1904_SEC_32LE = 4;
    public static final int TIME_1970_MILLIS_64BE = 7;
    public static final int TIME_1970_MILLIS_64LE = 8;
    public static final int TIME_1970_SEC_32BE = 1;
    public static final int TIME_1970_SEC_32LE = 2;
    
    public static double dec_doublebe(final byte[] array, final int n) {
        return Double.longBitsToDouble(dec_uint64be(array, n));
    }
    
    public static double dec_doublele(final byte[] array, final int n) {
        return Double.longBitsToDouble(dec_uint64le(array, n));
    }
    
    public static float dec_floatbe(final byte[] array, final int n) {
        return Float.intBitsToFloat(dec_uint32be(array, n));
    }
    
    public static float dec_floatle(final byte[] array, final int n) {
        return Float.intBitsToFloat(dec_uint32le(array, n));
    }
    
    public static Date dec_time(final byte[] array, final int n, final int n2) {
        Date date = null;
        switch (n2) {
            default: {
                throw new IllegalArgumentException("Unsupported time encoding");
            }
            case 1: {
                date = new Date(1000L * dec_uint32be(array, n));
                break;
            }
            case 2: {
                date = new Date(1000L * dec_uint32le(array, n));
                break;
            }
            case 3: {
                date = new Date(1000L * ((0xFFFFFFFFL & dec_uint32be(array, n)) - 2082844800L));
                break;
            }
            case 4: {
                date = new Date(1000L * ((0xFFFFFFFFL & dec_uint32le(array, n)) - 2082844800L));
                break;
            }
            case 6: {
                date = new Date(dec_uint64be(array, n) / 10000L - 11644473600000L);
                break;
            }
            case 5: {
                date = new Date(dec_uint64le(array, n) / 10000L - 11644473600000L);
                break;
            }
            case 7: {
                date = new Date(dec_uint64be(array, n));
                break;
            }
            case 8: {
                date = new Date(dec_uint64le(array, n));
                break;
            }
        }
        return date;
    }
    
    public static String dec_ucs2le(final byte[] array, int n, final int n2, final char[] array2) throws IOException {
        int n3 = 0;
        while (n + 1 < n2) {
            array2[n3] = (char)dec_uint16le(array, n);
            if (array2[n3] == '\0') {
                break;
            }
            ++n3;
            n += 2;
        }
        return new String(array2, 0, n3);
    }
    
    public static short dec_uint16be(final byte[] array, final int n) {
        return (short)((0xFF & array[n]) << 8 | (0xFF & array[n + 1]));
    }
    
    public static short dec_uint16le(final byte[] array, final int n) {
        return (short)((0xFF & array[n]) | (0xFF & array[n + 1]) << 8);
    }
    
    public static int dec_uint32be(final byte[] array, final int n) {
        return (0xFF & array[n]) << 24 | (0xFF & array[n + 1]) << 16 | (0xFF & array[n + 2]) << 8 | (0xFF & array[n + 3]);
    }
    
    public static int dec_uint32le(final byte[] array, final int n) {
        return (0xFF & array[n]) | (0xFF & array[n + 1]) << 8 | (0xFF & array[n + 2]) << 16 | (0xFF & array[n + 3]) << 24;
    }
    
    public static long dec_uint64be(final byte[] array, final int n) {
        return (0xFFFFFFFFL & dec_uint32be(array, n)) << 32 | (0xFFFFFFFFL & dec_uint32be(array, n + 4));
    }
    
    public static long dec_uint64le(final byte[] array, final int n) {
        return (0xFFFFFFFFL & dec_uint32le(array, n + 4)) << 32 | (0xFFFFFFFFL & dec_uint32le(array, n));
    }
    
    public static String dec_utf8(final byte[] array, final int n, final int n2) throws IOException {
        final char[] array2 = new char[n2 - n];
        int n3 = 0;
        int i = n;
        while (i < n2) {
            int n4 = i + 1;
            final int n5 = 0xFF & array[i];
            if (n5 != 0) {
                if (n5 < 128) {
                    array2[n3] = (char)n5;
                }
                else if ((n5 & 0xE0) == 0xC0) {
                    if (n2 - n4 < 2) {
                        break;
                    }
                    array2[n3] = (char)((n5 & 0x1F) << 6);
                    final int n6 = n4 + 1;
                    final int n7 = 0xFF & array[n4];
                    array2[n3] |= (char)(n7 & 0x3F);
                    if ((n7 & 0xC0) != 0x80 || array2[n3] < '\u0080') {
                        throw new IOException("Invalid UTF-8 sequence");
                    }
                    n4 = n6;
                }
                else {
                    if ((n5 & 0xF0) != 0xE0) {
                        throw new IOException("Unsupported UTF-8 sequence");
                    }
                    if (n2 - n4 < 3) {
                        break;
                    }
                    array2[n3] = (char)((n5 & 0xF) << 12);
                    final int n8 = n4 + 1;
                    final int n9 = 0xFF & array[n4];
                    if ((n9 & 0xC0) != 0x80) {
                        throw new IOException("Invalid UTF-8 sequence");
                    }
                    array2[n3] |= (char)((n9 & 0x3F) << 6);
                    n4 = n8 + 1;
                    final int n10 = 0xFF & array[n8];
                    array2[n3] |= (char)(n10 & 0x3F);
                    if ((n10 & 0xC0) != 0x80 || array2[n3] < '\u0800') {
                        throw new IOException("Invalid UTF-8 sequence");
                    }
                }
                ++n3;
                i = n4;
                continue;
            }
            return new String(array2, 0, n3);
        }
        return new String(array2, 0, n3);
    }
    
    public static int enc_doublebe(final double n, final byte[] array, final int n2) {
        return enc_uint64be(Double.doubleToLongBits(n), array, n2);
    }
    
    public static int enc_doublele(final double n, final byte[] array, final int n2) {
        return enc_uint64le(Double.doubleToLongBits(n), array, n2);
    }
    
    public static int enc_floatbe(final float n, final byte[] array, final int n2) {
        return enc_uint32be(Float.floatToIntBits(n), array, n2);
    }
    
    public static int enc_floatle(final float n, final byte[] array, final int n2) {
        return enc_uint32le(Float.floatToIntBits(n), array, n2);
    }
    
    public static int enc_time(final Date date, final byte[] array, final int n, final int n2) {
        int n3 = 0;
        switch (n2) {
            default: {
                throw new IllegalArgumentException("Unsupported time encoding");
            }
            case 1: {
                n3 = enc_uint32be((int)(date.getTime() / 1000L), array, n);
                break;
            }
            case 2: {
                n3 = enc_uint32le((int)(date.getTime() / 1000L), array, n);
                break;
            }
            case 3: {
                n3 = enc_uint32be((int)(-1L & 2082844800L + date.getTime() / 1000L), array, n);
                break;
            }
            case 4: {
                n3 = enc_uint32le((int)(-1L & 2082844800L + date.getTime() / 1000L), array, n);
                break;
            }
            case 6: {
                n3 = enc_uint64be(10000L * (11644473600000L + date.getTime()), array, n);
                break;
            }
            case 5: {
                n3 = enc_uint64le(10000L * (11644473600000L + date.getTime()), array, n);
                break;
            }
            case 7: {
                n3 = enc_uint64be(date.getTime(), array, n);
                break;
            }
            case 8: {
                n3 = enc_uint64le(date.getTime(), array, n);
                break;
            }
        }
        return n3;
    }
    
    public static int enc_uint16be(final short n, final byte[] array, final int n2) {
        final int n3 = n2 + 1;
        array[n2] = (byte)(0xFF & n >> 8);
        array[n3] = (byte)(n & 0xFF);
        return 2;
    }
    
    public static int enc_uint16le(final short n, final byte[] array, final int n2) {
        final int n3 = n2 + 1;
        array[n2] = (byte)(n & 0xFF);
        array[n3] = (byte)(0xFF & n >> 8);
        return 2;
    }
    
    public static int enc_uint32be(final int n, final byte[] array, final int n2) {
        final int n3 = n2 + 1;
        array[n2] = (byte)(0xFF & n >> 24);
        final int n4 = n3 + 1;
        array[n3] = (byte)(0xFF & n >> 16);
        final int n5 = n4 + 1;
        array[n4] = (byte)(0xFF & n >> 8);
        array[n5] = (byte)(n & 0xFF);
        return 4;
    }
    
    public static int enc_uint32le(final int n, final byte[] array, final int n2) {
        final int n3 = n2 + 1;
        array[n2] = (byte)(n & 0xFF);
        final int n4 = n3 + 1;
        array[n3] = (byte)(0xFF & n >> 8);
        final int n5 = n4 + 1;
        array[n4] = (byte)(0xFF & n >> 16);
        array[n5] = (byte)(0xFF & n >> 24);
        return 4;
    }
    
    public static int enc_uint64be(final long n, final byte[] array, final int n2) {
        enc_uint32be((int)(n & 0xFFFFFFFFL), array, n2 + 4);
        enc_uint32be((int)(0xFFFFFFFFL & n >> 32), array, n2);
        return 8;
    }
    
    public static int enc_uint64le(final long n, final byte[] array, final int n2) {
        enc_uint32le((int)(n & 0xFFFFFFFFL), array, n2);
        enc_uint32le((int)(0xFFFFFFFFL & n >> 32), array, n2 + 4);
        return 8;
    }
    
    public static int enc_utf8(final String s, final byte[] array, final int n, final int n2) throws IOException {
        int length;
        int n3;
        int n4;
        int n5;
        for (length = s.length(), n3 = 0, n4 = n; n4 < n2 && n3 < length; ++n3, n4 = n5) {
            final char char1 = s.charAt(n3);
            if (char1 >= '\u0001' && char1 <= '\u007f') {
                n5 = n4 + 1;
                array[n4] = (byte)char1;
            }
            else if (char1 > '\u07ff') {
                if (n2 - n4 < 3) {
                    break;
                }
                final int n6 = n4 + 1;
                array[n4] = (byte)('\u00e0' | ('\u000f' & char1 >> 12));
                final int n7 = n6 + 1;
                array[n6] = (byte)('\u0080' | ('?' & char1 >> 6));
                n5 = n7 + 1;
                array[n7] = (byte)('\u0080' | ('?' & char1 >> 0));
            }
            else {
                if (n2 - n4 < 2) {
                    break;
                }
                final int n8 = n4 + 1;
                array[n4] = (byte)('\u00c0' | ('\u001f' & char1 >> 6));
                final int n9 = n8 + 1;
                array[n8] = (byte)('\u0080' | ('?' & char1 >> 0));
                n5 = n9;
            }
        }
        return n4 - n;
    }
}
