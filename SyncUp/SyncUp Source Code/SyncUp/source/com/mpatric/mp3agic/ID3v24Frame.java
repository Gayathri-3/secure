package com.mpatric.mp3agic;

public class ID3v24Frame extends ID3v2Frame
{
    public ID3v24Frame(final String s, final byte[] array) {
        super(s, array);
    }
    
    public ID3v24Frame(final byte[] array, final int n) throws InvalidDataException {
        super(array, n);
    }
    
    public boolean equals(final Object o) {
        return o instanceof ID3v24Frame && super.equals(o);
    }
    
    protected byte[] packDataLength() {
        return BufferTools.packSynchsafeInteger(this.dataLength);
    }
    
    protected void unpackDataLength(final byte[] array, final int n) {
        this.dataLength = BufferTools.unpackSynchsafeInteger(array[n + 4], array[1 + (n + 4)], array[2 + (n + 4)], array[3 + (n + 4)]);
    }
}
