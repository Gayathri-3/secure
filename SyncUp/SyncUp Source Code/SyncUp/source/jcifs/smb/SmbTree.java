package jcifs.smb;

class SmbTree
{
    private static int tree_conn_counter;
    int connectionState;
    boolean inDfs;
    boolean inDomainDfs;
    String service;
    String service0;
    SmbSession session;
    String share;
    int tid;
    int tree_num;
    
    SmbTree(final SmbSession session, final String s, final String service) {
        super();
        this.service = "?????";
        this.session = session;
        this.share = s.toUpperCase();
        if (service != null && !service.startsWith("??")) {
            this.service = service;
        }
        this.service0 = this.service;
        this.connectionState = 0;
    }
    
    public boolean equals(final Object o) {
        boolean matches;
        if (o instanceof SmbTree) {
            final SmbTree smbTree = (SmbTree)o;
            matches = this.matches(smbTree.share, smbTree.service);
        }
        else {
            matches = false;
        }
        return matches;
    }
    
    boolean matches(final String s, final String s2) {
        return this.share.equalsIgnoreCase(s) && (s2 == null || s2.startsWith("??") || this.service.equalsIgnoreCase(s2));
    }
    
    void send(final ServerMessageBlock serverMessageBlock, final ServerMessageBlock serverMessageBlock2) throws SmbException {
        final SmbTransport transport = this.session.transport();
        // monitorenter(transport)
        while (true) {
            if (serverMessageBlock2 != null) {
                Label_0296: {
                    try {
                        serverMessageBlock2.received = false;
                        this.treeConnect(serverMessageBlock, serverMessageBlock2);
                        if (serverMessageBlock == null || (serverMessageBlock2 != null && serverMessageBlock2.received)) {
                            return;
                        }
                        if ("A:".equals(this.service)) {
                            break Label_0296;
                        }
                        switch (serverMessageBlock.command) {
                            default: {
                                throw new SmbException("Invalid operation for " + this.service + " service" + serverMessageBlock);
                            }
                            case 37:
                            case 50: {
                                break;
                            }
                            case -94:
                            case 4:
                            case 45:
                            case 46:
                            case 47:
                            case 113: {
                                break Label_0296;
                            }
                        }
                    }
                    finally {}
                    // monitorexit(transport)
                    switch (0xFF & ((SmbComTransaction)serverMessageBlock).subCommand) {
                        default: {
                            throw new SmbException("Invalid operation for " + this.service + " service");
                        }
                        case 0:
                        case 16:
                        case 35:
                        case 38:
                        case 83:
                        case 84:
                        case 104:
                        case 215: {
                            serverMessageBlock.tid = this.tid;
                            if (this.inDfs && !this.service.equals("IPC") && serverMessageBlock.path != null && serverMessageBlock.path.length() > 0) {
                                serverMessageBlock.flags2 = 4096;
                                serverMessageBlock.path = String.valueOf('\\') + this.session.transport().tconHostName + '\\' + this.share + serverMessageBlock.path;
                            }
                            try {
                                this.session.send(serverMessageBlock, serverMessageBlock2);
                            }
                            // monitorexit(transport)
                            catch (SmbException ex) {
                                if (ex.getNtStatus() == -1073741623) {
                                    this.treeDisconnect(true);
                                }
                                throw ex;
                            }
                            break;
                        }
                    }
                }
                return;
            }
            continue;
        }
    }
    
    public String toString() {
        return "SmbTree[share=" + this.share + ",service=" + this.service + ",tid=" + this.tid + ",inDfs=" + this.inDfs + ",inDomainDfs=" + this.inDomainDfs + ",connectionState=" + this.connectionState + "]";
    }
    
