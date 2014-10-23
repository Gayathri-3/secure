package com.mpatric.mp3agic;

public class ID3Wrapper
{
    private ID3v1 id3v1Tag;
    private ID3v2 id3v2Tag;
    
    public ID3Wrapper(final ID3v1 id3v1Tag, final ID3v2 id3v2Tag) {
        super();
        this.id3v1Tag = id3v1Tag;
        this.id3v2Tag = id3v2Tag;
    }
    
    public void clearComment() {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.clearFrameSet("COMM");
        }
        if (this.id3v1Tag != null) {
            this.id3v1Tag.setComment(null);
        }
    }
    
    public void clearCopyright() {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.clearFrameSet("TCOP");
        }
    }
    
    public void clearEncoder() {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.clearFrameSet("TENC");
        }
    }
    
    public String getAlbum() {
        String s;
        if (this.id3v2Tag != null && this.id3v2Tag.getAlbum() != null && this.id3v2Tag.getAlbum().length() > 0) {
            s = this.id3v2Tag.getAlbum();
        }
        else if (this.id3v1Tag != null) {
            s = this.id3v1Tag.getAlbum();
        }
        else {
            s = null;
        }
        return s;
    }
    
    public byte[] getAlbumImage() {
        byte[] albumImage;
        if (this.id3v2Tag != null) {
            albumImage = this.id3v2Tag.getAlbumImage();
        }
        else {
            albumImage = null;
        }
        return albumImage;
    }
    
    public String getAlbumImageMimeType() {
        String albumImageMimeType;
        if (this.id3v2Tag != null) {
            albumImageMimeType = this.id3v2Tag.getAlbumImageMimeType();
        }
        else {
            albumImageMimeType = null;
        }
        return albumImageMimeType;
    }
    
    public String getArtist() {
        String s;
        if (this.id3v2Tag != null && this.id3v2Tag.getArtist() != null && this.id3v2Tag.getArtist().length() > 0) {
            s = this.id3v2Tag.getArtist();
        }
        else if (this.id3v1Tag != null) {
            s = this.id3v1Tag.getArtist();
        }
        else {
            s = null;
        }
        return s;
    }
    
    public String getComment() {
        String s;
        if (this.id3v2Tag != null && this.id3v2Tag.getComment() != null && this.id3v2Tag.getComment().length() > 0) {
            s = this.id3v2Tag.getComment();
        }
        else if (this.id3v1Tag != null) {
            s = this.id3v1Tag.getComment();
        }
        else {
            s = null;
        }
        return s;
    }
    
    public String getComposer() {
        String composer;
        if (this.id3v2Tag != null) {
            composer = this.id3v2Tag.getComposer();
        }
        else {
            composer = null;
        }
        return composer;
    }
    
    public String getCopyright() {
        String copyright;
        if (this.id3v2Tag != null) {
            copyright = this.id3v2Tag.getCopyright();
        }
        else {
            copyright = null;
        }
        return copyright;
    }
    
    public String getEncoder() {
        String encoder;
        if (this.id3v2Tag != null) {
            encoder = this.id3v2Tag.getEncoder();
        }
        else {
            encoder = null;
        }
        return encoder;
    }
    
    public int getGenre() {
        int n = -1;
        if (this.id3v1Tag != null && this.id3v1Tag.getGenre() != n) {
            n = this.id3v1Tag.getGenre();
        }
        else if (this.id3v2Tag != null) {
            n = this.id3v2Tag.getGenre();
        }
        return n;
    }
    
    public String getGenreDescription() {
        String s;
        if (this.id3v1Tag != null) {
            s = this.id3v1Tag.getGenreDescription();
        }
        else if (this.id3v2Tag != null) {
            s = this.id3v2Tag.getGenreDescription();
        }
        else {
            s = null;
        }
        return s;
    }
    
    public ID3v1 getId3v1Tag() {
        return this.id3v1Tag;
    }
    
    public ID3v2 getId3v2Tag() {
        return this.id3v2Tag;
    }
    
    public String getOriginalArtist() {
        String originalArtist;
        if (this.id3v2Tag != null) {
            originalArtist = this.id3v2Tag.getOriginalArtist();
        }
        else {
            originalArtist = null;
        }
        return originalArtist;
    }
    
    public String getTitle() {
        String s;
        if (this.id3v2Tag != null && this.id3v2Tag.getTitle() != null && this.id3v2Tag.getTitle().length() > 0) {
            s = this.id3v2Tag.getTitle();
        }
        else if (this.id3v1Tag != null) {
            s = this.id3v1Tag.getTitle();
        }
        else {
            s = null;
        }
        return s;
    }
    
    public String getTrack() {
        String s;
        if (this.id3v2Tag != null && this.id3v2Tag.getTrack() != null && this.id3v2Tag.getTrack().length() > 0) {
            s = this.id3v2Tag.getTrack();
        }
        else if (this.id3v1Tag != null) {
            s = this.id3v1Tag.getTrack();
        }
        else {
            s = null;
        }
        return s;
    }
    
    public String getUrl() {
        String url;
        if (this.id3v2Tag != null) {
            url = this.id3v2Tag.getUrl();
        }
        else {
            url = null;
        }
        return url;
    }
    
    public String getYear() {
        String s;
        if (this.id3v2Tag != null && this.id3v2Tag.getYear() != null && this.id3v2Tag.getYear().length() > 0) {
            s = this.id3v2Tag.getYear();
        }
        else if (this.id3v1Tag != null) {
            s = this.id3v1Tag.getYear();
        }
        else {
            s = null;
        }
        return s;
    }
    
    public void setAlbum(final String s) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setAlbum(s);
        }
        if (this.id3v1Tag != null) {
            this.id3v1Tag.setAlbum(s);
        }
    }
    
    public void setAlbumImage(final byte[] array, final String s) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setAlbumImage(array, s);
        }
    }
    
    public void setArtist(final String s) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setArtist(s);
        }
        if (this.id3v1Tag != null) {
            this.id3v1Tag.setArtist(s);
        }
    }
    
    public void setComment(final String s) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setComment(s);
        }
        if (this.id3v1Tag != null) {
            this.id3v1Tag.setComment(s);
        }
    }
    
    public void setComposer(final String composer) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setComposer(composer);
        }
    }
    
    public void setCopyright(final String copyright) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setCopyright(copyright);
        }
    }
    
    public void setEncoder(final String encoder) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setEncoder(encoder);
        }
    }
    
    public void setGenre(final int n) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setGenre(n);
        }
        if (this.id3v1Tag != null) {
            this.id3v1Tag.setGenre(n);
        }
    }
    
    public void setOriginalArtist(final String originalArtist) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setOriginalArtist(originalArtist);
        }
    }
    
    public void setTitle(final String s) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setTitle(s);
        }
        if (this.id3v1Tag != null) {
            this.id3v1Tag.setTitle(s);
        }
    }
    
    public void setTrack(final String s) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setTrack(s);
        }
        if (this.id3v1Tag != null) {
            this.id3v1Tag.setTrack(s);
        }
    }
    
    public void setUrl(final String url) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setUrl(url);
        }
    }
    
    public void setYear(final String s) {
        if (this.id3v2Tag != null) {
            this.id3v2Tag.setYear(s);
        }
        if (this.id3v1Tag != null) {
            this.id3v1Tag.setYear(s);
        }
    }
}
