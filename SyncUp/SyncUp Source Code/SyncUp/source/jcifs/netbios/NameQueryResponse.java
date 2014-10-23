package jcifs.netbios;

class NameQueryResponse extends NameServicePacket
{
    NameQueryResponse() {
        super();
        this.recordName = new Name();
    }
    
    int readBodyWireFormat(final byte[] array, final int n) {
        return this.readResourceRecordWireFormat(array, n);
    }
    
    int readRDataWireFormat(final byte[] array, final int n) {
        final int resultCode = this.resultCode;
        int n2 = 0;
        if (resultCode == 0) {
            final int opCode = this.opCode;
            n2 = 0;
            if (opCode == 0) {
                final int n3 = 0x80 & array[n];
                boolean b = false;
                if (n3 == 128) {
                    b = true;
                }
                final int n4 = (0x60 & array[n]) >> 5;
                final int int4 = NameServicePacket.readInt4(array, n + 2);
                if (int4 != 0) {
                    this.addrEntry[this.addrIndex] = new NbtAddress(this.recordName, int4, b, n4);
                }
                else {
                    this.addrEntry[this.addrIndex] = null;
                }
                n2 = 6;
            }
        }
        return n2;
    }
    
    public String toString() {
        return new String("NameQueryResponse[" + super.toString() + ",addrEntry=" + this.addrEntry + "]");
    }
    
    int writeBodyWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeRDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
