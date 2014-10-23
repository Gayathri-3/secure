package com.bv.sync;

import java.util.*;
import java.io.*;

public class LocalFile implements IFile
{
    private static final long serialVersionUID = 3440211277315123927L;
    protected final File file;
    
    public LocalFile(final File file) {
        super();
        this.file = file;
    }
    
    public LocalFile(final String s) {
        super();
        this.file = new File(s);
    }
    
    private boolean isReadable() throws IOException {
        try {
            new FileInputStream(this.file).close();
            return true;
        }
        catch (FileNotFoundException ex) {
            if (ex.getMessage().endsWith("(Access is denied)")) {
                return false;
            }
            throw ex;
        }
    }
    
    public boolean canRead() throws IOException {
        if (!Utils.isWindows()) {
            return this.file.canRead();
        }
        boolean b;
        if (this.file.isDirectory()) {
            b = (this.file.list() != null);
        }
        else {
            if (!this.file.isFile()) {
                return this.file.canRead();
            }
            b = this.isReadable();
        }
        return b;
        b = this.file.canRead();
        return b;
    }
    
    public IFile createFile(final String s) {
        return this.getNewFile(new File(this.file, s));
    }
    
    public void delete() throws IOException {
        if (!this.file.delete()) {
            throw new ErrorCodeException(5, this.getAbsolutePath());
        }
    }
    
    public boolean equals(final Object o) {
        boolean equals;
        if (o == this) {
            equals = true;
        }
        else {
            equals = false;
            if (o != null) {
                final boolean b = o instanceof LocalFile;
                equals = false;
                if (b) {
                    equals = this.file.equals(((LocalFile)o).file);
                }
            }
        }
        return equals;
    }
    
    public boolean exists() {
        return this.file.exists();
    }
    
    public String getAbsolutePath() {
        return this.file.getAbsolutePath();
    }
    
    public long getFreeSpace() {
        return this.file.getFreeSpace();
    }
    
    public InputStream getInputStream() throws FileNotFoundException {
        return new FileInputStream(this.file);
    }
    
    public long getLastModified() {
        return this.file.lastModified();
    }
    
    public String getName() {
        return this.file.getName();
    }
    
    protected LocalFile getNewFile(final File file) {
        return new LocalFile(file);
    }
    
    public OutputStream getOutputStream() throws FileNotFoundException {
        return new FileOutputStream(this.file);
    }
    
    public IFile getParent() {
        return this.getNewFile(this.file.getParentFile());
    }
    
    public boolean isDirectory() {
        return this.file.isDirectory();
    }
    
    public boolean isFile() {
        return this.file.isFile();
    }
    
    public boolean isHidden() throws IOException {
        return this.file.isHidden();
    }
    
    public boolean isSymlink() throws IOException {
        return !this.file.getAbsolutePath().equals(this.file.getCanonicalPath());
    }
    
    public long length() {
        return this.file.length();
    }
    
    public IFile[] listFiles() throws IOException {
        final File[] listFiles = this.file.listFiles();
        if (listFiles == null) {
            throw new ErrorCodeException(2, this.file.getCanonicalPath());
        }
        final LocalFile[] array = new LocalFile[listFiles.length];
        for (int i = 0; i < array.length; ++i) {
            array[i] = this.getNewFile(listFiles[i]);
        }
        return array;
    }
    
    public IFile[] listFiles(final IFileFilter fileFilter) throws IOException {
        final String[] list = this.file.list();
        if (list == null) {
            throw new ErrorCodeException(2, this.file.getCanonicalPath());
        }
        final ArrayList<LocalFile> list2 = new ArrayList<LocalFile>();
        for (int i = 0; i < list.length; ++i) {
            final LocalFile newFile = this.getNewFile(new File(this.file, list[i]));
            list[i] = null;
            if (fileFilter != null && fileFilter.accept(newFile)) {
                list2.add(newFile);
            }
        }
        return list2.toArray(new IFile[list2.size()]);
    }
    
    public void mkdir() throws IOException {
        if (!this.file.mkdir()) {
            throw new ErrorCodeException(3, this.file.getAbsolutePath());
        }
    }
    
    public IFile openFile(final String s) throws IOException {
        final LocalFile newFile = this.getNewFile(new File(s));
        if (!newFile.exists()) {
            throw new FileNotFoundException(s);
        }
        return newFile;
    }
    
    public void renameTo(final IFile file) throws IOException {
        if (!(file instanceof LocalFile)) {
            throw new InvalidClassException(file.getClass().getName(), "Invalid class");
        }
        if (!this.file.renameTo(((LocalFile)file).file)) {
            throw new ErrorCodeException(4, String.valueOf(this.file.getAbsolutePath()) + "\n" + file.getAbsolutePath());
        }
    }
    
    public void setLastModified(final long lastModified) throws IOException {
        if (!this.file.setLastModified(lastModified)) {
            throw new ErrorCodeException(1, this.getAbsolutePath());
        }
    }
    
    public String toString() {
        return this.getAbsolutePath();
    }
}
