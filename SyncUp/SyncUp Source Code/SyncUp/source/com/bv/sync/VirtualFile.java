package com.bv.sync;

import java.io.*;
import java.util.*;

public class VirtualFile implements IFile
{
    private static final long serialVersionUID = -5435114492609870839L;
    private boolean canRead;
    private boolean exists;
    private Set<IFile> files;
    private boolean isDirectory;
    private boolean isFile;
    private boolean isHidden;
    private long lastModified;
    private long length;
    private String name;
    private transient VirtualFile parent;
    private String path;
    
    public VirtualFile(final IFile file) throws IOException {
        int i = 0;
        super();
        this.files = Collections.synchronizedSet(new HashSet<IFile>());
        this.path = file.getAbsolutePath();
        this.isDirectory = file.isDirectory();
        this.isFile = !file.isDirectory();
        this.isHidden = file.isHidden();
        this.lastModified = file.getLastModified();
        this.length = file.length();
        this.canRead = file.canRead();
        this.exists = file.exists();
        this.files = new HashSet<IFile>();
        if (file.isDirectory()) {
            for (IFile[] listFiles = file.listFiles(); i < listFiles.length; ++i) {
                this.files.add(new VirtualFile(listFiles[i], this));
            }
        }
    }
    
    private VirtualFile(final IFile file, final VirtualFile parent) throws IOException {
        this(file);
        this.parent = parent;
    }
    
    private VirtualFile(final VirtualFile parent) {
        super();
        this.files = Collections.synchronizedSet(new HashSet<IFile>());
        this.parent = parent;
    }
    
    private void add(final VirtualFile virtualFile) {
        if (this.files == null) {
            this.files = Collections.synchronizedSet(new HashSet<IFile>());
        }
        this.files.add(virtualFile);
    }
    
    private void remove(final VirtualFile virtualFile) {
        synchronized (this.files) {
            final Iterator<IFile> iterator = this.files.iterator();
            while (iterator.hasNext()) {
                if (iterator.next() == virtualFile) {
                    iterator.remove();
                }
            }
        }
    }
    
    public boolean canRead() throws IOException {
        return this.canRead;
    }
    
    public IFile createFile(final String s) throws IOException {
        if (!this.isDirectory) {
            throw new IOException("Not a directory");
        }
        Label_0057: {
            if (this.files == null) {
                break Label_0057;
            }
            synchronized (this.files) {
                for (final IFile file : this.files) {
                    if (file.getName().equals(s)) {
                        // monitorexit(this.files)
                        return file;
                    }
                }
                // monitorexit(this.files)
                final VirtualFile virtualFile = new VirtualFile(this);
                virtualFile.canRead = false;
                virtualFile.isHidden = false;
                virtualFile.isDirectory = false;
                virtualFile.isFile = false;
                virtualFile.lastModified = System.currentTimeMillis();
                virtualFile.path = String.valueOf(this.path) + File.separator + s;
                this.files.add(virtualFile);
                return virtualFile;
            }
        }
    }
    
    public void delete() throws IOException {
        this.parent.remove(this);
    }
    
    public boolean exists() throws IOException {
        return this.exists;
    }
    
    public String getAbsolutePath() {
        return this.path;
    }
    
    public long getFreeSpace() throws IOException {
        return Long.MAX_VALUE;
    }
    
    public InputStream getInputStream() throws IOException {
        return null;
    }
    
    public long getLastModified() throws IOException {
        return this.lastModified;
    }
    
    public String getName() {
        String s;
        if (this.name == null) {
            s = new File(this.path).getName();
        }
        else {
            s = this.name;
        }
        return s;
    }
    
    public OutputStream getOutputStream() throws IOException {
        return null;
    }
    
    public IFile getParent() throws IOException {
        return this.parent;
    }
    
    public boolean isDirectory() throws IOException {
        return this.isDirectory;
    }
    
    public boolean isFile() throws IOException {
        return this.isFile;
    }
    
    public boolean isHidden() throws IOException {
        return this.isHidden;
    }
    
    public boolean isSymlink() throws IOException {
        return false;
    }
    
    public long length() throws IOException {
        return this.length;
    }
    
    public IFile[] listFiles() throws IOException {
        return this.files.toArray(new IFile[this.files.size()]);
    }
    
    public IFile[] listFiles(final IFileFilter fileFilter) throws IOException {
        final IFile[] listFiles = this.listFiles();
        final ArrayList<IFile> list = new ArrayList<IFile>();
        for (final IFile file : listFiles) {
            if (fileFilter != null && fileFilter.accept(file)) {
                list.add(file);
            }
        }
        return list.toArray(new IFile[list.size()]);
    }
    
    public void mkdir() throws IOException {
        this.isDirectory = true;
        this.exists = true;
        this.canRead = true;
        this.parent.add(this);
    }
    
    public IFile openFile(final String s) throws IOException {
        return null;
    }
    
    public void renameTo(final IFile file) throws IOException {
        this.parent.remove(this);
        final VirtualFile virtualFile = (VirtualFile)file;
        virtualFile.parent.remove(virtualFile);
        virtualFile.parent.add(this);
        final String name = file.getName();
        if (!this.getName().equals(name)) {
            this.name = name;
        }
    }
    
    public void setLastModified(final long lastModified) throws IOException {
        this.lastModified = lastModified;
    }
    
    public String toString() {
        return this.getAbsolutePath();
    }
}
