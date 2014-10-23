package com.bv.wifisync;

import java.util.concurrent.*;
import java.util.*;

class ThreadedQueue<T>
{
    private Object[] lock;
    private final BlockingQueue<Wrapper> queue;
    private final List<Thread> threads;
    
    ThreadedQueue(final Runner<T>[] array) {
        int i = 0;
        super();
        this.threads = Collections.synchronizedList(new LinkedList<Thread>());
        this.lock = new Object[0];
        this.queue = new LinkedBlockingQueue<Wrapper>(3 * array.length);
        while (i < array.length) {
            final Runner<T> runner = array[i];
            final List<Thread> threads = this.threads;
            final QueueThread queueThread = new QueueThread(runner);
            threads.add(queueThread);
            queueThread.start();
            ++i;
        }
    }
    
    void add(final T t) throws InterruptedException {
        this.queue.put(new Wrapper(t));
    }
    
    void cancel() {
        this.queue.clear();
        while (this.threads.size() != 0) {
            synchronized (this.threads) {
                final Iterator<Thread> iterator = this.threads.iterator();
                while (iterator.hasNext()) {
                    iterator.next().interrupt();
                }
                // monitorexit(this.threads)
                try {
                    Thread.sleep(10L);
                }
                catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
    
    void waitFor() {
        while (this.threads.size() != 0) {
            final Object[] lock = this.lock;
            // monitorenter(lock)
            while (true) {
                try {
                    try {
                        this.queue.put(new Wrapper(null));
                        this.lock.wait();
                    }
                    finally {}
                    // monitorexit(lock)
                }
                catch (InterruptedException ex) {
                    continue;
                }
                break;
            }
        }
    }
    
    private class QueueThread extends Thread
    {
        private final Runner<T> runnable;
        
        QueueThread(final Runner<T> runnable) {
            super("ConnectThread");
            this.runnable = runnable;
        }
        
        public void run() {
            // 
            // This method could not be decompiled.
            // 
            // Original Bytecode:
            // 
            //     0: aload_0        
            //     1: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //     4: invokestatic    com/bv/wifisync/ThreadedQueue.access$2:(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/concurrent/BlockingQueue;
            //     7: invokeinterface java/util/concurrent/BlockingQueue.take:()Ljava/lang/Object;
            //    12: checkcast       Lcom/bv/wifisync/ThreadedQueue$Wrapper;
            //    15: astore          13
            //    17: aload           13
            //    19: ifnull          34
            //    22: aload           13
            //    24: getfield        com/bv/wifisync/ThreadedQueue$Wrapper.t:Ljava/lang/Object;
            //    27: astore          17
            //    29: aload           17
            //    31: ifnonnull       74
            //    34: aload_0        
            //    35: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //    38: invokestatic    com/bv/wifisync/ThreadedQueue.access$0:(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/List;
            //    41: aload_0        
            //    42: invokeinterface java/util/List.remove:(Ljava/lang/Object;)Z
            //    47: pop            
            //    48: aload_0        
            //    49: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //    52: invokestatic    com/bv/wifisync/ThreadedQueue.access$1:(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;
            //    55: astore          15
            //    57: aload           15
            //    59: monitorenter   
            //    60: aload_0        
            //    61: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //    64: invokestatic    com/bv/wifisync/ThreadedQueue.access$1:(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;
            //    67: invokevirtual   java/lang/Object.notify:()V
            //    70: aload           15
            //    72: monitorexit    
            //    73: return         
            //    74: aload_0        
            //    75: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.runnable:Lcom/bv/wifisync/ThreadedQueue$Runner;
            //    78: aload           13
            //    80: getfield        com/bv/wifisync/ThreadedQueue$Wrapper.t:Ljava/lang/Object;
            //    83: invokeinterface com/bv/wifisync/ThreadedQueue$Runner.run:(Ljava/lang/Object;)V
            //    88: goto            0
            //    91: astore          9
            //    93: aload_0        
            //    94: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //    97: invokestatic    com/bv/wifisync/ThreadedQueue.access$0:(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/List;
            //   100: aload_0        
            //   101: invokeinterface java/util/List.remove:(Ljava/lang/Object;)Z
            //   106: pop            
            //   107: aload_0        
            //   108: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //   111: invokestatic    com/bv/wifisync/ThreadedQueue.access$1:(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;
            //   114: astore          11
            //   116: aload           11
            //   118: monitorenter   
            //   119: aload_0        
            //   120: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //   123: invokestatic    com/bv/wifisync/ThreadedQueue.access$1:(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;
            //   126: invokevirtual   java/lang/Object.notify:()V
            //   129: aload           11
            //   131: monitorexit    
            //   132: goto            73
            //   135: astore          12
            //   137: aload           11
            //   139: monitorexit    
            //   140: aload           12
            //   142: athrow         
            //   143: astore          5
            //   145: aload           5
            //   147: invokevirtual   java/lang/Exception.printStackTrace:()V
            //   150: aload_0        
            //   151: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //   154: invokestatic    com/bv/wifisync/ThreadedQueue.access$0:(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/List;
            //   157: aload_0        
            //   158: invokeinterface java/util/List.remove:(Ljava/lang/Object;)Z
            //   163: pop            
            //   164: aload_0        
            //   165: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //   168: invokestatic    com/bv/wifisync/ThreadedQueue.access$1:(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;
            //   171: astore          7
            //   173: aload           7
            //   175: monitorenter   
            //   176: aload_0        
            //   177: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //   180: invokestatic    com/bv/wifisync/ThreadedQueue.access$1:(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;
            //   183: invokevirtual   java/lang/Object.notify:()V
            //   186: aload           7
            //   188: monitorexit    
            //   189: goto            73
            //   192: astore          8
            //   194: aload           7
            //   196: monitorexit    
            //   197: aload           8
            //   199: athrow         
            //   200: astore_1       
            //   201: aload_0        
            //   202: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //   205: invokestatic    com/bv/wifisync/ThreadedQueue.access$0:(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/List;
            //   208: aload_0        
            //   209: invokeinterface java/util/List.remove:(Ljava/lang/Object;)Z
            //   214: pop            
            //   215: aload_0        
            //   216: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //   219: invokestatic    com/bv/wifisync/ThreadedQueue.access$1:(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;
            //   222: astore_3       
            //   223: aload_3        
            //   224: monitorenter   
            //   225: aload_0        
            //   226: getfield        com/bv/wifisync/ThreadedQueue$QueueThread.this$0:Lcom/bv/wifisync/ThreadedQueue;
            //   229: invokestatic    com/bv/wifisync/ThreadedQueue.access$1:(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;
            //   232: invokevirtual   java/lang/Object.notify:()V
            //   235: aload_3        
            //   236: monitorexit    
            //   237: aload_1        
            //   238: athrow         
            //   239: astore          4
            //   241: aload_3        
            //   242: monitorexit    
            //   243: aload           4
            //   245: athrow         
            //   246: astore          16
            //   248: aload           15
            //   250: monitorexit    
            //   251: aload           16
            //   253: athrow         
            //    Exceptions:
            //  Try           Handler
            //  Start  End    Start  End    Type                            
            //  -----  -----  -----  -----  --------------------------------
            //  0      29     91     143    Ljava/lang/InterruptedException;
            //  0      29     143    200    Ljava/lang/Exception;
            //  0      29     200    246    Any
            //  60     73     246    254    Any
            //  74     88     91     143    Ljava/lang/InterruptedException;
            //  74     88     143    200    Ljava/lang/Exception;
            //  74     88     200    246    Any
            //  119    140    135    143    Any
            //  145    150    200    246    Any
            //  176    197    192    200    Any
            //  225    237    239    246    Any
            //  241    243    239    246    Any
            //  248    251    246    254    Any
            // 
            // The error that occurred was:
            // 
            // java.lang.IllegalStateException: Expression is linked from several locations: Label_0073:
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
    
    interface Runner<T>
    {
        void run(T p0);
    }
    
    private class Wrapper
    {
        T t;
        
        Wrapper(final T t) {
            super();
            this.t = t;
        }
    }
}
