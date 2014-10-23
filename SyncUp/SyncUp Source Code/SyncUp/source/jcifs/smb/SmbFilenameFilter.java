package jcifs.smb;

public interface SmbFilenameFilter
{
    boolean accept(SmbFile p0, String p1) throws SmbException;
}
