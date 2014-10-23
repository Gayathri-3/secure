package jcifs.dcerpc;

public class UnicodeString extends rpc.unicode_string
{
    boolean zterm;
    
    public UnicodeString(final String s, final boolean zterm) {
        super();
        this.zterm = zterm;
        final int length = s.length();
        int n;
        if (zterm) {
            n = 1;
        }
        else {
            n = 0;
        }
        final short n2 = (short)(2 * (length + n));
        this.maximum_length = n2;
        this.length = n2;
        this.buffer = new short[length + n];
        int i;
        for (i = 0; i < length; ++i) {
            this.buffer[i] = (short)s.charAt(i);
        }
        if (zterm) {
            this.buffer[i] = 0;
        }
    }
    
    public UnicodeString(final rpc.unicode_string unicode_string, final boolean zterm) {
        super();
        this.length = unicode_string.length;
        this.maximum_length = unicode_string.maximum_length;
        this.buffer = unicode_string.buffer;
        this.zterm = zterm;
    }
    
    public UnicodeString(final boolean zterm) {
        super();
        this.zterm = zterm;
    }
    
    public String toString() {
        final short n = this.length / 2;
        short n2;
        if (this.zterm) {
            n2 = 1;
        }
        else {
            n2 = 0;
        }
        final short n3 = n - n2;
        final char[] array = new char[n3];
        for (short n4 = 0; n4 < n3; ++n4) {
            array[n4] = (char)this.buffer[n4];
        }
        return new String(array, 0, n3);
    }
}
