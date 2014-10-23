package jcifs.smb;

import java.net.*;
import jcifs.util.*;
import java.io.*;

class TransactNamedPipeInputStream extends SmbFileInputStream
{
    private static final int INIT_PIPE_SIZE = 4096;
    private int beg_idx;
    private boolean dcePipe;
    Object lock;
    private int nxt_idx;
    private byte[] pipe_buf;
    private int used;
    
    TransactNamedPipeInputStream(final SmbNamedPipe smbNamedPipe) throws SmbException, MalformedURLException, UnknownHostException {
        super(smbNamedPipe, 0x20 | (0xFFFF00FF & smbNamedPipe.pipeType));
        this.pipe_buf = new byte[4096];
        this.dcePipe = ((0x600 & smbNamedPipe.pipeType) != 0x600);
        this.lock = new Object();
    }
    
    public int available() throws IOException {
        final LogStream log = SmbFile.log;
        if (LogStream.level >= 3) {
            SmbFile.log.println("Named Pipe available() does not apply to TRANSACT Named Pipes");
        }
        return 0;
    }
    
    public int dce_read(final byte[] array, final int n, final int n2) throws IOException {
        return super.read(array, n, n2);
    }
    
    public int read() throws IOException {
        synchronized (this.lock) {
            try {
                while (this.used == 0) {
                    this.lock.wait();
                }
                final int n = 0xFF & this.pipe_buf[this.beg_idx];
                this.beg_idx = (1 + this.beg_idx) % this.pipe_buf.length;
                return n;
            }
            catch (InterruptedException ex) {
                throw new IOException(ex.getMessage());
            }
        }
    }
    
    public int read(final byte[] array) throws IOException {
        return this.read(array, 0, array.length);
    }
    
    public int read(final byte[] array, final int n, final int n2) throws IOException {
        int n3 = 0;
        if (n2 > 0) {
            // monitorenter(this.lock)
        Label_0109_Outer:
            while (true) {
                while (true) {
                    int used = 0;
                Label_0186:
                    while (true) {
                        try {
                            while (this.used == 0) {
                                this.lock.wait();
                            }
                            final int n4 = this.pipe_buf.length - this.beg_idx;
                            if (n2 > this.used) {
                                used = this.used;
                                if (this.used > n4 && used > n4) {
                                    System.arraycopy(this.pipe_buf, this.beg_idx, array, n, n4);
                                    System.arraycopy(this.pipe_buf, 0, array, n + n4, used - n4);
                                    this.used -= used;
                                    this.beg_idx = (used + this.beg_idx) % this.pipe_buf.length;
                                    // monitorexit(this.lock)
                                    n3 = used;
                                    break;
                                }
                                break Label_0186;
                            }
                        }
                        catch (InterruptedException ex) {
                            throw new IOException(ex.getMessage());
                        }
                        finally {}
                        // monitorexit(this.lock)
                        used = n2;
                        continue Label_0109_Outer;
                    }
                    System.arraycopy(this.pipe_buf, this.beg_idx, array, n, used);
                    continue;
                }
            }
        }
        return n3;
    }
    
    int receive(final byte[] array, final int n, final int n2) {
        if (n2 > this.pipe_buf.length - this.used) {
            int n3 = 2 * this.pipe_buf.length;
            if (n2 > n3 - this.used) {
                n3 = n2 + this.used;
            }
            final byte[] pipe_buf = this.pipe_buf;
            this.pipe_buf = new byte[n3];
            final int n4 = pipe_buf.length - this.beg_idx;
            if (this.used > n4) {
                System.arraycopy(pipe_buf, this.beg_idx, this.pipe_buf, 0, n4);
                System.arraycopy(pipe_buf, 0, this.pipe_buf, n4, this.used - n4);
            }
            else {
                System.arraycopy(pipe_buf, this.beg_idx, this.pipe_buf, 0, this.used);
            }
            this.beg_idx = 0;
            this.nxt_idx = this.used;
        }
        final int n5 = this.pipe_buf.length - this.nxt_idx;
        if (n2 > n5) {
            System.arraycopy(array, n, this.pipe_buf, this.nxt_idx, n5);
            System.arraycopy(array, n + n5, this.pipe_buf, 0, n2 - n5);
        }
        else {
            System.arraycopy(array, n, this.pipe_buf, this.nxt_idx, n2);
        }
        this.nxt_idx = (n2 + this.nxt_idx) % this.pipe_buf.length;
        this.used += n2;
        return n2;
    }
}
