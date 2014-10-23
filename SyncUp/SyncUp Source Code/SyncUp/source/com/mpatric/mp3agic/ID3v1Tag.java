package com.mpatric.mp3agic;

import java.util.*;

public class ID3v1Tag implements ID3v1
{
    private static final int ALBUM_LENGTH = 30;
    private static final int ALBUM_OFFSET = 63;
    private static final int ARTIST_LENGTH = 30;
    private static final int ARTIST_OFFSET = 33;
    private static final int COMMENT_LENGTH_V1_0 = 30;
    private static final int COMMENT_LENGTH_V1_1 = 28;
    private static final int COMMENT_OFFSET = 97;
    private static final int GENRE_OFFSET = 127;
    private static final String TAG = "TAG";
    public static final int TAG_LENGTH = 128;
    private static final int TITLE_LENGTH = 30;
    private static final int TITLE_OFFSET = 3;
    private static final int TRACK_MARKER_OFFSET = 125;
    private static final int TRACK_OFFSET = 126;
    private static final String VERSION_0 = "0";
    private static final String VERSION_1 = "1";
    private static final int YEAR_LENGTH = 4;
    private static final int YEAR_OFFSET = 93;
    private String album;
    private String artist;
    private String comment;
    private int genre;
    private String title;
    private String track;
    private String year;
    
    public ID3v1Tag() {
        super();
        this.track = null;
        this.artist = null;
        this.title = null;
        this.album = null;
        this.year = null;
        this.genre = -1;
        this.comment = null;
    }
    
    public ID3v1Tag(final byte[] array) throws NoSuchTagException {
        super();
        this.track = null;
        this.artist = null;
        this.title = null;
        this.album = null;
        this.year = null;
        this.genre = -1;
        this.comment = null;
        this.unpackTag(array);
    }
    
    private String numericsOnly(final String s) {
        final StringBuffer sb = new StringBuffer();
        for (int i = 0; i < s.length(); ++i) {
            final char char1 = s.charAt(i);
            if (char1 < '0' || char1 > '9') {
                break;
            }
            sb.append(char1);
        }
        return sb.toString();
    }
    
    private void packField(final byte[] array, final String s, final int n, final int n2) {
        if (s != null) {
            BufferTools.stringIntoByteBuffer(s, 0, Math.min(s.length(), n), array, n2);
        }
    }
    
    private void sanityCheckTag(final byte[] array) throws NoSuchTagException {
        if (array.length != 128) {
            throw new NoSuchTagException("Buffer length wrong");
        }
        if (!"TAG".equals(BufferTools.byteBufferToString(array, 0, "TAG".length()))) {
            throw new NoSuchTagException();
        }
    }
    
