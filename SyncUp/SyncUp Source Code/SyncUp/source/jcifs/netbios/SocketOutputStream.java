package jcifs.netbios;

import java.io.*;

class SocketOutputStream extends FilterOutputStream
{
    SocketOutputStream(final OutputStream outputStream) {
        super(outputStream);
    }
    
    public void write(final byte[] array, final int n, final int n2) throws IOException {
        // monitorenter(this)
        if (n2 > 65535) {
            try {
                throw new IOException("write too large: " + n2);
            }
            finally {}
            // monitorexit(this)
        }
        if (n < 4) {
            throw new IOException("NetBIOS socket output buffer requires 4 bytes available before off");
        }
        final int n3 = n - 4;
        array[n3 + 1] = (array[n3 + 0] = 0);
        array[n3 + 2] = (byte)(0xFF & n2 >> 8);
        array[n3 + 3] = (byte)(n2 & 0xFF);
        this.out.write(array, n3, n2 + 4);
    }
    // monitorexit(this)
}
