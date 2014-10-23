package jcifs.smb;

abstract class SmbComNtTransaction extends SmbComTransaction
{
    private static final int NTT_PRIMARY_SETUP_OFFSET = 69;
    private static final int NTT_SECONDARY_PARAMETER_OFFSET = 51;
    static final int NT_TRANSACT_QUERY_SECURITY_DESC = 6;
    int function;
    
    SmbComNtTransaction() {
        super();
        this.primarySetupOffset = 69;
        this.secondaryParameterOffset = 51;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        int n3;
        if (this.command != -95) {
            final int n2 = n + 1;
            array[n] = this.maxSetupCount;
            n3 = n2;
        }
        else {
            final int n4 = n + 1;
            array[n] = 0;
            n3 = n4;
        }
        final int n5 = n3 + 1;
        array[n3] = 0;
        final int n6 = n5 + 1;
        array[n5] = 0;
        ServerMessageBlock.writeInt4(this.totalParameterCount, array, n6);
        final int n7 = n6 + 4;
        ServerMessageBlock.writeInt4(this.totalDataCount, array, n7);
        int n8 = n7 + 4;
        if (this.command != -95) {
            ServerMessageBlock.writeInt4(this.maxParameterCount, array, n8);
            final int n9 = n8 + 4;
            ServerMessageBlock.writeInt4(this.maxDataCount, array, n9);
            n8 = n9 + 4;
        }
        ServerMessageBlock.writeInt4(this.parameterCount, array, n8);
        final int n10 = n8 + 4;
        int parameterOffset;
        if (this.parameterCount == 0) {
            parameterOffset = 0;
        }
        else {
            parameterOffset = this.parameterOffset;
        }
        ServerMessageBlock.writeInt4(parameterOffset, array, n10);
        int n11 = n10 + 4;
        if (this.command == -95) {
            ServerMessageBlock.writeInt4(this.parameterDisplacement, array, n11);
            n11 += 4;
        }
        ServerMessageBlock.writeInt4(this.dataCount, array, n11);
        final int n12 = n11 + 4;
        int dataOffset;
        if (this.dataCount == 0) {
            dataOffset = 0;
        }
        else {
            dataOffset = this.dataOffset;
        }
        ServerMessageBlock.writeInt4(dataOffset, array, n12);
        final int n13 = n12 + 4;
        int n16;
        if (this.command == -95) {
            ServerMessageBlock.writeInt4(this.dataDisplacement, array, n13);
            final int n14 = n13 + 4;
            final int n15 = n14 + 1;
            array[n14] = 0;
            n16 = n15;
        }
        else {
            final int n17 = n13 + 1;
            array[n13] = (byte)this.setupCount;
            ServerMessageBlock.writeInt2(this.function, array, n17);
            final int n18 = n17 + 2;
            n16 = n18 + this.writeSetupWireFormat(array, n18);
        }
        return n16 - n;
    }
}
