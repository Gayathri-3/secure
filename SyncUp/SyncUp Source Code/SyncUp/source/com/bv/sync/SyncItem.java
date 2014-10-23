package com.bv.sync;

public class SyncItem
{
    public final String absolutePath;
    public final boolean isFolder;
    public final long lastModified;
    public final long size;
    public final Type type;
    
    public SyncItem(final String absolutePath, final long lastModified, final Type type, final long size, final boolean isFolder) {
        super();
        this.absolutePath = absolutePath;
        this.lastModified = lastModified;
        this.type = type;
        this.size = size;
        this.isFolder = isFolder;
    }
    
    public String toString() {
        return String.valueOf(this.absolutePath) + " " + this.type;
    }
    
    public enum Type
    {
        Deleted("Deleted", 2), 
        LocalFile("LocalFile", 0), 
        RemoteFile("RemoteFile", 1);
    }
}
