package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;
import jcifs.smb.*;
import java.io.*;

public class LsaPolicyHandle extends rpc.policy_handle
{
    public LsaPolicyHandle(final DcerpcHandle dcerpcHandle, String s, final int n) throws IOException {
        super();
        if (s == null) {
            s = "\\\\";
        }
        final MsrpcLsarOpenPolicy2 msrpcLsarOpenPolicy2 = new MsrpcLsarOpenPolicy2(s, n, this);
        dcerpcHandle.sendrecv(msrpcLsarOpenPolicy2);
        if (msrpcLsarOpenPolicy2.retval != 0) {
            throw new SmbException(msrpcLsarOpenPolicy2.retval, false);
        }
    }
    
    public void close() throws IOException {
    }
}
