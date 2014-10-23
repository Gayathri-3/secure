package com.bv.sync;

import java.util.concurrent.*;
import java.util.*;
import java.io.*;

public class FileManager
{
    private boolean canceled;
    private long currentSize;
    private ProgressNotification progress;
    private SizeCalculator sizeCalculator;
    private List<SyncItem> syncResult;
    
    FileManager(final List<SyncItem> syncResult) {
        super();
        this.syncResult = syncResult;
    }
    
    private void copy(final IFile file, final IFile file2, final boolean b) throws IOException {
        if (this.canceled) {
            throw new CancellationException();
        }
        if (file.isDirectory()) {
            this.copyDir(file, file2, b);
        }
        else {
            this.copyFile(file, file2, b);
        }
    }
    
    public static void copy(final IFile[] array, final IFile file, final ProgressNotification progressNotification, final List<SyncItem> list) throws IOException {
        new FileManager(list).copy(array, file, false, progressNotification);
    }
    
    private void copyBytes(final IFile file, final IFile file2, final boolean b) throws IOException {
        while (true) {
            final byte[] array = new byte[61440];
            final OutputStream outputStream = file2.getOutputStream();
            while (true) {
                Label_0120: {
                    try {
                        final InputStream inputStream = file.getInputStream();
                        try {
                            while (true) {
                                final int read = inputStream.read(array);
                                if (read == -1) {
                                    break;
                                }
                                outputStream.write(array, 0, read);
                                if (!b) {
                                    break Label_0120;
                                }
                                final ProgressNotification.ProgressAction progressAction = ProgressNotification.ProgressAction.Moving;
                                this.updateProgress(progressAction, read, file);
                            }
                            inputStream.close();
                            outputStream.close();
                            if (1 == 0) {
                                file2.delete();
                            }
                            return;
                        }
                        finally {
                            inputStream.close();
                        }
                    }
                    finally {
                        outputStream.close();
                        if (0 == 0) {
                            file2.delete();
                        }
                    }
                }
                final ProgressNotification.ProgressAction progressAction = ProgressNotification.ProgressAction.Copying;
                continue;
            }
        }
    }
    
    private IFile copyDir(final IFile file, final IFile file2, final boolean b) throws IOException {
        IFile file3 = null;
        if (b) {
            file3 = this.tryMove(file, file2);
        }
        if (file3 == null) {
            file3 = file2.createFile(file.getName());
            if (!file3.exists()) {
                System.out.println("Creating dir: " + file3.getAbsolutePath());
                file3.mkdir();
            }
            this.copyFiles(file, file3, b);
            if (b) {
                file.delete();
            }
            this.updateSyncResult(file, file2, file3);
        }
        return file3;
    }
    
