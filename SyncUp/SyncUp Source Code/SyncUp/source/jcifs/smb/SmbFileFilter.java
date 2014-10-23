package jcifs.smb;

public interface SmbFileFilter
{
    boolean accept(SmbFile p0) throws SmbException;
}
