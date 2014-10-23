package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;
import java.io.*;

public class SamrPolicyHandle extends rpc.policy_handle
{
    public SamrPolicyHandle(final DcerpcHandle dcerpcHandle, String s, final int n) throws IOException {
        super();
        if (s == null) {
            s = "\\\\";
        }
        final MsrpcSamrConnect4 msrpcSamrConnect4 = new MsrpcSamrConnect4(s, n, this);
        try {
            dcerpcHandle.sendrecv(msrpcSamrConnect4);
        }
        catch (DcerpcException ex) {
            if (ex.getErrorCode() != 469827586) {
                throw ex;
            }
            dcerpcHandle.sendrecv(new MsrpcSamrConnect2(s, n, this));
        }
    }
    
    public void close() throws IOException {
    }
}
