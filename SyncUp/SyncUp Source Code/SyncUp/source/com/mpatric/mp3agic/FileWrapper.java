package com.mpatric.mp3agic;

import java.io.*;

public class FileWrapper
{
    protected File file;
    protected String filename;
    protected long lastModified;
    protected long length;
    
    protected FileWrapper() {
        super();
    }
    
    public FileWrapper(final String filename) throws IOException {
        super();
        this.filename = filename;
        this.init();
        this.length = this.file.length();
        this.lastModified = this.file.lastModified();
    }
    
    private void init() throws IOException {
        this.file = new File(this.filename);
        if (!this.file.exists()) {
            throw new FileNotFoundException("File not found " + this.filename);
        }
        if (!this.file.canRead()) {
            throw new IOException("File not readable");
        }
    }
    
    public String getFilename() {
        return this.filename;
    }
    
    public long getLastModified() {
        return this.lastModified;
    }
    
    public long getLength() {
        return this.length;
    }
}
