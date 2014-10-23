package com.mpatric.mp3agic;

public class ID3v24Tag extends AbstractID3v2Tag
{
    public static final String VERSION = "4.0";
    
    public ID3v24Tag() {
        super();
        this.version = "4.0";
    }
    
    public ID3v24Tag(final byte[] array) throws NoSuchTagException, UnsupportedTagException, InvalidDataException {
        super(array);
    }
    
    protected ID3v2Frame createFrame(final String s, final byte[] array) {
        return new ID3v24Frame(s, array);
    }
    
    protected ID3v2Frame createFrame(final byte[] array, final int n) throws InvalidDataException {
        return new ID3v24Frame(array, n);
    }
    
    protected void packFlags(final byte[] array, final int n) {
        array[n + 5] = BufferTools.setBit(array[n + 5], 7, this.unsynchronisation);
        array[n + 5] = BufferTools.setBit(array[n + 5], 6, this.extendedHeader);
        array[n + 5] = BufferTools.setBit(array[n + 5], 5, this.experimental);
        array[n + 5] = BufferTools.setBit(array[n + 5], 4, this.footer);
    }
    
    protected void unpackFlags(final byte[] array) {
        this.unsynchronisation = BufferTools.checkBit(array[5], 7);
        this.extendedHeader = BufferTools.checkBit(array[5], 6);
        this.experimental = BufferTools.checkBit(array[5], 5);
        this.footer = BufferTools.checkBit(array[5], 4);
    }
    
    protected boolean useFrameUnsynchronisation() {
        return this.unsynchronisation;
    }
}
