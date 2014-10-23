package com.mpatric.mp3agic;

public class ID3v2ObseletePictureFrameData extends ID3v2PictureFrameData
{
    public ID3v2ObseletePictureFrameData(final boolean b) {
        super(b);
    }
    
    public ID3v2ObseletePictureFrameData(final boolean b, final String s, final byte b2, final EncodedText encodedText, final byte[] array) {
        super(b, s, b2, encodedText, array);
    }
    
    public ID3v2ObseletePictureFrameData(final boolean b, final byte[] array) throws InvalidDataException {
        super(b, array);
    }
    
    protected void unpackFrameData(final byte[] array) throws InvalidDataException {
        this.mimeType = "image/" + BufferTools.byteBufferToString(array, 1, 3).toLowerCase();
        this.pictureType = array[4];
        int n;
        for (n = 5; n < array.length && array[n] != 0; ++n) {}
        this.description = new EncodedText(array[0], BufferTools.copyBuffer(array, 5, n - 5));
        this.imageData = BufferTools.copyBuffer(array, n + 1, -1 + (array.length - n));
    }
}
