package com.bv.sync;

import junit.framework.*;
import jcifs.smb.*;
import java.io.*;
import java.net.*;
import jcifs.util.transport.*;

public class RemoteFileTest extends TestCase
{
    static int RETRY_COUNT;
    
    static {
        RemoteFile.setRetryCount(RemoteFileTest.RETRY_COUNT = 10);
    }
    
    private void testRetry(final IORunnable ioRunnable) {
        this.testRetry(ioRunnable, new TimeoutSmbException((TimeoutSmbException)null));
        this.testRetry(ioRunnable, new SocketClosedException((SocketClosedException)null));
        this.testRetry(ioRunnable, new TransportTimeoutException((TransportTimeoutException)null));
        this.testRetry(ioRunnable, new TransportSocketClosedException((TransportSocketClosedException)null));
    }
    
    private void testRetry(final IORunnable p0, final SmbException p1) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: new             Lcom/bv/sync/RemoteFileTest$RetrySmbFile;
        //     3: dup            
        //     4: aload_0        
        //     5: aload_2        
        //     6: invokespecial   com/bv/sync/RemoteFileTest$RetrySmbFile.<init>:(Lcom/bv/sync/RemoteFileTest;Ljcifs/smb/SmbException;)V
        //     9: astore_3       
        //    10: aload_3        
        //    11: astore          4
        //    13: new             Lcom/bv/sync/RemoteFile;
        //    16: dup            
        //    17: aload           4
        //    19: aconst_null    
        //    20: aconst_null    
        //    21: invokespecial   com/bv/sync/RemoteFile.<init>:(Ljcifs/smb/SmbFile;Lcom/bv/sync/IFile;Ljcifs/smb/NtlmPasswordAuthentication;)V
        //    24: astore          5
        //    26: aload_1        
        //    27: aload           5
        //    29: invokevirtual   com/bv/sync/RemoteFileTest$IORunnable.run:(Lcom/bv/sync/RemoteFile;)V
        //    32: getstatic       com/bv/sync/RemoteFileTest.RETRY_COUNT:I
        //    35: aload           4
        //    37: getfield        com/bv/sync/RemoteFileTest$RetrySmbFile.retryCount:I
        //    40: invokestatic    com/bv/sync/RemoteFileTest.assertEquals:(II)V
        //    43: return         
        //    44: astore          7
        //    46: aload           7
        //    48: invokevirtual   java/net/MalformedURLException.printStackTrace:()V
        //    51: aconst_null    
        //    52: astore          4
        //    54: goto            13
        //    57: astore          6
        //    59: goto            32
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                            
        //  -----  -----  -----  -----  --------------------------------
        //  0      10     44     57     Ljava/net/MalformedURLException;
        //  26     32     57     62     Ljava/io/IOException;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0032:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2607)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:100)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:668)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:567)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:493)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:460)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:105)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:55)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:271)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:203)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:103)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
    
    public void testCanRead() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.canRead();
            }
        });
    }
    
    public void testDelete() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.delete();
            }
        });
    }
    
    public void testExists() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.exists();
            }
        });
    }
    
    public void testGetLastModified() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.getLastModified();
            }
        });
    }
    
    public void testGetOutputStream() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.getOutputStream();
            }
        });
    }
    
    public void testIsDirectory() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.isDirectory();
            }
        });
    }
    
    public void testIsHidden() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.isHidden();
            }
        });
    }
    
    public void testLength() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.length();
            }
        });
    }
    
    public void testListFiles() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.listFiles();
            }
        });
    }
    
    public void testMkDir() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.mkdir();
            }
        });
    }
    
    public void testRenameTo() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.renameTo(new RemoteFile(null, null, null));
            }
        });
    }
    
    public void testSetlastModified() {
        this.testRetry((IORunnable)new IORunnable() {
            void run(final RemoteFile remoteFile) throws IOException {
                remoteFile.setLastModified(0L);
            }
        });
    }
    
    private abstract class IORunnable
    {
        abstract void run(final RemoteFile p0) throws IOException;
    }
    
    private class RetryException extends SmbException
    {
        private RetryException() {
            super(1, false);
        }
    }
    
    private class RetrySmbFile extends SmbFile
    {
        private final SmbException exception;
        int retryCount;
        
        public RetrySmbFile(final SmbException exception) throws MalformedURLException {
            super("smb://some/file");
            this.exception = exception;
        }
        
        private void throwException() throws SmbException {
            this.retryCount += 1;
            throw this.exception;
        }
        
        public boolean canRead() throws SmbException {
            this.throwException();
            return true;
        }
        
        public boolean canWrite() throws SmbException {
            this.throwException();
            return true;
        }
        
        public void connect() throws IOException {
            this.throwException();
        }
        
        public void copyTo(final SmbFile smbFile) throws SmbException {
            this.throwException();
            super.copyTo(smbFile);
        }
        
        public void createNewFile() throws SmbException {
            this.throwException();
            super.createNewFile();
        }
        
        public void delete() throws SmbException {
            this.throwException();
        }
        
        public boolean exists() throws SmbException {
            this.throwException();
            return true;
        }
        
        public InputStream getInputStream() throws IOException {
            this.throwException();
            return null;
        }
        
        public OutputStream getOutputStream() throws IOException {
            this.throwException();
            return super.getOutputStream();
        }
        
        public int getType() throws SmbException {
            return 8;
        }
        
        public boolean isDirectory() throws SmbException {
            this.throwException();
            return true;
        }
        
        public boolean isHidden() throws SmbException {
            this.throwException();
            return super.isHidden();
        }
        
        public long lastModified() throws SmbException {
            this.throwException();
            return 0L;
        }
        
        public long length() throws SmbException {
            this.throwException();
            return super.length();
        }
        
        public SmbFile[] listFiles() throws SmbException {
            this.throwException();
            return super.listFiles();
        }
        
        public void mkdir() throws SmbException {
            this.throwException();
            super.mkdir();
        }
        
        public void renameTo(final SmbFile smbFile) throws SmbException {
            this.throwException();
            super.renameTo(smbFile);
        }
        
        public void setLastModified(final long lastModified) throws SmbException {
            this.throwException();
            super.setLastModified(lastModified);
        }
    }
    
    private final class SocketClosedException extends RetryException
    {
        private SocketClosedException() {
            super((RetryException)null);
        }
        
        public Throwable getRootCause() {
            return new SocketException("Socket closed");
        }
    }
    
    private final class TimeoutSmbException extends RetryException
    {
        private TimeoutSmbException() {
            super((RetryException)null);
        }
        
        public Throwable getRootCause() {
            return new SocketTimeoutException();
        }
    }
    
    private final class TransportSocketClosedException extends RetryException
    {
        private TransportSocketClosedException() {
            super((RetryException)null);
        }
        
        public Throwable getRootCause() {
            return new TransportException() {
                public Throwable getRootCause() {
                    return new SocketException("Socket closed");
                }
            };
        }
    }
    
    private final class TransportTimeoutException extends RetryException
    {
        private TransportTimeoutException() {
            super((RetryException)null);
        }
        
        public Throwable getRootCause() {
            return new TransportException() {
                public Throwable getRootCause() {
                    return new SocketTimeoutException();
                }
            };
        }
    }
}
