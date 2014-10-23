package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;

public class MsrpcSamrOpenDomain extends samr.SamrOpenDomain
{
    public MsrpcSamrOpenDomain(final SamrPolicyHandle samrPolicyHandle, final int n, final rpc.sid_t sid_t, final SamrDomainHandle samrDomainHandle) {
        super(samrPolicyHandle, n, sid_t, samrDomainHandle);
        this.ptype = 0;
        this.flags = 3;
    }
}
