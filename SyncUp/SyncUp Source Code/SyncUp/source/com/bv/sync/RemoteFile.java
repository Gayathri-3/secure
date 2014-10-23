package com.bv.sync;

import java.io.*;
import jcifs.util.transport.*;
import java.net.*;
import jcifs.smb.*;

public class RemoteFile implements IFile
{
    private static transient int retryCount = 0;
    private static final long serialVersionUID = -7822570725067836924L;
    static transient int totalRetryCount;
    private transient SmbFile file;
    private transient NtlmPasswordAuthentication ntlm;
    private transient IFile parent;
    
    protected RemoteFile() {
        super();
    }
    
    public RemoteFile(final String s, final String s2, final String s3, final String s4) throws IOException {
        this(new NtlmPasswordAuthentication(s, s2, s3), s4);
    }
    
    private RemoteFile(final NtlmPasswordAuthentication ntlm, final String s) throws IOException {
        super();
        this.ntlm = ntlm;
        this.file = new SmbFile(s, ntlm);
        Retry.run((IORunnable<Object>)new IORunnable<Void>() {
            public Void run() throws IOException {
                RemoteFile.this.file.connect();
                return null;
            }
        });
    }
    
    RemoteFile(final SmbFile file, final IFile parent, final NtlmPasswordAuthentication ntlm) {
        super();
        this.file = file;
        this.parent = parent;
        this.ntlm = ntlm;
    }
    
    private boolean isShare(final SmbFile smbFile) throws SmbException {
        final int type = smbFile.getType();
        return (type & 0x40) == 0x0 && (type & 0x20) == 0x0 && (type & 0x10) == 0x0;
    }
    
    private void readObject(final ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        objectInputStream.defaultReadObject();
        final String s = (String)objectInputStream.readObject();
        this.ntlm = new NtlmPasswordAuthentication((String)objectInputStream.readObject(), (String)objectInputStream.readObject(), (String)objectInputStream.readObject());
        this.file = new SmbFile(s, this.ntlm);
    }
    
    public static void setRetryCount(final int retryCount) {
        RemoteFile.retryCount = retryCount;
    }
    
    private void writeObject(final ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.defaultWriteObject();
        objectOutputStream.writeObject(this.getAbsolutePath());
        objectOutputStream.writeObject(this.ntlm.getDomain());
        objectOutputStream.writeObject(this.ntlm.getUsername());
        objectOutputStream.writeObject(this.ntlm.getPassword());
    }
    
    public boolean canRead() throws IOException {
        return this.isShare(this.file) && Retry.run((IORunnable<Boolean>)new IORunnable<Boolean>() {
            public Boolean run() throws IOException {
                return RemoteFile.this.file.canRead();
            }
        });
    }
    
    public IFile createFile(final String s) throws IOException {
        String s2 = this.file.getURL().toString();
        if (!s2.endsWith("/")) {
            s2 = String.valueOf(s2) + "/";
        }
        final SmbFile smbFile = new SmbFile(String.valueOf(s2) + s, this.ntlm);
        Retry.run((IORunnable<Object>)new IORunnable<Void>() {
            public Void run() throws IOException {
                smbFile.connect();
                return null;
            }
        });
        return new RemoteFile(smbFile, this, this.ntlm);
    }
    
    public void delete() throws IOException {
        Retry.run((IORunnable<Object>)new IORunnable<Void>() {
            public Void run() throws IOException {
                RemoteFile.this.file.delete();
                return null;
            }
        });
    }
    
    public boolean equals(final Object o) {
        boolean equals;
        if (o == this) {
            equals = true;
        }
        else {
            equals = false;
            if (o != null) {
                final boolean b = o instanceof RemoteFile;
                equals = false;
                if (b) {
                    equals = ((RemoteFile)o).file.equals(this.file);
                }
            }
        }
        return equals;
    }
    
    public boolean exists() throws IOException {
        return Retry.run((IORunnable<Boolean>)new IORunnable<Boolean>() {
            public Boolean run() throws IOException {
                return RemoteFile.this.file.exists();
            }
        });
    }
    
    public String getAbsolutePath() {
        return this.file.getCanonicalPath();
    }
    
    public long getFreeSpace() throws IOException {
        return Retry.run((IORunnable<Long>)new IORunnable<Long>() {
            public Long run() throws IOException {
                return RemoteFile.this.file.getDiskFreeSpace();
            }
        });
    }
    
    public InputStream getInputStream() throws IOException {
        return Retry.run((IORunnable<InputStream>)new IORunnable<InputStream>() {
            public InputStream run() throws IOException {
                return new RetryInputStream(RemoteFile.this.file);
            }
        });
    }
    
    public long getLastModified() throws IOException {
        return Retry.run((IORunnable<Long>)new IORunnable<Long>() {
            public Long run() throws IOException {
                return RemoteFile.this.file.lastModified();
            }
        });
    }
    
    public String getName() {
        return this.file.getName();
    }
    
