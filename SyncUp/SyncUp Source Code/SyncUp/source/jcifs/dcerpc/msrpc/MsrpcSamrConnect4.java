package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;

public class MsrpcSamrConnect4 extends samr.SamrConnect4
{
    public MsrpcSamrConnect4(final String s, final int n, final SamrPolicyHandle samrPolicyHandle) {
        super(s, 2, n, samrPolicyHandle);
        this.ptype = 0;
        this.flags = 3;
    }
}
