package jcifs.dcerpc.ndr;

public class NdrSmall extends NdrObject
{
    public int value;
    
    public NdrSmall(final int n) {
        super();
        this.value = (n & 0xFF);
    }
    
    public void decode(final NdrBuffer ndrBuffer) throws NdrException {
        this.value = ndrBuffer.dec_ndr_small();
    }
    
    public void encode(final NdrBuffer ndrBuffer) throws NdrException {
        ndrBuffer.enc_ndr_small(this.value);
    }
}
