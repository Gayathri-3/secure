package jcifs.dcerpc;

public class UUID extends rpc.uuid_t
{
    static final char[] HEXCHARS;
    
    static {
        HEXCHARS = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
    }
    
    public UUID(final String s) {
        super();
        final char[] charArray = s.toCharArray();
        this.time_low = hex_to_bin(charArray, 0, 8);
        this.time_mid = S(hex_to_bin(charArray, 9, 4));
        this.time_hi_and_version = S(hex_to_bin(charArray, 14, 4));
        this.clock_seq_hi_and_reserved = B(hex_to_bin(charArray, 19, 2));
        this.clock_seq_low = B(hex_to_bin(charArray, 21, 2));
        (this.node = new byte[6])[0] = B(hex_to_bin(charArray, 24, 2));
        this.node[1] = B(hex_to_bin(charArray, 26, 2));
        this.node[2] = B(hex_to_bin(charArray, 28, 2));
        this.node[3] = B(hex_to_bin(charArray, 30, 2));
        this.node[4] = B(hex_to_bin(charArray, 32, 2));
        this.node[5] = B(hex_to_bin(charArray, 34, 2));
    }
    
    public UUID(final rpc.uuid_t uuid_t) {
        super();
        this.time_low = uuid_t.time_low;
        this.time_mid = uuid_t.time_mid;
        this.time_hi_and_version = uuid_t.time_hi_and_version;
        this.clock_seq_hi_and_reserved = uuid_t.clock_seq_hi_and_reserved;
        this.clock_seq_low = uuid_t.clock_seq_low;
        (this.node = new byte[6])[0] = uuid_t.node[0];
        this.node[1] = uuid_t.node[1];
        this.node[2] = uuid_t.node[2];
        this.node[3] = uuid_t.node[3];
        this.node[4] = uuid_t.node[4];
        this.node[5] = uuid_t.node[5];
    }
    
    private static byte B(final int n) {
        return (byte)(n & 0xFF);
    }
    
    private static short S(final int n) {
        return (short)(0xFFFF & n);
    }
    
    public static String bin_to_hex(int n, final int n2) {
        final char[] array = new char[n2];
        int length = array.length;
        while (true) {
            final int n3 = length - 1;
            if (length <= 0) {
                break;
            }
            array[n3] = UUID.HEXCHARS[n & 0xF];
            n >>>= 4;
            length = n3;
        }
        return new String(array);
    }
    
    public static int hex_to_bin(final char[] array, final int n, final int n2) {
        int n3 = 0;
        for (int n4 = 0, n5 = n; n5 < array.length && n4 < n2; ++n4, ++n5) {
            final int n6 = n3 << 4;
            switch (array[n5]) {
                default: {
                    throw new IllegalArgumentException(new String(array, n, n2));
                }
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9': {
                    n3 = n6 + (-48 + array[n5]);
                    break;
                }
                case 'A':
                case 'B':
                case 'C':
                case 'D':
                case 'E':
                case 'F': {
                    n3 = n6 + (10 + (-65 + array[n5]));
                    break;
                }
                case 'a':
                case 'b':
                case 'c':
                case 'd':
                case 'e':
                case 'f': {
                    n3 = n6 + (10 + (-97 + array[n5]));
                    break;
                }
            }
        }
        return n3;
    }
    
    public String toString() {
        return String.valueOf(bin_to_hex(this.time_low, 8)) + '-' + bin_to_hex(this.time_mid, 4) + '-' + bin_to_hex(this.time_hi_and_version, 4) + '-' + bin_to_hex(this.clock_seq_hi_and_reserved, 2) + bin_to_hex(this.clock_seq_low, 2) + '-' + bin_to_hex(this.node[0], 2) + bin_to_hex(this.node[1], 2) + bin_to_hex(this.node[2], 2) + bin_to_hex(this.node[3], 2) + bin_to_hex(this.node[4], 2) + bin_to_hex(this.node[5], 2);
    }
}
