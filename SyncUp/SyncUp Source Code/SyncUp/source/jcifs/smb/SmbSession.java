package jcifs.smb;

import jcifs.netbios.*;
import jcifs.*;
import java.net.*;
import jcifs.util.*;
import java.io.*;
import java.util.*;

public final class SmbSession
{
    private static final int CACHE_POLICY;
    private static final String DOMAIN;
    private static final String LOGON_SHARE;
    private static final int LOOKUP_RESP_LIMIT;
    private static final String USERNAME;
    static NbtAddress[] dc_list;
    static int dc_list_counter;
    static long dc_list_expiration;
    private UniAddress address;
    NtlmPasswordAuthentication auth;
    int connectionState;
    long expiration;
    private InetAddress localAddr;
    private int localPort;
    String netbiosName;
    private int port;
    SmbTransport transport;
    Vector trees;
    int uid;
    
    static {
        LOGON_SHARE = Config.getProperty("jcifs.smb.client.logonShare", null);
        LOOKUP_RESP_LIMIT = Config.getInt("jcifs.netbios.lookupRespLimit", 3);
        DOMAIN = Config.getProperty("jcifs.smb.client.domain", null);
        USERNAME = Config.getProperty("jcifs.smb.client.username", null);
        CACHE_POLICY = 60 * Config.getInt("jcifs.netbios.cachePolicy", 600);
        SmbSession.dc_list = null;
    }
    
    SmbSession(final UniAddress address, final int port, final InetAddress localAddr, final int localPort, final NtlmPasswordAuthentication auth) {
        super();
        this.transport = null;
        this.netbiosName = null;
        this.address = address;
        this.port = port;
        this.localAddr = localAddr;
        this.localPort = localPort;
        this.auth = auth;
        this.trees = new Vector();
        this.connectionState = 0;
    }
    
    public static byte[] getChallenge(final UniAddress uniAddress) throws SmbException, UnknownHostException {
        return getChallenge(uniAddress, 0);
    }
    
    public static byte[] getChallenge(final UniAddress uniAddress, final int n) throws SmbException, UnknownHostException {
        final SmbTransport smbTransport = SmbTransport.getSmbTransport(uniAddress, n);
        smbTransport.connect();
        return smbTransport.server.encryptionKey;
    }
    
    public static NtlmChallenge getChallengeForDomain() throws SmbException, UnknownHostException {
        if (SmbSession.DOMAIN == null) {
            throw new SmbException("A domain was not specified");
        }
        while (true) {
        Label_0093_Outer:
            while (true) {
                int n3 = 0;
            Label_0298:
                while (true) {
                    final int min;
                    int n2;
                    synchronized (SmbSession.DOMAIN) {
                        final long currentTimeMillis = System.currentTimeMillis();
                        final int n = 1;
                        if (SmbSession.dc_list_expiration < currentTimeMillis) {
                            final NbtAddress[] allByName = NbtAddress.getAllByName(SmbSession.DOMAIN, 28, null, null);
                            SmbSession.dc_list_expiration = currentTimeMillis + 1000L * SmbSession.CACHE_POLICY;
                            if (allByName != null && allByName.length > 0) {
                                SmbSession.dc_list = allByName;
                            }
                            else {
                                SmbSession.dc_list_expiration = 900000L + currentTimeMillis;
                                if (LogStream.level >= 2) {
                                    SmbTransport.log.println("Failed to retrieve DC list from WINS");
                                }
                            }
                        }
                        min = Math.min(SmbSession.dc_list.length, SmbSession.LOOKUP_RESP_LIMIT);
                        n2 = 0;
                        if (n2 >= min) {
                            SmbSession.dc_list_expiration = 0L;
                            n3 = n - 1;
                            if (n <= 0) {
                                SmbSession.dc_list_expiration = 900000L + currentTimeMillis;
                                // monitorexit(SmbSession.DOMAIN)
                                throw new UnknownHostException("Failed to negotiate with a suitable domain controller for " + SmbSession.DOMAIN);
                            }
                            break Label_0298;
                        }
                    }
                    final int dc_list_counter = SmbSession.dc_list_counter;
                    SmbSession.dc_list_counter = dc_list_counter + 1;
                    final int n4 = dc_list_counter % min;
                    if (SmbSession.dc_list[n4] != null) {
                        try {
                            // monitorexit(s)
                            return interrogate(SmbSession.dc_list[n4]);
                        }
                        catch (SmbException ex) {
                            if (LogStream.level >= 2) {
                                SmbTransport.log.println("Failed validate DC: " + SmbSession.dc_list[n4]);
                                if (LogStream.level > 2) {
                                    ex.printStackTrace(SmbTransport.log);
                                }
                            }
                            SmbSession.dc_list[n4] = null;
                        }
                    }
                    ++n2;
                    continue;
                }
                final int n = n3;
                continue Label_0093_Outer;
            }
        }
    }
    
