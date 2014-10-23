package com.mpatric.mp3agic;

public class ID3v2UrlFrameData extends AbstractID3v2FrameData
{
    protected EncodedText description;
    protected String url;
    
    public ID3v2UrlFrameData(final boolean b) {
        super(b);
    }
    
    public ID3v2UrlFrameData(final boolean b, final EncodedText description, final String url) {
        super(b);
        this.description = description;
        this.url = url;
    }
    
    public ID3v2UrlFrameData(final boolean b, final byte[] array) throws InvalidDataException {
        super(b);
        this.synchroniseAndUnpackFrameData(array);
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof ID3v2UrlFrameData;
        boolean b2 = false;
        if (b) {
            final boolean equals = super.equals(o);
            b2 = false;
            if (equals) {
                final ID3v2UrlFrameData id3v2UrlFrameData = (ID3v2UrlFrameData)o;
                if (this.url == null) {
                    final String url = id3v2UrlFrameData.url;
                    b2 = false;
                    if (url != null) {
                        return b2;
                    }
                }
                else {
                    final String url2 = id3v2UrlFrameData.url;
                    b2 = false;
                    if (url2 == null) {
                        return b2;
                    }
                    if (!this.url.equals(id3v2UrlFrameData.url)) {
                        b2 = false;
                        return b2;
                    }
                }
                if (this.description == null) {
                    final EncodedText description = id3v2UrlFrameData.description;
                    b2 = false;
                    if (description != null) {
                        return b2;
                    }
                }
                else {
                    final EncodedText description2 = id3v2UrlFrameData.description;
                    b2 = false;
                    if (description2 == null) {
                        return b2;
                    }
                    if (!this.description.equals(id3v2UrlFrameData.description)) {
                        b2 = false;
                        return b2;
                    }
                }
                b2 = true;
            }
        }
        return b2;
    }
    
    public EncodedText getDescription() {
        return this.description;
    }
    
    protected int getLength() {
        int n = 2;
        if (this.description != null) {
            n += this.description.toBytes().length;
        }
        if (this.url != null) {
            n += this.url.length();
        }
        return n;
    }
    
    public String getUrl() {
        return this.url;
    }
    
    protected byte[] packFrameData() {
        final byte[] array = new byte[this.getLength()];
        if (this.description != null) {
            array[0] = this.description.getTextEncoding();
        }
        else {
            array[0] = 0;
        }
        final EncodedText description = this.description;
        int length = 0;
        if (description != null) {
            final int length2 = this.description.toBytes().length;
            length = 0;
            if (length2 > 0) {
                length = this.description.toBytes().length;
                BufferTools.copyIntoByteBuffer(this.description.toBytes(), 0, length, array, 1);
            }
        }
        array[length + 1] = 0;
        if (this.url != null && this.url.length() > 0) {
            BufferTools.stringIntoByteBuffer(this.url, 0, this.url.length(), array, length + 2);
        }
        return array;
    }
    
    public void setDescription(final EncodedText description) {
        this.description = description;
    }
    
    public void setUrl(final String url) {
        this.url = url;
    }
    
    protected void unpackFrameData(final byte[] array) throws InvalidDataException {
        int n;
        for (n = 1; n < array.length && array[n] != 0; ++n) {}
        this.description = new EncodedText(array[0], BufferTools.copyBuffer(array, 1, n - 1));
        int n2 = 0;
        for (int n3 = n + 1; n3 < array.length && array[n3] != 0; ++n3) {
            ++n2;
        }
        this.url = BufferTools.byteBufferToString(array, n + 1, n2);
    }
}
