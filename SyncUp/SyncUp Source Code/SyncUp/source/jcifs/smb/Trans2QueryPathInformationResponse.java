package jcifs.smb;

import java.util.*;
import jcifs.util.*;

class Trans2QueryPathInformationResponse extends SmbComTransactionResponse
{
    static final int SMB_QUERY_FILE_BASIC_INFO = 257;
    static final int SMB_QUERY_FILE_STANDARD_INFO = 258;
    Info info;
    private int informationLevel;
    
    Trans2QueryPathInformationResponse(final int informationLevel) {
        super();
        this.informationLevel = informationLevel;
        this.subCommand = 5;
    }
    
    int readDataWireFormat(final byte[] array, final int n, final int n2) {
        int n3 = 0;
        switch (this.informationLevel) {
            default: {
                n3 = 0;
                break;
            }
            case 257: {
                n3 = this.readSmbQueryFileBasicInfoWireFormat(array, n);
                break;
            }
            case 258: {
                n3 = this.readSmbQueryFileStandardInfoWireFormat(array, n);
                break;
            }
        }
        return n3;
    }
    
    int readParametersWireFormat(final byte[] array, final int n, final int n2) {
        return 2;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readSmbQueryFileBasicInfoWireFormat(final byte[] array, final int n) {
        final SmbQueryFileBasicInfo info = new SmbQueryFileBasicInfo();
        info.createTime = ServerMessageBlock.readTime(array, n);
        final int n2 = n + 8;
        info.lastAccessTime = ServerMessageBlock.readTime(array, n2);
        final int n3 = n2 + 8;
        info.lastWriteTime = ServerMessageBlock.readTime(array, n3);
        final int n4 = n3 + 8;
        info.changeTime = ServerMessageBlock.readTime(array, n4);
        final int n5 = n4 + 8;
        info.attributes = ServerMessageBlock.readInt2(array, n5);
        final int n6 = n5 + 2;
        this.info = info;
        return n6 - n;
    }
    
    int readSmbQueryFileStandardInfoWireFormat(final byte[] array, final int n) {
        boolean directory = true;
        final SmbQueryFileStandardInfo info = new SmbQueryFileStandardInfo();
        info.allocationSize = ServerMessageBlock.readInt8(array, n);
        final int n2 = n + 8;
        info.endOfFile = ServerMessageBlock.readInt8(array, n2);
        final int n3 = n2 + 8;
        info.numberOfLinks = ServerMessageBlock.readInt4(array, n3);
        final int n4 = n3 + 4;
        final int n5 = n4 + 1;
        info.deletePending = ((0xFF & array[n4]) > 0 && directory);
        final int n6 = n5 + 1;
        if ((0xFF & array[n5]) <= 0) {
            directory = false;
        }
        info.directory = directory;
        this.info = info;
        return n6 - n;
    }
    
    public String toString() {
        return new String("Trans2QueryPathInformationResponse[" + super.toString() + "]");
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
    
    class SmbQueryFileBasicInfo implements Info
    {
        int attributes;
        long changeTime;
        long createTime;
        long lastAccessTime;
        long lastWriteTime;
        
        public int getAttributes() {
            return this.attributes;
        }
        
        public long getCreateTime() {
            return this.createTime;
        }
        
        public long getLastWriteTime() {
            return this.lastWriteTime;
        }
        
        public long getSize() {
            return 0L;
        }
        
        public String toString() {
            return new String("SmbQueryFileBasicInfo[createTime=" + new Date(this.createTime) + ",lastAccessTime=" + new Date(this.lastAccessTime) + ",lastWriteTime=" + new Date(this.lastWriteTime) + ",changeTime=" + new Date(this.changeTime) + ",attributes=0x" + Hexdump.toHexString(this.attributes, 4) + "]");
        }
    }
    
    class SmbQueryFileStandardInfo implements Info
    {
        long allocationSize;
        boolean deletePending;
        boolean directory;
        long endOfFile;
        int numberOfLinks;
        
        public int getAttributes() {
            return 0;
        }
        
        public long getCreateTime() {
            return 0L;
        }
        
        public long getLastWriteTime() {
            return 0L;
        }
        
        public long getSize() {
            return this.endOfFile;
        }
        
        public String toString() {
            return new String("SmbQueryInfoStandard[allocationSize=" + this.allocationSize + ",endOfFile=" + this.endOfFile + ",numberOfLinks=" + this.numberOfLinks + ",deletePending=" + this.deletePending + ",directory=" + this.directory + "]");
        }
    }
}