    private void unpackTag(final byte[] array) throws NoSuchTagException {
        this.sanityCheckTag(array);
        this.title = BufferTools.trimStringRight(BufferTools.byteBufferToString(array, 3, 30));
        this.artist = BufferTools.trimStringRight(BufferTools.byteBufferToString(array, 33, 30));
        this.album = BufferTools.trimStringRight(BufferTools.byteBufferToString(array, 63, 30));
        this.year = BufferTools.trimStringRight(BufferTools.byteBufferToString(array, 93, 4));
        this.genre = (0xFF & array[127]);
        if (this.genre == 255) {
            this.genre = -1;
        }
        if (array[125] != 0) {
            this.comment = BufferTools.trimStringRight(BufferTools.byteBufferToString(array, 97, 30));
            this.track = null;
        }
        else {
            this.comment = BufferTools.trimStringRight(BufferTools.byteBufferToString(array, 97, 28));
            final byte b = array[126];
            if (b == 0) {
                this.track = "";
            }
            else {
                this.track = Integer.toString(b);
            }
        }
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof ID3v1Tag;
        boolean b2 = false;
        if (b) {
            if (super.equals(o)) {
                b2 = true;
            }
            else {
                final ID3v1Tag id3v1Tag = (ID3v1Tag)o;
                final int genre = this.genre;
                final int genre2 = id3v1Tag.genre;
                b2 = false;
                if (genre == genre2) {
                    if (this.track == null) {
                        final String track = id3v1Tag.track;
                        b2 = false;
                        if (track != null) {
                            return b2;
                        }
                    }
                    else {
                        final String track2 = id3v1Tag.track;
                        b2 = false;
                        if (track2 == null) {
                            return b2;
                        }
                        if (!this.track.equals(id3v1Tag.track)) {
                            b2 = false;
                            return b2;
                        }
                    }
                    if (this.artist == null) {
                        final String artist = id3v1Tag.artist;
                        b2 = false;
                        if (artist != null) {
                            return b2;
                        }
                    }
                    else {
                        final String artist2 = id3v1Tag.artist;
                        b2 = false;
                        if (artist2 == null) {
                            return b2;
                        }
                        if (!this.artist.equals(id3v1Tag.artist)) {
                            b2 = false;
                            return b2;
                        }
                    }
                    if (this.title == null) {
                        final String title = id3v1Tag.title;
                        b2 = false;
                        if (title != null) {
                            return b2;
                        }
                    }
                    else {
                        final String title2 = id3v1Tag.title;
                        b2 = false;
                        if (title2 == null) {
                            return b2;
                        }
                        if (!this.title.equals(id3v1Tag.title)) {
                            b2 = false;
                            return b2;
                        }
                    }
                    if (this.album == null) {
                        final String album = id3v1Tag.album;
                        b2 = false;
                        if (album != null) {
                            return b2;
                        }
                    }
                    else {
                        final String album2 = id3v1Tag.album;
                        b2 = false;
                        if (album2 == null) {
                            return b2;
                        }
                        if (!this.album.equals(id3v1Tag.album)) {
                            b2 = false;
                            return b2;
                        }
                    }
                    if (this.year == null) {
                        final String year = id3v1Tag.year;
                        b2 = false;
                        if (year != null) {
                            return b2;
                        }
                    }
                    else {
                        final String year2 = id3v1Tag.year;
                        b2 = false;
                        if (year2 == null) {
                            return b2;
                        }
                        if (!this.year.equals(id3v1Tag.year)) {
                            b2 = false;
                            return b2;
                        }
                    }
                    if (this.comment == null) {
                        final String comment = id3v1Tag.comment;
                        b2 = false;
                        if (comment != null) {
                            return b2;
                        }
                    }
                    else {
                        final String comment2 = id3v1Tag.comment;
                        b2 = false;
                        if (comment2 == null) {
                            return b2;
                        }
                        if (!this.comment.equals(id3v1Tag.comment)) {
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
    
    public String getAlbum() {
        return this.album;
    }
    
    public String getArtist() {
        return this.artist;
    }
    
    public String getComment() {
        return this.comment;
    }
    
    public int getGenre() {
        return this.genre;
    }
    
    public String getGenreDescription() {
        try {
            return ID3v1Genres.GENRES[this.genre];
        }
        catch (ArrayIndexOutOfBoundsException ex) {
            return "Unknown";
        }
    }
    
    public String getTitle() {
        return this.title;
    }
    
    public String getTrack() {
        return this.track;
    }
    
    public String getVersion() {
        String s;
        if (this.track == null) {
            s = "0";
        }
        else {
            s = "1";
        }
        return s;
    }
    
    public String getYear() {
        return this.year;
    }
    
    public void packTag(final byte[] array) {
        Arrays.fill(array, 0);
        BufferTools.stringIntoByteBuffer("TAG", 0, 3, array, 0);
        this.packField(array, this.title, 30, 3);
        this.packField(array, this.artist, 30, 33);
        this.packField(array, this.album, 30, 63);
        this.packField(array, this.year, 4, 93);
        if (this.genre < 128) {
            array[127] = (byte)this.genre;
        }
        else {
            array[127] = (byte)(-256 + this.genre);
        }
        if (this.track == null) {
            this.packField(array, this.comment, 30, 97);
        }
        else {
            this.packField(array, this.comment, 28, 97);
            final String numericsOnly = this.numericsOnly(this.track);
            if (numericsOnly.length() > 0) {
                final int int1 = Integer.parseInt(numericsOnly.toString());
                if (int1 < 128) {
                    array[126] = (byte)int1;
                }
                else {
                    array[126] = (byte)(int1 - 256);
                }
            }
        }
    }
    
    public void setAlbum(final String album) {
        this.album = album;
    }
    
    public void setArtist(final String artist) {
        this.artist = artist;
    }
    
    public void setComment(final String comment) {
        this.comment = comment;
    }
    
    public void setGenre(final int genre) {
        this.genre = genre;
    }
    
    public void setTitle(final String title) {
        this.title = title;
    }
    
    public void setTrack(final String track) {
        this.track = track;
    }
    
    public void setYear(final String year) {
        this.year = year;
    }
    
    public void toBytes(final byte[] array) {
        this.packTag(array);
    }
    
    public byte[] toBytes() {
        final byte[] array = new byte[128];
        this.packTag(array);
        return array;
    }
}
