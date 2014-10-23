package jcifs.smb;

import java.util.*;
import jcifs.util.*;

abstract class SmbComTransactionResponse extends ServerMessageBlock implements Enumeration
{
    private static final int DISCONNECT_TID = 1;
    private static final int ONE_WAY_TRANSACTION = 2;
    private static final int SETUP_OFFSET = 61;
    protected int bufDataStart;
    protected int bufParameterStart;
    int dataCount;
    protected int dataDisplacement;
    private boolean dataDone;
    protected int dataOffset;
    boolean hasMore;
    boolean isPrimary;
    int numEntries;
    private int pad;
    private int pad1;
    protected int parameterCount;
    protected int parameterDisplacement;
    protected int parameterOffset;
    private boolean parametersDone;
    FileEntry[] results;
    protected int setupCount;
    int status;
    byte subCommand;
    protected int totalDataCount;
    protected int totalParameterCount;
    byte[] txn_buf;
    
    SmbComTransactionResponse() {
        super();
        this.hasMore = true;
        this.isPrimary = true;
        this.txn_buf = null;
    }
    
    public boolean hasMoreElements() {
        return this.errorCode == 0 && this.hasMore;
    }
    
    public Object nextElement() {
        if (this.isPrimary) {
            this.isPrimary = false;
        }
        return this;
    }
    
    int readBytesWireFormat(final byte[] array, int n) {
        this.pad1 = 0;
        this.pad = 0;
        if (this.parameterCount > 0) {
            final int pad = this.parameterOffset - (n - this.headerStart);
            this.pad = pad;
            final int n2 = n + pad;
            System.arraycopy(array, n2, this.txn_buf, this.bufParameterStart + this.parameterDisplacement, this.parameterCount);
            n = n2 + this.parameterCount;
        }
        if (this.dataCount > 0) {
            final int pad2 = this.dataOffset - (n - this.headerStart);
            this.pad1 = pad2;
            final int n3 = n + pad2;
            System.arraycopy(array, n3, this.txn_buf, this.bufDataStart + this.dataDisplacement, this.dataCount);
            final int n4 = n3 + this.dataCount;
        }
        if (!this.parametersDone && this.parameterDisplacement + this.parameterCount == this.totalParameterCount) {
            this.parametersDone = true;
        }
        if (!this.dataDone && this.dataDisplacement + this.dataCount == this.totalDataCount) {
            this.dataDone = true;
        }
        if (this.parametersDone && this.dataDone) {
            this.hasMore = false;
            this.readParametersWireFormat(this.txn_buf, this.bufParameterStart, this.totalParameterCount);
            this.readDataWireFormat(this.txn_buf, this.bufDataStart, this.totalDataCount);
        }
        return this.pad + this.parameterCount + this.pad1 + this.dataCount;
    }
    
    abstract int readDataWireFormat(final byte[] p0, final int p1, final int p2);
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        this.totalParameterCount = ServerMessageBlock.readInt2(array, n);
        if (this.bufDataStart == 0) {
            this.bufDataStart = this.totalParameterCount;
        }
        final int n2 = n + 2;
        this.totalDataCount = ServerMessageBlock.readInt2(array, n2);
        final int n3 = n2 + 4;
        this.parameterCount = ServerMessageBlock.readInt2(array, n3);
        final int n4 = n3 + 2;
        this.parameterOffset = ServerMessageBlock.readInt2(array, n4);
        final int n5 = n4 + 2;
        this.parameterDisplacement = ServerMessageBlock.readInt2(array, n5);
        final int n6 = n5 + 2;
        this.dataCount = ServerMessageBlock.readInt2(array, n6);
        final int n7 = n6 + 2;
        this.dataOffset = ServerMessageBlock.readInt2(array, n7);
        final int n8 = n7 + 2;
        this.dataDisplacement = ServerMessageBlock.readInt2(array, n8);
        final int n9 = n8 + 2;
        this.setupCount = (0xFF & array[n9]);
        final int n10 = n9 + 2;
        if (this.setupCount != 0) {
            final LogStream log = SmbComTransactionResponse.log;
            if (LogStream.level > 2) {
                SmbComTransactionResponse.log.println("setupCount is not zero: " + this.setupCount);
            }
        }
        return n10 - n;
    }
    
    abstract int readParametersWireFormat(final byte[] p0, final int p1, final int p2);
    
    abstract int readSetupWireFormat(final byte[] p0, final int p1, final int p2);
    
    void reset() {
        super.reset();
        this.bufDataStart = 0;
        this.hasMore = true;
        this.isPrimary = true;
        this.dataDone = false;
        this.parametersDone = false;
    }
    
    public String toString() {
        return new String(String.valueOf(super.toString()) + ",totalParameterCount=" + this.totalParameterCount + ",totalDataCount=" + this.totalDataCount + ",parameterCount=" + this.parameterCount + ",parameterOffset=" + this.parameterOffset + ",parameterDisplacement=" + this.parameterDisplacement + ",dataCount=" + this.dataCount + ",dataOffset=" + this.dataOffset + ",dataDisplacement=" + this.dataDisplacement + ",setupCount=" + this.setupCount + ",pad=" + this.pad + ",pad1=" + this.pad1);
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    abstract int writeDataWireFormat(final byte[] p0, final int p1);
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    abstract int writeParametersWireFormat(final byte[] p0, final int p1);
    
    abstract int writeSetupWireFormat(final byte[] p0, final int p1);
}
