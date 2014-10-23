package jcifs.smb;

import jcifs.util.*;
import java.io.*;
import java.util.*;

class Trans2FindFirst2Response extends SmbComTransactionResponse
{
    static final int SMB_FILE_BOTH_DIRECTORY_INFO = 260;
    static final int SMB_FILE_NAMES_INFO = 259;
    static final int SMB_FIND_FILE_DIRECTORY_INFO = 257;
    static final int SMB_FIND_FILE_FULL_DIRECTORY_INFO = 258;
    static final int SMB_INFO_QUERY_EAS_FROM_LIST = 3;
    static final int SMB_INFO_QUERY_EA_SIZE = 2;
    static final int SMB_INFO_STANDARD = 1;
    int eaErrorOffset;
    boolean isEndOfSearch;
    String lastName;
    int lastNameBufferIndex;
    int lastNameOffset;
    int resumeKey;
    int sid;
    
    Trans2FindFirst2Response() {
        super();
        this.command = 50;
        this.subCommand = 1;
    }
    
    int readDataWireFormat(final byte[] array, int n, final int n2) {
        this.lastNameBufferIndex = n + this.lastNameOffset;
        this.results = new SmbFindFileBothDirectoryInfo[this.numEntries];
        for (int i = 0; i < this.numEntries; ++i) {
            final FileEntry[] results = this.results;
            final SmbFindFileBothDirectoryInfo smbFindFileBothDirectoryInfo = new SmbFindFileBothDirectoryInfo();
            results[i] = smbFindFileBothDirectoryInfo;
            smbFindFileBothDirectoryInfo.nextEntryOffset = ServerMessageBlock.readInt4(array, n);
            smbFindFileBothDirectoryInfo.fileIndex = ServerMessageBlock.readInt4(array, n + 4);
            smbFindFileBothDirectoryInfo.creationTime = ServerMessageBlock.readTime(array, n + 8);
            smbFindFileBothDirectoryInfo.lastWriteTime = ServerMessageBlock.readTime(array, n + 24);
            smbFindFileBothDirectoryInfo.endOfFile = ServerMessageBlock.readInt8(array, n + 40);
            smbFindFileBothDirectoryInfo.extFileAttributes = ServerMessageBlock.readInt4(array, n + 56);
            smbFindFileBothDirectoryInfo.fileNameLength = ServerMessageBlock.readInt4(array, n + 60);
            smbFindFileBothDirectoryInfo.filename = this.readString(array, n + 94, smbFindFileBothDirectoryInfo.fileNameLength);
            if (this.lastNameBufferIndex >= n && (smbFindFileBothDirectoryInfo.nextEntryOffset == 0 || this.lastNameBufferIndex < n + smbFindFileBothDirectoryInfo.nextEntryOffset)) {
                this.lastName = smbFindFileBothDirectoryInfo.filename;
                this.resumeKey = smbFindFileBothDirectoryInfo.fileIndex;
            }
            n += smbFindFileBothDirectoryInfo.nextEntryOffset;
        }
        return this.dataCount;
    }
    
    int readParametersWireFormat(final byte[] array, int n, final int n2) {
        boolean isEndOfSearch = true;
        final int n3 = n;
        if (this.subCommand == isEndOfSearch) {
            this.sid = ServerMessageBlock.readInt2(array, n);
            n += 2;
        }
        this.numEntries = ServerMessageBlock.readInt2(array, n);
        final int n4 = n + 2;
        if ((0x1 & array[n4]) != isEndOfSearch) {
            isEndOfSearch = false;
        }
        this.isEndOfSearch = isEndOfSearch;
        final int n5 = n4 + 2;
        this.eaErrorOffset = ServerMessageBlock.readInt2(array, n5);
        final int n6 = n5 + 2;
        this.lastNameOffset = ServerMessageBlock.readInt2(array, n6);
        return n6 + 2 - n3;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    String readString(final byte[] array, final int n, int n2) {
        String s;
        try {
            if (this.useUnicode) {
                if (n2 > 1 && array[-1 + (n + n2)] == 0 && array[-2 + (n + n2)] == 0) {
                    n2 -= 2;
                }
                s = new String(array, n, n2, "UTF-16LE");
            }
            else {
                if (n2 > 0 && array[-1 + (n + n2)] == 0) {
                    --n2;
                }
                s = new String(array, n, n2, ServerMessageBlock.OEM_ENCODING);
            }
        }
        catch (UnsupportedEncodingException ex) {
            final LogStream log = Trans2FindFirst2Response.log;
            if (LogStream.level > 1) {
                ex.printStackTrace(Trans2FindFirst2Response.log);
            }
            throw new RuntimeException(ex.getLocalizedMessage(), ex);
        }
        return s;
    }
    
    public String toString() {
        String s;
        if (this.subCommand == 1) {
            s = "Trans2FindFirst2Response[";
        }
        else {
            s = "Trans2FindNext2Response[";
        }
        return new String(String.valueOf(s) + super.toString() + ",sid=" + this.sid + ",searchCount=" + this.numEntries + ",isEndOfSearch=" + this.isEndOfSearch + ",eaErrorOffset=" + this.eaErrorOffset + ",lastNameOffset=" + this.lastNameOffset + ",lastName=" + this.lastName + "]");
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
    
    class SmbFindFileBothDirectoryInfo implements FileEntry
    {
        long allocationSize;
        long changeTime;
        long creationTime;
        int eaSize;
        long endOfFile;
        int extFileAttributes;
        int fileIndex;
        int fileNameLength;
        String filename;
        long lastAccessTime;
        long lastWriteTime;
        int nextEntryOffset;
        String shortName;
        int shortNameLength;
        
        public long createTime() {
            return this.creationTime;
        }
        
        public int getAttributes() {
            return this.extFileAttributes;
        }
        
        public String getName() {
            return this.filename;
        }
        
        public int getType() {
            return 1;
        }
        
        public long lastModified() {
            return this.lastWriteTime;
        }
        
        public long length() {
            return this.endOfFile;
        }
        
        public String toString() {
            return new String("SmbFindFileBothDirectoryInfo[nextEntryOffset=" + this.nextEntryOffset + ",fileIndex=" + this.fileIndex + ",creationTime=" + new Date(this.creationTime) + ",lastAccessTime=" + new Date(this.lastAccessTime) + ",lastWriteTime=" + new Date(this.lastWriteTime) + ",changeTime=" + new Date(this.changeTime) + ",endOfFile=" + this.endOfFile + ",allocationSize=" + this.allocationSize + ",extFileAttributes=" + this.extFileAttributes + ",fileNameLength=" + this.fileNameLength + ",eaSize=" + this.eaSize + ",shortNameLength=" + this.shortNameLength + ",shortName=" + this.shortName + ",filename=" + this.filename + "]");
        }
    }
}
