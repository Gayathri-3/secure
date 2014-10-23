package jcifs.netbios;

import jcifs.util.*;
import java.net.*;
import jcifs.*;
import java.io.*;

public class NbtSocket extends Socket
{
    private static final int BUFFER_SIZE = 512;
    private static final int DEFAULT_SO_TIMEOUT = 5000;
    private static final int SSN_SRVC_PORT = 139;
    private static LogStream log;
    private NbtAddress address;
    private Name calledName;
    private int soTimeout;
    
    static {
        NbtSocket.log = LogStream.getInstance();
    }
    
    public NbtSocket() {
        super();
    }
    
    public NbtSocket(final NbtAddress nbtAddress, final int n) throws IOException {
        this(nbtAddress, n, null, 0);
    }
    
    public NbtSocket(final NbtAddress nbtAddress, final int n, final InetAddress inetAddress, final int n2) throws IOException {
        this(nbtAddress, null, n, inetAddress, n2);
    }
    
    public NbtSocket(final NbtAddress address, final String s, int n, final InetAddress inetAddress, final int n2) throws IOException {
        final InetAddress inetAddress2 = address.getInetAddress();
        if (n == 0) {
            n = 139;
        }
        super(inetAddress2, n, inetAddress, n2);
        this.address = address;
        if (s == null) {
            this.calledName = address.hostName;
        }
        else {
            this.calledName = new Name(s, 32, null);
        }
        this.soTimeout = Config.getInt("jcifs.netbios.soTimeout", 5000);
        this.connect();
    }
    
    private void connect() throws IOException {
        final byte[] array = new byte[512];
        InputStream inputStream = null;
        Label_0150: {
            try {
                inputStream = super.getInputStream();
                super.getOutputStream().write(array, 0, new SessionRequestPacket(this.calledName, NbtAddress.localhost.hostName).writeWireFormat(array, 0));
                this.setSoTimeout(this.soTimeout);
                switch (SessionServicePacket.readPacketType(inputStream, array, 0)) {
                    default: {
                        this.close();
                        throw new NbtException(2, 0);
                    }
                    case 130: {
                        break;
                    }
                    case 131: {
                        break Label_0150;
                    }
                    case -1: {
                        throw new NbtException(2, -1);
                    }
                }
            }
            catch (IOException ex) {
                this.close();
                throw ex;
            }
            if (LogStream.level > 2) {
                NbtSocket.log.println("session established ok with " + this.address);
            }
            return;
        }
        final int n = 0xFF & inputStream.read();
        this.close();
        throw new NbtException(2, n);
    }
    
    public void close() throws IOException {
        if (LogStream.level > 3) {
            NbtSocket.log.println("close: " + this);
        }
        super.close();
    }
    
    public InputStream getInputStream() throws IOException {
        return new SocketInputStream(super.getInputStream());
    }
    
    public InetAddress getLocalAddress() {
        return super.getLocalAddress();
    }
    
    public int getLocalPort() {
        return super.getLocalPort();
    }
    
    public NbtAddress getNbtAddress() {
        return this.address;
    }
    
    public OutputStream getOutputStream() throws IOException {
        return new SocketOutputStream(super.getOutputStream());
    }
    
    public int getPort() {
        return super.getPort();
    }
    
    public String toString() {
        return "NbtSocket[addr=" + this.address + ",port=" + super.getPort() + ",localport=" + super.getLocalPort() + "]";
    }
}
