package jcifs.netbios;

class NameQueryRequest extends NameServicePacket
{
    NameQueryRequest(final Name questionName) {
        super();
        this.questionName = questionName;
        this.questionType = 32;
    }
    
    int readBodyWireFormat(final byte[] array, final int n) {
        return this.readQuestionSectionWireFormat(array, n);
    }
    
    int readRDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("NameQueryRequest[" + super.toString() + "]");
    }
    
    int writeBodyWireFormat(final byte[] array, final int n) {
        return this.writeQuestionSectionWireFormat(array, n);
    }
    
    int writeRDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