    public OutputStream getOutputStream() throws IOException {
        return Retry.run((IORunnable<OutputStream>)new IORunnable<OutputStream>() {
            public OutputStream run() throws IOException {
                return new RetryOutputStream(RemoteFile.this.file);
            }
        });
    }
    
    public IFile getParent() throws MalformedURLException {
        synchronized (this) {
            if (this.parent == null) {
                this.parent = new RemoteFile(new SmbFile(new File(this.getAbsolutePath()).getParent(), this.ntlm), null, this.ntlm);
            }
            return this.parent;
        }
    }
    
    public boolean isDirectory() throws IOException {
        return Retry.run((IORunnable<Boolean>)new IORunnable<Boolean>() {
            public Boolean run() throws IOException {
                return RemoteFile.this.file.isDirectory();
            }
        });
    }
    
    public boolean isFile() throws IOException {
        return Retry.run((IORunnable<Boolean>)new IORunnable<Boolean>() {
            public Boolean run() throws IOException {
                return RemoteFile.this.file.isFile();
            }
        });
    }
    
    public boolean isHidden() throws IOException {
        return Retry.run((IORunnable<Boolean>)new IORunnable<Boolean>() {
            public Boolean run() throws IOException {
                return RemoteFile.this.file.isHidden();
            }
        });
    }
    
    public boolean isSymlink() throws IOException {
        return false;
    }
    
    public long length() throws IOException {
        return Retry.run((IORunnable<Long>)new IORunnable<Long>() {
            public Long run() throws IOException {
                return RemoteFile.this.file.length();
            }
        });
    }
    
    public IFile[] listFiles() throws IOException {
        final SmbFile[] array = Retry.run((IORunnable<SmbFile[]>)new IORunnable<SmbFile[]>() {
            public SmbFile[] run() throws IOException {
                int i = 0;
                while (i < -1 + RemoteFile.retryCount) {
                    SmbFile[] array;
                    try {
                        array = RemoteFile.this.file.listFiles();
                    }
                    catch (SmbException ex) {
                        if (ex.getNtStatus() != -1073741816) {
                            throw ex;
                        }
                        RemoteFile.totalRetryCount += 1;
                        ++i;
                        continue;
                    }
                    return array;
                }
                return RemoteFile.this.file.listFiles();
            }
        });
        if (array == null) {
            throw new ErrorCodeException(2, this.getAbsolutePath());
        }
        final RemoteFile[] array2 = new RemoteFile[array.length];
        for (int i = 0; i < array2.length; ++i) {
            array2[i] = new RemoteFile(array[i], this, this.ntlm);
        }
        return array2;
    }
    
    public IFile[] listFiles(final IFileFilter fileFilter) throws IOException {
        final SmbFileFilter remoteFile$11 = new SmbFileFilter() {
            public boolean accept(final SmbFile smbFile) throws SmbException {
                try {
                    return fileFilter == null || fileFilter.accept(new RemoteFile(smbFile, RemoteFile.this, RemoteFile.this.ntlm));
                }
                catch (SmbException ex) {
                    throw ex;
                }
                catch (IOException ex3) {
                    final RuntimeException ex2 = new RuntimeException();
                    ex2.initCause(ex3);
                    throw ex2;
                }
            }
        };
        SmbFile[] array;
        try {
            array = Retry.run((IORunnable<SmbFile[]>)new IORunnable<SmbFile[]>() {
                public SmbFile[] run() throws IOException {
                    int i = 0;
                Label_0054_Outer:
                    while (i < RemoteFile.retryCount) {
                        while (true) {
                            if (i != 0) {
                                SmbFile[] array;
                                try {
                                    System.err.println("Retry " + i);
                                    array = RemoteFile.this.file.listFiles(remoteFile$11);
                                }
                                catch (SmbException ex) {
                                    if (ex.getNtStatus() != -1073741816) {
                                        throw ex;
                                    }
                                    ++i;
                                    continue Label_0054_Outer;
                                }
                                return array;
                            }
                            continue;
                        }
                    }
                    return RemoteFile.this.file.listFiles(remoteFile$11);
                }
            });
            if (array == null) {
                throw new ErrorCodeException(2, this.getAbsolutePath());
            }
        }
        catch (RuntimeException ex) {
            final Throwable cause = ex.getCause();
            if (cause != null && cause instanceof IOException) {
                throw (IOException)cause;
            }
            throw ex;
        }
        final RemoteFile[] array2 = new RemoteFile[array.length];
        for (int i = 0; i < array2.length; ++i) {
            array2[i] = new RemoteFile(array[i], this, this.ntlm);
        }
        return array2;
    }
    
