package jcifs.smb;

import jcifs.util.*;

abstract class AndXServerMessageBlock extends ServerMessageBlock
{
    private static final int ANDX_COMMAND_OFFSET = 1;
    private static final int ANDX_OFFSET_OFFSET = 3;
    private static final int ANDX_RESERVED_OFFSET = 2;
    ServerMessageBlock andx;
    private byte andxCommand;
    private int andxOffset;
    
    AndXServerMessageBlock() {
        super();
        this.andxCommand = -1;
        this.andxOffset = 0;
        this.andx = null;
    }
    
    AndXServerMessageBlock(final ServerMessageBlock andx) {
        super();
        this.andxCommand = -1;
        this.andxOffset = 0;
        this.andx = null;
        if (andx != null) {
            this.andx = andx;
            this.andxCommand = andx.command;
        }
    }
    
    int decode(final byte[] array, final int headerStart) {
        this.headerStart = headerStart;
        final int n = headerStart + this.readHeaderWireFormat(array, headerStart);
        return this.length = n + this.readAndXWireFormat(array, n) - headerStart;
    }
    
    int encode(final byte[] array, final int headerStart) {
        this.headerStart = headerStart;
        final int n = headerStart + this.writeHeaderWireFormat(array, headerStart);
        this.length = n + this.writeAndXWireFormat(array, n) - headerStart;
        if (this.digest != null) {
            this.digest.sign(array, this.headerStart, this.length, this, this.response);
        }
        return this.length;
    }
    
    int getBatchLimit(final byte b) {
        return 0;
    }
    
    int readAndXWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        this.wordCount = array[n];
        int n3;
        if (this.wordCount != 0) {
            this.andxCommand = array[n2];
            this.andxOffset = ServerMessageBlock.readInt2(array, n2 + 2);
            if (this.andxOffset == 0) {
                this.andxCommand = -1;
            }
            if (this.wordCount > 2) {
                this.readParameterWordsWireFormat(array, n2 + 4);
                if (this.command == -94 && ((SmbComNTCreateAndXResponse)this).isExtended) {
                    this.wordCount += 8;
                }
            }
            n3 = n + 1 + 2 * this.wordCount;
        }
        else {
            n3 = n2;
        }
        this.byteCount = ServerMessageBlock.readInt2(array, n3);
        int n4 = n3 + 2;
        if (this.byteCount != 0) {
            this.readBytesWireFormat(array, n4);
            n4 += this.byteCount;
        }
        if (this.errorCode != 0 || this.andxCommand == -1) {
            this.andxCommand = -1;
            this.andx = null;
        }
        else {
            if (this.andx == null) {
                this.andxCommand = -1;
                throw new RuntimeException("no andx command supplied with response");
            }
            final int n5 = this.headerStart + this.andxOffset;
            this.andx.headerStart = this.headerStart;
            this.andx.command = this.andxCommand;
            this.andx.errorCode = this.errorCode;
            this.andx.flags = this.flags;
            this.andx.flags2 = this.flags2;
            this.andx.tid = this.tid;
            this.andx.pid = this.pid;
            this.andx.uid = this.uid;
            this.andx.mid = this.mid;
            this.andx.useUnicode = this.useUnicode;
            if (this.andx instanceof AndXServerMessageBlock) {
                n4 = n5 + ((AndXServerMessageBlock)this.andx).readAndXWireFormat(array, n5);
            }
            else {
                final int n6 = n5 + 1;
                array[n5] = (byte)(0xFF & this.andx.wordCount);
                int n7;
                if (this.andx.wordCount != 0 && this.andx.wordCount > 2) {
                    n7 = n6 + this.andx.readParameterWordsWireFormat(array, n6);
                }
                else {
                    n7 = n6;
                }
                this.andx.byteCount = ServerMessageBlock.readInt2(array, n7);
                n4 = n7 + 2;
                if (this.andx.byteCount != 0) {
                    this.andx.readBytesWireFormat(array, n4);
                    n4 += this.andx.byteCount;
                }
            }
            this.andx.received = true;
        }
        return n4 - n;
    }
    
    public String toString() {
        return new String(String.valueOf(super.toString()) + ",andxCommand=0x" + Hexdump.toHexString(this.andxCommand, 2) + ",andxOffset=" + this.andxOffset);
    }
    
    int writeAndXWireFormat(final byte[] array, final int n) {
        this.wordCount = this.writeParameterWordsWireFormat(array, 2 + (n + 3));
        this.wordCount += 4;
        final int n2 = n + (1 + this.wordCount);
        this.wordCount /= 2;
        array[n] = (byte)(0xFF & this.wordCount);
        this.byteCount = this.writeBytesWireFormat(array, n2 + 2);
        final int n3 = n2 + 1;
        array[n2] = (byte)(0xFF & this.byteCount);
        final int n4 = n3 + 1;
        array[n3] = (byte)(0xFF & this.byteCount >> 8);
        final int n5 = n4 + this.byteCount;
        int n6;
        if (this.andx == null || !AndXServerMessageBlock.USE_BATCHING || this.batchLevel >= this.getBatchLimit(this.andx.command)) {
            this.andxCommand = -1;
            this.andx = null;
            array[n + 1] = -1;
            array[n + 2] = 0;
            array[1 + (n + 3)] = (array[n + 3] = -34);
            n6 = n5 - n;
        }
        else {
            this.andx.batchLevel = 1 + this.batchLevel;
            array[n + 1] = this.andxCommand;
            array[n + 2] = 0;
            this.andxOffset = n5 - this.headerStart;
            ServerMessageBlock.writeInt2(this.andxOffset, array, n + 3);
            this.andx.useUnicode = this.useUnicode;
            int n7;
            if (this.andx instanceof AndXServerMessageBlock) {
                this.andx.uid = this.uid;
                n7 = n5 + ((AndXServerMessageBlock)this.andx).writeAndXWireFormat(array, n5);
            }
            else {
                this.andx.wordCount = this.andx.writeParameterWordsWireFormat(array, n5);
                final int n8 = n5 + (1 + this.andx.wordCount);
                final ServerMessageBlock andx = this.andx;
                andx.wordCount /= 2;
                array[n5] = (byte)(0xFF & this.andx.wordCount);
                this.andx.byteCount = this.andx.writeBytesWireFormat(array, n8 + 2);
                final int n9 = n8 + 1;
                array[n8] = (byte)(0xFF & this.andx.byteCount);
                final int n10 = n9 + 1;
                array[n9] = (byte)(0xFF & this.andx.byteCount >> 8);
                n7 = n10 + this.andx.byteCount;
            }
            n6 = n7 - n;
        }
        return n6;
    }
}
