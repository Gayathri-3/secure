package jcifs.dcerpc.ndr;

import java.io.*;

public class NdrException extends IOException
{
    public static final String INVALID_CONFORMANCE = "invalid array conformance";
    public static final String NO_NULL_REF = "ref pointer cannot be null";
    
    public NdrException(final String s) {
        super(s);
    }
}
