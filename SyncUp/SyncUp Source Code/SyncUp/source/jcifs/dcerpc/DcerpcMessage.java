package jcifs.dcerpc;

import jcifs.dcerpc.ndr.*;

public abstract class DcerpcMessage extends NdrObject implements DcerpcConstants
{
    protected int alloc_hint;
    protected int call_id;
    protected int flags;
    protected int length;
    protected int ptype;
    protected int result;
    
    public DcerpcMessage() {
        super();
        this.ptype = -1;
        this.flags = 0;
        this.length = 0;
        this.call_id = 0;
        this.alloc_hint = 0;
        this.result = 0;
    }
    
    public void decode(final NdrBuffer ndrBuffer) throws NdrException {
        this.decode_header(ndrBuffer);
        if (this.ptype != 12 && this.ptype != 2 && this.ptype != 3 && this.ptype != 13) {
            throw new NdrException("Unexpected ptype: " + this.ptype);
        }
        if (this.ptype == 2 || this.ptype == 3) {
            this.alloc_hint = ndrBuffer.dec_ndr_long();
            ndrBuffer.dec_ndr_short();
            ndrBuffer.dec_ndr_short();
        }
        if (this.ptype == 3 || this.ptype == 13) {
            this.result = ndrBuffer.dec_ndr_long();
        }
        else {
            this.decode_out(ndrBuffer);
        }
    }
    
    void decode_header(final NdrBuffer ndrBuffer) throws NdrException {
        if (ndrBuffer.dec_ndr_small() != 5 || ndrBuffer.dec_ndr_small() != 0) {
            throw new NdrException("DCERPC version not supported");
        }
        this.ptype = ndrBuffer.dec_ndr_small();
        this.flags = ndrBuffer.dec_ndr_small();
        if (ndrBuffer.dec_ndr_long() != 16) {
            throw new NdrException("Data representation not supported");
        }
        this.length = ndrBuffer.dec_ndr_short();
        if (ndrBuffer.dec_ndr_short() != 0) {
            throw new NdrException("DCERPC authentication not supported");
        }
        this.call_id = ndrBuffer.dec_ndr_long();
    }
    
    public abstract void decode_out(final NdrBuffer p0) throws NdrException;
    
    public void encode(final NdrBuffer ndrBuffer) throws NdrException {
        final int index = ndrBuffer.getIndex();
        ndrBuffer.advance(16);
        final int ptype = this.ptype;
        int index2 = 0;
        if (ptype == 0) {
            index2 = ndrBuffer.getIndex();
            ndrBuffer.enc_ndr_long(0);
            ndrBuffer.enc_ndr_short(0);
            ndrBuffer.enc_ndr_short(this.getOpnum());
        }
        this.encode_in(ndrBuffer);
        this.length = ndrBuffer.getIndex() - index;
        if (this.ptype == 0) {
            ndrBuffer.setIndex(index2);
            ndrBuffer.enc_ndr_long(this.alloc_hint = this.length - index2);
        }
        ndrBuffer.setIndex(index);
        this.encode_header(ndrBuffer);
        ndrBuffer.setIndex(index + this.length);
    }
    
    void encode_header(final NdrBuffer ndrBuffer) {
        ndrBuffer.enc_ndr_small(5);
        ndrBuffer.enc_ndr_small(0);
        ndrBuffer.enc_ndr_small(this.ptype);
        ndrBuffer.enc_ndr_small(this.flags);
        ndrBuffer.enc_ndr_long(16);
        ndrBuffer.enc_ndr_short(this.length);
        ndrBuffer.enc_ndr_short(0);
        ndrBuffer.enc_ndr_long(this.call_id);
    }
    
    public abstract void encode_in(final NdrBuffer p0) throws NdrException;
    
    public abstract int getOpnum();
    
    public DcerpcException getResult() {
        DcerpcException ex;
        if (this.result != 0) {
            ex = new DcerpcException(this.result);
        }
        else {
            ex = null;
        }
        return ex;
    }
    
    public boolean isFlagSet(final int n) {
        return (n & this.flags) == n;
    }
    
    public void setFlag(final int n) {
        this.flags |= n;
    }
    
    public void unsetFlag(final int n) {
        this.flags &= (n ^ -1);
    }
}
