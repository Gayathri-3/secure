package com.mpatric.mp3agic;

public class BufferTools
{
    public static String asciiOnly(final String s) {
        final StringBuffer sb = new StringBuffer();
        for (int i = 0; i < s.length(); ++i) {
            final char char1 = s.charAt(i);
            if (char1 < ' ' || char1 > '~') {
                sb.append('?');
            }
            else {
                sb.append(char1);
            }
        }
        return sb.toString();
    }
    
    public static String byteBufferToString(final byte[] array, final int n, final int n2) {
        String string;
        if (n2 < 1) {
            string = "";
        }
        else {
            final StringBuffer sb = new StringBuffer();
            for (int i = 0; i < n2; ++i) {
                char c;
                if (array[n + i] >= 0) {
                    c = (char)array[n + i];
                }
                else {
                    c = (char)(256 + array[n + i]);
                }
                sb.append(c);
            }
            string = sb.toString();
        }
        return string;
    }
    
    public static boolean checkBit(final byte b, final int n) {
        int n2 = 1;
        if ((b & n2 << n) == 0x0) {
            n2 = 0;
        }
        return n2 != 0;
    }
    
    public static byte[] copyBuffer(final byte[] array, final int n, final int n2) {
        final byte[] array2 = new byte[n2];
        for (int i = 0; i < n2; ++i) {
            array2[i] = array[n + i];
        }
        return array2;
    }
    
    public static void copyIntoByteBuffer(final byte[] array, final int n, final int n2, final byte[] array2, final int n3) {
        for (int i = n; i < n2; ++i) {
            array2[n3 + i] = array[i];
        }
    }
    
    public static byte[] packInteger(final int n) {
        return new byte[] { (byte)(0xFF & n >> 24), (byte)(0xFF & n >> 16), (byte)(0xFF & n >> 8), (byte)(n & 0xFF) };
    }
    
    public static void packSynchsafeInteger(final int n, final byte[] array, final int n2) {
        array[n2 + 3] = (byte)(n & 0x7F);
        array[n2 + 2] = (byte)(0x7F & n >> 7);
        array[n2 + 1] = (byte)(0x7F & n >> 14);
        array[n2 + 0] = (byte)(0x7F & n >> 21);
    }
    
    public static byte[] packSynchsafeInteger(final int n) {
        final byte[] array = new byte[4];
        packSynchsafeInteger(n, array, 0);
        return array;
    }
    
    public static String padStringRight(String string, final int n, final char c) {
        if (string.length() < n) {
            final StringBuffer sb = new StringBuffer(string);
            while (sb.length() < n) {
                sb.append(c);
            }
            string = sb.toString();
        }
        return string;
    }
    
    public static byte setBit(final byte b, final int n, final boolean b2) {
        byte b3;
        if (b2) {
            b3 = (byte)(b | 1 << n);
        }
        else {
            b3 = (byte)(b & (-1 ^ 1 << n));
        }
        return b3;
    }
    
    public static int shiftByte(final byte b, final int n) {
        int n2 = b & 0xFF;
        if (n < 0) {
            n2 <<= -n;
        }
        else if (n > 0) {
            n2 >>= n;
        }
        return n2;
    }
    
    public static int sizeSynchronisationWouldSubtract(final byte[] array) {
        int n = 0;
        for (int i = 0; i < -2 + array.length; ++i) {
            if (array[i] == -1 && array[i + 1] == 0 && ((0xE0 & array[i + 2]) == 0xE0 || array[i + 2] == 0)) {
                ++n;
            }
        }
        if (array.length > 1 && array[-2 + array.length] == -1 && array[-1 + array.length] == 0) {
            ++n;
        }
        return n;
    }
    
    public static int sizeUnsynchronisationWouldAdd(final byte[] array) {
        int n = 0;
        for (int i = 0; i < -1 + array.length; ++i) {
            if (array[i] == -1 && ((0xE0 & array[i + 1]) == 0xE0 || array[i + 1] == 0)) {
                ++n;
            }
        }
        if (array.length > 0 && array[-1 + array.length] == -1) {
            ++n;
        }
        return n;
    }
    
