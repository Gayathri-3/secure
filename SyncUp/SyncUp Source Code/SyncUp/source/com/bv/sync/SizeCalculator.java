package com.bv.sync;

import java.util.*;
import java.io.*;
import java.util.concurrent.*;

class SizeCalculator
{
    private final CyclicBarrier barier;
    private boolean canceled;
    private volatile long count;
    private Throwable error;
    Utils.FileComparator fileComparator;
    private volatile long size;
    private final long start;
    private final List<CalcSizeThread> threads;
    
    SizeCalculator(final IFile[] array) {
        this(null, array);
    }
    
    SizeCalculator(final IFileFilter[] array, final IFile... array2) {
        super();
        this.fileComparator = new Utils.FileComparator();
        this.start = System.currentTimeMillis();
        this.threads = new LinkedList<CalcSizeThread>();
        final ArrayList<IFile> list = new ArrayList<IFile>();
        final ArrayList<IFile> list2 = new ArrayList<IFile>();
        final ArrayList<IFile> list3 = new ArrayList<IFile>();
        for (final IFile file : array2) {
            if (file instanceof LocalFile) {
                list.add(file);
            }
            else if (file instanceof RemoteFile) {
                list2.add(file);
            }
            else {
                list3.add(file);
            }
        }
        this.addThread(array, list);
        this.addThread(array, list2);
        this.addThread(array, list3);
        this.barier = new CyclicBarrier(this.threads.size(), new Runnable() {
            public void run() {
                while (true) {
                    Label_0139: {
                        Label_0056: {
                            if (SizeCalculator.this.error != null) {
                                break Label_0056;
                            }
                            final long n = 0L;
                            final long n2 = 0L;
                            final Iterator<CalcSizeThread> iterator = SizeCalculator.this.threads.iterator();
                            if (iterator.hasNext()) {
                                break Label_0139;
                            }
                            SizeCalculator.access$5(SizeCalculator.this, n);
                            SizeCalculator.access$6(SizeCalculator.this, n2);
                        }
                        System.out.println("Calculated: size=" + SizeCalculator.this.size + ", count=" + SizeCalculator.this.count + ", time=" + (System.currentTimeMillis() - SizeCalculator.this.start) / 1000L);
                        synchronized (SizeCalculator.this) {
                            SizeCalculator.this.notifyAll();
                            return;
                            final Iterator<CalcSizeThread> iterator;
                            final CalcSizeThread calcSizeThread = iterator.next();
                            final long n = n + calcSizeThread.size;
                            final long n2 = n2 + calcSizeThread.count;
                            continue;
                        }
                    }
                    break;
                }
            }
        });
    }
    
    static /* synthetic */ void access$5(final SizeCalculator sizeCalculator, final long size) {
        sizeCalculator.size = size;
    }
    
    static /* synthetic */ void access$6(final SizeCalculator sizeCalculator, final long count) {
        sizeCalculator.count = count;
    }
    
    private void addThread(final IFileFilter[] array, final List<IFile> list) {
        if (list.size() != 0) {
            this.threads.add(new CalcSizeThread(array, (IFile[])list.toArray(new IFile[list.size()]), (CalcSizeThread)null));
        }
    }
    
    long calcSize() throws Throwable {
        synchronized (this) {
            this.start();
            this.wait();
            if (this.error != null) {
                throw this.error;
            }
        }
        // monitorexit(this)
        return this.getSize();
    }
    
    void cancel() {
        this.canceled = true;
        this.barier.reset();
    }
    
    long getCount() {
        return this.count;
    }
    
    long getSize() {
        return this.size;
    }
    
    void start() {
        for (final CalcSizeThread calcSizeThread : this.threads) {
            if (calcSizeThread != null) {
                calcSizeThread.start();
            }
        }
    }
    
    private final class CalcSizeThread extends Thread
    {
        protected long count;
        private final IFile[] files;
        private final IFileFilter[] filters;
        long size;
        