    private static NtlmChallenge interrogate(final NbtAddress nbtAddress) throws SmbException {
        final UniAddress uniAddress = new UniAddress(nbtAddress);
        final SmbTransport smbTransport = SmbTransport.getSmbTransport(uniAddress, 0);
        if (SmbSession.USERNAME == null) {
            smbTransport.connect();
            if (LogStream.level >= 3) {
                SmbTransport.log.println("Default credentials (jcifs.smb.client.username/password) not specified. SMB signing may not work propertly.  Skipping DC interrogation.");
            }
        }
        else {
            smbTransport.getSmbSession(NtlmPasswordAuthentication.DEFAULT).getSmbTree(SmbSession.LOGON_SHARE, null).treeConnect(null, null);
        }
        return new NtlmChallenge(smbTransport.server.encryptionKey, uniAddress);
    }
    
    public static void logon(final UniAddress uniAddress, final int n, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws SmbException {
        final SmbTree smbTree = SmbTransport.getSmbTransport(uniAddress, n).getSmbSession(ntlmPasswordAuthentication).getSmbTree(SmbSession.LOGON_SHARE, null);
        if (SmbSession.LOGON_SHARE == null) {
            smbTree.treeConnect(null, null);
        }
        else {
            smbTree.send(new Trans2FindFirst2("\\", "*", 16), new Trans2FindFirst2Response());
        }
    }
    
    public static void logon(final UniAddress uniAddress, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws SmbException {
        logon(uniAddress, 0, ntlmPasswordAuthentication);
    }
    
    SmbTree getSmbTree(String s, final String s2) {
        // monitorenter(this)
        Label_0009: {
            if (s != null) {
                break Label_0009;
            }
            try {
                s = "IPC$";
                final Enumeration<SmbTree> elements = this.trees.elements();
                while (elements.hasMoreElements()) {
                    final SmbTree smbTree = elements.nextElement();
                    if (smbTree.matches(s, s2)) {
                        return smbTree;
                    }
                }
                final SmbTree smbTree3 = new SmbTree(this, s, s2);
                this.trees.addElement(smbTree3);
                return smbTree3;
            }
            finally {}
            // monitorexit(this)
        }
    }
    
    void logoff(final boolean p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: invokevirtual   jcifs/smb/SmbSession.transport:()Ljcifs/smb/SmbTransport;
        //     4: astore_2       
        //     5: aload_2        
        //     6: monitorenter   
        //     7: aload_0        
        //     8: getfield        jcifs/smb/SmbSession.connectionState:I
        //    11: iconst_2       
        //    12: if_icmpeq       20
        //    15: aload_2        
        //    16: monitorexit    
        //    17: goto            144
        //    20: aload_0        
        //    21: iconst_3       
        //    22: putfield        jcifs/smb/SmbSession.connectionState:I
        //    25: aload_0        
        //    26: aconst_null    
        //    27: putfield        jcifs/smb/SmbSession.netbiosName:Ljava/lang/String;
        //    30: aload_0        
        //    31: getfield        jcifs/smb/SmbSession.trees:Ljava/util/Vector;
        //    34: invokevirtual   java/util/Vector.elements:()Ljava/util/Enumeration;
        //    37: astore          4
        //    39: aload           4
        //    41: invokeinterface java/util/Enumeration.hasMoreElements:()Z
        //    46: ifne            122
        //    49: iload_1        
        //    50: ifne            100
        //    53: aload_0        
        //    54: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //    57: getfield        jcifs/smb/SmbTransport.server:Ljcifs/smb/SmbTransport$ServerData;
        //    60: getfield        jcifs/smb/SmbTransport$ServerData.security:I
        //    63: ifeq            100
        //    66: new             Ljcifs/smb/SmbComLogoffAndX;
        //    69: dup            
        //    70: aconst_null    
        //    71: invokespecial   jcifs/smb/SmbComLogoffAndX.<init>:(Ljcifs/smb/ServerMessageBlock;)V
        //    74: astore          5
        //    76: aload           5
        //    78: aload_0        
        //    79: getfield        jcifs/smb/SmbSession.uid:I
        //    82: putfield        jcifs/smb/SmbComLogoffAndX.uid:I
        //    85: aload_0        
        //    86: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //    89: aload           5
        //    91: aconst_null    
        //    92: invokevirtual   jcifs/smb/SmbTransport.send:(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
        //    95: aload_0        
        //    96: iconst_0       
        //    97: putfield        jcifs/smb/SmbSession.uid:I
        //   100: aload_0        
        //   101: iconst_0       
        //   102: putfield        jcifs/smb/SmbSession.connectionState:I
        //   105: aload_0        
        //   106: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   109: invokevirtual   java/lang/Object.notifyAll:()V
        //   112: aload_2        
        //   113: monitorexit    
        //   114: goto            144
        //   117: astore_3       
        //   118: aload_2        
        //   119: monitorexit    
        //   120: aload_3        
        //   121: athrow         
        //   122: aload           4
        //   124: invokeinterface java/util/Enumeration.nextElement:()Ljava/lang/Object;
        //   129: checkcast       Ljcifs/smb/SmbTree;
        //   132: iload_1        
        //   133: invokevirtual   jcifs/smb/SmbTree.treeDisconnect:(Z)V
        //   136: goto            39
        //   139: astore          6
        //   141: goto            95
        //   144: return         
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                    
        //  -----  -----  -----  -----  ------------------------
        //  7      85     117    122    Any
        //  85     95     139    144    Ljcifs/smb/SmbException;
        //  85     95     117    122    Any
        //  95     120    117    122    Any
        //  122    136    117    122    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0095:
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
    
    boolean matches(final NtlmPasswordAuthentication ntlmPasswordAuthentication) {
        return this.auth == ntlmPasswordAuthentication || this.auth.equals(ntlmPasswordAuthentication);
    }
    
    void send(final ServerMessageBlock serverMessageBlock, final ServerMessageBlock serverMessageBlock2) throws SmbException {
        final SmbTransport transport = this.transport();
        // monitorenter(transport)
        while (true) {
            if (serverMessageBlock2 != null) {
                try {
                    serverMessageBlock2.received = false;
                    this.expiration = System.currentTimeMillis() + SmbTransport.SO_TIMEOUT;
                    this.sessionSetup(serverMessageBlock, serverMessageBlock2);
                    if (serverMessageBlock2 != null && serverMessageBlock2.received) {
                        return;
                    }
                    if (serverMessageBlock instanceof SmbComTreeConnectAndX) {
                        final SmbComTreeConnectAndX smbComTreeConnectAndX = (SmbComTreeConnectAndX)serverMessageBlock;
                        if (this.netbiosName != null && smbComTreeConnectAndX.path.endsWith("\\IPC$")) {
                            smbComTreeConnectAndX.path = "\\\\" + this.netbiosName + "\\IPC$";
                        }
                    }
                    serverMessageBlock.uid = this.uid;
                    serverMessageBlock.auth = this.auth;
                    final SmbSession smbSession = this;
                    final SmbTransport smbTransport = smbSession.transport;
                    final ServerMessageBlock serverMessageBlock3 = serverMessageBlock;
                    final ServerMessageBlock serverMessageBlock4 = serverMessageBlock2;
                    smbTransport.send(serverMessageBlock3, serverMessageBlock4);
                    return;
                }
                finally {}
                // monitorexit(transport)
                try {
                    final SmbSession smbSession = this;
                    final SmbTransport smbTransport = smbSession.transport;
                    final ServerMessageBlock serverMessageBlock3 = serverMessageBlock;
                    final ServerMessageBlock serverMessageBlock4 = serverMessageBlock2;
                    smbTransport.send(serverMessageBlock3, serverMessageBlock4);
                }
                catch (SmbException ex) {
                    if (serverMessageBlock instanceof SmbComTreeConnectAndX) {
                        this.logoff(true);
                    }
                    serverMessageBlock.digest = null;
                    throw ex;
                }
                return;
            }
            continue;
        }
    }
    
    void sessionSetup(final ServerMessageBlock p0, final ServerMessageBlock p1) throws SmbException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: invokevirtual   jcifs/smb/SmbSession.transport:()Ljcifs/smb/SmbTransport;
        //     4: astore_3       
        //     5: aload_3        
        //     6: monitorenter   
        //     7: aconst_null    
        //     8: astore          4
        //    10: aconst_null    
        //    11: astore          5
        //    13: iconst_0       
        //    14: newarray        B
        //    16: astore          6
        //    18: bipush          10
        //    20: istore          7
        //    22: aload_0        
        //    23: getfield        jcifs/smb/SmbSession.connectionState:I
        //    26: ifne            196
        //    29: aload_0        
        //    30: iconst_1       
        //    31: putfield        jcifs/smb/SmbSession.connectionState:I
        //    34: aload_0        
        //    35: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //    38: invokevirtual   jcifs/smb/SmbTransport.connect:()V
        //    41: getstatic       jcifs/smb/SmbTransport.log:Ljcifs/util/LogStream;
        //    44: pop            
        //    45: getstatic       jcifs/util/LogStream.level:I
        //    48: iconst_4       
        //    49: if_icmplt       97
        //    52: getstatic       jcifs/smb/SmbTransport.log:Ljcifs/util/LogStream;
        //    55: new             Ljava/lang/StringBuilder;
        //    58: dup            
        //    59: ldc_w           "sessionSetup: accountName="
        //    62: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    65: aload_0        
        //    66: getfield        jcifs/smb/SmbSession.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //    69: getfield        jcifs/smb/NtlmPasswordAuthentication.username:Ljava/lang/String;
        //    72: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    75: ldc_w           ",primaryDomain="
        //    78: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    81: aload_0        
        //    82: getfield        jcifs/smb/SmbSession.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //    85: getfield        jcifs/smb/NtlmPasswordAuthentication.domain:Ljava/lang/String;
        //    88: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    91: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    94: invokevirtual   jcifs/util/LogStream.println:(Ljava/lang/String;)V
        //    97: aload_0        
        //    98: iconst_0       
        //    99: putfield        jcifs/smb/SmbSession.uid:I
        //   102: aload           4
        //   104: astore          13
        //   106: iload           7
        //   108: lookupswitch {
        //               10: 242
        //               20: 484
        //          default: 136
        //        }
        //   136: new             Ljcifs/smb/SmbException;
        //   139: dup            
        //   140: new             Ljava/lang/StringBuilder;
        //   143: dup            
        //   144: ldc_w           "Unexpected session setup state: "
        //   147: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   150: iload           7
        //   152: invokevirtual   java/lang/StringBuilder.append:(I)Ljava/lang/StringBuilder;
        //   155: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   158: invokespecial   jcifs/smb/SmbException.<init>:(Ljava/lang/String;)V
        //   161: athrow         
        //   162: astore          10
        //   164: aload_0        
        //   165: iconst_1       
        //   166: invokevirtual   jcifs/smb/SmbSession.logoff:(Z)V
        //   169: aload_0        
        //   170: iconst_0       
        //   171: putfield        jcifs/smb/SmbSession.connectionState:I
        //   174: aload           10
        //   176: athrow         
        //   177: astore          11
        //   179: aload_0        
        //   180: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   183: invokevirtual   java/lang/Object.notifyAll:()V
        //   186: aload           11
        //   188: athrow         
        //   189: astore          8
        //   191: aload_3        
        //   192: monitorexit    
        //   193: aload           8
        //   195: athrow         
        //   196: aload_0        
        //   197: getfield        jcifs/smb/SmbSession.connectionState:I
        //   200: iconst_2       
        //   201: if_icmpeq       212
        //   204: aload_0        
        //   205: getfield        jcifs/smb/SmbSession.connectionState:I
        //   208: iconst_3       
        //   209: if_icmpne       215
        //   212: aload_3        
        //   213: monitorexit    
        //   214: return         
        //   215: aload_0        
        //   216: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   219: invokevirtual   java/lang/Object.wait:()V
        //   222: goto            22
        //   225: astore          9
        //   227: new             Ljcifs/smb/SmbException;
        //   230: dup            
        //   231: aload           9
        //   233: invokevirtual   java/lang/InterruptedException.getMessage:()Ljava/lang/String;
        //   236: aload           9
        //   238: invokespecial   jcifs/smb/SmbException.<init>:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   241: athrow         
        //   242: aload_0        
        //   243: getfield        jcifs/smb/SmbSession.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //   246: getstatic       jcifs/smb/NtlmPasswordAuthentication.ANONYMOUS:Ljcifs/smb/NtlmPasswordAuthentication;
        //   249: if_acmpeq       294
        //   252: aload_0        
        //   253: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   256: ldc_w           -2147483648
        //   259: invokevirtual   jcifs/smb/SmbTransport.hasCapability:(I)Z
        //   262: istore          28
        //   264: iload           28
        //   266: ifeq            294
        //   269: bipush          20
        //   271: istore          7
        //   273: aload           13
        //   275: astore          4
        //   277: iload           7
        //   279: ifne            102
        //   282: aload_0        
        //   283: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   286: invokevirtual   java/lang/Object.notifyAll:()V
        //   289: aload_3        
        //   290: monitorexit    
        //   291: goto            214
        //   294: new             Ljcifs/smb/SmbComSessionSetupAndX;
        //   297: dup            
        //   298: aload_0        
        //   299: aload_1        
        //   300: aload_0        
        //   301: getfield        jcifs/smb/SmbSession.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //   304: invokespecial   jcifs/smb/SmbComSessionSetupAndX.<init>:(Ljcifs/smb/SmbSession;Ljcifs/smb/ServerMessageBlock;Ljava/lang/Object;)V
        //   307: astore          24
        //   309: new             Ljcifs/smb/SmbComSessionSetupAndXResponse;
        //   312: dup            
        //   313: aload_2        
        //   314: invokespecial   jcifs/smb/SmbComSessionSetupAndXResponse.<init>:(Ljcifs/smb/ServerMessageBlock;)V
        //   317: astore          25
        //   319: aload_0        
        //   320: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   323: aload_0        
        //   324: getfield        jcifs/smb/SmbSession.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //   327: invokevirtual   jcifs/smb/SmbTransport.isSignatureSetupRequired:(Ljcifs/smb/NtlmPasswordAuthentication;)Z
        //   330: ifeq            374
        //   333: aload_0        
        //   334: getfield        jcifs/smb/SmbSession.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //   337: getfield        jcifs/smb/NtlmPasswordAuthentication.hashesExternal:Z
        //   340: ifeq            402
        //   343: getstatic       jcifs/smb/NtlmPasswordAuthentication.DEFAULT_PASSWORD:Ljava/lang/String;
        //   346: ldc_w           ""
        //   349: if_acmpeq       402
        //   352: aload_0        
        //   353: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   356: getstatic       jcifs/smb/NtlmPasswordAuthentication.DEFAULT:Ljcifs/smb/NtlmPasswordAuthentication;
        //   359: invokevirtual   jcifs/smb/SmbTransport.getSmbSession:(Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/smb/SmbSession;
        //   362: getstatic       jcifs/smb/SmbSession.LOGON_SHARE:Ljava/lang/String;
        //   365: aconst_null    
        //   366: invokevirtual   jcifs/smb/SmbSession.getSmbTree:(Ljava/lang/String;Ljava/lang/String;)Ljcifs/smb/SmbTree;
        //   369: aconst_null    
        //   370: aconst_null    
        //   371: invokevirtual   jcifs/smb/SmbTree.treeConnect:(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
        //   374: aload           24
        //   376: aload_0        
        //   377: getfield        jcifs/smb/SmbSession.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //   380: putfield        jcifs/smb/SmbComSessionSetupAndX.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //   383: aload_0        
        //   384: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   387: aload           24
        //   389: aload           25
        //   391: invokevirtual   jcifs/smb/SmbTransport.send:(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
        //   394: aload           5
        //   396: ifnull          440
        //   399: aload           5
        //   401: athrow         
        //   402: aload           24
        //   404: new             Ljcifs/smb/SigningDigest;
        //   407: dup            
        //   408: aload_0        
        //   409: getfield        jcifs/smb/SmbSession.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //   412: aload_0        
        //   413: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   416: getfield        jcifs/smb/SmbTransport.server:Ljcifs/smb/SmbTransport$ServerData;
        //   419: getfield        jcifs/smb/SmbTransport$ServerData.encryptionKey:[B
        //   422: invokevirtual   jcifs/smb/NtlmPasswordAuthentication.getSigningKey:([B)[B
        //   425: iconst_0       
        //   426: invokespecial   jcifs/smb/SigningDigest.<init>:([BZ)V
        //   429: putfield        jcifs/smb/SmbComSessionSetupAndX.digest:Ljcifs/smb/SigningDigest;
        //   432: goto            374
        //   435: astore          27
        //   437: aload           27
        //   439: athrow         
        //   440: aload_0        
        //   441: aload           25
        //   443: getfield        jcifs/smb/SmbComSessionSetupAndXResponse.uid:I
        //   446: putfield        jcifs/smb/SmbSession.uid:I
        //   449: aload           24
        //   451: getfield        jcifs/smb/SmbComSessionSetupAndX.digest:Ljcifs/smb/SigningDigest;
        //   454: ifnull          469
        //   457: aload_0        
        //   458: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   461: aload           24
        //   463: getfield        jcifs/smb/SmbComSessionSetupAndX.digest:Ljcifs/smb/SigningDigest;
        //   466: putfield        jcifs/smb/SmbTransport.digest:Ljcifs/smb/SigningDigest;
        //   469: aload_0        
        //   470: iconst_2       
        //   471: putfield        jcifs/smb/SmbSession.connectionState:I
        //   474: aload           13
        //   476: astore          4
        //   478: iconst_0       
        //   479: istore          7
        //   481: goto            277
        //   484: aload           13
        //   486: ifnonnull       781
        //   489: iconst_4       
        //   490: aload_0        
        //   491: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   494: getfield        jcifs/smb/SmbTransport.flags2:I
        //   497: iand           
        //   498: ifeq            562
        //   501: iconst_1       
        //   502: istore          23
        //   504: new             Ljcifs/smb/NtlmContext;
        //   507: dup            
        //   508: aload_0        
        //   509: getfield        jcifs/smb/SmbSession.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //   512: iload           23
        //   514: invokespecial   jcifs/smb/NtlmContext.<init>:(Ljcifs/smb/NtlmPasswordAuthentication;Z)V
        //   517: astore          4
        //   519: getstatic       jcifs/util/LogStream.level:I
        //   522: iconst_4       
        //   523: if_icmplt       534
        //   526: getstatic       jcifs/smb/SmbTransport.log:Ljcifs/util/LogStream;
        //   529: aload           4
        //   531: invokevirtual   jcifs/util/LogStream.println:(Ljava/lang/Object;)V
        //   534: aload           4
        //   536: invokevirtual   jcifs/smb/NtlmContext.isEstablished:()Z
        //   539: ifeq            568
        //   542: aload_0        
        //   543: aload           4
        //   545: invokevirtual   jcifs/smb/NtlmContext.getNetbiosName:()Ljava/lang/String;
        //   548: putfield        jcifs/smb/SmbSession.netbiosName:Ljava/lang/String;
        //   551: aload_0        
        //   552: iconst_2       
        //   553: putfield        jcifs/smb/SmbSession.connectionState:I
        //   556: iconst_0       
        //   557: istore          7
        //   559: goto            277
        //   562: iconst_0       
        //   563: istore          23
        //   565: goto            504
        //   568: aload           4
        //   570: aload           6
        //   572: iconst_0       
        //   573: aload           6
        //   575: arraylength    
        //   576: invokevirtual   jcifs/smb/NtlmContext.initSecContext:([BII)[B
        //   579: astore          16
        //   581: aload           16
        //   583: astore          6
        //   585: aload           6
        //   587: ifnull          277
        //   590: new             Ljcifs/smb/SmbComSessionSetupAndX;
        //   593: dup            
        //   594: aload_0        
        //   595: aconst_null    
        //   596: aload           6
        //   598: invokespecial   jcifs/smb/SmbComSessionSetupAndX.<init>:(Ljcifs/smb/SmbSession;Ljcifs/smb/ServerMessageBlock;Ljava/lang/Object;)V
        //   601: astore          17
        //   603: new             Ljcifs/smb/SmbComSessionSetupAndXResponse;
        //   606: dup            
        //   607: aconst_null    
        //   608: invokespecial   jcifs/smb/SmbComSessionSetupAndXResponse.<init>:(Ljcifs/smb/ServerMessageBlock;)V
        //   611: astore          18
        //   613: aload_0        
        //   614: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   617: aload_0        
        //   618: getfield        jcifs/smb/SmbSession.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //   621: invokevirtual   jcifs/smb/SmbTransport.isSignatureSetupRequired:(Ljcifs/smb/NtlmPasswordAuthentication;)Z
        //   624: ifeq            654
        //   627: aload           4
        //   629: invokevirtual   jcifs/smb/NtlmContext.getSigningKey:()[B
        //   632: astore          22
        //   634: aload           22
        //   636: ifnull          654
        //   639: aload           17
        //   641: new             Ljcifs/smb/SigningDigest;
        //   644: dup            
        //   645: aload           22
        //   647: iconst_1       
        //   648: invokespecial   jcifs/smb/SigningDigest.<init>:([BZ)V
        //   651: putfield        jcifs/smb/SmbComSessionSetupAndX.digest:Ljcifs/smb/SigningDigest;
        //   654: aload           17
        //   656: aload_0        
        //   657: getfield        jcifs/smb/SmbSession.uid:I
        //   660: putfield        jcifs/smb/SmbComSessionSetupAndX.uid:I
        //   663: aload_0        
        //   664: iconst_0       
        //   665: putfield        jcifs/smb/SmbSession.uid:I
        //   668: aload_0        
        //   669: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   672: aload           17
        //   674: aload           18
        //   676: invokevirtual   jcifs/smb/SmbTransport.send:(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
        //   679: aload           5
        //   681: ifnull          737
        //   684: aload           5
        //   686: athrow         
        //   687: astore          10
        //   689: goto            164
        //   692: astore          14
        //   694: aload_0        
        //   695: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   698: iconst_1       
        //   699: invokevirtual   jcifs/smb/SmbTransport.disconnect:(Z)V
        //   702: aload_0        
        //   703: iconst_0       
        //   704: putfield        jcifs/smb/SmbSession.uid:I
        //   707: aload           14
        //   709: athrow         
        //   710: astore          21
        //   712: aload           21
        //   714: athrow         
        //   715: astore          19
        //   717: aload           19
        //   719: astore          5
        //   721: aload_0        
        //   722: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   725: iconst_1       
        //   726: invokevirtual   jcifs/smb/SmbTransport.disconnect:(Z)V
        //   729: goto            679
        //   732: astore          20
        //   734: goto            679
        //   737: aload_0        
        //   738: aload           18
        //   740: getfield        jcifs/smb/SmbComSessionSetupAndXResponse.uid:I
        //   743: putfield        jcifs/smb/SmbSession.uid:I
        //   746: aload           17
        //   748: getfield        jcifs/smb/SmbComSessionSetupAndX.digest:Ljcifs/smb/SigningDigest;
        //   751: ifnull          766
        //   754: aload_0        
        //   755: getfield        jcifs/smb/SmbSession.transport:Ljcifs/smb/SmbTransport;
        //   758: aload           17
        //   760: getfield        jcifs/smb/SmbComSessionSetupAndX.digest:Ljcifs/smb/SigningDigest;
        //   763: putfield        jcifs/smb/SmbTransport.digest:Ljcifs/smb/SigningDigest;
        //   766: aload           18
        //   768: getfield        jcifs/smb/SmbComSessionSetupAndXResponse.blob:[B
        //   771: astore          6
        //   773: goto            277
        //   776: astore          15
        //   778: goto            702
        //   781: aload           13
        //   783: astore          4
        //   785: goto            519
        //   788: astore          11
        //   790: goto            179
        //   793: astore          26
        //   795: aload           26
        //   797: astore          5
        //   799: goto            394
        //    Exceptions:
        //  throws jcifs.smb.SmbException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                            
        //  -----  -----  -----  -----  --------------------------------
        //  13     34     189    196    Any
        //  34     102    687    692    Ljcifs/smb/SmbException;
        //  34     102    177    179    Any
        //  136    162    162    164    Ljcifs/smb/SmbException;
        //  136    162    788    793    Any
        //  164    177    177    179    Any
        //  179    193    189    196    Any
        //  196    214    189    196    Any
        //  215    222    225    242    Ljava/lang/InterruptedException;
        //  215    222    189    196    Any
        //  227    242    189    196    Any
        //  242    264    162    164    Ljcifs/smb/SmbException;
        //  242    264    788    793    Any
        //  282    291    189    196    Any
        //  294    383    162    164    Ljcifs/smb/SmbException;
        //  294    383    788    793    Any
        //  383    394    435    440    Ljcifs/smb/SmbAuthException;
        //  383    394    793    802    Ljcifs/smb/SmbException;
        //  383    394    788    793    Any
        //  399    519    162    164    Ljcifs/smb/SmbException;
        //  399    519    788    793    Any
        //  519    556    687    692    Ljcifs/smb/SmbException;
        //  519    556    177    179    Any
        //  568    581    692    710    Ljcifs/smb/SmbException;
        //  568    581    177    179    Any
        //  590    668    687    692    Ljcifs/smb/SmbException;
        //  590    668    177    179    Any
        //  668    679    710    715    Ljcifs/smb/SmbAuthException;
        //  668    679    715    737    Ljcifs/smb/SmbException;
        //  668    679    177    179    Any
        //  684    687    687    692    Ljcifs/smb/SmbException;
        //  684    687    177    179    Any
        //  694    702    776    781    Ljava/io/IOException;
        //  694    702    687    692    Ljcifs/smb/SmbException;
        //  694    702    177    179    Any
        //  702    715    687    692    Ljcifs/smb/SmbException;
        //  702    715    177    179    Any
        //  721    729    732    737    Ljava/lang/Exception;
        //  721    729    687    692    Ljcifs/smb/SmbException;
        //  721    729    177    179    Any
        //  737    773    687    692    Ljcifs/smb/SmbException;
        //  737    773    177    179    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IndexOutOfBoundsException: Index: 363, Size: 363
        //     at java.util.ArrayList.rangeCheck(Unknown Source)
        //     at java.util.ArrayList.get(Unknown Source)
        //     at com.strobel.decompiler.ast.AstBuilder.convertToAst(AstBuilder.java:3262)
        //     at com.strobel.decompiler.ast.AstBuilder.build(AstBuilder.java:113)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:210)
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
        return "SmbSession[accountName=" + this.auth.username + ",primaryDomain=" + this.auth.domain + ",uid=" + this.uid + ",connectionState=" + this.connectionState + "]";
    }
    
    SmbTransport transport() {
        synchronized (this) {
            if (this.transport == null) {
                this.transport = SmbTransport.getSmbTransport(this.address, this.port, this.localAddr, this.localPort, null);
            }
            return this.transport;
        }
    }
}
