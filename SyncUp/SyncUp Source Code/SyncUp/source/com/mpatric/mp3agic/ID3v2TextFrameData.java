package com.mpatric.mp3agic;

public class ID3v2TextFrameData extends AbstractID3v2FrameData
{
    protected EncodedText text;
    
    public ID3v2TextFrameData(final boolean b) {
        super(b);
    }
    
    public ID3v2TextFrameData(final boolean b, final EncodedText text) {
        super(b);
        this.text = text;
    }
    
    public ID3v2TextFrameData(final boolean b, final byte[] array) throws InvalidDataException {
        super(b);
        this.synchroniseAndUnpackFrameData(array);
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof ID3v2TextFrameData;
        boolean b2 = false;
        if (b) {
            final boolean equals = super.equals(o);
            b2 = false;
            if (equals) {
                final ID3v2TextFrameData id3v2TextFrameData = (ID3v2TextFrameData)o;
                if (this.text == null) {
                    final EncodedText text = id3v2TextFrameData.text;
                    b2 = false;
                    if (text != null) {
                        return b2;
                    }
                }
                else {
                    final EncodedText text2 = id3v2TextFrameData.text;
                    b2 = false;
                    if (text2 == null) {
                        return b2;
                    }
                    if (!this.text.equals(id3v2TextFrameData.text)) {
                        b2 = false;
                        return b2;
                    }
                }
                b2 = true;
            }
        }
        return b2;
    }
    
    protected int getLength() {
        int n = 1;
        if (this.text != null) {
            n += this.text.toBytes().length;
        }
        return n;
    }
    
    public EncodedText getText() {
        return this.text;
    }
    
    protected byte[] packFrameData() {
        final byte[] array = new byte[this.getLength()];
        if (this.text != null) {
            array[0] = this.text.getTextEncoding();
        }
        else {
            array[0] = 0;
        }
        if (this.text != null && this.text.toBytes().length > 0) {
            BufferTools.copyIntoByteBuffer(this.text.toBytes(), 0, this.text.toBytes().length, array, 1);
        }
        return array;
    }
    
    public void setText(final EncodedText text) {
        this.text = text;
    }
    
    protected void unpackFrameData(final byte[] array) throws InvalidDataException {
        this.text = new EncodedText(array[0], BufferTools.copyBuffer(array, 1, -1 + array.length));
    }
}
