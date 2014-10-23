package com.mpatric.mp3agic;

import java.util.*;

public abstract class AbstractID3v2Tag implements ID3v2
{
    protected static final int COMPRESSION_BIT = 6;
    protected static final int DATA_LENGTH_OFFSET = 6;
    protected static final int EXPERIMENTAL_BIT = 5;
    protected static final int EXTENDED_HEADER_BIT = 6;
    protected static final int FLAGS_OFFSET = 5;
    protected static final int FOOTER_BIT = 4;
    protected static final int FOOTER_LENGTH = 10;
    protected static final String FOOTER_TAG = "3DI";
    protected static final int HEADER_LENGTH = 10;
    public static final String ID_ALBUM = "TALB";
    public static final String ID_ALBUM_OBSELETE = "TAL";
    public static final String ID_ARTIST = "TPE1";
    public static final String ID_ARTIST_OBSELETE = "TP1";
    public static final String ID_COMMENT = "COMM";
    public static final String ID_COMMENT_OBSELETE = "COM";
    public static final String ID_COMPOSER = "TCOM";
    public static final String ID_COMPOSER_OBSELETE = "TCM";
    public static final String ID_COPYRIGHT = "TCOP";
    public static final String ID_COPYRIGHT_OBSELETE = "TCR";
    public static final String ID_ENCODER = "TENC";
    public static final String ID_ENCODER_OBSELETE = "TEN";
    public static final String ID_GENRE = "TCON";
    public static final String ID_GENRE_OBSELETE = "TCO";
    public static final String ID_IMAGE = "APIC";
    public static final String ID_IMAGE_OBSELETE = "PIC";
    public static final String ID_ORIGINAL_ARTIST = "TOPE";
    public static final String ID_ORIGINAL_ARTIST_OBSELETE = "TOA";
    public static final String ID_PUBLISHER = "TPUB";
    public static final String ID_PUBLISHER_OBSELETE = "TBP";
    public static final String ID_TITLE = "TIT2";
    public static final String ID_TITLE_OBSELETE = "TT2";
    public static final String ID_TRACK = "TRCK";
    public static final String ID_TRACK_OBSELETE = "TRK";
    public static final String ID_URL = "WXXX";
    public static final String ID_URL_OBSELETE = "WXX";
    public static final String ID_YEAR = "TYER";
    public static final String ID_YEAR_OBSELETE = "TYE";
    private static final String ITUNES_COMMENT_DESCRIPTION = "iTunNORM";
    protected static final int MAJOR_VERSION_OFFSET = 3;
    protected static final int MINOR_VERSION_OFFSET = 4;
    protected static final int PADDING_LENGTH = 256;
    protected static final String TAG = "ID3";
    protected static final int UNSYNCHRONISATION_BIT = 7;
    protected boolean compression;
    private int dataLength;
    protected boolean experimental;
    protected boolean extendedHeader;
    private byte[] extendedHeaderData;
    private int extendedHeaderLength;
    protected boolean footer;
    private final Map<String, ID3v2FrameSet> frameSets;
    private boolean obseleteFormat;
    protected boolean padding;
    protected boolean unsynchronisation;
    protected String version;
    
    public AbstractID3v2Tag() {
        super();
        this.unsynchronisation = false;
        this.extendedHeader = false;
        this.experimental = false;
        this.footer = false;
        this.compression = false;
        this.padding = false;
        this.version = null;
        this.dataLength = 0;
        this.obseleteFormat = false;
        this.frameSets = new TreeMap<String, ID3v2FrameSet>();
    }
    
    public AbstractID3v2Tag(final byte[] array) throws NoSuchTagException, UnsupportedTagException, InvalidDataException {
        this(array, false);
    }
    
    public AbstractID3v2Tag(final byte[] array, final boolean obseleteFormat) throws NoSuchTagException, UnsupportedTagException, InvalidDataException {
        super();
        this.unsynchronisation = false;
        this.extendedHeader = false;
        this.experimental = false;
        this.footer = false;
        this.compression = false;
        this.padding = false;
        this.version = null;
        this.dataLength = 0;
        this.obseleteFormat = false;
        this.frameSets = new TreeMap<String, ID3v2FrameSet>();
        this.obseleteFormat = obseleteFormat;
        this.unpackTag(array);
    }
    
