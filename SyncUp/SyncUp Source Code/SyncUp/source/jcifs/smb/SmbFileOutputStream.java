package jcifs.smb;

import java.net.*;
import java.io.*;
import jcifs.util.*;

public class SmbFileOutputStream extends OutputStream
{
    private int access;
    private boolean append;
    private SmbFile file;
    private long fp;
    private boolean modified;
    private int openFlags;
    private SmbComWrite req;
    private SmbComWriteAndX reqx;
    private SmbComWriteResponse rsp;
    private SmbComWriteAndXResponse rspx;
    private byte[] tmp;
    private boolean useNTSmbs;
    private int writeSize;
    private int writeSizeFile;
    
    public SmbFileOutputStream(final String s) throws SmbException, MalformedURLException, UnknownHostException {
        this(s, false);
    }
    
    public SmbFileOutputStream(final String s, final int n) throws SmbException, MalformedURLException, UnknownHostException {
        this(new SmbFile(s, "", null, n), false);
    }
    
    public SmbFileOutputStream(final String s, final boolean b) throws SmbException, MalformedURLException, UnknownHostException {
        this(new SmbFile(s), b);
    }
    
    public SmbFileOutputStream(final SmbFile smbFile) throws SmbException, MalformedURLException, UnknownHostException {
        this(smbFile, false);
    }
    
    public SmbFileOutputStream(final SmbFile smbFile, final boolean b) throws SmbException, MalformedURLException, UnknownHostException {
        int n;
        if (b) {
            n = 22;
        }
        else {
            n = 82;
        }
        this(smbFile, b, n);
    }
    
    SmbFileOutputStream(final SmbFile file, final boolean append, final int openFlags) throws SmbException, MalformedURLException, UnknownHostException {
        super();
        this.tmp = new byte[1];
        this.file = file;
        this.append = append;
        this.openFlags = openFlags;
        this.access = (0xFFFF & openFlags >>> 16);
    Label_0049:
        while (true) {
            if (!append) {
                break Label_0049;
            }
            while (true) {
            Label_0293:
                while (true) {
                    try {
                        this.fp = file.length();
                        if (file instanceof SmbNamedPipe && file.unc.startsWith("\\pipe\\")) {
                            file.unc = file.unc.substring(5);
                            file.send(new TransWaitNamedPipe("\\pipe" + file.unc), new TransWaitNamedPipeResponse());
                        }
                        file.open(openFlags, 0x2 | this.access, 128, 0);
                        this.openFlags &= 0xFFFFFFAF;
                        this.writeSize = -70 + file.tree.session.transport.snd_buf_size;
                        if ((0x8000 & file.tree.session.transport.server.capabilities) == 0x8000 && !file.tree.session.transport.server.signaturesRequired) {
                            this.writeSizeFile = Math.min(SmbConstants.RCV_BUF_SIZE, 65535);
                            this.useNTSmbs = file.tree.session.transport.hasCapability(16);
                            if (this.useNTSmbs) {
                                this.reqx = new SmbComWriteAndX();
                                this.rspx = new SmbComWriteAndXResponse();
                                return;
                            }
                            break Label_0293;
                        }
                    }
                    catch (SmbAuthException ex) {
                        throw ex;
                    }
                    catch (SmbException ex2) {
                        this.fp = 0L;
                        continue Label_0049;
                    }
                    this.writeSizeFile = this.writeSize;
                    continue;
                }
                this.req = new SmbComWrite();
                this.rsp = new SmbComWriteResponse();
            }
            break;
        }
    }
    
    public void close() throws IOException {
        this.file.close();
        if (this.modified) {
            this.file.refresh();
        }
        this.tmp = null;
    }
    
    void ensureOpen() throws IOException {
        if (!this.file.isOpen()) {
            this.file.open(this.openFlags, 0x2 | this.access, 128, 0);
            if (this.append) {
                this.fp = this.file.length();
            }
        }
    }
    
    public boolean isOpen() {
        return this.file.isOpen();
    }
    
    public void write(final int n) throws IOException {
        this.tmp[0] = (byte)n;
        this.write(this.tmp, 0, 1);
    }
    
    public void write(final byte[] array) throws IOException {
        this.write(array, 0, array.length);
    }
    
    public void write(final byte[] array, final int n, final int n2) throws IOException {
        if (!this.file.isOpen() && this.file instanceof SmbNamedPipe) {
            this.file.send(new TransWaitNamedPipe("\\pipe" + this.file.unc), new TransWaitNamedPipeResponse());
        }
        this.writeDirect(array, n, n2, 0);
    }
    
    public void writeDirect(final byte[] array, int n, int n2, final int n3) throws IOException {
        if (n2 > 0) {
            if (this.tmp == null) {
                throw new IOException("Bad file descriptor");
            }
            this.ensureOpen();
            final LogStream log = SmbFile.log;
            if (LogStream.level >= 4) {
                SmbFile.log.println("write: fid=" + this.file.fid + ",off=" + n + ",len=" + n2);
            }
            this.modified = true;
            do {
                if (n2 > this.writeSize) {
                    final int writeSize = this.writeSize;
                }
                int n4;
                if (this.file.getType() == 1) {
                    n4 = this.writeSizeFile;
                }
                else {
                    n4 = this.writeSize;
                }
                int n5;
                if (n2 > n4) {
                    n5 = n4;
                }
                else {
                    n5 = n2;
                }
                if (this.useNTSmbs) {
                    this.reqx.setParam(this.file.fid, this.fp, n2 - n5, array, n, n5);
                    if ((n3 & 0x1) != 0x0) {
                        this.reqx.setParam(this.file.fid, this.fp, n2, array, n, n5);
                        this.reqx.writeMode = 8;
                    }
                    else {
                        this.reqx.writeMode = 0;
                    }
                    this.file.send(this.reqx, this.rspx);
                    this.fp += this.rspx.count;
                    n2 -= (int)this.rspx.count;
                    n += (int)this.rspx.count;
                }
                else {
                    this.req.setParam(this.file.fid, this.fp, n2 - n5, array, n, n5);
                    this.fp += this.rsp.count;
                    n2 -= (int)this.rsp.count;
                    n += (int)this.rsp.count;
                    this.file.send(this.req, this.rsp);
                }
            } while (n2 > 0);
        }
    }
}
