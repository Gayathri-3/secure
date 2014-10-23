package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.ndr.*;
import jcifs.smb.*;

public class MsrpcShareEnum extends srvsvc.ShareEnumAll
{
    public MsrpcShareEnum(final String s) {
        super("\\\\" + s, 1, new srvsvc.ShareInfoCtr1(), -1, 0, 0);
        this.ptype = 0;
        this.flags = 3;
    }
    
    public FileEntry[] getEntries() {
        final srvsvc.ShareInfoCtr1 shareInfoCtr1 = (srvsvc.ShareInfoCtr1)this.info;
        final MsrpcShareInfo1[] array = new MsrpcShareInfo1[shareInfoCtr1.count];
        for (int i = 0; i < shareInfoCtr1.count; ++i) {
            array[i] = new MsrpcShareInfo1(shareInfoCtr1.array[i]);
        }
        return array;
    }
    
    class MsrpcShareInfo1 extends SmbShareInfo
    {
        MsrpcShareInfo1(final srvsvc.ShareInfo1 shareInfo1) {
            super();
            this.netName = shareInfo1.netname;
            this.type = shareInfo1.type;
            this.remark = shareInfo1.remark;
        }
    }
}
