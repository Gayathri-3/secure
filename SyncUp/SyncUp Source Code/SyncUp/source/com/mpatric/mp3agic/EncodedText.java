package com.mpatric.mp3agic;

import java.nio.*;
import java.nio.charset.*;
import java.util.*;

public class EncodedText
{
    public static final String CHARSET_ISO_8859_1 = "ISO-8859-1";
    public static final String CHARSET_UTF_16 = "UTF-16";
    public static final String CHARSET_UTF_16BE = "UTF-16BE";
    public static final String CHARSET_UTF_8 = "UTF-8";
    public static final byte TEXT_ENCODING_ISO_8859_1 = 0;
    public static final byte TEXT_ENCODING_UTF_16 = 1;
    public static final byte TEXT_ENCODING_UTF_16BE = 2;
    public static final byte TEXT_ENCODING_UTF_8 = 3;
    private static final String[] characterSets;
    private byte textEncoding;
    private byte[] value;
    
    static {
        characterSets = new String[] { "ISO-8859-1", "UTF-16", "UTF-16BE", "UTF-8" };
    }
    
    public EncodedText(final byte textEncoding, final String s) {
        super();
        this.textEncoding = textEncoding;
        this.value = stringToUnicodeBytes(s, this.characterSetForTextEncoding(textEncoding));
    }
    
    public EncodedText(final byte textEncoding, final byte[] value) {
        super();
        this.textEncoding = textEncoding;
        this.value = value;
    }
    
    private String characterSetForTextEncoding(final byte b) {
        try {
            return EncodedText.characterSets[b];
        }
        catch (ArrayIndexOutOfBoundsException ex) {
            throw new IllegalArgumentException("Invalid text encoding " + b);
        }
    }
    
    public static byte[] stringToUnicodeBytes(final String s, final String s2) {
        final CharsetEncoder encoder = Charset.forName(s2).newEncoder();
        try {
            final ByteBuffer encode = encoder.encode(CharBuffer.wrap(s));
            return BufferTools.copyBuffer(encode.array(), 0, encode.limit());
        }
        catch (CharacterCodingException ex) {
            return null;
        }
    }
    
    public static String unicodeBytesToString(final byte[] array, final String s) {
        final CharsetDecoder decoder = Charset.forName(s).newDecoder();
        String s2;
        try {
            s2 = decoder.decode(ByteBuffer.wrap(array)).toString();
            final int index = s2.indexOf(0);
            if (index != -1) {
                s2 = s2.substring(0, index);
            }
        }
        catch (CharacterCodingException ex) {
            s2 = null;
        }
        return s2;
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof EncodedText;
        boolean b2 = false;
        if (b) {
            if (super.equals(o)) {
                b2 = true;
            }
            else {
                final EncodedText encodedText = (EncodedText)o;
                final byte textEncoding = this.textEncoding;
                final byte textEncoding2 = encodedText.textEncoding;
                b2 = false;
                if (textEncoding == textEncoding2) {
                    final boolean equals = Arrays.equals(this.value, encodedText.value);
                    b2 = false;
                    if (equals) {
                        b2 = true;
                    }
                }
            }
        }
        return b2;
    }
    
    public String getCharacterSet() {
        return this.characterSetForTextEncoding(this.textEncoding);
    }
    
    public byte getTextEncoding() {
        return this.textEncoding;
    }
    
    public void setTextEncoding(final byte textEncoding) {
        this.textEncoding = textEncoding;
    }
    
    public byte[] toBytes() {
        return this.value;
    }
    
    public String toString() {
        return unicodeBytesToString(this.value, this.characterSetForTextEncoding(this.textEncoding));
    }
}
