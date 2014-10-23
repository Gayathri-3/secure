package jcifs.smb;

class Trans2GetDfsReferralResponse extends SmbComTransactionResponse
{
    int flags;
    int numReferrals;
    int pathConsumed;
    Referral[] referrals;
    
    Trans2GetDfsReferralResponse() {
        super();
        this.subCommand = 16;
    }
    
    int readDataWireFormat(final byte[] array, final int n, final int n2) {
        this.pathConsumed = ServerMessageBlock.readInt2(array, n);
        final int n3 = n + 2;
        if ((0x8000 & this.flags2) != 0x0) {
            this.pathConsumed /= 2;
        }
        this.numReferrals = ServerMessageBlock.readInt2(array, n3);
        final int n4 = n3 + 2;
        this.flags = ServerMessageBlock.readInt2(array, n4);
        int n5 = n4 + 4;
        this.referrals = new Referral[this.numReferrals];
        for (int i = 0; i < this.numReferrals; ++i) {
            this.referrals[i] = new Referral();
            n5 += this.referrals[i].readWireFormat(array, n5, n2);
        }
        return n5 - n;
    }
    
    int readParametersWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    public String toString() {
        return new String("Trans2GetDfsReferralResponse[" + super.toString() + ",pathConsumed=" + this.pathConsumed + ",numReferrals=" + this.numReferrals + ",flags=" + this.flags + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    class Referral
    {
        private String altPath;
        private int altPathOffset;
        private int flags;
        String node;
        private int nodeOffset;
        String path;
        private int pathOffset;
        private int proximity;
        private int serverType;
        private int size;
        int ttl;
        private int version;
        
        Referral() {
            super();
            this.path = null;
            this.node = null;
        }
        
        int readWireFormat(final byte[] array, final int n, final int n2) {
            boolean b = true;
            this.version = ServerMessageBlock.readInt2(array, n);
            if (this.version != 3 && this.version != b) {
                throw new RuntimeException("Version " + this.version + " referral not supported. Please report this to jcifs at samba dot org.");
            }
            final int n3 = n + 2;
            this.size = ServerMessageBlock.readInt2(array, n3);
            final int n4 = n3 + 2;
            this.serverType = ServerMessageBlock.readInt2(array, n4);
            final int n5 = n4 + 2;
            this.flags = ServerMessageBlock.readInt2(array, n5);
            final int n6 = n5 + 2;
            if (this.version == 3) {
                this.proximity = ServerMessageBlock.readInt2(array, n6);
                final int n7 = n6 + 2;
                this.ttl = ServerMessageBlock.readInt2(array, n7);
                final int n8 = n7 + 2;
                this.pathOffset = ServerMessageBlock.readInt2(array, n8);
                final int n9 = n8 + 2;
                this.altPathOffset = ServerMessageBlock.readInt2(array, n9);
                this.nodeOffset = ServerMessageBlock.readInt2(array, n9 + 2);
                this.path = Trans2GetDfsReferralResponse.this.readString(array, n + this.pathOffset, n2, (0x8000 & Trans2GetDfsReferralResponse.this.flags2) != 0x0 && b);
                if (this.nodeOffset > 0) {
                    final Trans2GetDfsReferralResponse this$0 = Trans2GetDfsReferralResponse.this;
                    final int n10 = n + this.nodeOffset;
                    if ((0x8000 & Trans2GetDfsReferralResponse.this.flags2) == 0x0) {
                        b = false;
                    }
                    this.node = this$0.readString(array, n10, n2, b);
                }
            }
            else if (this.version == b) {
                final Trans2GetDfsReferralResponse this$ = Trans2GetDfsReferralResponse.this;
                if ((0x8000 & Trans2GetDfsReferralResponse.this.flags2) == 0x0) {
                    b = false;
                }
                this.node = this$.readString(array, n6, n2, b);
            }
            return this.size;
        }
        
        public String toString() {
            return new String("Referral[version=" + this.version + ",size=" + this.size + ",serverType=" + this.serverType + ",flags=" + this.flags + ",proximity=" + this.proximity + ",ttl=" + this.ttl + ",pathOffset=" + this.pathOffset + ",altPathOffset=" + this.altPathOffset + ",nodeOffset=" + this.nodeOffset + ",path=" + this.path + ",altPath=" + this.altPath + ",node=" + this.node + "]");
        }
    }
}
