package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;

public class MsrpcEnumerateAliasesInDomain extends samr.SamrEnumerateAliasesInDomain
{
    public MsrpcEnumerateAliasesInDomain(final SamrDomainHandle samrDomainHandle, final int n, final samr.SamrSamArray sam) {
        super(samrDomainHandle, 0, n, null, 0);
        this.sam = sam;
        this.ptype = 0;
        this.flags = 3;
    }
}