        private CalcSizeThread(final IFileFilter[] filters, final IFile... files) {
            final StringBuilder sb = new StringBuilder("Size calculator: ");
            String absolutePath;
            if (files.length == 0) {
                absolutePath = "";
            }
            else {
                absolutePath = files[0].getAbsolutePath();
            }
            super(sb.append(absolutePath).toString());
            this.files = files;
            this.filters = filters;
        }
        
        private void calcDirSize(final IFile file) throws IOException {
            this.count += 1L;
            final IFile[] listFiles = file.listFiles(new IFileFilter() {
                public boolean accept(final IFile file) throws IOException {
                    if (SizeCalculator.this.canceled) {
                        throw new CancellationException();
                    }
                    final boolean directory = file.isDirectory();
                    if (!directory) {
                        CalcSizeThread.this.calcFileSize(file);
                    }
                    return directory;
                }
            });
            for (int n = 0; n < listFiles.length && !SizeCalculator.this.canceled; ++n) {
                if (this.isSyncable(listFiles[n])) {
                    this.calcDirSize(listFiles[n]);
                }
            }
        }
        
        private void calcFileSize(final IFile file) throws IOException {
            if (this.isSyncable(file)) {
                this.count += 1L;
                this.size += file.length();
            }
        }
        
        private boolean isSyncable(final IFile file) throws IOException {
            if (this.filters != null) {
                final IFileFilter[] filters = this.filters;
                for (int length = filters.length, i = 0; i < length; ++i) {
                    final boolean accept = filters[i].accept(file);
                    final boolean b = false;
                    if (!accept) {
                        return b;
                    }
                }
            }
            return true;
        }
        
