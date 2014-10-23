package jcifs.netbios;

import java.net.*;
import jcifs.util.*;

abstract class NameServicePacket
{
    static final int A = 1;
    static final int ACT_ERR = 6;
    static final int ADDITIONAL_OFFSET = 10;
    static final int ANSWER_OFFSET = 6;
    static final int AUTHORITY_OFFSET = 8;
    static final int CFT_ERR = 7;
    static final int FMT_ERR = 1;
    static final int HEADER_LENGTH = 12;
    static final int IMP_ERR = 4;
    static final int IN = 1;
    static final int NB = 32;
    static final int NBSTAT = 33;
    static final int NBSTAT_IN = 2162689;
    static final int NB_IN = 2097153;
    static final int NS = 2;
    static final int NULL = 10;
    static final int OPCODE_OFFSET = 2;
    static final int QUERY = 0;
    static final int QUESTION_OFFSET = 4;
    static final int RFS_ERR = 5;
    static final int SRV_ERR = 2;
    static final int WACK = 7;
    int additionalCount;
    InetAddress addr;
    NbtAddress[] addrEntry;
    int addrIndex;
    int answerCount;
    int authorityCount;
    boolean isAuthAnswer;
    boolean isBroadcast;
    boolean isRecurAvailable;
    boolean isRecurDesired;
    boolean isResponse;
    boolean isTruncated;
    int nameTrnId;
    int opCode;
    int questionClass;
    int questionCount;
    Name questionName;
    int questionType;
    int rDataLength;
    boolean received;
    int recordClass;
    Name recordName;
    int recordType;
    int resultCode;
    int ttl;
    
    NameServicePacket() {
        super();
        this.isRecurDesired = true;
        this.isBroadcast = true;
        this.questionCount = 1;
        this.questionClass = 1;
    }
    
    static int readInt2(final byte[] array, final int n) {
        return ((0xFF & array[n]) << 8) + (0xFF & array[n + 1]);
    }
    
    static int readInt4(final byte[] array, final int n) {
        return ((0xFF & array[n]) << 24) + ((0xFF & array[n + 1]) << 16) + ((0xFF & array[n + 2]) << 8) + (0xFF & array[n + 3]);
    }
    
    static int readNameTrnId(final byte[] array, final int n) {
        return readInt2(array, n);
    }
    
    static void writeInt2(final int n, final byte[] array, final int n2) {
        final int n3 = n2 + 1;
        array[n2] = (byte)(0xFF & n >> 8);
        array[n3] = (byte)(n & 0xFF);
    }
    
    static void writeInt4(final int n, final byte[] array, final int n2) {
        final int n3 = n2 + 1;
        array[n2] = (byte)(0xFF & n >> 24);
        final int n4 = n3 + 1;
        array[n3] = (byte)(0xFF & n >> 16);
        final int n5 = n4 + 1;
        array[n4] = (byte)(0xFF & n >> 8);
        array[n5] = (byte)(n & 0xFF);
    }
    
    abstract int readBodyWireFormat(final byte[] p0, final int p1);
    
    int readHeaderWireFormat(final byte[] array, final int n) {
        this.nameTrnId = readInt2(array, n);
        this.isResponse = ((0x80 & array[n + 2]) != 0x0);
        this.opCode = (0x78 & array[n + 2]) >> 3;
        this.isAuthAnswer = ((0x4 & array[n + 2]) != 0x0);
        this.isTruncated = ((0x2 & array[n + 2]) != 0x0);
        this.isRecurDesired = ((0x1 & array[n + 2]) != 0x0);
        this.isRecurAvailable = ((0x80 & array[1 + (n + 2)]) != 0x0);
        final byte b = 0x10 & array[1 + (n + 2)];
        boolean isBroadcast = false;
        if (b != 0) {
            isBroadcast = true;
        }
        this.isBroadcast = isBroadcast;
        this.resultCode = (0xF & array[1 + (n + 2)]);
        this.questionCount = readInt2(array, n + 4);
        this.answerCount = readInt2(array, n + 6);
        this.authorityCount = readInt2(array, n + 8);
        this.additionalCount = readInt2(array, n + 10);
        return 12;
    }
    
    int readQuestionSectionWireFormat(final byte[] array, final int n) {
        final int n2 = n + this.questionName.readWireFormat(array, n);
        this.questionType = readInt2(array, n2);
        final int n3 = n2 + 2;
        this.questionClass = readInt2(array, n3);
        return n3 + 2 - n;
    }
    
    abstract int readRDataWireFormat(final byte[] p0, final int p1);
    
    int readResourceRecordWireFormat(final byte[] array, final int n) {
        int n2;
        if ((0xC0 & array[n]) == 0xC0) {
            this.recordName = this.questionName;
            n2 = n + 2;
        }
        else {
            n2 = n + this.recordName.readWireFormat(array, n);
        }
        this.recordType = readInt2(array, n2);
        final int n3 = n2 + 2;
        this.recordClass = readInt2(array, n3);
        final int n4 = n3 + 2;
        this.ttl = readInt4(array, n4);
        final int n5 = n4 + 4;
        this.rDataLength = readInt2(array, n5);
        int i = n5 + 2;
        this.addrEntry = new NbtAddress[this.rDataLength / 6];
        final int n6 = i + this.rDataLength;
        this.addrIndex = 0;
        while (i < n6) {
            i += this.readRDataWireFormat(array, i);
            this.addrIndex += 1;
        }
        return i - n;
    }
    
    int readWireFormat(final byte[] array, final int n) {
        final int n2 = n + this.readHeaderWireFormat(array, n);
        return n2 + this.readBodyWireFormat(array, n2) - n;
    }
    