    private void addFrame(final ID3v2Frame id3v2Frame, final boolean b) {
        final ID3v2FrameSet set = this.frameSets.get(id3v2Frame.getId());
        if (set == null) {
            final ID3v2FrameSet set2 = new ID3v2FrameSet(id3v2Frame.getId());
            set2.addFrame(id3v2Frame);
            this.frameSets.put(id3v2Frame.getId(), set2);
        }
        else if (b) {
            set.clear();
            set.addFrame(id3v2Frame);
        }
        else {
            set.addFrame(id3v2Frame);
        }
    }
    
    private int calculateDataLength() {
        final boolean extendedHeader = this.extendedHeader;
        int n = 0;
        if (extendedHeader) {
            n = 0 + this.extendedHeaderLength;
        }
        if (this.footer) {
            n += 10;
        }
        else if (this.padding) {
            n += 256;
        }
        final Iterator<ID3v2FrameSet> iterator = this.frameSets.values().iterator();
        while (iterator.hasNext()) {
            final Iterator<ID3v2Frame> iterator2 = iterator.next().getFrames().iterator();
            while (iterator2.hasNext()) {
                n += iterator2.next().getLength();
            }
        }
        return n;
    }
    
    private ID3v2PictureFrameData createPictureFrameData(final String s) {
        final ID3v2FrameSet set = this.frameSets.get(s);
        if (set != null) {
            final ID3v2Frame id3v2Frame = set.getFrames().get(0);
            try {
                if (this.obseleteFormat) {
                    return new ID3v2ObseletePictureFrameData(this.useFrameUnsynchronisation(), id3v2Frame.getData());
                }
                return new ID3v2PictureFrameData(this.useFrameUnsynchronisation(), id3v2Frame.getData());
            }
            catch (InvalidDataException ex) {}
        }
        return null;
    }
    
    private ID3v2CommentFrameData extractCommentFrameData(final String s, final boolean b) {
        final ID3v2FrameSet set = this.frameSets.get(s);
        if (set != null) {
            for (final ID3v2Frame id3v2Frame : set.getFrames()) {
                try {
                    final ID3v2CommentFrameData id3v2CommentFrameData = new ID3v2CommentFrameData(this.useFrameUnsynchronisation(), id3v2Frame.getData());
                    if (b && "iTunNORM".equals(id3v2CommentFrameData.getDescription().toString())) {
                        return id3v2CommentFrameData;
                    }
                    if (!b) {
                        return id3v2CommentFrameData;
                    }
                    continue;
                }
                catch (InvalidDataException ex) {}
            }
        }
        return null;
    }
    
    private ID3v2TextFrameData extractTextFrameData(final String s) {
        final ID3v2FrameSet set = this.frameSets.get(s);
        if (set == null) {
            return null;
        }
        final ID3v2Frame id3v2Frame = set.getFrames().get(0);
        try {
            return new ID3v2TextFrameData(this.useFrameUnsynchronisation(), id3v2Frame.getData());
        }
        catch (InvalidDataException ex) {}
        return null;
    }
    
    private ID3v2UrlFrameData extractUrlFrameData(final String s) {
        final ID3v2FrameSet set = this.frameSets.get(s);
        if (set == null) {
            return null;
        }
        final ID3v2Frame id3v2Frame = set.getFrames().get(0);
        try {
            return new ID3v2UrlFrameData(this.useFrameUnsynchronisation(), id3v2Frame.getData());
        }
        catch (InvalidDataException ex) {}
        return null;
    }
    
    private void invalidateDataLength() {
        this.dataLength = 0;
    }
    
    private int packExtendedHeader(final byte[] array, final int n) {
        BufferTools.packSynchsafeInteger(this.extendedHeaderLength, array, n);
        BufferTools.copyIntoByteBuffer(this.extendedHeaderData, 0, this.extendedHeaderData.length, array, n + 4);
        return n + 4 + this.extendedHeaderData.length;
    }
    
