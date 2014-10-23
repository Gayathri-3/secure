package jcifs.smb;

public class TestLocking implements Runnable
{
    long delay;
    long ltime;
    int numComplete;
    int numIter;
    int numThreads;
    String url;
    
    public TestLocking() {
        super();
        this.numThreads = 1;
        this.numIter = 1;
        this.delay = 100L;
        this.url = null;
        this.numComplete = 0;
        this.ltime = 0L;
    }
    
    public static void main(final String[] array) throws Exception {
        if (array.length < 1) {
            System.err.println("usage: TestLocking [-t <numThreads>] [-i <numIter>] [-d <delay>] url");
            System.exit(1);
        }
        final TestLocking testLocking = new TestLocking();
        testLocking.ltime = System.currentTimeMillis();
        for (int i = 0; i < array.length; ++i) {
            if (array[i].equals("-t")) {
                ++i;
                testLocking.numThreads = Integer.parseInt(array[i]);
            }
            else if (array[i].equals("-i")) {
                ++i;
                testLocking.numIter = Integer.parseInt(array[i]);
            }
            else if (array[i].equals("-d")) {
                ++i;
                testLocking.delay = Long.parseLong(array[i]);
            }
            else {
                testLocking.url = array[i];
            }
        }
        final Thread[] array2 = new Thread[testLocking.numThreads];
        for (int j = 0; j < testLocking.numThreads; ++j) {
            array2[j] = new Thread(testLocking);
            System.out.print(array2[j].getName());
            array2[j].start();
        }
        while (true) {
        Label_0334_Outer:
            while (testLocking.numComplete < testLocking.numThreads) {
                while (true) {
                    long n = 2L;
                    synchronized (testLocking) {
                        final long n2 = testLocking.ltime + testLocking.delay;
                        final long currentTimeMillis = System.currentTimeMillis();
                        if (n2 > currentTimeMillis) {
                            n = n2 - currentTimeMillis;
                        }
                        // monitorexit(testLocking)
                        if (n > 2L) {
                            System.out.println("delay=" + n);
                        }
                        Thread.sleep(n);
                        if (n > 2L) {
                            continue Label_0334_Outer;
                        }
                        synchronized (testLocking) {
                            testLocking.notifyAll();
                        }
                    }
                    break;
                }
                while (true) {
                    int n3 = 0;
                    array2[n3].join();
                    System.out.print(array2[n3].getName());
                    ++n3;
                    if (n3 >= testLocking.numThreads) {
                        System.out.println();
                        return;
                    }
                    continue;
                }
            }
            int n3 = 0;
            continue;
        }
    }
    
