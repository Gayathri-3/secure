package com.mpatric.mp3agic;

import java.util.*;

public class ID3v2PictureFrameData extends AbstractID3v2FrameData
{
    protected EncodedText description;
    protected byte[] imageData;
    protected String mimeType;
    protected byte pictureType;
    
    public ID3v2PictureFrameData(final boolean b) {
        super(b);
    }
    
    public ID3v2PictureFrameData(final boolean b, final String mimeType, final byte pictureType, final EncodedText description, final byte[] imageData) {
        super(b);
        this.mimeType = mimeType;
        this.pictureType = pictureType;
        this.description = description;
        this.imageData = imageData;
    }
    
    public ID3v2PictureFrameData(final boolean b, final byte[] array) throws InvalidDataException {
        super(b);
        this.synchroniseAndUnpackFrameData(array);
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof ID3v2PictureFrameData;
        boolean b2 = false;
        if (b) {
            final boolean equals = super.equals(o);
            b2 = false;
            if (equals) {
                final ID3v2PictureFrameData id3v2PictureFrameData = (ID3v2PictureFrameData)o;
                final byte pictureType = this.pictureType;
                final byte pictureType2 = id3v2PictureFrameData.pictureType;
                b2 = false;
                if (pictureType == pictureType2) {
                    if (this.mimeType == null) {
                        final String mimeType = id3v2PictureFrameData.mimeType;
                        b2 = false;
                        if (mimeType != null) {
                            return b2;
                        }
                    }
                    else {
                        final String mimeType2 = id3v2PictureFrameData.mimeType;
                        b2 = false;
                        if (mimeType2 == null) {
                            return b2;
                        }
                        if (!this.mimeType.equals(id3v2PictureFrameData.mimeType)) {
                            b2 = false;
                            return b2;
                        }
                    }
                    if (this.description == null) {
                        final EncodedText description = id3v2PictureFrameData.description;
                        b2 = false;
                        if (description != null) {
                            return b2;
                        }
                    }
                    else {
                        final EncodedText description2 = id3v2PictureFrameData.description;
                        b2 = false;
                        if (description2 == null) {
                            return b2;
                        }
                        if (!this.description.equals(id3v2PictureFrameData.description)) {
                            b2 = false;
                            return b2;
                        }
                    }
                    if (this.imageData == null) {
                        final byte[] imageData = id3v2PictureFrameData.imageData;
                        b2 = false;
                        if (imageData != null) {
                            return b2;
                        }
                    }
                    else {
                        final byte[] imageData2 = id3v2PictureFrameData.imageData;
                        b2 = false;
                        if (imageData2 == null) {
                            return b2;
                        }
                        if (!Arrays.equals(this.imageData, id3v2PictureFrameData.imageData)) {
                            b2 = false;
                            return b2;
                        }
                    }
                    b2 = true;
                }
            }
        }
        return b2;
    }
    
    public EncodedText getDescription() {
        return this.description;
    }
    
    public byte[] getImageData() {
        return this.imageData;
    }
    
    protected int getLength() {
        int n = 4;
        if (this.mimeType != null) {
            n += this.mimeType.length();
        }
        if (this.description != null) {
            n += this.description.toBytes().length;
        }
        if (this.imageData != null) {
            n += this.imageData.length;
        }
        return n;
    }
    
    public String getMimeType() {
        return this.mimeType;
    }
    
    public byte getPictureType() {
        return this.pictureType;
    }
    
    protected byte[] packFrameData() {
        final byte[] array = new byte[this.getLength()];
        if (this.description != null) {
            array[0] = this.description.getTextEncoding();
        }
        else {
            array[0] = 0;
        }
        final String mimeType = this.mimeType;
        int length = 0;
        if (mimeType != null) {
            final int length2 = this.mimeType.length();
            length = 0;
            if (length2 > 0) {
                length = this.mimeType.length();
                BufferTools.stringIntoByteBuffer(this.mimeType, 0, length, array, 1);
            }
        }
        array[length + 1] = 0;
        array[length + 2] = this.pictureType;
        final EncodedText description = this.description;
        int length3 = 0;
        if (description != null) {
            final int length4 = this.description.toBytes().length;
            length3 = 0;
            if (length4 > 0) {
                length3 = this.description.toBytes().length;
                BufferTools.copyIntoByteBuffer(this.description.toBytes(), 0, length3, array, length + 3);
            }
        }
        array[3 + (length + length3)] = 0;
        if (this.imageData != null && this.imageData.length > 0) {
            BufferTools.copyIntoByteBuffer(this.imageData, 0, this.imageData.length, array, 4 + (length + length3));
        }
        return array;
    }
    
    public void setDescription(final EncodedText description) {
        this.description = description;
    }
    
    public void setImageData(final byte[] imageData) {
        this.imageData = imageData;
    }
    
    public void setMimeType(final String mimeType) {
        this.mimeType = mimeType;
    }
    
    public void setPictureType(final byte pictureType) {
        this.pictureType = pictureType;
    }
    
    protected void unpackFrameData(final byte[] array) throws InvalidDataException {
        int n;
        for (n = 1; n < array.length && array[n] != 0; ++n) {}
        this.mimeType = BufferTools.byteBufferToString(array, 1, n - 1);
        this.pictureType = array[n + 1];
        int n3;
        int n2;
        for (n2 = (n3 = n + 2); n3 < array.length && array[n3] != 0; ++n3) {}
        this.description = new EncodedText(array[0], BufferTools.copyBuffer(array, n2, n3 - n2));
        this.imageData = BufferTools.copyBuffer(array, n3 + 1, -1 + (array.length - n3));
    }
}
