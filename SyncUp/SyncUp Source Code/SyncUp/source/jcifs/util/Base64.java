package jcifs.util;

public class Base64
{
    private static final String ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    
    public static byte[] decode(final String s) {
        final int length = s.length();
        byte[] array;
        if (length == 0) {
            array = new byte[0];
        }
        else {
            int n;
            if (s.charAt(length - 2) == '=') {
                n = 2;
            }
            else {
                final char char1 = s.charAt(length - 1);
                n = 0;
                if (char1 == '=') {
                    n = 1;
                }
            }
            final int n2 = length * 3 / 4 - n;
            array = new byte[n2];
            int n3 = 0;
            int i = 0;
            while (i < length) {
                final int n4 = i + 1;
                final int n5 = (0xFF & "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".indexOf(s.charAt(i))) << 18;
                final int n6 = n4 + 1;
                final int n7 = n5 | (0xFF & "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".indexOf(s.charAt(n4))) << 12;
                final int n8 = n6 + 1;
                final int n9 = n7 | (0xFF & "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".indexOf(s.charAt(n6))) << 6;
                i = n8 + 1;
                final int n10 = n9 | (0xFF & "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".indexOf(s.charAt(n8)));
                final int n11 = n3 + 1;
                array[n3] = (byte)(n10 >>> 16);
                if (n11 < n2) {
                    n3 = n11 + 1;
                    array[n11] = (byte)(0xFF & n10 >>> 8);
                }
                else {
                    n3 = n11;
                }
                if (n3 < n2) {
                    final int n12 = n3 + 1;
                    array[n3] = (byte)(n10 & 0xFF);
                    n3 = n12;
                }
            }
        }
        return array;
    }
    
    public static String encode(final byte[] array) {
        final int length = array.length;
        String s;
        if (length == 0) {
            s = "";
        }
        else {
            final StringBuffer sb = new StringBuffer(4 * (int)Math.ceil(length / 3.0));
            final int n = length % 3;
            int n2;
            int i;
            int n7;
            for (n2 = length - n, i = 0; i < n2; i = n7) {
                final int n3 = i + 1;
                final int n4 = (0xFF & array[i]) << 16;
                final int n5 = n3 + 1;
                final int n6 = n4 | (0xFF & array[n3]) << 8;
                n7 = n5 + 1;
                final int n8 = n6 | (0xFF & array[n5]);
                sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(n8 >>> 18));
                sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(0x3F & n8 >>> 12));
                sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(0x3F & n8 >>> 6));
                sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(n8 & 0x3F));
            }
            if (n == 0) {
                s = sb.toString();
            }
            else if (n == 1) {
                final int n9 = (0xFF & array[i]) << 4;
                sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(n9 >>> 6));
                sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(n9 & 0x3F));
                sb.append("==");
                s = sb.toString();
            }
            else {
                final int n10 = ((0xFF & array[i]) << 8 | (0xFF & array[i + 1])) << 2;
                sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(n10 >>> 12));
                sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(0x3F & n10 >>> 6));
                sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(n10 & 0x3F));
                sb.append("=");
                s = sb.toString();
            }
        }
        return s;
    }
}
