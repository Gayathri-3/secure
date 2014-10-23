package jcifs.dcerpc.ndr;

public class NdrHyper extends NdrObject
{
    public long value;
    
    public NdrHyper(final long value) {
        super();
        this.value = value;
    }
    
    public void decode(final NdrBuffer ndrBuffer) throws NdrException {
        this.value = ndrBuffer.dec_ndr_hyper();
    }
    
    public void encode(final NdrBuffer ndrBuffer) throws NdrException {
        ndrBuffer.enc_ndr_hyper(this.value);
    }
}
