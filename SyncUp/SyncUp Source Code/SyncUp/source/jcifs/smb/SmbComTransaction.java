package jcifs.smb;

import java.util.*;
import jcifs.*;
import jcifs.util.*;

abstract class SmbComTransaction extends ServerMessageBlock implements Enumeration
{
    private static final int DEFAULT_MAX_DATA_COUNT = 0;
    private static final int DISCONNECT_TID = 1;
    static final int NET_SERVER_ENUM2 = 104;
    static final int NET_SERVER_ENUM3 = 215;
    static final int NET_SHARE_ENUM = 0;
    private static final int ONE_WAY_TRANSACTION = 2;
    private static final int PADDING_SIZE = 2;
    private static final int PRIMARY_SETUP_OFFSET = 61;
    private static final int SECONDARY_PARAMETER_OFFSET = 51;
    static final byte TRANS2_FIND_FIRST2 = 1;
    static final byte TRANS2_FIND_NEXT2 = 2;
    static final byte TRANS2_GET_DFS_REFERRAL = 16;
    static final byte TRANS2_QUERY_FS_INFORMATION = 3;
    static final byte TRANS2_QUERY_PATH_INFORMATION = 5;
    static final byte TRANS2_SET_FILE_INFORMATION = 8;
    static final int TRANSACTION_BUF_SIZE = 65535;
    static final byte TRANS_CALL_NAMED_PIPE = 84;
    static final byte TRANS_PEEK_NAMED_PIPE = 35;
    static final byte TRANS_TRANSACT_NAMED_PIPE = 38;
    static final byte TRANS_WAIT_NAMED_PIPE = 83;
    private int bufDataOffset;
    private int bufParameterOffset;
    protected int dataCount;
    protected int dataDisplacement;
    protected int dataOffset;
    private int fid;
    private int flags;
    private boolean hasMore;
    private boolean isPrimary;
    int maxBufferSize;
    int maxDataCount;
    int maxParameterCount;
    byte maxSetupCount;
    String name;
    private int pad;
    private int pad1;
    protected int parameterCount;
    protected int parameterDisplacement;
    protected int parameterOffset;
    protected int primarySetupOffset;
    protected int secondaryParameterOffset;
    int setupCount;
    byte subCommand;
    int timeout;
    int totalDataCount;
    int totalParameterCount;
    byte[] txn_buf;
    
    static {
        DEFAULT_MAX_DATA_COUNT = -512 + Config.getInt("jcifs.smb.client.transaction_buf_size", 65535);
    }
    
    SmbComTransaction() {
        super();
        this.flags = 0;
        this.pad = 0;
        this.pad1 = 0;
        this.hasMore = true;
        this.isPrimary = true;
        this.maxDataCount = SmbComTransaction.DEFAULT_MAX_DATA_COUNT;
        this.timeout = 0;
        this.setupCount = 1;
        this.name = "";
        this.maxParameterCount = 1024;
        this.primarySetupOffset = 61;
        this.secondaryParameterOffset = 51;
    }
    
    public boolean hasMoreElements() {
        return this.hasMore;
    }
    
    public Object nextElement() {
        if (this.isPrimary) {
            this.isPrimary = false;
            this.parameterOffset = 2 + (this.primarySetupOffset + 2 * this.setupCount);
            if (this.command != -96) {
                if (this.command == 37 && !this.isResponse()) {
                    this.parameterOffset += this.stringWireLength(this.name, this.parameterOffset);
                }
            }
            else if (this.command == -96) {
                this.parameterOffset += 2;
            }
            this.pad = this.parameterOffset % 2;
            int pad;
            if (this.pad == 0) {
                pad = 0;
            }
            else {
                pad = 2 - this.pad;
            }
            this.pad = pad;
            this.parameterOffset += this.pad;
            this.totalParameterCount = this.writeParametersWireFormat(this.txn_buf, this.bufParameterOffset);
            this.bufDataOffset = this.totalParameterCount;
            final int n = this.maxBufferSize - this.parameterOffset;
            this.parameterCount = Math.min(this.totalParameterCount, n);
            final int n2 = n - this.parameterCount;
            this.dataOffset = this.parameterOffset + this.parameterCount;
            this.pad1 = this.dataOffset % 2;
            int pad2;
            if (this.pad1 == 0) {
                pad2 = 0;
            }
            else {
                pad2 = 2 - this.pad1;
            }
            this.pad1 = pad2;
            this.dataOffset += this.pad1;
            this.totalDataCount = this.writeDataWireFormat(this.txn_buf, this.bufDataOffset);
            this.dataCount = Math.min(this.totalDataCount, n2);
        }
        else {
            if (this.command != -96) {
                this.command = 38;
            }
            else {
                this.command = -95;
            }
            this.parameterOffset = 51;
            if (this.totalParameterCount - this.parameterDisplacement > 0) {
                this.pad = this.parameterOffset % 2;
                int pad3;
                if (this.pad == 0) {
                    pad3 = 0;
                }
                else {
                    pad3 = 2 - this.pad;
                }
                this.pad = pad3;
                this.parameterOffset += this.pad;
            }
            this.parameterDisplacement += this.parameterCount;
            final int n3 = this.maxBufferSize - this.parameterOffset - this.pad;
            this.parameterCount = Math.min(this.totalParameterCount - this.parameterDisplacement, n3);
            final int n4 = n3 - this.parameterCount;
            this.dataOffset = this.parameterOffset + this.parameterCount;
            this.pad1 = this.dataOffset % 2;
            int pad4;
            if (this.pad1 == 0) {
                pad4 = 0;
            }
            else {
                pad4 = 2 - this.pad1;
            }
            this.pad1 = pad4;
            this.dataOffset += this.pad1;
            this.dataDisplacement += this.dataCount;
            this.dataCount = Math.min(this.totalDataCount - this.dataDisplacement, n4 - this.pad1);
        }
        if (this.parameterDisplacement + this.parameterCount >= this.totalParameterCount && this.dataDisplacement + this.dataCount >= this.totalDataCount) {
            this.hasMore = false;
        }
        return this;
    }
    
