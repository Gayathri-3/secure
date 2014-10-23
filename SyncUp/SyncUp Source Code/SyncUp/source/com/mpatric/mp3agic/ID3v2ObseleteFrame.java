package com.mpatric.mp3agic;

public class ID3v2ObseleteFrame extends ID3v2Frame
{
    protected static final int DATA_LENGTH_OFFSET = 3;
    private static final int HEADER_LENGTH = 6;
    private static final int ID_LENGTH = 3;
    private static final int ID_OFFSET;
    
    public ID3v2ObseleteFrame(final String s, final byte[] array) {
        super(s, array);
    }
    
    public ID3v2ObseleteFrame(final byte[] array, final int n) throws InvalidDataException {
        super(array, n);
    }
    
    public int getLength() {
        return 6 + this.dataLength;
    }
    
    public void packFrame(final byte[] array, final int n) throws NotSupportedException {
        throw new NotSupportedException("Packing Obselete frames is not supported");
    }
    
    protected void unpackDataLength(final byte[] array, final int n) {
        this.dataLength = BufferTools.unpackInteger(0, array[n + 3], array[1 + (n + 3)], array[2 + (n + 3)]);
    }
    
    protected int unpackHeader(final byte[] array, final int n) {
        this.id = BufferTools.byteBufferToString(array, n + 0, 3);
        this.unpackDataLength(array, n);
        return n + 6;
    }
}
