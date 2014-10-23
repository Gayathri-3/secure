package jcifs.smb;

import jcifs.util.*;
import java.util.*;

class SmbComNTCreateAndXResponse extends AndXServerMessageBlock
{
    static final int BATCH_OPLOCK_GRANTED = 2;
    static final int EXCLUSIVE_OPLOCK_GRANTED = 1;
    static final int LEVEL_II_OPLOCK_GRANTED = 3;
    long allocationSize;
    long changeTime;
    int createAction;
    long creationTime;
    int deviceState;
    boolean directory;
    long endOfFile;
    int extFileAttributes;
    int fid;
    int fileType;
    boolean isExtended;
    long lastAccessTime;
    long lastWriteTime;
    byte oplockLevel;
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        this.oplockLevel = array[n];
        this.fid = ServerMessageBlock.readInt2(array, n2);
        final int n3 = n2 + 2;
        this.createAction = ServerMessageBlock.readInt4(array, n3);
        final int n4 = n3 + 4;
        this.creationTime = ServerMessageBlock.readTime(array, n4);
        final int n5 = n4 + 8;
        this.lastAccessTime = ServerMessageBlock.readTime(array, n5);
        final int n6 = n5 + 8;
        this.lastWriteTime = ServerMessageBlock.readTime(array, n6);
        final int n7 = n6 + 8;
        this.changeTime = ServerMessageBlock.readTime(array, n7);
        final int n8 = n7 + 8;
        this.extFileAttributes = ServerMessageBlock.readInt4(array, n8);
        final int n9 = n8 + 4;
        this.allocationSize = ServerMessageBlock.readInt8(array, n9);
        final int n10 = n9 + 8;
        this.endOfFile = ServerMessageBlock.readInt8(array, n10);
        final int n11 = n10 + 8;
        this.fileType = ServerMessageBlock.readInt2(array, n11);
        final int n12 = n11 + 2;
        this.deviceState = ServerMessageBlock.readInt2(array, n12);
        final int n13 = n12 + 2;
        final int n14 = n13 + 1;
        this.directory = ((0xFF & array[n13]) > 0);
        return n14 - n;
    }
    
    public String toString() {
        return new String("SmbComNTCreateAndXResponse[" + super.toString() + ",oplockLevel=" + this.oplockLevel + ",fid=" + this.fid + ",createAction=0x" + Hexdump.toHexString(this.createAction, 4) + ",creationTime=" + new Date(this.creationTime) + ",lastAccessTime=" + new Date(this.lastAccessTime) + ",lastWriteTime=" + new Date(this.lastWriteTime) + ",changeTime=" + new Date(this.changeTime) + ",extFileAttributes=0x" + Hexdump.toHexString(this.extFileAttributes, 4) + ",allocationSize=" + this.allocationSize + ",endOfFile=" + this.endOfFile + ",fileType=" + this.fileType + ",deviceState=" + this.deviceState + ",directory=" + this.directory + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
