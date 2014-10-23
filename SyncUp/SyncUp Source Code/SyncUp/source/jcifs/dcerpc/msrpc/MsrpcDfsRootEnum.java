package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.ndr.*;
import jcifs.smb.*;

public class MsrpcDfsRootEnum extends netdfs.NetrDfsEnumEx
{
    public MsrpcDfsRootEnum(final String s) {
        super(s, 200, 65535, new netdfs.DfsEnumStruct(), new NdrLong(0));
        this.info.level = this.level;
        this.info.e = new netdfs.DfsEnumArray200();
        this.ptype = 0;
        this.flags = 3;
    }
    
    public FileEntry[] getEntries() {
        final netdfs.DfsEnumArray200 dfsEnumArray200 = (netdfs.DfsEnumArray200)this.info.e;
        final SmbShareInfo[] array = new SmbShareInfo[dfsEnumArray200.count];
        for (int i = 0; i < dfsEnumArray200.count; ++i) {
            array[i] = new SmbShareInfo(dfsEnumArray200.s[i].dfs_name, 0, null);
        }
        return array;
    }
}
