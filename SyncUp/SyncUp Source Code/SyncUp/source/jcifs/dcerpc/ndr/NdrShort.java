package jcifs.dcerpc.ndr;

public class NdrShort extends NdrObject
{
    public int value;
    
    public NdrShort(final int n) {
        super();
        this.value = (n & 0xFF);
    }
    
    public void decode(final NdrBuffer ndrBuffer) throws NdrException {
        this.value = ndrBuffer.dec_ndr_short();
    }
    
    public void encode(final NdrBuffer ndrBuffer) throws NdrException {
        ndrBuffer.enc_ndr_short(this.value);
    }
}