    public void run() {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: new             Ljcifs/smb/SmbFile;
        //     3: dup            
        //     4: aload_0        
        //     5: getfield        jcifs/smb/TestLocking.url:Ljava/lang/String;
        //     8: invokespecial   jcifs/smb/SmbFile.<init>:(Ljava/lang/String;)V
        //    11: astore_1       
        //    12: new             Ljcifs/smb/SmbFile;
        //    15: dup            
        //    16: aload_1        
        //    17: invokevirtual   jcifs/smb/SmbFile.getParent:()Ljava/lang/String;
        //    20: invokespecial   jcifs/smb/SmbFile.<init>:(Ljava/lang/String;)V
        //    23: astore_2       
        //    24: sipush          1024
        //    27: newarray        B
        //    29: astore          5
        //    31: iconst_0       
        //    32: istore          6
        //    34: aload_0        
        //    35: getfield        jcifs/smb/TestLocking.numIter:I
        //    38: istore          7
        //    40: iload           6
        //    42: iload           7
        //    44: if_icmplt       58
        //    47: aload_0        
        //    48: iconst_1       
        //    49: aload_0        
        //    50: getfield        jcifs/smb/TestLocking.numComplete:I
        //    53: iadd           
        //    54: putfield        jcifs/smb/TestLocking.numComplete:I
        //    57: return         
        //    58: aload_0        
        //    59: monitorenter   
        //    60: aload_0        
        //    61: invokestatic    java/lang/System.currentTimeMillis:()J
        //    64: putfield        jcifs/smb/TestLocking.ltime:J
        //    67: aload_0        
        //    68: invokevirtual   java/lang/Object.wait:()V
        //    71: aload_0        
        //    72: monitorexit    
        //    73: invokestatic    java/lang/Math.random:()D
        //    76: dstore          10
        //    78: dload           10
        //    80: ldc2_w          0.333
        //    83: dcmpg          
        //    84: ifge            125
        //    87: aload_1        
        //    88: invokevirtual   jcifs/smb/SmbFile.exists:()Z
        //    91: pop            
        //    92: iinc            6, 1
        //    95: goto            34
        //    98: astore          8
        //   100: aload_0        
        //   101: monitorexit    
        //   102: aload           8
        //   104: athrow         
        //   105: astore          4
        //   107: aload           4
        //   109: invokevirtual   java/lang/Exception.printStackTrace:()V
        //   112: aload_0        
        //   113: iconst_1       
        //   114: aload_0        
        //   115: getfield        jcifs/smb/TestLocking.numComplete:I
        //   118: iadd           
        //   119: putfield        jcifs/smb/TestLocking.numComplete:I
        //   122: goto            57
        //   125: dload           10
        //   127: ldc2_w          0.667
        //   130: dcmpg          
        //   131: ifge            171
        //   134: aload_2        
        //   135: invokevirtual   jcifs/smb/SmbFile.listFiles:()[Ljcifs/smb/SmbFile;
        //   138: pop            
        //   139: goto            92
        //   142: astore          9
        //   144: getstatic       java/lang/System.err:Ljava/io/PrintStream;
        //   147: aload           9
        //   149: invokevirtual   java/io/IOException.getMessage:()Ljava/lang/String;
        //   152: invokevirtual   java/io/PrintStream.println:(Ljava/lang/String;)V
        //   155: goto            92
        //   158: astore_3       
        //   159: aload_0        
        //   160: iconst_1       
        //   161: aload_0        
        //   162: getfield        jcifs/smb/TestLocking.numComplete:I
        //   165: iadd           
        //   166: putfield        jcifs/smb/TestLocking.numComplete:I
        //   169: aload_3        
        //   170: athrow         
        //   171: dload           10
        //   173: dconst_1       
        //   174: dcmpg          
        //   175: ifge            92
        //   178: aload_1        
        //   179: invokevirtual   jcifs/smb/SmbFile.getInputStream:()Ljava/io/InputStream;
        //   182: astore          12
        //   184: aload           12
        //   186: aload           5
        //   188: invokevirtual   java/io/InputStream.read:([B)I
        //   191: ifgt            184
        //   194: aload           12
        //   196: invokevirtual   java/io/InputStream.close:()V
        //   199: goto            92
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  0      40     105    125    Ljava/lang/Exception;
        //  0      40     158    171    Any
        //  58     60     105    125    Ljava/lang/Exception;
        //  58     60     158    171    Any
        //  60     73     98     105    Any
        //  73     92     142    158    Ljava/io/IOException;
        //  73     92     105    125    Ljava/lang/Exception;
        //  73     92     158    171    Any
        //  100    102    98     105    Any
        //  102    105    105    125    Ljava/lang/Exception;
        //  102    105    158    171    Any
        //  107    112    158    171    Any
        //  134    139    142    158    Ljava/io/IOException;
        //  134    139    105    125    Ljava/lang/Exception;
        //  134    139    158    171    Any
        //  144    155    105    125    Ljava/lang/Exception;
        //  144    155    158    171    Any
        //  178    199    142    158    Ljava/io/IOException;
        //  178    199    105    125    Ljava/lang/Exception;
        //  178    199    158    171    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0092:
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
}
