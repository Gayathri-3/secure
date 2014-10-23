package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;
import jcifs.smb.*;
import java.io.*;

public class SamrDomainHandle extends rpc.policy_handle
{
    public SamrDomainHandle(final DcerpcHandle dcerpcHandle, final SamrPolicyHandle samrPolicyHandle, final int n, final rpc.sid_t sid_t) throws IOException {
        super();
        final MsrpcSamrOpenDomain msrpcSamrOpenDomain = new MsrpcSamrOpenDomain(samrPolicyHandle, n, sid_t, this);
        dcerpcHandle.sendrecv(msrpcSamrOpenDomain);
        if (msrpcSamrOpenDomain.retval != 0) {
            throw new SmbException(msrpcSamrOpenDomain.retval, false);
        }
    }
    
    public void close() throws IOException {
    }
}
