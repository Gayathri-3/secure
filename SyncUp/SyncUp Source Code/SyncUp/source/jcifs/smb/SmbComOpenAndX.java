package jcifs.smb;

import jcifs.*;
import jcifs.util.*;
import java.util.*;

class SmbComOpenAndX extends AndXServerMessageBlock
{
    private static final int BATCH_LIMIT = 0;
    private static final int DO_NOT_CACHE = 4096;
    private static final int FLAGS_REQUEST_BATCH_OPLOCK = 4;
    private static final int FLAGS_REQUEST_OPLOCK = 2;
    private static final int FLAGS_RETURN_ADDITIONAL_INFO = 1;
    private static final int OPEN_FN_CREATE = 16;
    private static final int OPEN_FN_FAIL_IF_EXISTS = 0;
    private static final int OPEN_FN_OPEN = 1;
    private static final int OPEN_FN_TRUNC = 2;
    private static final int SHARING_COMPATIBILITY = 0;
    private static final int SHARING_DENY_NONE = 64;
    private static final int SHARING_DENY_READ_EXECUTE = 48;
    private static final int SHARING_DENY_READ_WRITE_EXECUTE = 16;
    private static final int SHARING_DENY_WRITE = 32;
    private static final int WRITE_THROUGH = 16384;
    int allocationSize;
    int creationTime;
    int desiredAccess;
    int fileAttributes;
    int flags;
    int openFunction;
    int searchAttributes;
    
    static {
        BATCH_LIMIT = Config.getInt("jcifs.smb.client.OpenAndX.ReadAndX", 1);
    }
    
    SmbComOpenAndX(final String path, final int n, final int n2, final ServerMessageBlock serverMessageBlock) {
        super(serverMessageBlock);
        this.path = path;
        this.command = 45;
        this.desiredAccess = (n & 0x3);
        if (this.desiredAccess == 3) {
            this.desiredAccess = 2;
        }
        this.desiredAccess |= 0x40;
        this.desiredAccess &= 0xFFFFFFFE;
        this.searchAttributes = 22;
        this.fileAttributes = 0;
        if ((n2 & 0x40) == 0x40) {
            if ((n2 & 0x10) == 0x10) {
                this.openFunction = 18;
            }
            else {
                this.openFunction = 2;
            }
        }
        else if ((n2 & 0x10) == 0x10) {
            if ((n2 & 0x20) == 0x20) {
                this.openFunction = 16;
            }
            else {
                this.openFunction = 17;
            }
        }
        else {
            this.openFunction = 1;
        }
    }
    
    int getBatchLimit(final byte b) {
        int batch_LIMIT;
        if (b == 46) {
            batch_LIMIT = SmbComOpenAndX.BATCH_LIMIT;
        }
        else {
            batch_LIMIT = 0;
        }
        return batch_LIMIT;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("SmbComOpenAndX[" + super.toString() + ",flags=0x" + Hexdump.toHexString(this.flags, 2) + ",desiredAccess=0x" + Hexdump.toHexString(this.desiredAccess, 4) + ",searchAttributes=0x" + Hexdump.toHexString(this.searchAttributes, 4) + ",fileAttributes=0x" + Hexdump.toHexString(this.fileAttributes, 4) + ",creationTime=" + new Date(this.creationTime) + ",openFunction=0x" + Hexdump.toHexString(this.openFunction, 2) + ",allocationSize=" + this.allocationSize + ",fileName=" + this.path + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, int n) {
        final int n2 = n;
        if (this.useUnicode) {
            final int n3 = n + 1;
            array[n] = 0;
            n = n3;
        }
        return n + this.writeString(this.path, array, n) - n2;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.flags, array, n);
        final int n2 = n + 2;
        ServerMessageBlock.writeInt2(this.desiredAccess, array, n2);
        final int n3 = n2 + 2;
        ServerMessageBlock.writeInt2(this.searchAttributes, array, n3);
        final int n4 = n3 + 2;
        ServerMessageBlock.writeInt2(this.fileAttributes, array, n4);
        final int n5 = n4 + 2;
        this.creationTime = 0;
        ServerMessageBlock.writeInt4(this.creationTime, array, n5);
        final int n6 = n5 + 4;
        ServerMessageBlock.writeInt2(this.openFunction, array, n6);
        final int n7 = n6 + 2;
        ServerMessageBlock.writeInt4(this.allocationSize, array, n7);
        final int n8 = n7 + 4;
        int i = 0;
        int n9 = n8;
        while (i < 8) {
            final int n10 = n9 + 1;
            array[n9] = 0;
            ++i;
            n9 = n10;
        }
        return n9 - n;
    }
}
