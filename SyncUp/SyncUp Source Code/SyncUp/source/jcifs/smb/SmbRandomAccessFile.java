package jcifs.smb;

import java.net.*;
import jcifs.util.*;
import java.io.*;

public class SmbRandomAccessFile implements DataOutput, DataInput
{
    private static final int WRITE_OPTIONS = 2114;
    private int access;
    private int ch;
    private SmbFile file;
    private long fp;
    private int openFlags;
    private int options;
    private int readSize;
    private byte[] tmp;
    private int writeSize;
    private SmbComWriteAndXResponse write_andx_resp;
    
    public SmbRandomAccessFile(final String s, final String s2, final int n) throws SmbException, MalformedURLException, UnknownHostException {
        this(new SmbFile(s, "", null, n), s2);
    }
    
    public SmbRandomAccessFile(final SmbFile file, final String s) throws SmbException, MalformedURLException, UnknownHostException {
        super();
        this.access = 0;
        this.options = 0;
        this.tmp = new byte[8];
        this.write_andx_resp = null;
        this.file = file;
        if (s.equals("r")) {
            this.openFlags = 17;
        }
        else {
            if (!s.equals("rw")) {
                throw new IllegalArgumentException("Invalid mode");
            }
            this.openFlags = 23;
            this.write_andx_resp = new SmbComWriteAndXResponse();
            this.options = 2114;
            this.access = 3;
        }
        file.open(this.openFlags, this.access, 128, this.options);
        if ((0x4000 & file.tree.session.transport.server.capabilities) == 0x4000) {
            this.readSize = Math.min(-70 + SmbConstants.RCV_BUF_SIZE, 65465);
        }
        else {
            this.readSize = -70 + file.tree.session.transport.rcv_buf_size;
        }
        if ((0x8000 & file.tree.session.transport.server.capabilities) == 0x8000) {
            this.writeSize = Math.min(-70 + SmbConstants.SND_BUF_SIZE, 65465);
        }
        else {
            this.writeSize = Math.min(-70 + file.tree.session.transport.snd_buf_size, -70 + file.tree.session.transport.server.maxBufferSize);
        }
        this.fp = 0L;
    }
    
    public void close() throws SmbException {
        this.file.close();
    }
    
    public long getFilePointer() throws SmbException {
        return this.fp;
    }
    
    public long length() throws SmbException {
        return this.file.length();
    }
    
    public int read() throws SmbException {
        int n = -1;
        if (this.read(this.tmp, 0, 1) != n) {
            n = (0xFF & this.tmp[0]);
        }
        return n;
    }
    
    public int read(final byte[] array) throws SmbException {
        return this.read(array, 0, array.length);
    }
    
    public int read(final byte[] array, final int n, int n2) throws SmbException {
        int n3 = 0;
        if (n2 > 0) {
            final long fp = this.fp;
            if (!this.file.isOpen()) {
                this.file.open(this.openFlags, 0, 128, this.options);
            }
            final SmbComReadAndXResponse smbComReadAndXResponse = new SmbComReadAndXResponse(array, n);
            int dataLength;
            int readSize;
            do {
                if (n2 > this.readSize) {
                    readSize = this.readSize;
                }
                else {
                    readSize = n2;
                }
                this.file.send(new SmbComReadAndX(this.file.fid, this.fp, readSize, null), smbComReadAndXResponse);
                dataLength = smbComReadAndXResponse.dataLength;
                if (dataLength <= 0) {
                    long n4;
                    if (this.fp - fp > 0L) {
                        n4 = this.fp - fp;
                    }
                    else {
                        n4 = -1L;
                    }
                    n3 = (int)n4;
                    return n3;
                }
                this.fp += dataLength;
                n2 -= dataLength;
                smbComReadAndXResponse.off += dataLength;
            } while (n2 > 0 && dataLength == readSize);
            n3 = (int)(this.fp - fp);
        }
        return n3;
    }
    
    public final boolean readBoolean() throws SmbException {
        boolean b = true;
        if (this.read(this.tmp, 0, b ? 1 : 0) < 0) {
            throw new SmbException("EOF");
        }
        if (this.tmp[0] == 0) {
            b = false;
        }
        return b;
    }
    
