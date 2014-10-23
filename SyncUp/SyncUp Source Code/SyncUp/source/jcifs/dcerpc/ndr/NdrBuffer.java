package jcifs.dcerpc.ndr;

import java.util.*;
import jcifs.util.*;
import java.io.*;

public class NdrBuffer
{
    public byte[] buf;
    public NdrBuffer deferred;
    public int index;
    public int length;
    int referent;
    HashMap referents;
    public int start;
    
    public NdrBuffer(final byte[] buf, final int n) {
        super();
        this.buf = buf;
        this.index = n;
        this.start = n;
        this.length = 0;
        this.deferred = this;
    }
    
    private int getDceReferent(final Object obj) {
        if (this.referents == null) {
            this.referents = new HashMap();
            this.referent = 1;
        }
        Entry entry = this.referents.get(obj);
        if (entry == null) {
            entry = new Entry();
            entry.referent = this.referent++;
            entry.obj = obj;
            this.referents.put(obj, entry);
        }
        return entry.referent;
    }
    
    public void advance(final int n) {
        this.index += n;
        if (this.index - this.start > this.deferred.length) {
            this.deferred.length = this.index - this.start;
        }
    }
    
    public int align(final int n) {
        final int n2 = n - 1;
        final int n3 = this.index - this.start;
        final int n4 = (n3 + n2 & (n2 ^ -1)) - n3;
        this.advance(n4);
        return n4;
    }
    
    public int align(final int n, final byte b) {
        int i;
        int n2;
        for (n2 = (i = this.align(n)); i > 0; --i) {
            this.buf[this.index - i] = b;
        }
        return n2;
    }
    
    public long dec_ndr_hyper() {
        this.align(8);
        final long dec_uint64le = Encdec.dec_uint64le(this.buf, this.index);
        this.advance(8);
        return dec_uint64le;
    }
    
    public int dec_ndr_long() {
        this.align(4);
        final int dec_uint32le = Encdec.dec_uint32le(this.buf, this.index);
        this.advance(4);
        return dec_uint32le;
    }
    
    public int dec_ndr_short() {
        this.align(2);
        final short dec_uint16le = Encdec.dec_uint16le(this.buf, this.index);
        this.advance(2);
        return dec_uint16le;
    }
    
    public int dec_ndr_small() {
        final int n = 0xFF & this.buf[this.index];
        this.advance(1);
        return n;
    }
    
    public String dec_ndr_string() throws NdrException {
        this.align(4);
        final int index = this.index;
        final int dec_uint32le = Encdec.dec_uint32le(this.buf, index);
        int n = index + 12;
        String s = null;
        Label_0064: {
            if (dec_uint32le != 0) {
                final int n2 = 2 * (dec_uint32le - 1);
                if (n2 >= 0) {
                    if (n2 <= 65535) {
                        final String s2 = new String(this.buf, n, n2, "UTF-16LE");
                        n += n2 + 2;
                        s = s2;
                        break Label_0064;
                    }
                }
                try {
                    throw new NdrException("invalid array conformance");
                }
                catch (UnsupportedEncodingException ex) {}
            }
        }
        this.advance(n - this.index);
        return s;
    }
    
    public NdrBuffer derive(final int index) {
        final NdrBuffer ndrBuffer = new NdrBuffer(this.buf, this.start);
        ndrBuffer.index = index;
        ndrBuffer.deferred = this.deferred;
        return ndrBuffer;
    }
    
    public void enc_ndr_hyper(final long n) {
        this.align(8);
        Encdec.enc_uint64le(n, this.buf, this.index);
        this.advance(8);
    }
    
    public void enc_ndr_long(final int n) {
        this.align(4);
        Encdec.enc_uint32le(n, this.buf, this.index);
        this.advance(4);
    }
    
    public void enc_ndr_referent(final Object o, final int n) {
        if (o == null) {
            this.enc_ndr_long(0);
        }
        else {
            switch (n) {
                case 1:
                case 3: {
                    this.enc_ndr_long(System.identityHashCode(o));
                    break;
                }
                case 2: {
                    this.enc_ndr_long(this.getDceReferent(o));
                    break;
                }
            }
        }
    }
    
    public void enc_ndr_short(final int n) {
        this.align(2);
        Encdec.enc_uint16le((short)n, this.buf, this.index);
        this.advance(2);
    }
    
    public void enc_ndr_small(final int n) {
        this.buf[this.index] = (byte)(n & 0xFF);
        this.advance(1);
    }
    
    public void enc_ndr_string(final String s) {
        this.align(4);
        final int index = this.index;
        final int length = s.length();
        Encdec.enc_uint32le(length + 1, this.buf, index);
        final int n = index + 4;
        Encdec.enc_uint32le(0, this.buf, n);
        final int n2 = n + 4;
        Encdec.enc_uint32le(length + 1, this.buf, n2);
        final int n3 = n2 + 4;
        while (true) {
            try {
                System.arraycopy(s.getBytes("UTF-16LE"), 0, this.buf, n3, length * 2);
                final int n4 = n3 + length * 2;
                final byte[] buf = this.buf;
                final int n5 = n4 + 1;
                buf[n4] = 0;
                final byte[] buf2 = this.buf;
                final int n6 = n5 + 1;
                buf2[n5] = 0;
                this.advance(n6 - this.index);
            }
            catch (UnsupportedEncodingException ex) {
                continue;
            }
            break;
        }
    }
    
    public byte[] getBuffer() {
        return this.buf;
    }
    
    public int getCapacity() {
        return this.buf.length - this.start;
    }
    
    public int getIndex() {
        return this.index;
    }
    
    public int getLength() {
        return this.deferred.length;
    }
    
    public int getTailSpace() {
        return this.buf.length - this.index;
    }
    
    public void readOctetArray(final byte[] array, final int n, final int n2) {
        System.arraycopy(this.buf, this.index, array, n, n2);
        this.advance(n2);
    }
    
    public void reset() {
        this.index = this.start;
        this.length = 0;
        this.deferred = this;
    }
    
    public void setIndex(final int index) {
        this.index = index;
    }
    
    public void setLength(final int length) {
        this.deferred.length = length;
    }
    
    public String toString() {
        return "start=" + this.start + ",index=" + this.index + ",length=" + this.getLength();
    }
    
    public void writeOctetArray(final byte[] array, final int n, final int n2) {
        System.arraycopy(array, n, this.buf, this.index, n2);
        this.advance(n2);
    }
    
    static class Entry
    {
        Object obj;
        int referent;
    }
}