    int readBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    abstract int readDataWireFormat(final byte[] p0, final int p1, final int p2);
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    abstract int readParametersWireFormat(final byte[] p0, final int p1, final int p2);
    
    abstract int readSetupWireFormat(final byte[] p0, final int p1, final int p2);
    
    void reset() {
        super.reset();
        this.hasMore = true;
        this.isPrimary = true;
    }
    
    void reset(final int n, final String s) {
        this.reset();
    }
    
    public String toString() {
        return new String(String.valueOf(super.toString()) + ",totalParameterCount=" + this.totalParameterCount + ",totalDataCount=" + this.totalDataCount + ",maxParameterCount=" + this.maxParameterCount + ",maxDataCount=" + this.maxDataCount + ",maxSetupCount=" + this.maxSetupCount + ",flags=0x" + Hexdump.toHexString(this.flags, 2) + ",timeout=" + this.timeout + ",parameterCount=" + this.parameterCount + ",parameterOffset=" + this.parameterOffset + ",parameterDisplacement=" + this.parameterDisplacement + ",dataCount=" + this.dataCount + ",dataOffset=" + this.dataOffset + ",dataDisplacement=" + this.dataDisplacement + ",setupCount=" + this.setupCount + ",pad=" + this.pad + ",pad1=" + this.pad1);
    }
    
    int writeBytesWireFormat(final byte[] array, int n) {
        final int n2 = n;
        final int pad = this.pad;
        if (this.command == 37 && !this.isResponse()) {
            n += this.writeString(this.name, array, n);
        }
        if (this.parameterCount > 0) {
            int n3 = pad;
            int n4 = n;
            while (true) {
                final int n5 = n3 - 1;
                if (n3 <= 0) {
                    break;
                }
                final int n6 = n4 + 1;
                array[n4] = 0;
                n3 = n5;
                n4 = n6;
            }
            System.arraycopy(this.txn_buf, this.bufParameterOffset, array, n4, this.parameterCount);
            n = n4 + this.parameterCount;
        }
        if (this.dataCount > 0) {
            int pad2 = this.pad1;
            int n7 = n;
            while (true) {
                final int n8 = pad2 - 1;
                if (pad2 <= 0) {
                    break;
                }
                final int n9 = n7 + 1;
                array[n7] = 0;
                pad2 = n8;
                n7 = n9;
            }
            System.arraycopy(this.txn_buf, this.bufDataOffset, array, n7, this.dataCount);
            this.bufDataOffset += this.dataCount;
            n = n7 + this.dataCount;
        }
        return n - n2;
    }
    
    abstract int writeDataWireFormat(final byte[] p0, final int p1);
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.totalParameterCount, array, n);
        final int n2 = n + 2;
        ServerMessageBlock.writeInt2(this.totalDataCount, array, n2);
        int n3 = n2 + 2;
        if (this.command != 38) {
            ServerMessageBlock.writeInt2(this.maxParameterCount, array, n3);
            final int n4 = n3 + 2;
            ServerMessageBlock.writeInt2(this.maxDataCount, array, n4);
            final int n5 = n4 + 2;
            final int n6 = n5 + 1;
            array[n5] = this.maxSetupCount;
            final int n7 = n6 + 1;
            array[n6] = 0;
            ServerMessageBlock.writeInt2(this.flags, array, n7);
            final int n8 = n7 + 2;
            ServerMessageBlock.writeInt4(this.timeout, array, n8);
            final int n9 = n8 + 4;
            final int n10 = n9 + 1;
            array[n9] = 0;
            n3 = n10 + 1;
            array[n10] = 0;
        }
        ServerMessageBlock.writeInt2(this.parameterCount, array, n3);
        final int n11 = n3 + 2;
        ServerMessageBlock.writeInt2(this.parameterOffset, array, n11);
        int n12 = n11 + 2;
        if (this.command == 38) {
            ServerMessageBlock.writeInt2(this.parameterDisplacement, array, n12);
            n12 += 2;
        }
        ServerMessageBlock.writeInt2(this.dataCount, array, n12);
        final int n13 = n12 + 2;
        int dataOffset;
        if (this.dataCount == 0) {
            dataOffset = 0;
        }
        else {
            dataOffset = this.dataOffset;
        }
        ServerMessageBlock.writeInt2(dataOffset, array, n13);
        final int n14 = n13 + 2;
        int n15;
        if (this.command == 38) {
            ServerMessageBlock.writeInt2(this.dataDisplacement, array, n14);
            n15 = n14 + 2;
        }
        else {
            final int n16 = n14 + 1;
            array[n14] = (byte)this.setupCount;
            final int n17 = n16 + 1;
            array[n16] = 0;
            n15 = n17 + this.writeSetupWireFormat(array, n17);
        }
        return n15 - n;
    }
    
    abstract int writeParametersWireFormat(final byte[] p0, final int p1);
    
    abstract int writeSetupWireFormat(final byte[] p0, final int p1);
}
