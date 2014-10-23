package com.bv.sync;

import java.io.*;

public interface IFile extends Serializable
{
    public static final String CAN_NOT_READ_DIRECTORY = "Can not read directory: ";
    
    boolean canRead() throws IOException;
    
    IFile createFile(String p0) throws IOException;
    
    void delete() throws IOException;
    
    boolean exists() throws IOException;
    
    String getAbsolutePath();
    
    long getFreeSpace() throws IOException;
    
    InputStream getInputStream() throws IOException;
    
    long getLastModified() throws IOException;
    
    String getName();
    
    OutputStream getOutputStream() throws IOException;
    
    IFile getParent() throws IOException;
    
    boolean isDirectory() throws IOException;
    
    boolean isFile() throws IOException;
    
    boolean isHidden() throws IOException;
    
    boolean isSymlink() throws IOException;
    
    long length() throws IOException;
    
    IFile[] listFiles() throws IOException;
    
    IFile[] listFiles(IFileFilter p0) throws IOException;
    
    void mkdir() throws IOException;
    
    IFile openFile(String p0) throws IOException;
    
    void renameTo(IFile p0) throws IOException;
    
    void setLastModified(long p0) throws IOException;
}