    public String toString() {
        String string = null;
        switch (this.opCode) {
            default: {
                string = Integer.toString(this.opCode);
                break;
            }
            case 0: {
                string = "QUERY";
                break;
            }
            case 7: {
                string = "WACK";
                break;
            }
        }
        switch (this.resultCode) {
            default: {
                new StringBuilder("0x").append(Hexdump.toHexString(this.resultCode, 1)).toString();
                break;
            }
            case 1: {
                break;
            }
            case 2: {
                break;
            }
            case 4: {
                break;
            }
            case 5: {
                break;
            }
            case 6: {
                break;
            }
            case 7: {
                break;
            }
        }
        String string2 = null;
        switch (this.questionType) {
            default: {
                string2 = "0x" + Hexdump.toHexString(this.questionType, 4);
                break;
            }
            case 32: {
                string2 = "NB";
                break;
            }
            case 33: {
                string2 = "NBSTAT";
                break;
            }
        }
        String string3 = null;
        switch (this.recordType) {
            default: {
                string3 = "0x" + Hexdump.toHexString(this.recordType, 4);
                break;
            }
            case 1: {
                string3 = "A";
                break;
            }
            case 2: {
                string3 = "NS";
                break;
            }
            case 10: {
                string3 = "NULL";
                break;
            }
            case 32: {
                string3 = "NB";
                break;
            }
            case 33: {
                string3 = "NBSTAT";
                break;
            }
        }
        final StringBuilder append = new StringBuilder("nameTrnId=").append(this.nameTrnId).append(",isResponse=").append(this.isResponse).append(",opCode=").append(string).append(",isAuthAnswer=").append(this.isAuthAnswer).append(",isTruncated=").append(this.isTruncated).append(",isRecurAvailable=").append(this.isRecurAvailable).append(",isRecurDesired=").append(this.isRecurDesired).append(",isBroadcast=").append(this.isBroadcast).append(",resultCode=").append(this.resultCode).append(",questionCount=").append(this.questionCount).append(",answerCount=").append(this.answerCount).append(",authorityCount=").append(this.authorityCount).append(",additionalCount=").append(this.additionalCount).append(",questionName=").append(this.questionName).append(",questionType=").append(string2).append(",questionClass=");
        String string4;
        if (this.questionClass == 1) {
            string4 = "IN";
        }
        else {
            string4 = "0x" + Hexdump.toHexString(this.questionClass, 4);
        }
        final StringBuilder append2 = append.append(string4).append(",recordName=").append(this.recordName).append(",recordType=").append(string3).append(",recordClass=");
        String string5;
        if (this.recordClass == 1) {
            string5 = "IN";
        }
        else {
            string5 = "0x" + Hexdump.toHexString(this.recordClass, 4);
        }
        return new String(append2.append(string5).append(",ttl=").append(this.ttl).append(",rDataLength=").append(this.rDataLength).toString());
    }
    
    abstract int writeBodyWireFormat(final byte[] p0, final int p1);
    
    int writeHeaderWireFormat(final byte[] array, final int n) {
        int n2 = 128;
        writeInt2(this.nameTrnId, array, n);
        final int n3 = n + 2;
        int n4;
        if (this.isResponse) {
            n4 = n2;
        }
        else {
            n4 = 0;
        }
        final int n5 = n4 + (0x78 & this.opCode << 3);
        int n6;
        if (this.isAuthAnswer) {
            n6 = 4;
        }
        else {
            n6 = 0;
        }
        final int n7 = n5 + n6;
        int n8;
        if (this.isTruncated) {
            n8 = 2;
        }
        else {
            n8 = 0;
        }
        final int n9 = n7 + n8;
        int n10;
        if (this.isRecurDesired) {
            n10 = 1;
        }
        else {
            n10 = 0;
        }
        array[n3] = (byte)(n10 + n9);
        final int n11 = 1 + (n + 2);
        if (!this.isRecurAvailable) {
            n2 = 0;
        }
        final boolean isBroadcast = this.isBroadcast;
        int n12 = 0;
        if (isBroadcast) {
            n12 = 16;
        }
        array[n11] = (byte)(n2 + n12 + (0xF & this.resultCode));
        writeInt2(this.questionCount, array, n + 4);
        writeInt2(this.answerCount, array, n + 6);
        writeInt2(this.authorityCount, array, n + 8);
        writeInt2(this.additionalCount, array, n + 10);
        return 12;
    }
    
    int writeQuestionSectionWireFormat(final byte[] array, final int n) {
        final int n2 = n + this.questionName.writeWireFormat(array, n);
        writeInt2(this.questionType, array, n2);
        final int n3 = n2 + 2;
        writeInt2(this.questionClass, array, n3);
        return n3 + 2 - n;
    }
    
    abstract int writeRDataWireFormat(final byte[] p0, final int p1);
    
    int writeResourceRecordWireFormat(final byte[] array, final int n) {
        int n3;
        if (this.recordName == this.questionName) {
            final int n2 = n + 1;
            array[n] = -64;
            n3 = n2 + 1;
            array[n2] = 12;
        }
        else {
            n3 = n + this.recordName.writeWireFormat(array, n);
        }
        writeInt2(this.recordType, array, n3);
        final int n4 = n3 + 2;
        writeInt2(this.recordClass, array, n4);
        final int n5 = n4 + 2;
        writeInt4(this.ttl, array, n5);
        final int n6 = n5 + 4;
        writeInt2(this.rDataLength = this.writeRDataWireFormat(array, n6 + 2), array, n6);
        return n6 + (2 + this.rDataLength) - n;
    }
    
    int writeWireFormat(final byte[] array, final int n) {
        final int n2 = n + this.writeHeaderWireFormat(array, n);
        return n2 + this.writeBodyWireFormat(array, n2) - n;
    }
}
