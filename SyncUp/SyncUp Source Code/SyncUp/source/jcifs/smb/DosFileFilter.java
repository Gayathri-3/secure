package jcifs.smb;

public class DosFileFilter implements SmbFileFilter
{
    protected int attributes;
    protected String wildcard;
    
    public DosFileFilter(final String wildcard, final int attributes) {
        super();
        this.wildcard = wildcard;
        this.attributes = attributes;
    }
    
    public boolean accept(final SmbFile smbFile) throws SmbException {
        return (smbFile.getAttributes() & this.attributes) != 0x0;
    }
}
