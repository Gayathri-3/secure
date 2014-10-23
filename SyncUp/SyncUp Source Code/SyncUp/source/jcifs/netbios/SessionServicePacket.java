package jcifs.netbios;

import java.io.*;

public abstract class SessionServicePacket
{
    static final int HEADER_LENGTH = 4;
    static final int MAX_MESSAGE_SIZE = 131071;
    public static final int NEGATIVE_SESSION_RESPONSE = 131;
    public static final int POSITIVE_SESSION_RESPONSE = 130;
    static final int SESSION_KEEP_ALIVE = 133;
    static final int SESSION_MESSAGE = 0;
    static final int SESSION_REQUEST = 129;
    static final int SESSION_RETARGET_RESPONSE = 132;
    int length;
    int type;
    
    static int readInt2(final byte[] array, final int n) {
        return ((0xFF & array[n]) << 8) + (0xFF & array[n + 1]);
    }
    
    static int readInt4(final byte[] array, final int n) {
        return ((0xFF & array[n]) << 24) + ((0xFF & array[n + 1]) << 16) + ((0xFF & array[n + 2]) << 8) + (0xFF & array[n + 3]);
    }
    
    static int readLength(final byte[] array, final int n) {
        final int n2 = n + 1;
        final int n3 = n2 + 1;
        return ((0x1 & array[n2]) << 16) + ((0xFF & array[n3]) << 8) + (0xFF & array[n3 + 1]);
    }
    
    static int readPacketType(final InputStream inputStream, final byte[] array, final int n) throws IOException {
        int n2 = -1;
        final int readn = readn(inputStream, array, n, 4);
        if (readn != 4) {
            if (readn != n2) {
                throw new IOException("unexpected EOF reading netbios session header");
            }
        }
        else {
            n2 = (0xFF & array[n]);
        }
        return n2;
    }
    
    static int readn(final InputStream inputStream, final byte[] array, final int n, final int n2) throws IOException {
        int i;
        int read;
        for (i = 0; i < n2; i += read) {
            read = inputStream.read(array, n + i, n2 - i);
            if (read <= 0) {
                break;
            }
        }
        return i;
    }
    
    static void writeInt2(final int n, final byte[] array, final int n2) {
        final int n3 = n2 + 1;
        array[n2] = (byte)(0xFF & n >> 8);
        array[n3] = (byte)(n & 0xFF);
    }
    
    static void writeInt4(final int n, final byte[] array, final int n2) {
        final int n3 = n2 + 1;
        array[n2] = (byte)(0xFF & n >> 24);
        final int n4 = n3 + 1;
        array[n3] = (byte)(0xFF & n >> 16);
        final int n5 = n4 + 1;
        array[n4] = (byte)(0xFF & n >> 8);
        array[n5] = (byte)(n & 0xFF);
    }
    
    int readHeaderWireFormat(final InputStream inputStream, final byte[] array, final int n) throws IOException {
        final int n2 = n + 1;
        this.type = (0xFF & array[n]);
        this.length = ((0x1 & array[n2]) << 16) + readInt2(array, n2 + 1);
        return 4;
    }
    
    abstract int readTrailerWireFormat(final InputStream p0, final byte[] p1, final int p2) throws IOException;
    
    int readWireFormat(final InputStream inputStream, final byte[] array, final int n) throws IOException {
        this.readHeaderWireFormat(inputStream, array, n);
        return 4 + this.readTrailerWireFormat(inputStream, array, n);
    }
    
    int writeHeaderWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = (byte)this.type;
        if (this.length > 65535) {
            array[n2] = 1;
        }
        writeInt2(this.length, array, n2 + 1);
        return 4;
    }
    
    abstract int writeTrailerWireFormat(final byte[] p0, final int p1);
    
    public int writeWireFormat(final byte[] array, final int n) {
        this.length = this.writeTrailerWireFormat(array, n + 4);
        this.writeHeaderWireFormat(array, n);
        return 4 + this.length;
    }
}
