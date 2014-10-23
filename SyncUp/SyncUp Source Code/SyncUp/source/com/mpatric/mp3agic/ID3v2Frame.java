package com.mpatric.mp3agic;

import java.util.*;

public class ID3v2Frame
{
    private static final int COMPRESSION_BIT = 3;
    private static final int DATA_LENGTH_INDICATOR_BIT = 0;
    protected static final int DATA_LENGTH_OFFSET = 4;
    private static final int ENCRYPTION_BIT = 2;
    private static final int FLAGS1_OFFSET = 8;
    private static final int FLAGS2_OFFSET = 9;
    private static final int GROUP_BIT = 6;
    private static final int HEADER_LENGTH = 10;
    private static final int ID_LENGTH = 4;
    private static final int ID_OFFSET = 0;
    private static final int PRESERVE_FILE_BIT = 5;
    private static final int PRESERVE_TAG_BIT = 6;
    private static final int READ_ONLY_BIT = 4;
    private static final int UNSYNCHRONISATION_BIT = 1;
    private boolean compression;
    protected byte[] data;
    protected int dataLength;
    private boolean dataLengthIndicator;
    private boolean encryption;
    private boolean group;
    protected String id;
    private boolean preserveFile;
    private boolean preserveTag;
    private boolean readOnly;
    private boolean unsynchronisation;
    
    public ID3v2Frame(final String id, final byte[] data) {
        super();
        this.dataLength = 0;
        this.data = null;
        this.preserveTag = false;
        this.preserveFile = false;
        this.readOnly = false;
        this.group = false;
        this.compression = false;
        this.encryption = false;
        this.unsynchronisation = false;
        this.dataLengthIndicator = false;
        this.id = id;
        this.data = data;
        this.dataLength = data.length;
    }
    
    public ID3v2Frame(final byte[] array, final int n) throws InvalidDataException {
        super();
        this.dataLength = 0;
        this.data = null;
        this.preserveTag = false;
        this.preserveFile = false;
        this.readOnly = false;
        this.group = false;
        this.compression = false;
        this.encryption = false;
        this.unsynchronisation = false;
        this.dataLengthIndicator = false;
        this.unpackFrame(array, n);
    }
    
    private byte[] packFlags() {
        final byte[] array = new byte[2];
        array[0] = BufferTools.setBit(array[0], 6, this.preserveTag);
        array[0] = BufferTools.setBit(array[0], 5, this.preserveFile);
        array[0] = BufferTools.setBit(array[0], 4, this.readOnly);
        array[1] = BufferTools.setBit(array[1], 6, this.group);
        array[1] = BufferTools.setBit(array[1], 3, this.compression);
        array[1] = BufferTools.setBit(array[1], 2, this.encryption);
        array[1] = BufferTools.setBit(array[1], 1, this.unsynchronisation);
        array[1] = BufferTools.setBit(array[1], 0, this.dataLengthIndicator);
        return array;
    }
    
    private void packHeader(final byte[] array, final int n) {
        BufferTools.stringIntoByteBuffer(this.id, 0, this.id.length(), array, 0);
        BufferTools.copyIntoByteBuffer(this.packDataLength(), 0, 4, array, 4);
        BufferTools.copyIntoByteBuffer(this.packFlags(), 0, 2, array, 8);
    }
    
