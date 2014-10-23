package jcifs.smb;

class Trans2GetDfsReferral extends SmbComTransaction
{
    private int maxReferralLevel;
    
    Trans2GetDfsReferral(final String path) {
        super();
        this.maxReferralLevel = 3;
        this.path = path;
        this.command = 50;
        this.subCommand = 16;
        this.totalDataCount = 0;
        this.maxParameterCount = 0;
        this.maxDataCount = 4096;
        this.maxSetupCount = 0;
    }
    
    int readDataWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readParametersWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    public String toString() {
        return new String("Trans2GetDfsReferral[" + super.toString() + ",maxReferralLevel=0x" + this.maxReferralLevel + ",filename=" + this.path + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.maxReferralLevel, array, n);
        final int n2 = n + 2;
        return n2 + this.writeString(this.path, array, n2) - n;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = this.subCommand;
        array[n2] = 0;
        return 2;
    }
}
