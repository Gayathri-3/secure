package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;

public class MsrpcSamrOpenAlias extends samr.SamrOpenAlias
{
    public MsrpcSamrOpenAlias(final SamrDomainHandle samrDomainHandle, final int n, final int n2, final SamrAliasHandle samrAliasHandle) {
        super(samrDomainHandle, n, n2, samrAliasHandle);
        this.ptype = 0;
        this.flags = 3;
    }
}
