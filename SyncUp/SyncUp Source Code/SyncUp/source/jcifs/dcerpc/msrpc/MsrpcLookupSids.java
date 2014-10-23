package jcifs.dcerpc.msrpc;

import jcifs.smb.*;
import jcifs.dcerpc.*;

public class MsrpcLookupSids extends lsarpc.LsarLookupSids
{
    SID[] sids;
    
    public MsrpcLookupSids(final LsaPolicyHandle lsaPolicyHandle, final SID[] sids) {
        super(lsaPolicyHandle, new LsarSidArrayX(sids), new lsarpc.LsarRefDomainList(), new lsarpc.LsarTransNameArray(), 1, sids.length);
        this.sids = sids;
        this.ptype = 0;
        this.flags = 3;
    }
}