    private IFile copyFile(final IFile p0, final IFile p1, final boolean p2) throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aconst_null    
        //     1: astore          4
        //     3: iload_3        
        //     4: ifeq            15
        //     7: aload_0        
        //     8: aload_1        
        //     9: aload_2        
        //    10: invokespecial   com/bv/sync/FileManager.tryMove:(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Lcom/bv/sync/IFile;
        //    13: astore          4
        //    15: aload           4
        //    17: ifnonnull       185
        //    20: aload_2        
        //    21: new             Ljava/lang/StringBuilder;
        //    24: dup            
        //    25: aload_1        
        //    26: invokeinterface com/bv/sync/IFile.getName:()Ljava/lang/String;
        //    31: invokestatic    java/lang/String.valueOf:(Ljava/lang/Object;)Ljava/lang/String;
        //    34: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    37: ldc             "_(!).(!)_tmp"
        //    39: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    42: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    45: invokeinterface com/bv/sync/IFile.createFile:(Ljava/lang/String;)Lcom/bv/sync/IFile;
        //    50: astore          5
        //    52: aload_0        
        //    53: aload_1        
        //    54: aload           5
        //    56: iload_3        
        //    57: invokespecial   com/bv/sync/FileManager.copyBytes:(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V
        //    60: aload_2        
        //    61: aload_1        
        //    62: invokeinterface com/bv/sync/IFile.getName:()Ljava/lang/String;
        //    67: invokeinterface com/bv/sync/IFile.createFile:(Ljava/lang/String;)Lcom/bv/sync/IFile;
        //    72: astore          4
        //    74: aload           4
        //    76: invokeinterface com/bv/sync/IFile.exists:()Z
        //    81: ifeq            91
        //    84: aload           4
        //    86: invokeinterface com/bv/sync/IFile.delete:()V
        //    91: aload           5
        //    93: aload           4
        //    95: invokeinterface com/bv/sync/IFile.renameTo:(Lcom/bv/sync/IFile;)V
        //   100: aload_1        
        //   101: invokeinterface com/bv/sync/IFile.getLastModified:()J
        //   106: lconst_0       
        //   107: lcmp           
        //   108: iflt            124
        //   111: aload           4
        //   113: aload_1        
        //   114: invokeinterface com/bv/sync/IFile.getLastModified:()J
        //   119: invokeinterface com/bv/sync/IFile.setLastModified:(J)V
        //   124: getstatic       java/lang/System.out:Ljava/io/PrintStream;
        //   127: new             Ljava/lang/StringBuilder;
        //   130: dup            
        //   131: ldc             "Creating file:"
        //   133: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   136: aload           4
        //   138: invokeinterface com/bv/sync/IFile.getAbsolutePath:()Ljava/lang/String;
        //   143: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   146: ldc             ", setting modified: "
        //   148: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   151: aload           4
        //   153: invokeinterface com/bv/sync/IFile.getLastModified:()J
        //   158: invokevirtual   java/lang/StringBuilder.append:(J)Ljava/lang/StringBuilder;
        //   161: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   164: invokevirtual   java/io/PrintStream.println:(Ljava/lang/String;)V
        //   167: iload_3        
        //   168: ifeq            177
        //   171: aload_1        
        //   172: invokeinterface com/bv/sync/IFile.delete:()V
        //   177: aload_0        
        //   178: aload_1        
        //   179: aload_2        
        //   180: aload           4
        //   182: invokespecial   com/bv/sync/FileManager.updateSyncResult:(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
        //   185: aload           4
        //   187: areturn        
        //   188: astore          6
        //   190: aload           6
        //   192: invokevirtual   jcifs/smb/SmbException.getNtStatus:()I
        //   195: ldc             -1073741816
        //   197: if_icmpeq       203
        //   200: aload           6
        //   202: athrow         
        //   203: getstatic       java/lang/System.err:Ljava/io/PrintStream;
        //   206: ldc             "Retrying copy file on invalid handle"
        //   208: invokevirtual   java/io/PrintStream.println:(Ljava/lang/String;)V
        //   211: aload_0        
        //   212: aload_1        
        //   213: aload           5
        //   215: iload_3        
        //   216: invokespecial   com/bv/sync/FileManager.copyBytes:(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V
        //   219: goto            60
        //   222: astore          7
        //   224: goto            124
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                    
        //  -----  -----  -----  -----  ------------------------
        //  52     60     188    222    Ljcifs/smb/SmbException;
        //  100    124    222    227    Ljava/io/IOException;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0124:
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
    
    private void copyFiles(final IFile file, final IFile file2, final boolean b) throws IOException {
        final IFile[] listFiles = file.listFiles(new IFileFilter() {
            public boolean accept(final IFile file) throws IOException {
                if (FileManager.this.canceled) {
                    throw new CancellationException();
                }
                final boolean directory = file.isDirectory();
                if (!directory) {
                    FileManager.this.copy(file, file2, b);
                }
                return directory;
            }
        });
        for (int i = 0; i < listFiles.length; ++i) {
            this.copyDir(listFiles[i], file2, b);
        }
    }
    
    private void delete(final IFile file, final boolean b) throws IOException {
        final String absolutePath = file.getAbsolutePath();
        System.err.println("Removing: " + absolutePath);
        final SyncItem syncItem = new SyncItem(absolutePath, file.getLastModified(), SyncItem.Type.Deleted, file.length(), b);
        file.delete();
        this.updateProgress(ProgressNotification.ProgressAction.Deleting, file);
        if (this.syncResult != null) {
            this.syncResult.add(syncItem);
        }
    }
    
    public static void delete(final IFile[] array, final ProgressNotification progressNotification, final List<SyncItem> list) throws IOException {
        new FileManager(list).delete(array, progressNotification);
    }
    
    private void deleteDir(final IFile file) throws IOException {
        final IFile[] listFiles = file.listFiles(new IFileFilter() {
            public boolean accept(final IFile file) throws IOException {
                if (FileManager.this.canceled) {
                    throw new CancellationException();
                }
                final boolean directory = file.isDirectory();
                if (!directory) {
                    FileManager.this.delete(file, false);
                }
                return directory;
            }
        });
        for (int i = 0; i < listFiles.length; ++i) {
            this.deleteDir(listFiles[i]);
        }
        this.delete(file, true);
    }
    
