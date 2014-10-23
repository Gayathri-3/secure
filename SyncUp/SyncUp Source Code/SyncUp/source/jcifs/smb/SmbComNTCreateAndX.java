package jcifs.smb;

import jcifs.util.*;

class SmbComNTCreateAndX extends AndXServerMessageBlock
{
    static final int FILE_CREATE = 2;
    static final int FILE_OPEN = 1;
    static final int FILE_OPEN_IF = 3;
    static final int FILE_OVERWRITE = 4;
    static final int FILE_OVERWRITE_IF = 5;
    static final int FILE_SEQUENTIAL_ONLY = 4;
    static final int FILE_SUPERSEDE = 0;
    static final int FILE_SYNCHRONOUS_IO_ALERT = 16;
    static final int FILE_SYNCHRONOUS_IO_NONALERT = 32;
    static final int FILE_WRITE_THROUGH = 2;
    static final int SECURITY_CONTEXT_TRACKING = 1;
    static final int SECURITY_EFFECTIVE_ONLY = 2;
    private long allocationSize;
    private int createDisposition;
    private int createOptions;
    int desiredAccess;
    private int extFileAttributes;
    int flags0;
    private int impersonationLevel;
    private int namelen_index;
    private int rootDirectoryFid;
    private byte securityFlags;
    private int shareAccess;
    
    SmbComNTCreateAndX(final String path, final int n, final int desiredAccess, final int shareAccess, final int extFileAttributes, final int createOptions, final ServerMessageBlock serverMessageBlock) {
        super(serverMessageBlock);
        this.path = path;
        this.command = -94;
        this.desiredAccess = desiredAccess;
        this.desiredAccess |= 0x89;
        this.extFileAttributes = extFileAttributes;
        this.shareAccess = shareAccess;
        if ((n & 0x40) == 0x40) {
            if ((n & 0x10) == 0x10) {
                this.createDisposition = 5;
            }
            else {
                this.createDisposition = 4;
            }
        }
        else if ((n & 0x10) == 0x10) {
            if ((n & 0x20) == 0x20) {
                this.createDisposition = 2;
            }
            else {
                this.createDisposition = 3;
            }
        }
        else {
            this.createDisposition = 1;
        }
        if ((createOptions & 0x1) == 0x0) {
            this.createOptions = (createOptions | 0x40);
        }
        else {
            this.createOptions = createOptions;
        }
        this.impersonationLevel = 2;
        this.securityFlags = 3;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("SmbComNTCreateAndX[" + super.toString() + ",flags=0x" + Hexdump.toHexString(this.flags0, 2) + ",rootDirectoryFid=" + this.rootDirectoryFid + ",desiredAccess=0x" + Hexdump.toHexString(this.desiredAccess, 4) + ",allocationSize=" + this.allocationSize + ",extFileAttributes=0x" + Hexdump.toHexString(this.extFileAttributes, 4) + ",shareAccess=0x" + Hexdump.toHexString(this.shareAccess, 4) + ",createDisposition=0x" + Hexdump.toHexString(this.createDisposition, 4) + ",createOptions=0x" + Hexdump.toHexString(this.createOptions, 8) + ",impersonationLevel=0x" + Hexdump.toHexString(this.impersonationLevel, 4) + ",securityFlags=0x" + Hexdump.toHexString(this.securityFlags, 2) + ",name=" + this.path + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        final int writeString = this.writeString(this.path, array, n);
        int n2;
        if (this.useUnicode) {
            n2 = 2 * this.path.length();
        }
        else {
            n2 = writeString;
        }
        ServerMessageBlock.writeInt2(n2, array, this.namelen_index);
        return writeString;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        final int namelen_index = n + 1;
        array[n] = 0;
        this.namelen_index = namelen_index;
        final int n2 = namelen_index + 2;
        ServerMessageBlock.writeInt4(this.flags0, array, n2);
        final int n3 = n2 + 4;
        ServerMessageBlock.writeInt4(this.rootDirectoryFid, array, n3);
        final int n4 = n3 + 4;
        ServerMessageBlock.writeInt4(this.desiredAccess, array, n4);
        final int n5 = n4 + 4;
        ServerMessageBlock.writeInt8(this.allocationSize, array, n5);
        final int n6 = n5 + 8;
        ServerMessageBlock.writeInt4(this.extFileAttributes, array, n6);
        final int n7 = n6 + 4;
        ServerMessageBlock.writeInt4(this.shareAccess, array, n7);
        final int n8 = n7 + 4;
        ServerMessageBlock.writeInt4(this.createDisposition, array, n8);
        final int n9 = n8 + 4;
        ServerMessageBlock.writeInt4(this.createOptions, array, n9);
        final int n10 = n9 + 4;
        ServerMessageBlock.writeInt4(this.impersonationLevel, array, n10);
        final int n11 = n10 + 4;
        final int n12 = n11 + 1;
        array[n11] = this.securityFlags;
        return n12 - n;
    }
}