    public void mkdir() throws IOException {
        Retry.run((IORunnable<Object>)new IORunnable<Void>() {
            public Void run() throws IOException {
                RemoteFile.this.file.mkdir();
                return null;
            }
        });
        String s = this.file.getCanonicalPath();
        if (s.charAt(-1 + s.length()) != '/') {
            s = String.valueOf(s) + "/";
        }
        synchronized (this) {
            this.file = new SmbFile(s, this.ntlm);
            // monitorexit(this)
            Retry.run((IORunnable<Object>)new IORunnable<Void>() {
                public Void run() throws IOException {
                    RemoteFile.this.file.connect();
                    return null;
                }
            });
        }
    }
    
    public IFile openFile(final String s) throws IOException {
        final RemoteFile remoteFile = new RemoteFile(this.ntlm, "smb://" + this.file.getServer() + "/" + s);
        if (!remoteFile.exists()) {
            throw new FileNotFoundException(s);
        }
        return remoteFile;
    }
    
    public void renameTo(final IFile file) throws IOException {
        if (!(file instanceof RemoteFile)) {
            throw new InvalidClassException(file.getClass().getName(), "Can not rename to non SMBFile");
        }
        Retry.run((IORunnable<Object>)new IORunnable<Void>() {
            public Void run() throws IOException {
                RemoteFile.this.file.renameTo(((RemoteFile)file).file);
                return null;
            }
        });
    }
    
    public void setLastModified(final long n) throws IOException {
        Retry.run((IORunnable<Object>)new IORunnable<Void>() {
            public Void run() throws IOException {
                RemoteFile.this.file.setLastModified(n);
                return null;
            }
        });
    }
    
    public String toString() {
        return this.getAbsolutePath();
    }
    
    private interface IORunnable<T>
    {
        T run() throws IOException;
    }
    
    private static class Retry
    {
        private static void handleRetry(final SmbException ex) throws IOException {
            final Throwable rootCause = ex.getRootCause();
            if (rootCause == null) {
                throw ex;
            }
            if (rootCause instanceof TransportException) {
                handleRetry((TransportException)rootCause);
            }
            else if (!isRetryException(rootCause)) {
                throw ex;
            }
        }
        
        private static void handleRetry(final TransportException ex) throws IOException {
            final Throwable rootCause = ex.getRootCause();
            if (rootCause != null) {
                if (rootCause instanceof TransportException) {
                    handleRetry((TransportException)rootCause);
                }
                else if (!isRetryException(rootCause)) {
                    throw ex;
                }
            }
        }
        
        private static boolean isRetryException(final Throwable t) {
            return t instanceof SocketTimeoutException || (t instanceof SocketException && "Socket closed".equals(t.getMessage()));
        }
        
        static <T> T run(final IORunnable<T> ioRunnable) throws IOException {
            int i = 0;
            while (i < -1 + RemoteFile.retryCount) {
                if (i > 0) {
                    System.out.println("Retry " + i);
                }
                T t;
                try {
                    t = ioRunnable.run();
                }
                catch (IOException ex) {
                    if (ex instanceof SmbException) {
                        handleRetry((SmbException)ex);
                    }
                    else if (ex instanceof TransportException) {
                        handleRetry((TransportException)ex);
                    }
                    else if (!isRetryException(ex)) {
                        throw ex;
                    }
                    RemoteFile.totalRetryCount += 1;
                    ++i;
                    continue;
                }
                return t;
            }
            return ioRunnable.run();
        }
    }
    
    class RetryInputStream extends SmbFileInputStream
    {
        RetryInputStream(final SmbFile smbFile) throws SmbException, MalformedURLException, UnknownHostException {
            super(smbFile);
        }
        
        private void superClose() throws IOException {
            super.close();
        }
        
        private int superRead(final byte[] array) throws IOException {
            return super.read(array);
        }
        
        public void close() throws IOException {
            Retry.run((IORunnable<Object>)new IORunnable<Void>() {
                public Void run() throws IOException {
                    RetryInputStream.this.superClose();
                    return null;
                }
            });
        }
        
        public int read(final byte[] array) throws IOException {
            return Retry.run((IORunnable<Integer>)new IORunnable<Integer>() {
                public Integer run() throws IOException {
                    return RetryInputStream.this.superRead(array);
                }
            });
        }
    }
    
    class RetryOutputStream extends SmbFileOutputStream
    {
        RetryOutputStream(final SmbFile smbFile) throws SmbException, MalformedURLException, UnknownHostException {
            super(smbFile);
        }
        
        private void superClose() throws IOException {
            super.close();
        }
        
        private void superWrite(final byte[] array, final int n, final int n2) throws IOException {
            super.write(array, n, n2);
        }
        
        public void close() throws IOException {
            Retry.run((IORunnable<Object>)new IORunnable<Void>() {
                public Void run() throws IOException {
                    RetryOutputStream.this.superClose();
                    return null;
                }
            });
        }
        
        public void write(final byte[] array, final int n, final int n2) throws IOException {
            Retry.run((IORunnable<Object>)new IORunnable<Void>() {
                public Void run() throws IOException {
                    RetryOutputStream.this.superWrite(array, n, n2);
                    return null;
                }
            });
        }
    }
}
