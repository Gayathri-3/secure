package jcifs.dcerpc.ndr;

public class NdrLong extends NdrObject
{
    public int value;
    
    public NdrLong(final int value) {
        super();
        this.value = value;
    }
    
    public void decode(final NdrBuffer ndrBuffer) throws NdrException {
        this.value = ndrBuffer.dec_ndr_long();
    }
    
    public void encode(final NdrBuffer ndrBuffer) throws NdrException {
        ndrBuffer.enc_ndr_long(this.value);
    }
}
