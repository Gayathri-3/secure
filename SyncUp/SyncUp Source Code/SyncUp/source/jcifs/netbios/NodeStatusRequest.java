package jcifs.netbios;

class NodeStatusRequest extends NameServicePacket
{
    NodeStatusRequest(final Name questionName) {
        super();
        this.questionName = questionName;
        this.questionType = 33;
        this.isRecurDesired = false;
        this.isBroadcast = false;
    }
    
    int readBodyWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int readRDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    public String toString() {
        return new String("NodeStatusRequest[" + super.toString() + "]");
    }
    
    int writeBodyWireFormat(final byte[] array, final int n) {
        final int hexCode = this.questionName.hexCode;
        this.questionName.hexCode = 0;
        final int writeQuestionSectionWireFormat = this.writeQuestionSectionWireFormat(array, n);
        this.questionName.hexCode = hexCode;
        return writeQuestionSectionWireFormat;
    }
    
    int writeRDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
