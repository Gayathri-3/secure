package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.ndr.*;
import jcifs.dcerpc.*;

public class MsrpcQueryInformationPolicy extends lsarpc.LsarQueryInformationPolicy
{
    public MsrpcQueryInformationPolicy(final LsaPolicyHandle lsaPolicyHandle, final short n, final NdrObject ndrObject) {
        super(lsaPolicyHandle, n, ndrObject);
        this.ptype = 0;
        this.flags = 3;
    }
}