    private int packFooter(final byte[] array, final int n) {
        BufferTools.stringIntoByteBuffer("3DI", 0, "3DI".length(), array, n);
        final String[] split = this.version.split(".");
        if (split.length > 0) {
            array[n + 3] = Byte.parseByte(split[0]);
        }
        if (split.length > 1) {
            array[n + 4] = Byte.parseByte(split[0]);
        }
        this.packFlags(array, n);
        BufferTools.packSynchsafeInteger(this.getDataLength(), array, n + 6);
        return n + 10;
    }
    
    private int packHeader(final byte[] array, final int n) {
        BufferTools.stringIntoByteBuffer("ID3", 0, "ID3".length(), array, n);
        final String[] split = this.version.split("\\.");
        if (split.length > 0) {
            array[n + 3] = Byte.parseByte(split[0]);
        }
        if (split.length > 1) {
            array[n + 4] = Byte.parseByte(split[1]);
        }
        this.packFlags(array, n);
        BufferTools.packSynchsafeInteger(this.getDataLength(), array, n + 6);
        return n + 10;
    }
    
    private int packSpecifiedFrames(final byte[] array, int n, final String s, final String s2) throws NotSupportedException {
        for (final ID3v2FrameSet set : this.frameSets.values()) {
            if ((s == null || s.equals(set.getId())) && (s2 == null || !s2.equals(set.getId()))) {
                for (final ID3v2Frame id3v2Frame : set.getFrames()) {
                    if (id3v2Frame.getDataLength() > 0) {
                        final byte[] bytes = id3v2Frame.toBytes();
                        BufferTools.copyIntoByteBuffer(bytes, 0, bytes.length, array, n);
                        n += bytes.length;
                    }
                }
            }
        }
        return n;
    }
    
    private int unpackExtendedHeader(final byte[] array, final int n) {
        this.extendedHeaderLength = 4 + BufferTools.unpackSynchsafeInteger(array[n], array[n + 1], array[n + 2], array[n + 3]);
        this.extendedHeaderData = BufferTools.copyBuffer(array, n + 4, this.extendedHeaderLength);
        return this.extendedHeaderLength;
    }
    
    private int unpackFooter(final byte[] array, final int n) throws InvalidDataException {
        if (!"3DI".equals(BufferTools.byteBufferToString(array, n, "3DI".length()))) {
            throw new InvalidDataException("Invalid footer");
        }
        return 10;
    }
    
    private int unpackHeader(final byte[] array) throws UnsupportedTagException, InvalidDataException {
        final byte b = array[3];
        this.version = String.valueOf(b) + "." + array[4];
        if (b != 2 && b != 3 && b != 4) {
            throw new UnsupportedTagException("Unsupported version " + this.version);
        }
        this.unpackFlags(array);
        if ((0xF & array[5]) != 0x0) {
            throw new UnsupportedTagException("Unrecognised bits in header");
        }
        this.dataLength = BufferTools.unpackSynchsafeInteger(array[6], array[7], array[8], array[9]);
        if (this.dataLength < 1) {
            throw new InvalidDataException("Zero size tag");
        }
        return 10;
    }
    
    private void unpackTag(final byte[] array) throws NoSuchTagException, UnsupportedTagException, InvalidDataException {
        ID3v2TagFactory.sanityCheckTag(array);
        int n = this.unpackHeader(array);
        try {
            if (this.extendedHeader) {
                n = this.unpackExtendedHeader(array, n);
            }
            int dataLength = this.dataLength;
            if (this.footer) {
                dataLength -= 10;
            }
            this.unpackFrames(array, n, dataLength);
            if (this.footer) {
                this.unpackFooter(array, this.dataLength);
            }
        }
        catch (ArrayIndexOutOfBoundsException ex) {
            throw new InvalidDataException("Premature end of tag", ex);
        }
    }
    
