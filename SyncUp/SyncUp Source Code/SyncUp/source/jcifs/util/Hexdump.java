package jcifs.util;

import java.io.*;

public class Hexdump
{
    public static final char[] HEX_DIGITS;
    private static final String NL;
    private static final int NL_LENGTH;
    private static final char[] SPACE_CHARS;
    
    static {
        NL = System.getProperty("line.separator");
        NL_LENGTH = Hexdump.NL.length();
        SPACE_CHARS = new char[] { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' };
        HEX_DIGITS = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
    }
    
    public static void hexdump(final PrintStream printStream, final byte[] array, final int n, final int n2) {
        if (n2 != 0) {
            final int n3 = n2 % 16;
            int n4;
            if (n3 == 0) {
                n4 = n2 / 16;
            }
            else {
                n4 = 1 + n2 / 16;
            }
            final char[] array2 = new char[n4 * (74 + Hexdump.NL_LENGTH)];
            final char[] array3 = new char[16];
            int i = 0;
            int n5 = 0;
        Block_3:
            while (true) {
                toHexChars(i, array2, n5, 5);
                final int n6 = n5 + 5;
                int n7 = n6 + 1;
                array2[n6] = ':';
                while (true) {
                    while (i != n2) {
                        final int n8 = n7 + 1;
                        array2[n7] = ' ';
                        final int n9 = 0xFF & array[n + i];
                        toHexChars(n9, array2, n8, 2);
                        final int n10 = n8 + 2;
                        if (n9 < 0 || Character.isISOControl((char)n9)) {
                            array3[i % 16] = '.';
                        }
                        else {
                            array3[i % 16] = (char)n9;
                        }
                        if (++i % 16 != 0) {
                            n7 = n10;
                        }
                        else {
                            final int n11 = n10 + 1;
                            array2[n10] = ' ';
                            final int n12 = n11 + 1;
                            array2[n11] = ' ';
                            final int n13 = n12 + 1;
                            array2[n12] = '|';
                            System.arraycopy(array3, 0, array2, n13, 16);
                            final int n14 = n13 + 16;
                            final int n15 = n14 + 1;
                            array2[n14] = '|';
                            Hexdump.NL.getChars(0, Hexdump.NL_LENGTH, array2, n15);
                            n5 = n15 + Hexdump.NL_LENGTH;
                            if (i >= n2) {
                                break Block_3;
                            }
                            continue Block_3;
                        }
                    }
                    final int n16 = 16 - n3;
                    System.arraycopy(Hexdump.SPACE_CHARS, 0, array2, n7, n16 * 3);
                    final int n10 = n7 + n16 * 3;
                    System.arraycopy(Hexdump.SPACE_CHARS, 0, array3, n3, n16);
                    continue;
                }
            }
            printStream.println(array2);
        }
    }
    
    public static void toHexChars(int n, final char[] array, final int n2, int i) {
        while (i > 0) {
            final int n3 = -1 + (n2 + i);
            if (n3 < array.length) {
                array[n3] = Hexdump.HEX_DIGITS[n & 0xF];
            }
            if (n != 0) {
                n >>>= 4;
            }
            --i;
        }
    }
    
    public static void toHexChars(long n, final char[] array, final int n2, int i) {
        while (i > 0) {
            array[-1 + (n2 + i)] = Hexdump.HEX_DIGITS[(int)(0xFL & n)];
            if (n != 0L) {
                n >>>= 4;
            }
            --i;
        }
    }
    
    public static String toHexString(final int n, final int n2) {
        final char[] array = new char[n2];
        toHexChars(n, array, 0, n2);
        return new String(array);
    }
    
    public static String toHexString(final long n, final int n2) {
        final char[] array = new char[n2];
        toHexChars(n, array, 0, n2);
        return new String(array);
    }
    
    public static String toHexString(final byte[] array, final int n, final int n2) {
        final char[] array2 = new char[n2];
        int n3;
        if (n2 % 2 == 0) {
            n3 = n2 / 2;
        }
        else {
            n3 = 1 + n2 / 2;
        }
        int i = 0;
        int n4 = 0;
        while (i < n3) {
            final int n5 = n4 + 1;
            array2[n4] = Hexdump.HEX_DIGITS[0xF & array[i] >> 4];
            if (n5 == array2.length) {
                break;
            }
            n4 = n5 + 1;
            array2[n5] = Hexdump.HEX_DIGITS[0xF & array[i]];
            ++i;
        }
        return new String(array2);
    }
}
