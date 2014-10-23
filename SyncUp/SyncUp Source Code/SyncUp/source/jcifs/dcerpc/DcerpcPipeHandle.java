package jcifs.dcerpc;

import jcifs.smb.*;
import java.net.*;
import java.io.*;
import jcifs.util.*;

public class DcerpcPipeHandle extends DcerpcHandle
{
    SmbFileInputStream in;
    boolean isStart;
    SmbFileOutputStream out;
    SmbNamedPipe pipe;
    
    public DcerpcPipeHandle(final String s, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws UnknownHostException, MalformedURLException, DcerpcException {
        super();
        this.in = null;
        this.out = null;
        this.isStart = true;
        this.binding = DcerpcHandle.parseBinding(s);
        String s2 = "smb://" + this.binding.server + "/IPC$/" + this.binding.endpoint.substring(6);
        String s3 = "";
        final String s4 = (String)this.binding.getOption("server");
        if (s4 != null) {
            s3 = String.valueOf(s3) + "&server=" + s4;
        }
        final String s5 = (String)this.binding.getOption("address");
        if (s4 != null) {
            s3 = String.valueOf(s3) + "&address=" + s5;
        }
        if (s3.length() > 0) {
            s2 = String.valueOf(s2) + "?" + s3.substring(1);
        }
        this.pipe = new SmbNamedPipe(s2, 27198979, ntlmPasswordAuthentication);
    }
    
    public void close() throws IOException {
        this.state = 0;
        if (this.out != null) {
            this.out.close();
        }
    }
    
    protected void doReceiveFragment(final byte[] array, final boolean b) throws IOException {
        int isStart = 1;
        if (array.length < this.max_recv) {
            throw new IllegalArgumentException("buffer too small");
        }
        int i;
        if (this.isStart && !b) {
            i = this.in.read(array, 0, 1024);
        }
        else {
            i = this.in.readDirect(array, 0, array.length);
        }
        if (array[0] != 5 && array[isStart] != 0) {
            throw new IOException("Unexpected DCERPC PDU header");
        }
        if ((0x2 & (0xFF & array[3])) != 0x2) {
            isStart = 0;
        }
        this.isStart = (isStart != 0);
        final short dec_uint16le = Encdec.dec_uint16le(array, 8);
        if (dec_uint16le > this.max_recv) {
            throw new IOException("Unexpected fragment length: " + dec_uint16le);
        }
        while (i < dec_uint16le) {
            i += this.in.readDirect(array, i, dec_uint16le - i);
        }
    }
    
    protected void doSendFragment(final byte[] array, final int n, final int n2, final boolean b) throws IOException {
        if (this.out != null && !this.out.isOpen()) {
            throw new IOException("DCERPC pipe is no longer open");
        }
        if (this.in == null) {
            this.in = (SmbFileInputStream)this.pipe.getNamedPipeInputStream();
        }
        if (this.out == null) {
            this.out = (SmbFileOutputStream)this.pipe.getNamedPipeOutputStream();
        }
        if (b) {
            this.out.writeDirect(array, n, n2, 1);
        }
        else {
            this.out.write(array, n, n2);
        }
    }
}
