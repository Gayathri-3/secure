package com.mpatric.mp3agic;

import java.util.*;

public interface ID3v2 extends ID3v1
{
    void clearFrameSet(String p0);
    
    byte[] getAlbumImage();
    
    String getAlbumImageMimeType();
    
    String getComposer();
    
    String getCopyright();
    
    int getDataLength();
    
    String getEncoder();
    
    Map<String, ID3v2FrameSet> getFrameSets();
    
    String getItunesComment();
    
    int getLength();
    
    boolean getObseleteFormat();
    
    String getOriginalArtist();
    
    boolean getPadding();
    
    String getPublisher();
    
    String getUrl();
    
    boolean hasFooter();
    
    boolean hasUnsynchronisation();
    
    void setAlbumImage(byte[] p0, String p1);
    
    void setComposer(String p0);
    
    void setCopyright(String p0);
    
    void setEncoder(String p0);
    
    void setFooter(boolean p0);
    
    void setItunesComment(String p0);
    
    void setOriginalArtist(String p0);
    
    void setPadding(boolean p0);
    
    void setPublisher(String p0);
    
    void setUnsynchronisation(boolean p0);
    
    void setUrl(String p0);
}
