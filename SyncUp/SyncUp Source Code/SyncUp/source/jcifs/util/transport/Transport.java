package jcifs.util.transport;

import jcifs.util.*;
import java.util.*;
import java.net.*;
import java.io.*;

public abstract class Transport implements Runnable
{
    static int id;
    static LogStream log;
    public static long readBytes;
    public static long readTime;
    String name;
    protected Exception readError;
    protected HashMap response_map;
    int state;
    TransportException te;
    Thread thread;
    protected long timeSendRecv;
    
    static {
        Transport.id = 0;
        Transport.log = LogStream.getInstance();
    }
    
    public Transport() {
        super();
        this.state = 0;
        final StringBuilder sb = new StringBuilder("Transport");
        final int id = Transport.id;
        Transport.id = id + 1;
        this.name = sb.append(id).toString();
        this.response_map = new HashMap(4);
    }
    
    private void loop() {
    Label_0000:
        while (this.thread == Thread.currentThread()) {
            Request peekKey;
            while (true) {
                while (true) {
                    Label_0159: {
                        try {
                            peekKey = this.peekKey();
                            if (peekKey == null) {
                                throw new IOException("end of stream");
                            }
                        }
                        catch (Exception readError) {
                            this.readError = readError;
                            final boolean b = readError instanceof SocketTimeoutException;
                            if (b) {
                                final boolean b2 = false;
                                if (!b && LogStream.level >= 3) {
                                    readError.printStackTrace(Transport.log);
                                }
                                try {
                                    this.disconnect(b2);
                                }
                                catch (Exception ex) {
                                    ex.printStackTrace(Transport.log);
                                }
                                continue Label_0000;
                            }
                            break Label_0159;
                        }
                        break;
                    }
                    final boolean b2 = true;
                    continue;
                }
            }
            while (true) {
                while (true) {
                    final Response response;
                    synchronized (this) {
                        response = this.response_map.get(peekKey);
                        if (response == null) {
                            if (LogStream.level >= 4) {
                                Transport.log.println("Invalid key, skipping message");
                            }
                            this.doSkip();
                            break;
                        }
                    }
                    this.doRecv(response);
                    response.isReceived = true;
                    this.notifyAll();
                    continue;
                }
            }
        }
    }
    
    public static int readn(final InputStream inputStream, final byte[] array, final int n, final int n2) throws IOException {
        int i = 0;
        final long currentTimeMillis = System.currentTimeMillis();
        while (i < n2) {
            final int read = inputStream.read(array, n + i, n2 - i);
            if (read <= 0) {
                break;
            }
            i += read;
        }
        Transport.readBytes += i;
        Transport.readTime += System.currentTimeMillis() - currentTimeMillis;
        return i;
    }
    
    public void connect(final long n) throws TransportException {
        Label_0272: {
            synchronized (this) {
                this.readError = null;
                try {
                    switch (this.state) {
                        default: {
                            final TransportException ex = new TransportException("Invalid state: " + this.state);
                            this.state = 0;
                            throw ex;
                        }
                        case 3: {
                            break Label_0272;
                            break Label_0272;
                        }
                        case 4: {
                            break Label_0272;
                            break Label_0272;
                        }
                        case 0: {
                            break Label_0272;
                            break Label_0272;
                        }
                    }
                }
                catch (InterruptedException ex2) {
                    try {
                        this.state = 0;
                        this.thread = null;
                        throw new TransportException(ex2);
                    }
                    finally {
                        if (this.state != 0 && this.state != 3 && this.state != 4) {
                            if (LogStream.level >= 1) {
                                Transport.log.println("Invalid state: " + this.state);
                            }
                            this.state = 0;
                            this.thread = null;
                        }
                    }
                }
            }
            do {
                try {
                    this.state = 3;
                    // monitorexit(thread)
                    if (this.state != 0 && this.state != 3 && this.state != 4) {
                        if (LogStream.level >= 1) {
                            Transport.log.println("Invalid state: " + this.state);
                        }
                        this.state = 0;
                        this.thread = null;
                    }
                    Label_0250: {
                        return;
                    }
                    Label_0356:
                    // monitorexit(thread)
                    // iftrue(Label_0250:, this.state == 0 || this.state == 3 || this.state == 4)
                    while (true) {
                        Block_21: {
                            break Block_21;
                            this.state = 0;
                            this.thread = null;
                            return;
                        }
                        Block_22: {
                            break Block_22;
                            Label_0427:
                            this.state = 0;
                            this.thread = null;
                            throw new TransportException("Connection timeout", this.readError);
                            this.state = 0;
                            throw new TransportException("Connection in error", this.te);
                            this.state = 1;
                            this.te = null;
                            (this.thread = new Thread(this, this.name)).setDaemon(true);
                            final Thread thread = this.thread;
                            this.thread.start();
                            this.thread.wait(n);
                        }
                        Transport.log.println("Invalid state: " + this.state);
                        continue;
                    }
                }
                // iftrue(Label_0414:, LogStream.level < 1)
                // monitorenter(thread)
                // switch([Lcom.strobel.decompiler.ast.Label;@40ed841e, this.state)
                finally {}
                // monitorexit(thread)
                Label_0459:;
            } while (this.te == null);
        }
        this.state = 4;
        this.thread = null;
        throw this.te;
    }
    