    public final byte readByte() throws SmbException {
        if (this.read(this.tmp, 0, 1) < 0) {
            throw new SmbException("EOF");
        }
        return this.tmp[0];
    }
    
    public final char readChar() throws SmbException {
        if (this.read(this.tmp, 0, 2) < 0) {
            throw new SmbException("EOF");
        }
        return (char)Encdec.dec_uint16be(this.tmp, 0);
    }
    
    public final double readDouble() throws SmbException {
        if (this.read(this.tmp, 0, 8) < 0) {
            throw new SmbException("EOF");
        }
        return Encdec.dec_doublebe(this.tmp, 0);
    }
    
    public final float readFloat() throws SmbException {
        if (this.read(this.tmp, 0, 4) < 0) {
            throw new SmbException("EOF");
        }
        return Encdec.dec_floatbe(this.tmp, 0);
    }
    
    public final void readFully(final byte[] array) throws SmbException {
        this.readFully(array, 0, array.length);
    }
    
    public final void readFully(final byte[] array, final int n, final int n2) throws SmbException {
        int i = 0;
        do {
            final int read = this.read(array, n + i, n2 - i);
            if (read < 0) {
                throw new SmbException("EOF");
            }
            i += read;
            this.fp += read;
        } while (i < n2);
    }
    
    public final int readInt() throws SmbException {
        if (this.read(this.tmp, 0, 4) < 0) {
            throw new SmbException("EOF");
        }
        return Encdec.dec_uint32be(this.tmp, 0);
    }
    
    public final String readLine() throws SmbException {
        final StringBuffer sb = new StringBuffer();
        int read = -1;
        int i = 0;
        while (i == 0) {
            read = this.read();
            switch (read) {
                default: {
                    sb.append((char)read);
                    continue;
                }
                case -1:
                case 10: {
                    i = 1;
                    continue;
                }
                case 13: {
                    i = 1;
                    final long fp = this.fp;
                    if (this.read() != 10) {
                        this.fp = fp;
                        continue;
                    }
                    continue;
                }
            }
        }
        String string;
        if (read == -1 && sb.length() == 0) {
            string = null;
        }
        else {
            string = sb.toString();
        }
        return string;
    }
    
    public final long readLong() throws SmbException {
        if (this.read(this.tmp, 0, 8) < 0) {
            throw new SmbException("EOF");
        }
        return Encdec.dec_uint64be(this.tmp, 0);
    }
    
    public final short readShort() throws SmbException {
        if (this.read(this.tmp, 0, 2) < 0) {
            throw new SmbException("EOF");
        }
        return Encdec.dec_uint16be(this.tmp, 0);
    }
    
    public final String readUTF() throws SmbException {
        final int unsignedShort = this.readUnsignedShort();
        final byte[] array = new byte[unsignedShort];
        this.read(array, 0, unsignedShort);
        try {
            return Encdec.dec_utf8(array, 0, unsignedShort);
        }
        catch (IOException ex) {
            throw new SmbException("", ex);
        }
    }
    
    public final int readUnsignedByte() throws SmbException {
        if (this.read(this.tmp, 0, 1) < 0) {
            throw new SmbException("EOF");
        }
        return 0xFF & this.tmp[0];
    }
    
    public final int readUnsignedShort() throws SmbException {
        if (this.read(this.tmp, 0, 2) < 0) {
            throw new SmbException("EOF");
        }
        return 0xFFFF & Encdec.dec_uint16be(this.tmp, 0);
    }
    
    public void seek(final long fp) throws SmbException {
        this.fp = fp;
    }
    
    public void setLength(final long n) throws SmbException {
        if (!this.file.isOpen()) {
            this.file.open(this.openFlags, 0, 128, this.options);
        }
        this.file.send(new SmbComWrite(this.file.fid, (int)(0xFFFFFFFFL & n), 0, this.tmp, 0, 0), new SmbComWriteResponse());
    }
    
    public int skipBytes(int n) throws SmbException {
        if (n > 0) {
            this.fp += n;
        }
        else {
            n = 0;
        }
        return n;
    }
    
    public void write(final int n) throws SmbException {
        this.tmp[0] = (byte)n;
        this.write(this.tmp, 0, 1);
    }
    
