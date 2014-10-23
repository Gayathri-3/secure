package jcifs.dcerpc;

import jcifs.dcerpc.ndr.*;

public interface DcerpcSecurityProvider
{
    void unwrap(NdrBuffer p0) throws DcerpcException;
    
    void wrap(NdrBuffer p0) throws DcerpcException;
}
