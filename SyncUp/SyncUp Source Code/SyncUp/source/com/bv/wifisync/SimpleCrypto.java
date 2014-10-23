package com.bv.wifisync;

import javax.crypto.spec.*;
import java.security.*;
import javax.crypto.*;

class SimpleCrypto
{
    private static final String HEX = "0123456789ABCDEF";
    private static byte[] SEED;
    
    static {
        SimpleCrypto.SEED = "bv.software.limited".getBytes();
    }
    
    private static void appendHex(final StringBuffer sb, final byte b) {
        sb.append("0123456789ABCDEF".charAt(0xF & b >> 4)).append("0123456789ABCDEF".charAt(b & 0xF));
    }
    
    private static byte[] crypt(final byte[] array, final int n) throws GeneralSecurityException {
        final SecretKeySpec secretKeySpec = new SecretKeySpec(getRawKey(), "AES");
        final Cipher instance = Cipher.getInstance("AES");
        instance.init(n, secretKeySpec);
        return instance.doFinal(array);
    }
    
    static String decrypt(final String s) throws GeneralSecurityException {
        return new String(crypt(toByte(s), 2));
    }
    
    static String encrypt(final String s) throws Exception {
        return toHex(crypt(s.getBytes(), 1));
    }
    
    private static byte[] getRawKey() throws GeneralSecurityException {
        final SecureRandom instance = SecureRandom.getInstance("SHA1PRNG", "Crypto");
        instance.setSeed(SimpleCrypto.SEED);
        final KeyGenerator instance2 = KeyGenerator.getInstance("AES");
        instance2.init(128, instance);
        return instance2.generateKey().getEncoded();
    }
    
    private static byte[] toByte(final String s) {
        final int n = s.length() / 2;
        final byte[] array = new byte[n];
        for (int i = 0; i < n; ++i) {
            array[i] = (byte)(Object)Integer.valueOf(s.substring(i * 2, 2 + i * 2), 16);
        }
        return array;
    }
    
    private static String toHex(final byte[] array) {
        String string;
        if (array == null) {
            string = "";
        }
        else {
            final StringBuffer sb = new StringBuffer(2 * array.length);
            for (int i = 0; i < array.length; ++i) {
                appendHex(sb, array[i]);
            }
            string = sb.toString();
        }
        return string;
    }
}