    private void unpackFlags(final byte[] array, final int n) {
        this.preserveTag = BufferTools.checkBit(array[n + 8], 6);
        this.preserveFile = BufferTools.checkBit(array[n + 8], 5);
        this.readOnly = BufferTools.checkBit(array[n + 8], 4);
        this.group = BufferTools.checkBit(array[n + 9], 6);
        this.compression = BufferTools.checkBit(array[n + 9], 3);
        this.encryption = BufferTools.checkBit(array[n + 9], 2);
        this.unsynchronisation = BufferTools.checkBit(array[n + 9], 1);
        this.dataLengthIndicator = BufferTools.checkBit(array[n + 9], 0);
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof ID3v2Frame;
        boolean b2 = false;
        if (b) {
            if (super.equals(o)) {
                b2 = true;
            }
            else {
                final ID3v2Frame id3v2Frame = (ID3v2Frame)o;
                final int dataLength = this.dataLength;
                final int dataLength2 = id3v2Frame.dataLength;
                b2 = false;
                if (dataLength == dataLength2) {
                    final boolean preserveTag = this.preserveTag;
                    final boolean preserveTag2 = id3v2Frame.preserveTag;
                    b2 = false;
                    if (preserveTag == preserveTag2) {
                        final boolean preserveFile = this.preserveFile;
                        final boolean preserveFile2 = id3v2Frame.preserveFile;
                        b2 = false;
                        if (preserveFile == preserveFile2) {
                            final boolean readOnly = this.readOnly;
                            final boolean readOnly2 = id3v2Frame.readOnly;
                            b2 = false;
                            if (readOnly == readOnly2) {
                                final boolean group = this.group;
                                final boolean group2 = id3v2Frame.group;
                                b2 = false;
                                if (group == group2) {
                                    final boolean compression = this.compression;
                                    final boolean compression2 = id3v2Frame.compression;
                                    b2 = false;
                                    if (compression == compression2) {
                                        final boolean encryption = this.encryption;
                                        final boolean encryption2 = id3v2Frame.encryption;
                                        b2 = false;
                                        if (encryption == encryption2) {
                                            final boolean unsynchronisation = this.unsynchronisation;
                                            final boolean encryption3 = id3v2Frame.encryption;
                                            b2 = false;
                                            if (unsynchronisation == encryption3) {
                                                final boolean dataLengthIndicator = this.dataLengthIndicator;
                                                final boolean dataLengthIndicator2 = id3v2Frame.dataLengthIndicator;
                                                b2 = false;
                                                if (dataLengthIndicator == dataLengthIndicator2) {
                                                    if (this.id == null) {
                                                        final String id = id3v2Frame.id;
                                                        b2 = false;
                                                        if (id != null) {
                                                            return b2;
                                                        }
                                                    }
                                                    else {
                                                        final String id2 = id3v2Frame.id;
                                                        b2 = false;
                                                        if (id2 == null) {
                                                            return b2;
                                                        }
                                                        if (!this.id.equals(id3v2Frame.id)) {
                                                            b2 = false;
                                                            return b2;
                                                        }
                                                    }
                                                    if (this.data == null) {
                                                        final byte[] data = id3v2Frame.data;
                                                        b2 = false;
                                                        if (data != null) {
                                                            return b2;
                                                        }
                                                    }
                                                    else {
                                                        final byte[] data2 = id3v2Frame.data;
                                                        b2 = false;
                                                        if (data2 == null) {
                                                            return b2;
                                                        }
                                                        if (!Arrays.equals(this.data, id3v2Frame.data)) {
                                                            b2 = false;
                                                            return b2;
                                                        }
                                                    }
                                                    b2 = true;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return b2;
    }
    
    public byte[] getData() {
        return this.data;
    }
    
    public int getDataLength() {
        return this.dataLength;
    }
    
    public String getId() {
        return this.id;
    }
    
    public int getLength() {
        return 10 + this.dataLength;
    }
    
    public boolean hasCompression() {
        return this.compression;
    }
    
    public boolean hasDataLengthIndicator() {
        return this.dataLengthIndicator;
    }
    
    public boolean hasEncryption() {
        return this.encryption;
    }
    
    public boolean hasGroup() {
        return this.group;
    }
    
    public boolean hasPreserveFile() {
        return this.preserveFile;
    }
    
    public boolean hasPreserveTag() {
        return this.preserveTag;
    }
    
    public boolean hasUnsynchronisation() {
        return this.unsynchronisation;
    }
    
    public boolean isReadOnly() {
        return this.readOnly;
    }
    
    protected byte[] packDataLength() {
        return BufferTools.packInteger(this.dataLength);
    }
    
    public void packFrame(final byte[] array, final int n) throws NotSupportedException {
        this.packHeader(array, n);
        BufferTools.copyIntoByteBuffer(this.data, 0, this.data.length, array, n + 10);
    }
    
    protected void sanityCheckUnpackedHeader() throws InvalidDataException {
        for (int i = 0; i < this.id.length(); ++i) {
            if ((this.id.charAt(i) < 'A' || this.id.charAt(i) > 'Z') && (this.id.charAt(i) < '0' || this.id.charAt(i) > '9')) {
                throw new InvalidDataException("Not a valid frame - invalid tag " + this.id);
            }
        }
    }
    
    public void setData(final byte[] data) {
        this.data = data;
        if (data == null) {
            this.dataLength = 0;
        }
        else {
            this.dataLength = data.length;
        }
    }
    
    public void toBytes(final byte[] array, final int n) throws NotSupportedException {
        this.packFrame(array, n);
    }
    
    public byte[] toBytes() throws NotSupportedException {
        final byte[] array = new byte[this.getLength()];
        this.packFrame(array, 0);
        return array;
    }
    
    protected void unpackDataLength(final byte[] array, final int n) {
        this.dataLength = BufferTools.unpackInteger(array[n + 4], array[1 + (n + 4)], array[2 + (n + 4)], array[3 + (n + 4)]);
    }
    
    protected void unpackFrame(final byte[] array, final int n) throws InvalidDataException {
        final int unpackHeader = this.unpackHeader(array, n);
        this.sanityCheckUnpackedHeader();
        this.data = BufferTools.copyBuffer(array, unpackHeader, this.dataLength);
    }
    
    protected int unpackHeader(final byte[] array, final int n) {
        this.id = BufferTools.byteBufferToString(array, n + 0, 4);
        this.unpackDataLength(array, n);
        this.unpackFlags(array, n);
        return n + 10;
    }
}