    void treeConnect(final ServerMessageBlock p0, final ServerMessageBlock p1) throws SmbException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //     4: invokevirtual   jcifs/smb/SmbSession.transport:()Ljcifs/smb/SmbTransport;
        //     7: astore_3       
        //     8: aload_3        
        //     9: monitorenter   
        //    10: aload_0        
        //    11: getfield        jcifs/smb/SmbTree.connectionState:I
        //    14: ifne            237
        //    17: aload_0        
        //    18: iconst_1       
        //    19: putfield        jcifs/smb/SmbTree.connectionState:I
        //    22: aload_0        
        //    23: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //    26: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //    29: invokevirtual   jcifs/smb/SmbTransport.connect:()V
        //    32: new             Ljava/lang/StringBuilder;
        //    35: dup            
        //    36: ldc             "\\\\"
        //    38: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    41: aload_0        
        //    42: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //    45: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //    48: getfield        jcifs/smb/SmbTransport.tconHostName:Ljava/lang/String;
        //    51: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    54: bipush          92
        //    56: invokevirtual   java/lang/StringBuilder.append:(C)Ljava/lang/StringBuilder;
        //    59: aload_0        
        //    60: getfield        jcifs/smb/SmbTree.share:Ljava/lang/String;
        //    63: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    66: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    69: astore          7
        //    71: aload_0        
        //    72: aload_0        
        //    73: getfield        jcifs/smb/SmbTree.service0:Ljava/lang/String;
        //    76: putfield        jcifs/smb/SmbTree.service:Ljava/lang/String;
        //    79: aload_0        
        //    80: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //    83: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //    86: pop            
        //    87: getstatic       jcifs/smb/SmbTransport.log:Ljcifs/util/LogStream;
        //    90: pop            
        //    91: getstatic       jcifs/util/LogStream.level:I
        //    94: iconst_4       
        //    95: if_icmplt       141
        //    98: aload_0        
        //    99: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //   102: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   105: pop            
        //   106: getstatic       jcifs/smb/SmbTransport.log:Ljcifs/util/LogStream;
        //   109: new             Ljava/lang/StringBuilder;
        //   112: dup            
        //   113: ldc             "treeConnect: unc="
        //   115: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   118: aload           7
        //   120: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   123: ldc             ",service="
        //   125: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   128: aload_0        
        //   129: getfield        jcifs/smb/SmbTree.service:Ljava/lang/String;
        //   132: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   135: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   138: invokevirtual   jcifs/util/LogStream.println:(Ljava/lang/String;)V
        //   141: new             Ljcifs/smb/SmbComTreeConnectAndXResponse;
        //   144: dup            
        //   145: aload_2        
        //   146: invokespecial   jcifs/smb/SmbComTreeConnectAndXResponse.<init>:(Ljcifs/smb/ServerMessageBlock;)V
        //   149: astore          10
        //   151: new             Ljcifs/smb/SmbComTreeConnectAndX;
        //   154: dup            
        //   155: aload_0        
        //   156: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //   159: aload           7
        //   161: aload_0        
        //   162: getfield        jcifs/smb/SmbTree.service:Ljava/lang/String;
        //   165: aload_1        
        //   166: invokespecial   jcifs/smb/SmbComTreeConnectAndX.<init>:(Ljcifs/smb/SmbSession;Ljava/lang/String;Ljava/lang/String;Ljcifs/smb/ServerMessageBlock;)V
        //   169: astore          11
        //   171: aload_0        
        //   172: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //   175: aload           11
        //   177: aload           10
        //   179: invokevirtual   jcifs/smb/SmbSession.send:(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
        //   182: aload_0        
        //   183: aload           10
        //   185: getfield        jcifs/smb/SmbComTreeConnectAndXResponse.tid:I
        //   188: putfield        jcifs/smb/SmbTree.tid:I
        //   191: aload_0        
        //   192: aload           10
        //   194: getfield        jcifs/smb/SmbComTreeConnectAndXResponse.service:Ljava/lang/String;
        //   197: putfield        jcifs/smb/SmbTree.service:Ljava/lang/String;
        //   200: aload_0        
        //   201: aload           10
        //   203: getfield        jcifs/smb/SmbComTreeConnectAndXResponse.shareIsInDfs:Z
        //   206: putfield        jcifs/smb/SmbTree.inDfs:Z
        //   209: getstatic       jcifs/smb/SmbTree.tree_conn_counter:I
        //   212: istore          12
        //   214: iload           12
        //   216: iconst_1       
        //   217: iadd           
        //   218: putstatic       jcifs/smb/SmbTree.tree_conn_counter:I
        //   221: aload_0        
        //   222: iload           12
        //   224: putfield        jcifs/smb/SmbTree.tree_num:I
        //   227: aload_0        
        //   228: iconst_2       
        //   229: putfield        jcifs/smb/SmbTree.connectionState:I
        //   232: aload_3        
        //   233: monitorexit    
        //   234: goto            310
        //   237: aload_0        
        //   238: getfield        jcifs/smb/SmbTree.connectionState:I
        //   241: iconst_2       
        //   242: if_icmpeq       253
        //   245: aload_0        
        //   246: getfield        jcifs/smb/SmbTree.connectionState:I
        //   249: iconst_3       
        //   250: if_icmpne       265
        //   253: aload_3        
        //   254: monitorexit    
        //   255: goto            310
        //   258: astore          4
        //   260: aload_3        
        //   261: monitorexit    
        //   262: aload           4
        //   264: athrow         
        //   265: aload_0        
        //   266: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //   269: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   272: invokevirtual   java/lang/Object.wait:()V
        //   275: goto            10
        //   278: astore          5
        //   280: new             Ljcifs/smb/SmbException;
        //   283: dup            
        //   284: aload           5
        //   286: invokevirtual   java/lang/InterruptedException.getMessage:()Ljava/lang/String;
        //   289: aload           5
        //   291: invokespecial   jcifs/smb/SmbException.<init>:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   294: athrow         
        //   295: astore          6
        //   297: aload_0        
        //   298: iconst_1       
        //   299: invokevirtual   jcifs/smb/SmbTree.treeDisconnect:(Z)V
        //   302: aload_0        
        //   303: iconst_0       
        //   304: putfield        jcifs/smb/SmbTree.connectionState:I
        //   307: aload           6
        //   309: athrow         
        //   310: return         
        //    Exceptions:
        //  throws jcifs.smb.SmbException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                            
        //  -----  -----  -----  -----  --------------------------------
        //  10     22     258    265    Any
        //  22     232    295    310    Ljcifs/smb/SmbException;
        //  22     232    258    265    Any
        //  232    262    258    265    Any
        //  265    275    278    295    Ljava/lang/InterruptedException;
        //  265    275    258    265    Any
        //  280    310    258    265    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0141:
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
    
