package jcifs.smb;

import jcifs.util.*;

abstract class SmbComNtTransactionResponse extends SmbComTransactionResponse
{
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = 0;
        final int n3 = n2 + 1;
        array[n2] = 0;
        final int n4 = n3 + 1;
        array[n3] = 0;
        this.totalParameterCount = ServerMessageBlock.readInt4(array, n4);
        if (this.bufDataStart == 0) {
            this.bufDataStart = this.totalParameterCount;
        }
        final int n5 = n4 + 4;
        this.totalDataCount = ServerMessageBlock.readInt4(array, n5);
        final int n6 = n5 + 4;
        this.parameterCount = ServerMessageBlock.readInt4(array, n6);
        final int n7 = n6 + 4;
        this.parameterOffset = ServerMessageBlock.readInt4(array, n7);
        final int n8 = n7 + 4;
        this.parameterDisplacement = ServerMessageBlock.readInt4(array, n8);
        final int n9 = n8 + 4;
        this.dataCount = ServerMessageBlock.readInt4(array, n9);
        final int n10 = n9 + 4;
        this.dataOffset = ServerMessageBlock.readInt4(array, n10);
        final int n11 = n10 + 4;
        this.dataDisplacement = ServerMessageBlock.readInt4(array, n11);
        final int n12 = n11 + 4;
        this.setupCount = (0xFF & array[n12]);
        final int n13 = n12 + 2;
        if (this.setupCount != 0) {
            final LogStream log = SmbComNtTransactionResponse.log;
            if (LogStream.level >= 3) {
                SmbComNtTransactionResponse.log.println("setupCount is not zero: " + this.setupCount);
            }
        }
        return n13 - n;
    }
}
