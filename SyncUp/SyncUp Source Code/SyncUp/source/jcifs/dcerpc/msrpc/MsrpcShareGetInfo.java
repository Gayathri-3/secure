package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.ndr.*;
import jcifs.smb.*;
import java.io.*;

public class MsrpcShareGetInfo extends srvsvc.ShareGetInfo
{
    public MsrpcShareGetInfo(final String s, final String s2) {
        super(s, s2, 502, new srvsvc.ShareInfo502());
        this.ptype = 0;
        this.flags = 3;
    }
    
    public ACE[] getSecurity() throws IOException {
        final srvsvc.ShareInfo502 shareInfo502 = (srvsvc.ShareInfo502)this.info;
        ACE[] aces;
        if (shareInfo502.security_descriptor != null) {
            aces = new SecurityDescriptor(shareInfo502.security_descriptor, 0, shareInfo502.sd_size).aces;
        }
        else {
            aces = null;
        }
        return aces;
    }
}
