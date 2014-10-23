package com.mpatric.mp3agic;

public class Version
{
    private static final int MAJOR_VERSION = 0;
    private static final int MINOR_VERSION = 6;
    private static final String URL = "http://github.com/mpatric/mp3agic";
    
    public static String asString() {
        return String.valueOf(getVersion()) + " - " + getUrl();
    }
    
    public static int getMajorVersion() {
        return 0;
    }
    
    public static int getMinorVersion() {
        return 6;
    }
    
    public static String getUrl() {
        return "http://github.com/mpatric/mp3agic";
    }
    
    public static String getVersion() {
        return "0.6";
    }
}
