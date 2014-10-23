package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;

public class MsrpcGetMembersInAlias extends samr.SamrGetMembersInAlias
{
    public MsrpcGetMembersInAlias(final SamrAliasHandle samrAliasHandle, final lsarpc.LsarSidArray sids) {
        super(samrAliasHandle, sids);
        this.sids = sids;
        this.ptype = 0;
        this.flags = 3;
    }
}