    void treeDisconnect(final boolean p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //     4: invokevirtual   jcifs/smb/SmbSession.transport:()Ljcifs/smb/SmbTransport;
        //     7: astore_2       
        //     8: aload_2        
        //     9: monitorenter   
        //    10: aload_0        
        //    11: getfield        jcifs/smb/SmbTree.connectionState:I
        //    14: iconst_2       
        //    15: if_icmpeq       23
        //    18: aload_2        
        //    19: monitorexit    
        //    20: goto            130
        //    23: aload_0        
        //    24: iconst_3       
        //    25: putfield        jcifs/smb/SmbTree.connectionState:I
        //    28: iload_1        
        //    29: ifne            55
        //    32: aload_0        
        //    33: getfield        jcifs/smb/SmbTree.tid:I
        //    36: istore          4
        //    38: iload           4
        //    40: ifeq            55
        //    43: aload_0        
        //    44: new             Ljcifs/smb/SmbComTreeDisconnect;
        //    47: dup            
        //    48: invokespecial   jcifs/smb/SmbComTreeDisconnect.<init>:()V
        //    51: aconst_null    
        //    52: invokevirtual   jcifs/smb/SmbTree.send:(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
        //    55: aload_0        
        //    56: iconst_0       
        //    57: putfield        jcifs/smb/SmbTree.inDfs:Z
        //    60: aload_0        
        //    61: iconst_0       
        //    62: putfield        jcifs/smb/SmbTree.inDomainDfs:Z
        //    65: aload_0        
        //    66: iconst_0       
        //    67: putfield        jcifs/smb/SmbTree.connectionState:I
        //    70: aload_0        
        //    71: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //    74: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //    77: invokevirtual   java/lang/Object.notifyAll:()V
        //    80: aload_2        
        //    81: monitorexit    
        //    82: goto            130
        //    85: astore_3       
        //    86: aload_2        
        //    87: monitorexit    
        //    88: aload_3        
        //    89: athrow         
        //    90: astore          5
        //    92: aload_0        
        //    93: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //    96: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //    99: pop            
        //   100: getstatic       jcifs/smb/SmbTransport.log:Ljcifs/util/LogStream;
        //   103: pop            
        //   104: getstatic       jcifs/util/LogStream.level:I
        //   107: iconst_1       
        //   108: if_icmple       55
        //   111: aload_0        
        //   112: getfield        jcifs/smb/SmbTree.session:Ljcifs/smb/SmbSession;
        //   115: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   118: pop            
        //   119: aload           5
        //   121: getstatic       jcifs/smb/SmbTransport.log:Ljcifs/util/LogStream;
        //   124: invokevirtual   jcifs/smb/SmbException.printStackTrace:(Ljava/io/PrintStream;)V
        //   127: goto            55
        //   130: return         
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                    
        //  -----  -----  -----  -----  ------------------------
        //  10     38     85     90     Any
        //  43     55     90     130    Ljcifs/smb/SmbException;
        //  43     55     85     90     Any
        //  55     88     85     90     Any
        //  92     127    85     90     Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0055:
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
