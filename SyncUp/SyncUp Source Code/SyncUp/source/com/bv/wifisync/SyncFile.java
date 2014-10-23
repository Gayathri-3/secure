package com.bv.wifisync;

import java.util.*;
import java.io.*;

class SyncFile implements Serializable
{
    private static final long serialVersionUID = 4568870306782695279L;
    final Boolean isFolder;
    final long modifiedTime;
    final String path;
    final long size;
    
    public SyncFile(final String path, final long size, final long modifiedTime, final boolean b) {
        super();
        this.path = path;
        this.size = size;
        this.modifiedTime = modifiedTime;
        this.isFolder = b;
    }
    
    public static List<SyncFile> read(final File file) throws StreamCorruptedException, FileNotFoundException, IOException, ClassNotFoundException {
        return (List<SyncFile>)Utils.readObjectFromFile(file, true);
    }
}
