package jcifs.netbios;

import java.io.*;

public class SessionRequestPacket extends SessionServicePacket
{
    private Name calledName;
    private Name callingName;
    
    SessionRequestPacket() {
        super();
        this.calledName = new Name();
        this.callingName = new Name();
    }
    
    public SessionRequestPacket(final Name calledName, final Name callingName) {
        super();
        this.type = 129;
        this.calledName = calledName;
        this.callingName = callingName;
    }
    
    int readTrailerWireFormat(final InputStream inputStream, final byte[] array, final int n) throws IOException {
        if (inputStream.read(array, n, this.length) != this.length) {
            throw new IOException("invalid session request wire format");
        }
        final int n2 = n + this.calledName.readWireFormat(array, n);
        return n2 + this.callingName.readWireFormat(array, n2) - n;
    }
    
    int writeTrailerWireFormat(final byte[] array, final int n) {
        final int n2 = n + this.calledName.writeWireFormat(array, n);
        return n2 + this.callingName.writeWireFormat(array, n2) - n;
    }
}
