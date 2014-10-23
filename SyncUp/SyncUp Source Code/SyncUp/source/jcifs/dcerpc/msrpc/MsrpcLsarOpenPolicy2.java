package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;

public class MsrpcLsarOpenPolicy2 extends lsarpc.LsarOpenPolicy2
{
    public MsrpcLsarOpenPolicy2(final String s, final int n, final LsaPolicyHandle lsaPolicyHandle) {
        super(s, new lsarpc.LsarObjectAttributes(), n, lsaPolicyHandle);
        this.object_attributes.length = 24;
        final lsarpc.LsarQosInfo security_quality_of_service = new lsarpc.LsarQosInfo();
        security_quality_of_service.length = 12;
        security_quality_of_service.impersonation_level = 2;
        security_quality_of_service.context_mode = 1;
        security_quality_of_service.effective_only = 0;
        this.object_attributes.security_quality_of_service = security_quality_of_service;
        this.ptype = 0;
        this.flags = 3;
    }
}
