package jcifs.smb;

class Trans2QueryFSInformationResponse extends SmbComTransactionResponse
{
    static final int SMB_FS_FULL_SIZE_INFORMATION = 1007;
    static final int SMB_INFO_ALLOCATION = 1;
    static final int SMB_QUERY_FS_SIZE_INFO = 259;
    AllocInfo info;
    private int informationLevel;
    
    Trans2QueryFSInformationResponse(final int informationLevel) {
        super();
        this.informationLevel = informationLevel;
        this.command = 50;
        this.subCommand = 3;
    }
    
    int readDataWireFormat(final byte[] array, final int n, final int n2) {
        int n3 = 0;
        switch (this.informationLevel) {
            default: {
                n3 = 0;
                break;
            }
            case 1: {
                n3 = this.readSmbInfoAllocationWireFormat(array, n);
                break;
            }
            case 259: {
                n3 = this.readSmbQueryFSSizeInfoWireFormat(array, n);
                break;
            }
            case 1007: {
                n3 = this.readFsFullSizeInformationWireFormat(array, n);
                break;
            }
        }
        return n3;
    }
    
    int readFsFullSizeInformationWireFormat(final byte[] array, final int n) {
        final SmbInfoAllocation info = new SmbInfoAllocation();
        info.alloc = ServerMessageBlock.readInt8(array, n);
        final int n2 = n + 8;
        info.free = ServerMessageBlock.readInt8(array, n2);
        final int n3 = 8 + (n2 + 8);
        info.sectPerAlloc = ServerMessageBlock.readInt4(array, n3);
        final int n4 = n3 + 4;
        info.bytesPerSect = ServerMessageBlock.readInt4(array, n4);
        final int n5 = n4 + 4;
        this.info = info;
        return n5 - n;
    }
    
    int readParametersWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readSmbInfoAllocationWireFormat(final byte[] array, final int n) {
        final SmbInfoAllocation info = new SmbInfoAllocation();
        final int n2 = n + 4;
        info.sectPerAlloc = ServerMessageBlock.readInt4(array, n2);
        final int n3 = n2 + 4;
        info.alloc = ServerMessageBlock.readInt4(array, n3);
        final int n4 = n3 + 4;
        info.free = ServerMessageBlock.readInt4(array, n4);
        final int n5 = n4 + 4;
        info.bytesPerSect = ServerMessageBlock.readInt2(array, n5);
        final int n6 = n5 + 4;
        this.info = info;
        return n6 - n;
    }
    
    int readSmbQueryFSSizeInfoWireFormat(final byte[] array, final int n) {
        final SmbInfoAllocation info = new SmbInfoAllocation();
        info.alloc = ServerMessageBlock.readInt8(array, n);
        final int n2 = n + 8;
        info.free = ServerMessageBlock.readInt8(array, n2);
        final int n3 = n2 + 8;
        info.sectPerAlloc = ServerMessageBlock.readInt4(array, n3);
        final int n4 = n3 + 4;
        info.bytesPerSect = ServerMessageBlock.readInt4(array, n4);
        final int n5 = n4 + 4;
        this.info = info;
        return n5 - n;
    }
    
    public String toString() {
        return new String("Trans2QueryFSInformationResponse[" + super.toString() + "]");
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
    
    class SmbInfoAllocation implements AllocInfo
    {
        long alloc;
        int bytesPerSect;
        long free;
        int sectPerAlloc;
        
        public long getCapacity() {
            return this.alloc * this.sectPerAlloc * this.bytesPerSect;
        }
        
        public long getFree() {
            return this.free * this.sectPerAlloc * this.bytesPerSect;
        }
        
        public String toString() {
            return new String("SmbInfoAllocation[alloc=" + this.alloc + ",free=" + this.free + ",sectPerAlloc=" + this.sectPerAlloc + ",bytesPerSect=" + this.bytesPerSect + "]");
        }
    }
}
