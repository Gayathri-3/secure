package com.mpatric.mp3agic;

public interface ID3v1
{
    String getAlbum();
    
    String getArtist();
    
    String getComment();
    
    int getGenre();
    
    String getGenreDescription();
    
    String getTitle();
    
    String getTrack();
    
    String getVersion();
    
    String getYear();
    
    void setAlbum(String p0);
    
    void setArtist(String p0);
    
    void setComment(String p0);
    
    void setGenre(int p0);
    
    void setTitle(String p0);
    
    void setTrack(String p0);
    
    void setYear(String p0);
    
    byte[] toBytes() throws NotSupportedException;
}
