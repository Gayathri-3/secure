package jcifs.smb;

class SmbComOpenAndXResponse extends AndXServerMessageBlock
{
    int action;
    int dataSize;
    int deviceState;
    int fid;
    int fileAttributes;
    int fileType;
    int grantedAccess;
    long lastWriteTime;
    int serverFid;
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        this.fid = ServerMessageBlock.readInt2(array, n);
        final int n2 = n + 2;
        this.fileAttributes = ServerMessageBlock.readInt2(array, n2);
        final int n3 = n2 + 2;
        this.lastWriteTime = ServerMessageBlock.readUTime(array, n3);
        final int n4 = n3 + 4;
        this.dataSize = ServerMessageBlock.readInt4(array, n4);
        final int n5 = n4 + 4;
        this.grantedAccess = ServerMessageBlock.readInt2(array, n5);
        final int n6 = n5 + 2;
        this.fileType = ServerMessageBlock.readInt2(array, n6);
        final int n7 = n6 + 2;
        this.deviceState = ServerMessageBlock.readInt2(array, n7);
        final int n8 = n7 + 2;
        this.action = ServerMessageBlock.readInt2(array, n8);
        final int n9 = n8 + 2;
        this.serverFid = ServerMessageBlock.readInt4(array, n9);
        return n9 + 6 - n;
    }
    
    public String toString() {
        return new String("SmbComOpenAndXResponse[" + super.toString() + ",fid=" + this.fid + ",fileAttributes=" + this.fileAttributes + ",lastWriteTime=" + this.lastWriteTime + ",dataSize=" + this.dataSize + ",grantedAccess=" + this.grantedAccess + ",fileType=" + this.fileType + ",deviceState=" + this.deviceState + ",action=" + this.action + ",serverFid=" + this.serverFid + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
