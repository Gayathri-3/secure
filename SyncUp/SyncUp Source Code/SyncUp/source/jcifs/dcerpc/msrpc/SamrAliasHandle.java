package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;
import jcifs.smb.*;
import java.io.*;

public class SamrAliasHandle extends rpc.policy_handle
{
    public SamrAliasHandle(final DcerpcHandle dcerpcHandle, final SamrDomainHandle samrDomainHandle, final int n, final int n2) throws IOException {
        super();
        final MsrpcSamrOpenAlias msrpcSamrOpenAlias = new MsrpcSamrOpenAlias(samrDomainHandle, n, n2, this);
        dcerpcHandle.sendrecv(msrpcSamrOpenAlias);
        if (msrpcSamrOpenAlias.retval != 0) {
            throw new SmbException(msrpcSamrOpenAlias.retval, false);
        }
    }
    
    public void close() throws IOException {
    }
}