    public void write(final byte[] array) throws SmbException {
        this.write(array, 0, array.length);
    }
    
    public void write(final byte[] array, int n, int n2) throws SmbException {
        if (n2 > 0) {
            if (!this.file.isOpen()) {
                this.file.open(this.openFlags, 0, 128, this.options);
            }
            do {
                int writeSize;
                if (n2 > this.writeSize) {
                    writeSize = this.writeSize;
                }
                else {
                    writeSize = n2;
                }
                this.file.send(new SmbComWriteAndX(this.file.fid, this.fp, n2 - writeSize, array, n, writeSize, null), this.write_andx_resp);
                this.fp += this.write_andx_resp.count;
                n2 -= (int)this.write_andx_resp.count;
                n += (int)this.write_andx_resp.count;
            } while (n2 > 0);
        }
    }
    
    public final void writeBoolean(final boolean b) throws SmbException {
        final byte[] tmp = this.tmp;
        boolean b2;
        if (b) {
            b2 = true;
        }
        else {
            b2 = false;
        }
        tmp[0] = (byte)(b2 ? 1 : 0);
        this.write(this.tmp, 0, 1);
    }
    
    public final void writeByte(final int n) throws SmbException {
        this.tmp[0] = (byte)n;
        this.write(this.tmp, 0, 1);
    }
    
    public final void writeBytes(final String s) throws SmbException {
        final byte[] bytes = s.getBytes();
        this.write(bytes, 0, bytes.length);
    }
    
    public final void writeChar(final int n) throws SmbException {
        Encdec.enc_uint16be((short)n, this.tmp, 0);
        this.write(this.tmp, 0, 2);
    }
    
    public final void writeChars(final String s) throws SmbException {
        final int length = s.length();
        final int n = length * 2;
        final byte[] array = new byte[n];
        final char[] array2 = new char[length];
        s.getChars(0, length, array2, 0);
        int i = 0;
        int n2 = 0;
        while (i < length) {
            final int n3 = n2 + 1;
            array[n2] = (byte)(array2[i] >>> 8);
            n2 = n3 + 1;
            array[n3] = (byte)(array2[i] >>> 0);
            ++i;
        }
        this.write(array, 0, n);
    }
    
    public final void writeDouble(final double n) throws SmbException {
        Encdec.enc_doublebe(n, this.tmp, 0);
        this.write(this.tmp, 0, 8);
    }
    
    public final void writeFloat(final float n) throws SmbException {
        Encdec.enc_floatbe(n, this.tmp, 0);
        this.write(this.tmp, 0, 4);
    }
    
    public final void writeInt(final int n) throws SmbException {
        Encdec.enc_uint32be(n, this.tmp, 0);
        this.write(this.tmp, 0, 4);
    }
    
    public final void writeLong(final long n) throws SmbException {
        Encdec.enc_uint64be(n, this.tmp, 0);
        this.write(this.tmp, 0, 8);
    }
    
    public final void writeShort(final int n) throws SmbException {
        Encdec.enc_uint16be((short)n, this.tmp, 0);
        this.write(this.tmp, 0, 2);
    }
    
    public final void writeUTF(final String s) throws SmbException {
        final int length = s.length();
        int n = 0;
        int n2 = 0;
    Block_4_Outer:
        while (true) {
            Label_0044: {
                if (n2 < length) {
                    break Label_0044;
                }
                final byte[] array = new byte[n];
                this.writeShort(n);
                try {
                    Encdec.enc_utf8(s, array, 0, n);
                    this.write(array, 0, n);
                    return;
                    int n3 = 0;
                    Label_0081: {
                        n3 = 2;
                    }
                    // iftrue(Label_0081:, char1 <= '\u07ff')
                    // iftrue(Label_0087:, char1 <= '\u007f')
                    Label_0070: {
                        break Label_0070;
                        while (true) {
                            while (true) {
                                n3 = 3;
                                break Label_0070;
                                continue Block_4_Outer;
                            }
                            final char char1 = s.charAt(n2);
                            continue;
                        }
                        Label_0087:
                        n3 = 1;
                    }
                    n += n3;
                    ++n2;
                }
                catch (IOException ex) {
                    throw new SmbException("", ex);
                }
            }
        }
    }
}
