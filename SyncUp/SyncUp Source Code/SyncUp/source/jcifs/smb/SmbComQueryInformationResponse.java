package jcifs.smb;

import jcifs.util.*;
import java.util.*;

class SmbComQueryInformationResponse extends ServerMessageBlock implements Info
{
    private int fileAttributes;
    private int fileSize;
    private long lastWriteTime;
    private long serverTimeZoneOffset;
    
    SmbComQueryInformationResponse(final long serverTimeZoneOffset) {
        super();
        this.fileAttributes = 0;
        this.lastWriteTime = 0L;
        this.fileSize = 0;
        this.serverTimeZoneOffset = serverTimeZoneOffset;
        this.command = 8;
    }
    
    public int getAttributes() {
        return this.fileAttributes;
    }
    
    public long getCreateTime() {
        return this.lastWriteTime + this.serverTimeZoneOffset;
    }
    
    public long getLastWriteTime() {
        return this.lastWriteTime + this.serverTimeZoneOffset;
    }
    
    public long getSize() {
        return this.fileSize;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        int n2;
        if (this.wordCount == 0) {
            n2 = 0;
        }
        else {
            this.fileAttributes = ServerMessageBlock.readInt2(array, n);
            final int n3 = n + 2;
            this.lastWriteTime = ServerMessageBlock.readUTime(array, n3);
            this.fileSize = ServerMessageBlock.readInt4(array, n3 + 4);
            n2 = 20;
        }
        return n2;
    }
    
    public String toString() {
        return new String("SmbComQueryInformationResponse[" + super.toString() + ",fileAttributes=0x" + Hexdump.toHexString(this.fileAttributes, 4) + ",lastWriteTime=" + new Date(this.lastWriteTime) + ",fileSize=" + this.fileSize + "]");
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
