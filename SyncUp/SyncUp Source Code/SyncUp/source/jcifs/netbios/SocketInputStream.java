package jcifs.netbios;

import java.io.*;

class SocketInputStream extends InputStream
{
    private static final int TMP_BUFFER_SIZE = 256;
    private int bip;
    private byte[] header;
    private InputStream in;
    private int n;
    private SessionServicePacket ssp;
    private byte[] tmp;
    private int tot;
    
    SocketInputStream(final InputStream in) {
        super();
        this.in = in;
        this.header = new byte[4];
        this.tmp = new byte[256];
    }
    
    public int available() throws IOException {
        int n;
        if (this.bip > 0) {
            n = this.bip;
        }
        else {
            n = this.in.available();
        }
        return n;
    }
    
    public void close() throws IOException {
        this.in.close();
    }
    
    public int read() throws IOException {
        synchronized (this) {
            int n;
            if (this.read(this.tmp, 0, 1) < 0) {
                n = -1;
            }
            else {
                n = (this.tmp[0] & 0xFF);
            }
            return n;
        }
    }
    
    public int read(final byte[] array) throws IOException {
        synchronized (this) {
            return this.read(array, 0, array.length);
        }
    }
    
    public int read(final byte[] array, int n, int n2) throws IOException {
        int n3 = -1;
        // monitorenter(this)
        Label_0012: {
            if (n2 == 0) {
                n3 = 0;
            }
            else {
            Label_0022_Outer:
                while (true) {
                    while (true) {
                        Label_0213: {
                            try {
                                this.tot = 0;
                                while (true) {
                                    if (this.bip <= 0) {
                                        switch (SessionServicePacket.readPacketType(this.in, this.header, 0)) {
                                            case 0: {
                                                this.bip = SessionServicePacket.readLength(this.header, 0);
                                            }
                                            case 133: {
                                                continue Label_0022_Outer;
                                            }
                                            case -1: {
                                                if (this.tot > 0) {
                                                    n3 = this.tot;
                                                    break Label_0012;
                                                }
                                                break Label_0012;
                                            }
                                            default: {
                                                break Label_0213;
                                            }
                                        }
                                    }
                                    else {
                                        this.n = this.in.read(array, n, Math.min(n2, this.bip));
                                        if (this.n == n3) {
                                            if (this.tot > 0) {
                                                n3 = this.tot;
                                                break Label_0012;
                                            }
                                            break Label_0012;
                                        }
                                        else {
                                            this.tot += this.n;
                                            n += this.n;
                                            n2 -= this.n;
                                            this.bip -= this.n;
                                            if (n2 == 0) {
                                                n3 = this.tot;
                                                break Label_0012;
                                            }
                                            continue Label_0022_Outer;
                                        }
                                    }
                                }
                            }
                            finally {}
                            // monitorexit(this)
                        }
                        continue;
                    }
                }
            }
        }
        // monitorexit(this)
        return n3;
    }
    
    public long skip(final long n) throws IOException {
        long n2 = 0L;
        // monitorenter(this)
        if (n > n2) {
            long n3 = n;
            while (n3 > n2) {
                try {
                    final int read = this.read(this.tmp, 0, (int)Math.min(256L, n3));
                    if (read < 0) {
                        break;
                    }
                    n3 -= read;
                }
                finally {}
                // monitorexit(this)
            }
            n2 = n - n3;
        }
        // monitorexit(this)
        return n2;
    }
}
