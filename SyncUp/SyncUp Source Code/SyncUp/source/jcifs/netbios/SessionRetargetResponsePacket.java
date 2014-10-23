package jcifs.netbios;

import java.io.*;

class SessionRetargetResponsePacket extends SessionServicePacket
{
    private NbtAddress retargetAddress;
    private int retargetPort;
    
    SessionRetargetResponsePacket() {
        super();
        this.type = 132;
        this.length = 6;
    }
    
    int readTrailerWireFormat(final InputStream inputStream, final byte[] array, final int n) throws IOException {
        if (inputStream.read(array, n, this.length) != this.length) {
            throw new IOException("unexpected EOF reading netbios retarget session response");
        }
        final int int4 = SessionServicePacket.readInt4(array, n);
        final int n2 = n + 4;
        this.retargetAddress = new NbtAddress(null, int4, false, 0);
        this.retargetPort = SessionServicePacket.readInt2(array, n2);
        return this.length;
    }
    
    int writeTrailerWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
