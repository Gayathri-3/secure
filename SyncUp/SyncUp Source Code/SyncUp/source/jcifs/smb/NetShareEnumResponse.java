package jcifs.smb;

import jcifs.util.*;

class NetShareEnumResponse extends SmbComTransactionResponse
{
    private int converter;
    private int totalAvailableEntries;
    
    int readDataWireFormat(final byte[] array, int n, final int n2) {
        final int n3 = n;
        this.useUnicode = false;
        this.results = new SmbShareInfo[this.numEntries];
        for (int i = 0; i < this.numEntries; ++i) {
            final FileEntry[] results = this.results;
            final SmbShareInfo smbShareInfo = new SmbShareInfo();
            results[i] = smbShareInfo;
            smbShareInfo.netName = this.readString(array, n, 13, false);
            final int n4 = n + 14;
            smbShareInfo.type = ServerMessageBlock.readInt2(array, n4);
            final int n5 = n4 + 2;
            final int int4 = ServerMessageBlock.readInt4(array, n5);
            n = n5 + 4;
            smbShareInfo.remark = this.readString(array, n3 + ((0xFFFF & int4) - this.converter), 128, false);
            final LogStream log = NetShareEnumResponse.log;
            if (LogStream.level >= 4) {
                NetShareEnumResponse.log.println(smbShareInfo);
            }
        }
        return n - n3;
    }
    
    int readParametersWireFormat(final byte[] array, final int n, final int n2) {
        this.status = ServerMessageBlock.readInt2(array, n);
        final int n3 = n + 2;
        this.converter = ServerMessageBlock.readInt2(array, n3);
        final int n4 = n3 + 2;
        this.numEntries = ServerMessageBlock.readInt2(array, n4);
        final int n5 = n4 + 2;
        this.totalAvailableEntries = ServerMessageBlock.readInt2(array, n5);
        return n5 + 2 - n;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    public String toString() {
        return new String("NetShareEnumResponse[" + super.toString() + ",status=" + this.status + ",converter=" + this.converter + ",entriesReturned=" + this.numEntries + ",totalAvailableEntries=" + this.totalAvailableEntries + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
