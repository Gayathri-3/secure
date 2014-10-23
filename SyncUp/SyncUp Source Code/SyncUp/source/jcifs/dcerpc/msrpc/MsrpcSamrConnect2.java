package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;

public class MsrpcSamrConnect2 extends samr.SamrConnect2
{
    public MsrpcSamrConnect2(final String s, final int n, final SamrPolicyHandle samrPolicyHandle) {
        super(s, n, samrPolicyHandle);
        this.ptype = 0;
        this.flags = 3;
    }
}
