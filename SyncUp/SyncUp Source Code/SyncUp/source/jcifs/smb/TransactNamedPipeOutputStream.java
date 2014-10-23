package jcifs.smb;

import java.io.*;

class TransactNamedPipeOutputStream extends SmbFileOutputStream
{
    private boolean dcePipe;
    private String path;
    private SmbNamedPipe pipe;
    private byte[] tmp;
    
    TransactNamedPipeOutputStream(final SmbNamedPipe pipe) throws IOException {
        int dcePipe = 1;
        super(pipe, false, 0x20 | (0xFFFF00FF & pipe.pipeType));
        this.tmp = new byte[dcePipe];
        this.pipe = pipe;
        if ((0x600 & pipe.pipeType) != 0x600) {
            dcePipe = 0;
        }
        this.dcePipe = (dcePipe != 0);
        this.path = pipe.unc;
    }
    
    public void close() throws IOException {
        this.pipe.close();
    }
    
    public void write(final int n) throws IOException {
        this.tmp[0] = (byte)n;
        this.write(this.tmp, 0, 1);
    }
    
    public void write(final byte[] array) throws IOException {
        this.write(array, 0, array.length);
    }
    
    public void write(final byte[] array, final int n, int n2) throws IOException {
        if (n2 < 0) {
            n2 = 0;
        }
        if ((0x100 & this.pipe.pipeType) == 0x100) {
            this.pipe.send(new TransWaitNamedPipe(this.path), new TransWaitNamedPipeResponse());
            this.pipe.send(new TransCallNamedPipe(this.path, array, n, n2), new TransCallNamedPipeResponse(this.pipe));
        }
        else if ((0x200 & this.pipe.pipeType) == 0x200) {
            this.ensureOpen();
            final TransTransactNamedPipe transTransactNamedPipe = new TransTransactNamedPipe(this.pipe.fid, array, n, n2);
            if (this.dcePipe) {
                transTransactNamedPipe.maxDataCount = 1024;
            }
            this.pipe.send(transTransactNamedPipe, new TransTransactNamedPipeResponse(this.pipe));
        }
    }
}