    public void clearFrameSet(final String s) {
        if (this.frameSets.remove(s) != null) {
            this.invalidateDataLength();
        }
    }
    
    protected ID3v2Frame createFrame(final String s, final byte[] array) {
        ID3v2Frame id3v2Frame;
        if (this.obseleteFormat) {
            id3v2Frame = new ID3v2ObseleteFrame(s, array);
        }
        else {
            id3v2Frame = new ID3v2Frame(s, array);
        }
        return id3v2Frame;
    }
    
    protected ID3v2Frame createFrame(final byte[] array, final int n) throws InvalidDataException {
        ID3v2Frame id3v2Frame;
        if (this.obseleteFormat) {
            id3v2Frame = new ID3v2ObseleteFrame(array, n);
        }
        else {
            id3v2Frame = new ID3v2Frame(array, n);
        }
        return id3v2Frame;
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof AbstractID3v2Tag;
        boolean b2 = false;
        if (b) {
            if (super.equals(o)) {
                b2 = true;
            }
            else {
                final AbstractID3v2Tag abstractID3v2Tag = (AbstractID3v2Tag)o;
                final boolean unsynchronisation = this.unsynchronisation;
                final boolean unsynchronisation2 = abstractID3v2Tag.unsynchronisation;
                b2 = false;
                if (unsynchronisation == unsynchronisation2) {
                    final boolean extendedHeader = this.extendedHeader;
                    final boolean extendedHeader2 = abstractID3v2Tag.extendedHeader;
                    b2 = false;
                    if (extendedHeader == extendedHeader2) {
                        final boolean experimental = this.experimental;
                        final boolean experimental2 = abstractID3v2Tag.experimental;
                        b2 = false;
                        if (experimental == experimental2) {
                            final boolean footer = this.footer;
                            final boolean footer2 = abstractID3v2Tag.footer;
                            b2 = false;
                            if (footer == footer2) {
                                final boolean compression = this.compression;
                                final boolean compression2 = abstractID3v2Tag.compression;
                                b2 = false;
                                if (compression == compression2) {
                                    final int dataLength = this.dataLength;
                                    final int dataLength2 = abstractID3v2Tag.dataLength;
                                    b2 = false;
                                    if (dataLength == dataLength2) {
                                        final int extendedHeaderLength = this.extendedHeaderLength;
                                        final int extendedHeaderLength2 = abstractID3v2Tag.extendedHeaderLength;
                                        b2 = false;
                                        if (extendedHeaderLength == extendedHeaderLength2) {
                                            if (this.version == null) {
                                                final String version = abstractID3v2Tag.version;
                                                b2 = false;
                                                if (version != null) {
                                                    return b2;
                                                }
                                            }
                                            else {
                                                final String version2 = abstractID3v2Tag.version;
                                                b2 = false;
                                                if (version2 == null) {
                                                    return b2;
                                                }
                                                if (!this.version.equals(abstractID3v2Tag.version)) {
                                                    b2 = false;
                                                    return b2;
                                                }
                                            }
                                            if (this.frameSets == null) {
                                                final Map<String, ID3v2FrameSet> frameSets = abstractID3v2Tag.frameSets;
                                                b2 = false;
                                                if (frameSets != null) {
                                                    return b2;
                                                }
                                            }
                                            else {
                                                final Map<String, ID3v2FrameSet> frameSets2 = abstractID3v2Tag.frameSets;
                                                b2 = false;
                                                if (frameSets2 == null) {
                                                    return b2;
                                                }
                                                if (!this.frameSets.equals(abstractID3v2Tag.frameSets)) {
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
        return b2;
    }
    
    protected String extractGenreDescription(final String s) throws NumberFormatException {
        String s2 = s.trim();
        if (s2.length() > 0) {
            if (s2.charAt(0) == '(') {
                final int index = s2.indexOf(41);
                if (index > 0) {
                    s2 = s2.substring(index + 1);
                }
            }
        }
        else {
            s2 = null;
        }
        return s2;
    }
    
    protected int extractGenreNumber(final String s) throws NumberFormatException {
        final String trim = s.trim();
        if (trim.length() <= 0 || trim.charAt(0) != '(') {
            return Integer.parseInt(trim);
        }
        final int index = trim.indexOf(41);
        if (index <= 0) {
            return Integer.parseInt(trim);
        }
        return Integer.parseInt(trim.substring(1, index));
        n = Integer.parseInt(trim);
        return n;
    }
    
    public String getAlbum() {
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TAL");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TALB");
        }
        String string;
        if (id3v2TextFrameData != null && id3v2TextFrameData.getText() != null) {
            string = id3v2TextFrameData.getText().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public byte[] getAlbumImage() {
        ID3v2PictureFrameData id3v2PictureFrameData;
        if (this.obseleteFormat) {
            id3v2PictureFrameData = this.createPictureFrameData("PIC");
        }
        else {
            id3v2PictureFrameData = this.createPictureFrameData("APIC");
        }
        byte[] imageData;
        if (id3v2PictureFrameData != null) {
            imageData = id3v2PictureFrameData.getImageData();
        }
        else {
            imageData = null;
        }
        return imageData;
    }
    
    public String getAlbumImageMimeType() {
        ID3v2PictureFrameData id3v2PictureFrameData;
        if (this.obseleteFormat) {
            id3v2PictureFrameData = this.createPictureFrameData("PIC");
        }
        else {
            id3v2PictureFrameData = this.createPictureFrameData("APIC");
        }
        String mimeType;
        if (id3v2PictureFrameData != null && id3v2PictureFrameData.getMimeType() != null) {
            mimeType = id3v2PictureFrameData.getMimeType();
        }
        else {
            mimeType = null;
        }
        return mimeType;
    }
    
    public String getArtist() {
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TP1");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TPE1");
        }
        String string;
        if (id3v2TextFrameData != null && id3v2TextFrameData.getText() != null) {
            string = id3v2TextFrameData.getText().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public String getComment() {
        ID3v2CommentFrameData id3v2CommentFrameData;
        if (this.obseleteFormat) {
            id3v2CommentFrameData = this.extractCommentFrameData("COM", false);
        }
        else {
            id3v2CommentFrameData = this.extractCommentFrameData("COMM", false);
        }
        String string;
        if (id3v2CommentFrameData != null && id3v2CommentFrameData.getComment() != null) {
            string = id3v2CommentFrameData.getComment().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public String getComposer() {
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TCM");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TCOM");
        }
        String string;
        if (id3v2TextFrameData != null && id3v2TextFrameData.getText() != null) {
            string = id3v2TextFrameData.getText().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public String getCopyright() {
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TCR");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TCOP");
        }
        String string;
        if (id3v2TextFrameData != null && id3v2TextFrameData.getText() != null) {
            string = id3v2TextFrameData.getText().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public int getDataLength() {
        if (this.dataLength == 0) {
            this.dataLength = this.calculateDataLength();
        }
        return this.dataLength;
    }
    
    public String getEncoder() {
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TEN");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TENC");
        }
        String string;
        if (id3v2TextFrameData != null && id3v2TextFrameData.getText() != null) {
            string = id3v2TextFrameData.getText().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public Map<String, ID3v2FrameSet> getFrameSets() {
        return this.frameSets;
    }
    
    public int getGenre() {
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TCO");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TCON");
        }
        int i;
        if (id3v2TextFrameData == null || id3v2TextFrameData.getText() == null) {
            i = -1;
        }
        else {
            final String string = id3v2TextFrameData.getText().toString();
            if (string == null || string.length() == 0) {
                i = -1;
            }
            else {
                try {
                    i = this.extractGenreNumber(string);
                }
                catch (NumberFormatException ex) {
                    final String genreDescription = this.extractGenreDescription(string);
                    if (genreDescription != null && genreDescription.length() > 0) {
                        for (i = 0; i < ID3v1Genres.GENRES.length; ++i) {
                            if (ID3v1Genres.GENRES[i].compareToIgnoreCase(genreDescription) == 0) {
                                return i;
                            }
                        }
                    }
                    i = -1;
                }
            }
        }
        return i;
    }
    
    public String getGenreDescription() {
        int n = 1;
        final int genre = this.getGenre();
        Label_0029: {
            if (genre < 0) {
                break Label_0029;
            }
            try {
                return ID3v1Genres.GENRES[genre];
            }
            catch (ArrayIndexOutOfBoundsException ex) {
                return null;
            }
        }
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TCO");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TCON");
        }
        if (id3v2TextFrameData != null && id3v2TextFrameData.getText() != null) {
            final String string = id3v2TextFrameData.getText().toString();
            if (string != null && string.length() > 0) {
                final String genreDescription = this.extractGenreDescription(string);
                int n2;
                if (genreDescription != null) {
                    n2 = n;
                }
                else {
                    n2 = 0;
                }
                if (genreDescription.length() <= 0) {
                    n = 0;
                }
                if ((n2 & n) != 0x0) {
                    return genreDescription;
                }
            }
        }
        return null;
    }
    
    public String getItunesComment() {
        ID3v2CommentFrameData id3v2CommentFrameData;
        if (this.obseleteFormat) {
            id3v2CommentFrameData = this.extractCommentFrameData("COM", true);
        }
        else {
            id3v2CommentFrameData = this.extractCommentFrameData("COMM", true);
        }
        String string;
        if (id3v2CommentFrameData != null && id3v2CommentFrameData.getComment() != null) {
            string = id3v2CommentFrameData.getComment().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public int getLength() {
        return 10 + this.getDataLength();
    }
    
    public boolean getObseleteFormat() {
        return this.obseleteFormat;
    }
    
    public String getOriginalArtist() {
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TOA");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TOPE");
        }
        String string;
        if (id3v2TextFrameData != null && id3v2TextFrameData.getText() != null) {
            string = id3v2TextFrameData.getText().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public boolean getPadding() {
        return this.padding;
    }
    
    public String getPublisher() {
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TBP");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TPUB");
        }
        String string;
        if (id3v2TextFrameData != null && id3v2TextFrameData.getText() != null) {
            string = id3v2TextFrameData.getText().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public String getTitle() {
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TT2");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TIT2");
        }
        String string;
        if (id3v2TextFrameData != null && id3v2TextFrameData.getText() != null) {
            string = id3v2TextFrameData.getText().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public String getTrack() {
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TRK");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TRCK");
        }
        String string;
        if (id3v2TextFrameData != null && id3v2TextFrameData.getText() != null) {
            string = id3v2TextFrameData.getText().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public String getUrl() {
        ID3v2UrlFrameData id3v2UrlFrameData;
        if (this.obseleteFormat) {
            id3v2UrlFrameData = this.extractUrlFrameData("WXX");
        }
        else {
            id3v2UrlFrameData = this.extractUrlFrameData("WXXX");
        }
        String url;
        if (id3v2UrlFrameData != null) {
            url = id3v2UrlFrameData.getUrl();
        }
        else {
            url = null;
        }
        return url;
    }
    
    public String getVersion() {
        return this.version;
    }
    
    public String getYear() {
        ID3v2TextFrameData id3v2TextFrameData;
        if (this.obseleteFormat) {
            id3v2TextFrameData = this.extractTextFrameData("TYE");
        }
        else {
            id3v2TextFrameData = this.extractTextFrameData("TYER");
        }
        String string;
        if (id3v2TextFrameData != null && id3v2TextFrameData.getText() != null) {
            string = id3v2TextFrameData.getText().toString();
        }
        else {
            string = null;
        }
        return string;
    }
    
    public boolean hasFooter() {
        return this.footer;
    }
    
    public boolean hasUnsynchronisation() {
        return this.unsynchronisation;
    }
    
    protected abstract void packFlags(final byte[] p0, final int p1);
    
    public int packFrames(final byte[] array, final int n) throws NotSupportedException {
        return this.packSpecifiedFrames(array, this.packSpecifiedFrames(array, n, null, "APIC"), "APIC", null);
    }
    
    public void packTag(final byte[] array) throws NotSupportedException {
        int n = this.packHeader(array, 0);
        if (this.extendedHeader) {
            n = this.packExtendedHeader(array, n);
        }
        this.packFrames(array, n);
        if (this.footer) {
            this.packFooter(array, this.dataLength);
        }
    }
    
    public void setAlbum(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("TALB", new ID3v2TextFrameData(this.useFrameUnsynchronisation(), new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public void setAlbumImage(final byte[] array, final String s) {
        if (array != null && array.length > 0 && s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("APIC", new ID3v2PictureFrameData(this.useFrameUnsynchronisation(), s, 0, null, array).toBytes()), true);
        }
    }
    
    public void setArtist(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("TPE1", new ID3v2TextFrameData(this.useFrameUnsynchronisation(), new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public void setComment(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("COMM", new ID3v2CommentFrameData(this.useFrameUnsynchronisation(), "eng", null, new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public void setComposer(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("TCOM", new ID3v2TextFrameData(this.useFrameUnsynchronisation(), new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public void setCopyright(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("TCOP", new ID3v2TextFrameData(this.useFrameUnsynchronisation(), new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public void setEncoder(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("TENC", new ID3v2TextFrameData(this.useFrameUnsynchronisation(), new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public void setFooter(final boolean footer) {
        if (this.footer != footer) {
            this.invalidateDataLength();
            this.footer = footer;
        }
    }
    
    public void setGenre(final int n) {
        if (n < 0) {
            return;
        }
        this.invalidateDataLength();
        while (true) {
            try {
                final String s = ID3v1Genres.GENRES[n];
                this.addFrame(this.createFrame("TCON", new ID3v2TextFrameData(this.useFrameUnsynchronisation(), new EncodedText(0, "(" + Integer.toString(n) + ")" + s)).toBytes()), true);
            }
            catch (ArrayIndexOutOfBoundsException ex) {
                final String s = "";
                continue;
            }
            break;
        }
    }
    
    public void setItunesComment(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("COMM", new ID3v2CommentFrameData(this.useFrameUnsynchronisation(), "iTunNORM", null, new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public void setOriginalArtist(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("TOPE", new ID3v2TextFrameData(this.useFrameUnsynchronisation(), new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public void setPadding(final boolean padding) {
        if (this.padding != padding) {
            this.invalidateDataLength();
            this.padding = padding;
        }
    }
    
    public void setPublisher(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("TPUB", new ID3v2TextFrameData(this.useFrameUnsynchronisation(), new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public void setTitle(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("TIT2", new ID3v2TextFrameData(this.useFrameUnsynchronisation(), new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public void setTrack(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("TRCK", new ID3v2TextFrameData(this.useFrameUnsynchronisation(), new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public void setUnsynchronisation(final boolean unsynchronisation) {
        if (this.unsynchronisation != unsynchronisation) {
            this.invalidateDataLength();
            this.unsynchronisation = unsynchronisation;
        }
    }
    
    public void setUrl(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("WXXX", new ID3v2UrlFrameData(this.useFrameUnsynchronisation(), null, s).toBytes()), true);
        }
    }
    
    public void setYear(final String s) {
        if (s != null && s.length() > 0) {
            this.invalidateDataLength();
            this.addFrame(this.createFrame("TYER", new ID3v2TextFrameData(this.useFrameUnsynchronisation(), new EncodedText(0, s)).toBytes()), true);
        }
    }
    
    public byte[] toBytes() throws NotSupportedException {
        final byte[] array = new byte[this.getLength()];
        this.packTag(array);
        return array;
    }
    
    protected abstract void unpackFlags(final byte[] p0);
    
    protected int unpackFrames(final byte[] array, final int n, final int n2) {
        int i = n;
        while (i <= n2) {
            try {
                final ID3v2Frame frame = this.createFrame(array, i);
                this.addFrame(frame, false);
                i += frame.getLength();
            }
            catch (InvalidDataException ex) {
                break;
            }
        }
        return i;
    }
    
    protected boolean useFrameUnsynchronisation() {
        return false;
    }
}
