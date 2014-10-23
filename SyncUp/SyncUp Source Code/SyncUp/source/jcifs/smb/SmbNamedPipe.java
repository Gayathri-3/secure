package jcifs.smb;

import java.net.*;
import java.io.*;

public class SmbNamedPipe extends SmbFile
{
    public static final int PIPE_TYPE_CALL = 256;
    public static final int PIPE_TYPE_DCE_TRANSACT = 1536;
    public static final int PIPE_TYPE_RDONLY = 1;
    public static final int PIPE_TYPE_RDWR = 3;
    public static final int PIPE_TYPE_TRANSACT = 512;
    public static final int PIPE_TYPE_WRONLY = 2;
    InputStream pipeIn;
    OutputStream pipeOut;
    int pipeType;
    
    public SmbNamedPipe(final String s, final int pipeType) throws MalformedURLException, UnknownHostException {
        super(s);
        this.pipeType = pipeType;
        this.type = 16;
    }
    
    public SmbNamedPipe(final String s, final int pipeType, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws MalformedURLException, UnknownHostException {
        super(s, ntlmPasswordAuthentication);
        this.pipeType = pipeType;
        this.type = 16;
    }
    
    public SmbNamedPipe(final URL url, final int pipeType, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws MalformedURLException, UnknownHostException {
        super(url, ntlmPasswordAuthentication);
        this.pipeType = pipeType;
        this.type = 16;
    }
    
    public InputStream getNamedPipeInputStream() throws IOException {
        if (this.pipeIn == null) {
            if ((0x100 & this.pipeType) == 0x100 || (0x200 & this.pipeType) == 0x200) {
                this.pipeIn = new TransactNamedPipeInputStream(this);
            }
            else {
                this.pipeIn = new SmbFileInputStream(this, 0x20 | (0xFFFF00FF & this.pipeType));
            }
        }
        return this.pipeIn;
    }
    
    public OutputStream getNamedPipeOutputStream() throws IOException {
        if (this.pipeOut == null) {
            if ((0x100 & this.pipeType) == 0x100 || (0x200 & this.pipeType) == 0x200) {
                this.pipeOut = new TransactNamedPipeOutputStream(this);
            }
            else {
                this.pipeOut = new SmbFileOutputStream(this, false, 0x20 | (0xFFFF00FF & this.pipeType));
            }
        }
        return this.pipeOut;
    }
}