    public void disconnect(boolean b) throws IOException {
    Label_0149:
        while (true) {
        Label_0127_Outer:
            while (true) {
                while (true) {
                    Label_0101: {
                        synchronized (this) {
                            final int state = this.state;
                            final IOException ex = null;
                            switch (state) {
                                default: {
                                    if (LogStream.level >= 1) {
                                        Transport.log.println("Invalid state: " + this.state);
                                    }
                                    this.thread = null;
                                    this.state = 0;
                                    if (ex != null) {
                                        throw ex;
                                    }
                                    break Label_0149;
                                }
                                case 2: {
                                    break;
                                }
                                case 3: {
                                    break Label_0101;
                                }
                                case 4: {
                                    break Label_0127;
                                    break Label_0127;
                                }
                                case 0: {
                                    break Label_0149;
                                }
                            }
                        }
                        b = true;
                    }
                    if (this.response_map.size() != 0) {
                        final IOException ex = null;
                        if (!b) {
                            continue Label_0127_Outer;
                        }
                    }
                    try {
                        this.doDisconnect(b);
                        this.thread = null;
                        this.state = 0;
                        continue Label_0127_Outer;
                    }
                    catch (IOException ex2) {
                        final IOException ex = ex2;
                        continue;
                    }
                    break;
                }
                break;
            }
            break;
        }
    }
    // monitorexit(this)
    
    protected abstract void doConnect() throws Exception;
    
    protected abstract void doDisconnect(final boolean p0) throws IOException;
    
    protected abstract void doRecv(final Response p0) throws IOException;
    
    protected abstract void doSend(final Request p0) throws IOException;
    
    protected abstract void doSkip() throws IOException;
    
    protected abstract void makeKey(final Request p0) throws IOException;
    
    protected abstract Request peekKey() throws IOException;
    