    private void enumerateMovedFiles(final IFile file, final List<SyncItem> list, final SyncItem.Type type) throws IOException {
        final boolean directory = file.isDirectory();
        if (directory) {
            for (final IFile file2 : file.listFiles()) {
                if (file2.isDirectory()) {
                    this.enumerateMovedFiles(file2, list, type);
                }
                else {
                    list.add(new SyncItem(file2.getAbsolutePath(), file2.getLastModified(), type, file2.length(), false));
                }
            }
        }
        list.add(new SyncItem(file.getAbsolutePath(), file.getLastModified(), type, file.length(), directory));
    }
    
    public static void move(final IFile[] array, final IFile file, final ProgressNotification progressNotification, final List<SyncItem> list) throws IOException {
        new FileManager(list).copy(array, file, true, progressNotification);
    }
    
    private IFile tryMove(final IFile file, final IFile file2) {
        int n;
        if ((!(file instanceof LocalFile) || !(file2 instanceof LocalFile)) && (!(file instanceof RemoteFile) || !(file2 instanceof RemoteFile))) {
            n = 0;
        }
        else {
            n = 1;
        }
        if (n != 0) {
            try {
                final IFile file3 = file2.createFile(file.getName());
                final ArrayList<SyncItem> list = new ArrayList<SyncItem>();
                SyncItem.Type type;
                if (file2 instanceof LocalFile) {
                    type = SyncItem.Type.LocalFile;
                }
                else {
                    type = SyncItem.Type.RemoteFile;
                }
                this.enumerateMovedFiles(file, list, type);
                file.renameTo(file3);
                this.syncResult.addAll(list);
                return file3;
            }
            catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
    
    private void updateProgress(final ProgressNotification.ProgressAction progressAction, final long n, final IFile file) {
        this.currentSize += n;
        if (this.progress != null) {
            final long n2 = lcmp(this.sizeCalculator.getSize(), 0L);
            int n3 = 0;
            if (n2 != 0) {
                n3 = (int)(100.0f * (this.currentSize / this.sizeCalculator.getSize()));
            }
            this.canceled = !this.progress.update(progressAction, n3, file);
            if (this.canceled) {
                this.sizeCalculator.cancel();
                throw new CancellationException();
            }
        }
    }
    
    private void updateProgress(final ProgressNotification.ProgressAction progressAction, final IFile file) {
        this.currentSize += 1L;
        if (this.progress != null) {
            final long n = lcmp(this.sizeCalculator.getCount(), 0L);
            int n2 = 0;
            if (n != 0) {
                n2 = (int)(100.0f * (this.currentSize / this.sizeCalculator.getCount()));
            }
            this.canceled = !this.progress.update(progressAction, n2, file);
            if (this.canceled) {
                this.sizeCalculator.cancel();
                throw new CancellationException();
            }
        }
    }
    
    private void updateSyncResult(final IFile file, final IFile file2, final IFile file3) throws IOException {
        if (this.syncResult != null) {
            final List<SyncItem> syncResult = this.syncResult;
            final String absolutePath = file3.getAbsolutePath();
            final long lastModified = file3.getLastModified();
            SyncItem.Type type;
            if (file2 instanceof LocalFile) {
                type = SyncItem.Type.LocalFile;
            }
            else {
                type = SyncItem.Type.RemoteFile;
            }
            syncResult.add(new SyncItem(absolutePath, lastModified, type, file3.length(), file3.isDirectory()));
        }
    }
    
    void copy(final IFile[] array, final IFile file, final boolean b, final ProgressNotification progress) throws IOException {
        this.progress = progress;
        (this.sizeCalculator = new SizeCalculator(array)).start();
        try {
            for (final IFile file2 : array) {
                if (!new File(file2.getAbsolutePath()).getParent().equals(file.getAbsolutePath())) {
                    this.copy(file2, file, b);
                }
            }
        }
        finally {
            this.sizeCalculator.cancel();
        }
    }
    
    void delete(final IFile[] array, final ProgressNotification progress) throws IOException {
        while (true) {
            int n = 0;
            this.progress = progress;
            (this.sizeCalculator = new SizeCalculator(array)).start();
            while (true) {
                try {
                    final int length = array.length;
                    if (n >= length) {
                        return;
                    }
                    final IFile file = array[n];
                    if (file.isDirectory()) {
                        this.deleteDir(file);
                    }
                    else {
                        this.delete(file, false);
                    }
                }
                finally {
                    this.sizeCalculator.cancel();
                }
                ++n;
                continue;
            }
        }
    }
}