    public static void stringIntoByteBuffer(final String s, final int n, final int n2, final byte[] array, final int n3) {
        for (int i = 0; i < n2; ++i) {
            final char char1 = s.charAt(n + i);
            byte b;
            if (char1 < '\u0080') {
                b = (byte)char1;
            }
            else {
                b = (byte)(char1 - '\u0100');
            }
            array[n3 + i] = b;
        }
    }
    
    public static byte[] stringToByteBuffer(final String s, final int n, final int n2) {
        return s.substring(n, n + n2).getBytes();
    }
    
    public static String substitute(String string, final String s, final String s2) {
        if (s.length() >= 1 && string.indexOf(s) >= 0) {
            final StringBuffer sb = new StringBuffer();
            int n = 0;
            int n2 = 0;
            while (true) {
                final int index = string.indexOf(s, n2);
                if (index < 0) {
                    break;
                }
                if (index > n) {
                    sb.append(string.substring(n, index));
                }
                if (s2 != null) {
                    sb.append(s2);
                }
                n = index + s.length();
                n2 = index + 1;
            }
            if (n < string.length()) {
                sb.append(string.substring(n));
            }
            string = sb.toString();
        }
        return string;
    }
    
    public static byte[] synchroniseBuffer(byte[] array) {
        final int sizeSynchronisationWouldSubtract = sizeSynchronisationWouldSubtract(array);
        if (sizeSynchronisationWouldSubtract != 0) {
            final byte[] array2 = new byte[array.length - sizeSynchronisationWouldSubtract];
            int n = 0;
            for (int i = 0; i < -1 + array2.length; ++i) {
                array2[i] = array[n];
                if (array[n] == -1 && array[n + 1] == 0 && ((0xE0 & array[n + 2]) == 0xE0 || array[n + 2] == 0)) {
                    ++n;
                }
                ++n;
            }
            array2[-1 + array2.length] = array[n];
            array = array2;
        }
        return array;
    }
    
    public static String trimStringRight(String substring) {
        int n;
        for (n = -1 + substring.length(); n >= 0 && substring.charAt(n) <= ' '; --n) {}
        if (n != -1 + substring.length()) {
            if (n < 0) {
                substring = "";
            }
            else {
                substring = substring.substring(0, n + 1);
            }
        }
        return substring;
    }
    
    public static int unpackInteger(final byte b, final byte b2, final byte b3, final byte b4) {
        return (b4 & 0xFF) + shiftByte(b3, -8) + shiftByte(b2, -16) + shiftByte(b, -24);
    }
    
    public static int unpackSynchsafeInteger(final byte b, final byte b2, final byte b3, final byte b4) {
        return (b4 & Byte.MAX_VALUE) + shiftByte(b3 & Byte.MAX_VALUE, -7) + shiftByte(b2 & Byte.MAX_VALUE, -14) + shiftByte(b & Byte.MAX_VALUE, -21);
    }
    
    public static byte[] unsynchroniseBuffer(byte[] array) {
        final int sizeUnsynchronisationWouldAdd = sizeUnsynchronisationWouldAdd(array);
        if (sizeUnsynchronisationWouldAdd != 0) {
            final byte[] array2 = new byte[sizeUnsynchronisationWouldAdd + array.length];
            int n = 0;
            for (int i = 0; i < -1 + array.length; ++i) {
                final int n2 = n + 1;
                array2[n] = array[i];
                if (array[i] == -1 && ((0xE0 & array[i + 1]) == 0xE0 || array[i + 1] == 0)) {
                    n = n2 + 1;
                    array2[n2] = 0;
                }
                else {
                    n = n2;
                }
            }
            final int n3 = n + 1;
            array2[n] = array[-1 + array.length];
            if (array[-1 + array.length] == -1) {
                array2[n3] = 0;
            }
            array = array2;
        }
        return array;
    }
}