    public void run() {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: invokestatic    java/lang/Thread.currentThread:()Ljava/lang/Thread;
        //     3: astore_1       
        //     4: aload_0        
        //     5: invokevirtual   jcifs/util/transport/Transport.doConnect:()V
        //     8: aload_1        
        //     9: monitorenter   
        //    10: aload_1        
        //    11: aload_0        
        //    12: getfield        jcifs/util/transport/Transport.thread:Ljava/lang/Thread;
        //    15: if_acmpeq       183
        //    18: iconst_0       
        //    19: ifeq            36
        //    22: getstatic       jcifs/util/LogStream.level:I
        //    25: iconst_2       
        //    26: if_icmplt       36
        //    29: aconst_null    
        //    30: getstatic       jcifs/util/transport/Transport.log:Ljcifs/util/LogStream;
        //    33: invokevirtual   java/lang/Exception.printStackTrace:(Ljava/io/PrintStream;)V
        //    36: aload_1        
        //    37: monitorexit    
        //    38: return         
        //    39: astore          4
        //    41: aload_1        
        //    42: monitorenter   
        //    43: aload_1        
        //    44: aload_0        
        //    45: getfield        jcifs/util/transport/Transport.thread:Ljava/lang/Thread;
        //    48: if_acmpeq       83
        //    51: aload           4
        //    53: ifnull          71
        //    56: getstatic       jcifs/util/LogStream.level:I
        //    59: iconst_2       
        //    60: if_icmplt       71
        //    63: aload           4
        //    65: getstatic       jcifs/util/transport/Transport.log:Ljcifs/util/LogStream;
        //    68: invokevirtual   java/lang/Exception.printStackTrace:(Ljava/io/PrintStream;)V
        //    71: aload_1        
        //    72: monitorexit    
        //    73: goto            38
        //    76: astore          5
        //    78: aload_1        
        //    79: monitorexit    
        //    80: aload           5
        //    82: athrow         
        //    83: aload           4
        //    85: ifnull          101
        //    88: aload_0        
        //    89: new             Ljcifs/util/transport/TransportException;
        //    92: dup            
        //    93: aload           4
        //    95: invokespecial   jcifs/util/transport/TransportException.<init>:(Ljava/lang/Throwable;)V
        //    98: putfield        jcifs/util/transport/Transport.te:Ljcifs/util/transport/TransportException;
        //   101: aload_0        
        //   102: iconst_2       
        //   103: putfield        jcifs/util/transport/Transport.state:I
        //   106: aload_1        
        //   107: invokevirtual   java/lang/Object.notify:()V
        //   110: aload_1        
        //   111: monitorexit    
        //   112: goto            38
        //   115: astore_2       
        //   116: aload_1        
        //   117: monitorenter   
        //   118: aload_1        
        //   119: aload_0        
        //   120: getfield        jcifs/util/transport/Transport.thread:Ljava/lang/Thread;
        //   123: if_acmpeq       154
        //   126: iconst_0       
        //   127: ifeq            144
        //   130: getstatic       jcifs/util/LogStream.level:I
        //   133: iconst_2       
        //   134: if_icmplt       144
        //   137: aconst_null    
        //   138: getstatic       jcifs/util/transport/Transport.log:Ljcifs/util/LogStream;
        //   141: invokevirtual   java/lang/Exception.printStackTrace:(Ljava/io/PrintStream;)V
        //   144: aload_1        
        //   145: monitorexit    
        //   146: goto            38
        //   149: astore_3       
        //   150: aload_1        
        //   151: monitorexit    
        //   152: aload_3        
        //   153: athrow         
        //   154: iconst_0       
        //   155: ifeq            170
        //   158: aload_0        
        //   159: new             Ljcifs/util/transport/TransportException;
        //   162: dup            
        //   163: aconst_null    
        //   164: invokespecial   jcifs/util/transport/TransportException.<init>:(Ljava/lang/Throwable;)V
        //   167: putfield        jcifs/util/transport/Transport.te:Ljcifs/util/transport/TransportException;
        //   170: aload_0        
        //   171: iconst_2       
        //   172: putfield        jcifs/util/transport/Transport.state:I
        //   175: aload_1        
        //   176: invokevirtual   java/lang/Object.notify:()V
        //   179: aload_1        
        //   180: monitorexit    
        //   181: aload_2        
        //   182: athrow         
        //   183: iconst_0       
        //   184: ifeq            199
        //   187: aload_0        
        //   188: new             Ljcifs/util/transport/TransportException;
        //   191: dup            
        //   192: aconst_null    
        //   193: invokespecial   jcifs/util/transport/TransportException.<init>:(Ljava/lang/Throwable;)V
        //   196: putfield        jcifs/util/transport/Transport.te:Ljcifs/util/transport/TransportException;
        //   199: aload_0        
        //   200: iconst_2       
        //   201: putfield        jcifs/util/transport/Transport.state:I
        //   204: aload_1        
        //   205: invokevirtual   java/lang/Object.notify:()V
        //   208: aload_1        
        //   209: monitorexit    
        //   210: aload_0        
        //   211: invokespecial   jcifs/util/transport/Transport.loop:()V
        //   214: goto            38
        //   217: astore          6
        //   219: aload_1        
        //   220: monitorexit    
        //   221: aload           6
        //   223: athrow         
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  4      8      39     115    Ljava/lang/Exception;
        //  4      8      115    183    Any
        //  10     38     217    224    Any
        //  43     80     76     83     Any
        //  88     112    76     83     Any
        //  118    152    149    154    Any
        //  158    181    149    154    Any
        //  187    210    217    224    Any
        //  219    221    217    224    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0036:
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
    
    public void sendrecv(final Request p0, final Response p1, final long p2) throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: monitorenter   
        //     2: aload_0        
        //     3: aconst_null    
        //     4: putfield        jcifs/util/transport/Transport.readError:Ljava/lang/Exception;
        //     7: aload_0        
        //     8: aload_1        
        //     9: invokevirtual   jcifs/util/transport/Transport.makeKey:(Ljcifs/util/transport/Request;)V
        //    12: aload_2        
        //    13: iconst_0       
        //    14: putfield        jcifs/util/transport/Response.isReceived:Z
        //    17: invokestatic    java/lang/System.currentTimeMillis:()J
        //    20: lstore          11
        //    22: aload_0        
        //    23: getfield        jcifs/util/transport/Transport.response_map:Ljava/util/HashMap;
        //    26: aload_1        
        //    27: aload_2        
        //    28: invokevirtual   java/util/HashMap.put:(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //    31: pop            
        //    32: aload_0        
        //    33: aload_1        
        //    34: invokevirtual   jcifs/util/transport/Transport.doSend:(Ljcifs/util/transport/Request;)V
        //    37: aload_2        
        //    38: lload_3        
        //    39: invokestatic    java/lang/System.currentTimeMillis:()J
        //    42: ladd           
        //    43: putfield        jcifs/util/transport/Response.expiration:J
        //    46: aload_2        
        //    47: getfield        jcifs/util/transport/Response.isReceived:Z
        //    50: ifeq            80
        //    53: aload_0        
        //    54: aload_0        
        //    55: getfield        jcifs/util/transport/Transport.timeSendRecv:J
        //    58: invokestatic    java/lang/System.currentTimeMillis:()J
        //    61: lload           11
        //    63: lsub           
        //    64: ladd           
        //    65: putfield        jcifs/util/transport/Transport.timeSendRecv:J
        //    68: aload_0        
        //    69: getfield        jcifs/util/transport/Transport.response_map:Ljava/util/HashMap;
        //    72: aload_1        
        //    73: invokevirtual   java/util/HashMap.remove:(Ljava/lang/Object;)Ljava/lang/Object;
        //    76: pop            
        //    77: aload_0        
        //    78: monitorexit    
        //    79: return         
        //    80: aload_0        
        //    81: lload_3        
        //    82: invokevirtual   java/lang/Object.wait:(J)V
        //    85: aload_2        
        //    86: getfield        jcifs/util/transport/Response.expiration:J
        //    89: invokestatic    java/lang/System.currentTimeMillis:()J
        //    92: lsub           
        //    93: lstore_3       
        //    94: lload_3        
        //    95: lconst_0       
        //    96: lcmp           
        //    97: ifgt            46
        //   100: new             Ljcifs/util/transport/TransportException;
        //   103: dup            
        //   104: ldc             "Timeout waiting for response from computer"
        //   106: aload_0        
        //   107: getfield        jcifs/util/transport/Transport.readError:Ljava/lang/Exception;
        //   110: invokespecial   jcifs/util/transport/TransportException.<init>:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   113: athrow         
        //   114: astore          9
        //   116: getstatic       jcifs/util/LogStream.level:I
        //   119: iconst_2       
        //   120: if_icmple       131
        //   123: aload           9
        //   125: getstatic       jcifs/util/transport/Transport.log:Ljcifs/util/LogStream;
        //   128: invokevirtual   java/io/IOException.printStackTrace:(Ljava/io/PrintStream;)V
        //   131: aload_0        
        //   132: iconst_1       
        //   133: invokevirtual   jcifs/util/transport/Transport.disconnect:(Z)V
        //   136: aload           9
        //   138: athrow         
        //   139: astore          7
        //   141: aload_0        
        //   142: getfield        jcifs/util/transport/Transport.response_map:Ljava/util/HashMap;
        //   145: aload_1        
        //   146: invokevirtual   java/util/HashMap.remove:(Ljava/lang/Object;)Ljava/lang/Object;
        //   149: pop            
        //   150: aload           7
        //   152: athrow         
        //   153: astore          5
        //   155: aload_0        
        //   156: monitorexit    
        //   157: aload           5
        //   159: athrow         
        //   160: astore          10
        //   162: aload           10
        //   164: getstatic       jcifs/util/transport/Transport.log:Ljcifs/util/LogStream;
        //   167: invokevirtual   java/io/IOException.printStackTrace:(Ljava/io/PrintStream;)V
        //   170: goto            136
        //   173: astore          6
        //   175: new             Ljcifs/util/transport/TransportException;
        //   178: dup            
        //   179: aload           6
        //   181: invokespecial   jcifs/util/transport/TransportException.<init>:(Ljava/lang/Throwable;)V
        //   184: athrow         
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                            
        //  -----  -----  -----  -----  --------------------------------
        //  2      17     153    160    Any
        //  17     68     114    173    Ljava/io/IOException;
        //  17     68     173    185    Ljava/lang/InterruptedException;
        //  17     68     139    153    Any
        //  68     77     153    160    Any
        //  80     114    114    173    Ljava/io/IOException;
        //  80     114    173    185    Ljava/lang/InterruptedException;
        //  80     114    139    153    Any
        //  116    131    139    153    Any
        //  131    136    160    173    Ljava/io/IOException;
        //  131    136    139    153    Any
        //  136    139    139    153    Any
        //  141    153    153    160    Any
        //  162    185    139    153    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0131:
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
    
    public String toString() {
        return this.name;
    }
}
