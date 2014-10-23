package com.mpatric.mp3agic;

public class ID3v2CommentFrameData extends AbstractID3v2FrameData
{
    private static final String DEFAULT_LANGUAGE = "eng";
    private EncodedText comment;
    private EncodedText description;
    private String language;
    
    public ID3v2CommentFrameData(final boolean b) {
        super(b);
    }
    
    public ID3v2CommentFrameData(final boolean b, final String language, final EncodedText description, final EncodedText comment) {
        super(b);
        this.language = language;
        this.description = description;
        this.comment = comment;
    }
    
    public ID3v2CommentFrameData(final boolean b, final byte[] array) throws InvalidDataException {
        super(b);
        this.synchroniseAndUnpackFrameData(array);
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof ID3v2CommentFrameData;
        boolean b2 = false;
        if (b) {
            final boolean equals = super.equals(o);
            b2 = false;
            if (equals) {
                final ID3v2CommentFrameData id3v2CommentFrameData = (ID3v2CommentFrameData)o;
                if (this.language == null) {
                    final String language = id3v2CommentFrameData.language;
                    b2 = false;
                    if (language != null) {
                        return b2;
                    }
                }
                else {
                    final String language2 = id3v2CommentFrameData.language;
                    b2 = false;
                    if (language2 == null) {
                        return b2;
                    }
                    if (!this.language.equals(id3v2CommentFrameData.language)) {
                        b2 = false;
                        return b2;
                    }
                }
                if (this.description == null) {
                    final EncodedText description = id3v2CommentFrameData.description;
                    b2 = false;
                    if (description != null) {
                        return b2;
                    }
                }
                else {
                    final EncodedText description2 = id3v2CommentFrameData.description;
                    b2 = false;
                    if (description2 == null) {
                        return b2;
                    }
                    if (!this.description.equals(id3v2CommentFrameData.description)) {
                        b2 = false;
                        return b2;
                    }
                }
                if (this.comment == null) {
                    final EncodedText comment = id3v2CommentFrameData.comment;
                    b2 = false;
                    if (comment != null) {
                        return b2;
                    }
                }
                else {
                    final EncodedText comment2 = id3v2CommentFrameData.comment;
                    b2 = false;
                    if (comment2 == null) {
                        return b2;
                    }
                    if (!this.comment.equals(id3v2CommentFrameData.comment)) {
                        b2 = false;
                        return b2;
                    }
                }
                b2 = true;
            }
        }
        return b2;
    }
    
    public EncodedText getComment() {
        return this.comment;
    }
    
    public EncodedText getDescription() {
        return this.description;
    }
    
    public String getLanguage() {
        return this.language;
    }
    
    protected int getLength() {
        int n = 5;
        if (this.description != null) {
            n += this.description.toBytes().length;
        }
        if (this.comment != null) {
            n += this.comment.toBytes().length;
        }
        return n;
    }
    
    protected byte[] packFrameData() {
        final byte[] array = new byte[this.getLength()];
        if (this.comment != null) {
            array[0] = this.comment.getTextEncoding();
        }
        else {
            array[0] = 0;
        }
        String s;
        if (this.language == null) {
            s = "eng";
        }
        else if (this.language.length() > 3) {
            s = this.language.substring(0, 3);
        }
        else {
            s = BufferTools.padStringRight(this.language, 3, ' ');
        }
        BufferTools.stringIntoByteBuffer(s, 0, 3, array, 1);
        final EncodedText description = this.description;
        int length = 0;
        if (description != null) {
            final int length2 = this.description.toBytes().length;
            length = 0;
            if (length2 > 0) {
                length = this.description.toBytes().length;
                BufferTools.copyIntoByteBuffer(this.description.toBytes(), 0, length, array, 4);
            }
        }
        array[length + 4] = 0;
        if (this.comment != null && this.comment.toBytes().length > 0) {
            BufferTools.copyIntoByteBuffer(this.comment.toBytes(), 0, this.comment.toBytes().length, array, length + 5);
        }
        return array;
    }
    
    public void setComment(final EncodedText comment) {
        this.comment = comment;
    }
    
    public void setDescription(final EncodedText description) {
        this.description = description;
    }
    
    public void setLanguage(final String language) {
        this.language = language;
    }
    
    protected void unpackFrameData(final byte[] array) throws InvalidDataException {
        this.language = BufferTools.byteBufferToString(array, 1, 3);
        int n;
        for (n = 4; n < array.length && array[n] != 0; ++n) {}
        this.description = new EncodedText(array[0], BufferTools.copyBuffer(array, 4, n - 4));
        int n2 = 0;
        for (int n3 = n + 1; n3 < array.length && array[n3] != 0; ++n3) {
            ++n2;
        }
        this.comment = new EncodedText(array[0], BufferTools.copyBuffer(array, n + 1, n2));
    }
}