        public void run() {
            // 
            // This method could not be decompiled.
            // 
            // Original Bytecode:
            // 
            //     0: aload_0        
            //     1: getfield        com/bv/sync/SizeCalculator$CalcSizeThread.files:[Lcom/bv/sync/IFile;
            //     4: astore          9
            //     6: aload           9
            //     8: arraylength    
            //     9: istore          10
            //    11: iconst_0       
            //    12: istore          11
            //    14: iload           11
            //    16: iload           10
            //    18: if_icmplt       43
            //    21: aload_0        
            //    22: getfield        com/bv/sync/SizeCalculator$CalcSizeThread.this$0:Lcom/bv/sync/SizeCalculator;
            //    25: invokestatic    com/bv/sync/SizeCalculator.access$0:(Lcom/bv/sync/SizeCalculator;)Z
            //    28: ifne            42
            //    31: aload_0        
            //    32: getfield        com/bv/sync/SizeCalculator$CalcSizeThread.this$0:Lcom/bv/sync/SizeCalculator;
            //    35: invokestatic    com/bv/sync/SizeCalculator.access$1:(Lcom/bv/sync/SizeCalculator;)Ljava/util/concurrent/CyclicBarrier;
            //    38: invokevirtual   java/util/concurrent/CyclicBarrier.await:()I
            //    41: pop            
            //    42: return         
            //    43: aload           9
            //    45: iload           11
            //    47: aaload         
            //    48: astore          12
            //    50: aload           12
            //    52: ifnull          175
            //    55: aload           12
            //    57: invokeinterface com/bv/sync/IFile.isDirectory:()Z
            //    62: ifeq            74
            //    65: aload_0        
            //    66: aload           12
            //    68: invokespecial   com/bv/sync/SizeCalculator$CalcSizeThread.calcDirSize:(Lcom/bv/sync/IFile;)V
            //    71: goto            175
            //    74: aload_0        
            //    75: aload           12
            //    77: invokespecial   com/bv/sync/SizeCalculator$CalcSizeThread.calcFileSize:(Lcom/bv/sync/IFile;)V
            //    80: goto            175
            //    83: astore          5
            //    85: aload_0        
            //    86: getfield        com/bv/sync/SizeCalculator$CalcSizeThread.this$0:Lcom/bv/sync/SizeCalculator;
            //    89: aload           5
            //    91: invokestatic    com/bv/sync/SizeCalculator.access$2:(Lcom/bv/sync/SizeCalculator;Ljava/lang/Throwable;)V
            //    94: aload           5
            //    96: invokevirtual   java/lang/Throwable.printStackTrace:()V
            //    99: aload_0        
            //   100: getfield        com/bv/sync/SizeCalculator$CalcSizeThread.this$0:Lcom/bv/sync/SizeCalculator;
            //   103: invokestatic    com/bv/sync/SizeCalculator.access$0:(Lcom/bv/sync/SizeCalculator;)Z
            //   106: ifne            42
            //   109: aload_0        
            //   110: getfield        com/bv/sync/SizeCalculator$CalcSizeThread.this$0:Lcom/bv/sync/SizeCalculator;
            //   113: invokestatic    com/bv/sync/SizeCalculator.access$1:(Lcom/bv/sync/SizeCalculator;)Ljava/util/concurrent/CyclicBarrier;
            //   116: invokevirtual   java/util/concurrent/CyclicBarrier.await:()I
            //   119: pop            
            //   120: goto            42
            //   123: astore          7
            //   125: goto            42
            //   128: astore_1       
            //   129: aload_0        
            //   130: getfield        com/bv/sync/SizeCalculator$CalcSizeThread.this$0:Lcom/bv/sync/SizeCalculator;
            //   133: invokestatic    com/bv/sync/SizeCalculator.access$0:(Lcom/bv/sync/SizeCalculator;)Z
            //   136: ifne            150
            //   139: aload_0        
            //   140: getfield        com/bv/sync/SizeCalculator$CalcSizeThread.this$0:Lcom/bv/sync/SizeCalculator;
            //   143: invokestatic    com/bv/sync/SizeCalculator.access$1:(Lcom/bv/sync/SizeCalculator;)Ljava/util/concurrent/CyclicBarrier;
            //   146: invokevirtual   java/util/concurrent/CyclicBarrier.await:()I
            //   149: pop            
            //   150: aload_1        
            //   151: athrow         
            //   152: astore          14
            //   154: goto            42
            //   157: astore          13
            //   159: goto            42
            //   162: astore_3       
            //   163: goto            150
            //   166: astore_2       
            //   167: goto            150
            //   170: astore          6
            //   172: goto            42
            //   175: iinc            11, 1
            //   178: goto            14
            //    Exceptions:
            //  Try           Handler
            //  Start  End    Start  End    Type                                         
            //  -----  -----  -----  -----  ---------------------------------------------
            //  0      11     83     128    Ljava/lang/Throwable;
            //  0      11     128    170    Any
            //  31     42     157    162    Ljava/lang/InterruptedException;
            //  31     42     152    157    Ljava/util/concurrent/BrokenBarrierException;
            //  43     80     83     128    Ljava/lang/Throwable;
            //  43     80     128    170    Any
            //  85     99     128    170    Any
            //  109    120    123    128    Ljava/lang/InterruptedException;
            //  109    120    170    175    Ljava/util/concurrent/BrokenBarrierException;
            //  139    150    166    170    Ljava/lang/InterruptedException;
            //  139    150    162    166    Ljava/util/concurrent/BrokenBarrierException;
            // 
            // The error that occurred was:
            // 
            // java.lang.IndexOutOfBoundsException: Index: 81, Size: 81
            //     at java.util.ArrayList.rangeCheck(Unknown Source)
            //     at java.util.ArrayList.get(Unknown Source)
            //     at com.strobel.decompiler.ast.AstBuilder.convertToAst(AstBuilder.java:3262)
            //     at com.strobel.decompiler.ast.AstBuilder.convertToAst(AstBuilder.java:3510)
            //     at com.strobel.decompiler.ast.AstBuilder.build(AstBuilder.java:113)
            //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:210)
            //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:100)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:668)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:567)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:493)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:460)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:507)
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
    }
}
