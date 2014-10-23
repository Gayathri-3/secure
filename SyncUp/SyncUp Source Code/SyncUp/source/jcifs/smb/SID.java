package jcifs.smb;

import java.io.*;
import java.util.*;
import jcifs.dcerpc.msrpc.*;
import jcifs.dcerpc.*;
import jcifs.util.*;

public class SID extends rpc.sid_t
{
    public static SID CREATOR_OWNER;
    public static SID EVERYONE;
    public static final int SID_FLAG_RESOLVE_SIDS = 1;
    public static final int SID_TYPE_ALIAS = 4;
    public static final int SID_TYPE_DELETED = 6;
    public static final int SID_TYPE_DOMAIN = 3;
    public static final int SID_TYPE_DOM_GRP = 2;
    public static final int SID_TYPE_INVALID = 7;
    static final String[] SID_TYPE_NAMES;
    public static final int SID_TYPE_UNKNOWN = 8;
    public static final int SID_TYPE_USER = 1;
    public static final int SID_TYPE_USE_NONE = 0;
    public static final int SID_TYPE_WKN_GRP = 5;
    public static SID SYSTEM;
    static Map sid_cache;
    String acctName;
    String domainName;
    NtlmPasswordAuthentication origin_auth;
    String origin_server;
    int type;
    
    static {
        SID_TYPE_NAMES = new String[] { "0", "User", "Domain group", "Domain", "Local group", "Builtin group", "Deleted", "Invalid", "Unknown" };
        SID.EVERYONE = null;
        SID.CREATOR_OWNER = null;
        SID.SYSTEM = null;
        while (true) {
            try {
                SID.EVERYONE = new SID("S-1-1-0");
                SID.CREATOR_OWNER = new SID("S-1-3-0");
                SID.SYSTEM = new SID("S-1-5-18");
                SID.sid_cache = new HashMap();
            }
            catch (SmbException ex) {
                continue;
            }
            break;
        }
    }
    
    public SID(final String s) throws SmbException {
        super();
        this.domainName = null;
        this.acctName = null;
        this.origin_server = null;
        this.origin_auth = null;
        final StringTokenizer stringTokenizer = new StringTokenizer(s, "-");
        if (stringTokenizer.countTokens() < 3 || !stringTokenizer.nextToken().equals("S")) {
            throw new SmbException("Bad textual SID format: " + s);
        }
        this.revision = Byte.parseByte(stringTokenizer.nextToken());
        final String nextToken = stringTokenizer.nextToken();
        long n;
        if (nextToken.startsWith("0x")) {
            n = Long.parseLong(nextToken.substring(2), 16);
        }
        else {
            n = Long.parseLong(nextToken);
        }
        this.identifier_authority = new byte[6];
        for (int n2 = 5; n > 0L; n >>= 8, --n2) {
            this.identifier_authority[n2] = (byte)(n % 256L);
        }
        this.sub_authority_count = (byte)stringTokenizer.countTokens();
        if (this.sub_authority_count > 0) {
            this.sub_authority = new int[this.sub_authority_count];
            for (byte b = 0; b < this.sub_authority_count; ++b) {
                this.sub_authority[b] = (int)(0xFFFFFFFFL & Long.parseLong(stringTokenizer.nextToken()));
            }
        }
    }
    
    public SID(final rpc.sid_t sid_t, final int type, final String domainName, final String acctName, final boolean b) {
        super();
        this.domainName = null;
        this.acctName = null;
        this.origin_server = null;
        this.origin_auth = null;
        this.revision = sid_t.revision;
        this.sub_authority_count = sid_t.sub_authority_count;
        this.identifier_authority = sid_t.identifier_authority;
        this.sub_authority = sid_t.sub_authority;
        this.type = type;
        this.domainName = domainName;
        this.acctName = acctName;
        if (b) {
            this.sub_authority_count -= 1;
            this.sub_authority = new int[this.sub_authority_count];
            for (byte b2 = 0; b2 < this.sub_authority_count; ++b2) {
                this.sub_authority[b2] = sid_t.sub_authority[b2];
            }
        }
    }
    
    public SID(final SID sid, final int n) {
        super();
        this.domainName = null;
        this.acctName = null;
        this.origin_server = null;
        this.origin_auth = null;
        this.revision = sid.revision;
        this.identifier_authority = sid.identifier_authority;
        this.sub_authority_count = 1 + sid.sub_authority_count;
        this.sub_authority = new int[this.sub_authority_count];
        byte b;
        for (b = 0; b < sid.sub_authority_count; ++b) {
            this.sub_authority[b] = sid.sub_authority[b];
        }
        this.sub_authority[b] = n;
    }
    
    public SID(final byte[] array, final int n) {
        super();
        this.domainName = null;
        this.acctName = null;
        this.origin_server = null;
        this.origin_auth = null;
        final int n2 = n + 1;
        this.revision = array[n];
        final int n3 = n2 + 1;
        this.sub_authority_count = array[n2];
        System.arraycopy(array, n3, this.identifier_authority = new byte[6], 0, 6);
        int n4 = n3 + 6;
        if (this.sub_authority_count > 100) {
            throw new RuntimeException("Invalid SID sub_authority_count");
        }
        this.sub_authority = new int[this.sub_authority_count];
        for (byte b = 0; b < this.sub_authority_count; ++b) {
            this.sub_authority[b] = ServerMessageBlock.readInt4(array, n4);
            n4 += 4;
        }
    }
    
    static SID[] getGroupMemberSids0(final DcerpcHandle p0, final SamrDomainHandle p1, final SID p2, final int p3, final int p4) throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: new             Ljcifs/dcerpc/msrpc/lsarpc$LsarSidArray;
        //     3: dup            
        //     4: invokespecial   jcifs/dcerpc/msrpc/lsarpc$LsarSidArray.<init>:()V
        //     7: astore          5
        //     9: new             Ljcifs/dcerpc/msrpc/SamrAliasHandle;
        //    12: dup            
        //    13: aload_0        
        //    14: aload_1        
        //    15: ldc             131084
        //    17: iload_3        
        //    18: invokespecial   jcifs/dcerpc/msrpc/SamrAliasHandle.<init>:(Ljcifs/dcerpc/DcerpcHandle;Ljcifs/dcerpc/msrpc/SamrDomainHandle;II)V
        //    21: astore          6
        //    23: new             Ljcifs/dcerpc/msrpc/MsrpcGetMembersInAlias;
        //    26: dup            
        //    27: aload           6
        //    29: aload           5
        //    31: invokespecial   jcifs/dcerpc/msrpc/MsrpcGetMembersInAlias.<init>:(Ljcifs/dcerpc/msrpc/SamrAliasHandle;Ljcifs/dcerpc/msrpc/lsarpc$LsarSidArray;)V
        //    34: astore          7
        //    36: aload_0        
        //    37: aload           7
        //    39: invokevirtual   jcifs/dcerpc/DcerpcHandle.sendrecv:(Ljcifs/dcerpc/DcerpcMessage;)V
        //    42: aload           7
        //    44: getfield        jcifs/dcerpc/msrpc/MsrpcGetMembersInAlias.retval:I
        //    47: ifeq            83
        //    50: new             Ljcifs/smb/SmbException;
        //    53: dup            
        //    54: aload           7
        //    56: getfield        jcifs/dcerpc/msrpc/MsrpcGetMembersInAlias.retval:I
        //    59: iconst_0       
        //    60: invokespecial   jcifs/smb/SmbException.<init>:(IZ)V
        //    63: athrow         
        //    64: astore          8
        //    66: aload           6
        //    68: astore          9
        //    70: aload           9
        //    72: ifnull          80
        //    75: aload           9
        //    77: invokevirtual   jcifs/dcerpc/msrpc/SamrAliasHandle.close:()V
        //    80: aload           8
        //    82: athrow         
        //    83: aload           7
        //    85: getfield        jcifs/dcerpc/msrpc/MsrpcGetMembersInAlias.sids:Ljcifs/dcerpc/msrpc/lsarpc$LsarSidArray;
        //    88: getfield        jcifs/dcerpc/msrpc/lsarpc$LsarSidArray.num_sids:I
        //    91: anewarray       Ljcifs/smb/SID;
        //    94: astore          10
        //    96: aload_0        
        //    97: invokevirtual   jcifs/dcerpc/DcerpcHandle.getServer:()Ljava/lang/String;
        //   100: astore          11
        //   102: aload_0        
        //   103: invokevirtual   jcifs/dcerpc/DcerpcHandle.getPrincipal:()Ljava/security/Principal;
        //   106: checkcast       Ljcifs/smb/NtlmPasswordAuthentication;
        //   109: astore          12
        //   111: iconst_0       
        //   112: istore          13
        //   114: iload           13
        //   116: aload           10
        //   118: arraylength    
        //   119: if_icmplt       157
        //   122: aload           10
        //   124: arraylength    
        //   125: ifle            144
        //   128: iload           4
        //   130: iconst_1       
        //   131: iand           
        //   132: ifeq            144
        //   135: aload           11
        //   137: aload           12
        //   139: aload           10
        //   141: invokestatic    jcifs/smb/SID.resolveSids:(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;[Ljcifs/smb/SID;)V
        //   144: aload           6
        //   146: ifnull          154
        //   149: aload           6
        //   151: invokevirtual   jcifs/dcerpc/msrpc/SamrAliasHandle.close:()V
        //   154: aload           10
        //   156: areturn        
        //   157: aload           10
        //   159: iload           13
        //   161: new             Ljcifs/smb/SID;
        //   164: dup            
        //   165: aload           7
        //   167: getfield        jcifs/dcerpc/msrpc/MsrpcGetMembersInAlias.sids:Ljcifs/dcerpc/msrpc/lsarpc$LsarSidArray;
        //   170: getfield        jcifs/dcerpc/msrpc/lsarpc$LsarSidArray.sids:[Ljcifs/dcerpc/msrpc/lsarpc$LsarSidPtr;
        //   173: iload           13
        //   175: aaload         
        //   176: getfield        jcifs/dcerpc/msrpc/lsarpc$LsarSidPtr.sid:Ljcifs/dcerpc/rpc$sid_t;
        //   179: iconst_0       
        //   180: aconst_null    
        //   181: aconst_null    
        //   182: iconst_0       
        //   183: invokespecial   jcifs/smb/SID.<init>:(Ljcifs/dcerpc/rpc$sid_t;ILjava/lang/String;Ljava/lang/String;Z)V
        //   186: aastore        
        //   187: aload           10
        //   189: iload           13
        //   191: aaload         
        //   192: aload           11
        //   194: putfield        jcifs/smb/SID.origin_server:Ljava/lang/String;
        //   197: aload           10
        //   199: iload           13
        //   201: aaload         
        //   202: aload           12
        //   204: putfield        jcifs/smb/SID.origin_auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //   207: iinc            13, 1
        //   210: goto            114
        //   213: astore          8
        //   215: aconst_null    
        //   216: astore          9
        //   218: goto            70
        //   221: astore          8
        //   223: aload           6
        //   225: astore          9
        //   227: goto            70
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  9      23     213    221    Any
        //  23     36     221    230    Any
        //  36     64     64     70     Any
        //  83     144    64     70     Any
        //  157    207    64     70     Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0070:
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
    
    static Map getLocalGroupsMap(final String p0, final NtlmPasswordAuthentication p1, final int p2) throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: aload_1        
        //     2: invokestatic    jcifs/smb/SID.getServerSid:(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/smb/SID;
        //     5: astore_3       
        //     6: aconst_null    
        //     7: astore          4
        //     9: new             Ljcifs/dcerpc/msrpc/samr$SamrSamArray;
        //    12: dup            
        //    13: invokespecial   jcifs/dcerpc/msrpc/samr$SamrSamArray.<init>:()V
        //    16: astore          5
        //    18: getstatic       jcifs/smb/SID.sid_cache:Ljava/util/Map;
        //    21: astore          6
        //    23: aload           6
        //    25: monitorenter   
        //    26: new             Ljava/lang/StringBuilder;
        //    29: dup            
        //    30: ldc_w           "ncacn_np:"
        //    33: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    36: astore          7
        //    38: aload           7
        //    40: aload_0        
        //    41: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    44: ldc_w           "[\\PIPE\\samr]"
        //    47: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    50: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    53: aload_1        
        //    54: invokestatic    jcifs/dcerpc/DcerpcHandle.getHandle:(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/dcerpc/DcerpcHandle;
        //    57: astore          4
        //    59: new             Ljcifs/dcerpc/msrpc/SamrPolicyHandle;
        //    62: dup            
        //    63: aload           4
        //    65: aload_0        
        //    66: ldc_w           33554432
        //    69: invokespecial   jcifs/dcerpc/msrpc/SamrPolicyHandle.<init>:(Ljcifs/dcerpc/DcerpcHandle;Ljava/lang/String;I)V
        //    72: astore          12
        //    74: new             Ljcifs/dcerpc/msrpc/SamrDomainHandle;
        //    77: dup            
        //    78: aload           4
        //    80: aload           12
        //    82: ldc_w           33554432
        //    85: aload_3        
        //    86: invokespecial   jcifs/dcerpc/msrpc/SamrDomainHandle.<init>:(Ljcifs/dcerpc/DcerpcHandle;Ljcifs/dcerpc/msrpc/SamrPolicyHandle;ILjcifs/dcerpc/rpc$sid_t;)V
        //    89: astore          13
        //    91: new             Ljcifs/dcerpc/msrpc/MsrpcEnumerateAliasesInDomain;
        //    94: dup            
        //    95: aload           13
        //    97: ldc_w           65535
        //   100: aload           5
        //   102: invokespecial   jcifs/dcerpc/msrpc/MsrpcEnumerateAliasesInDomain.<init>:(Ljcifs/dcerpc/msrpc/SamrDomainHandle;ILjcifs/dcerpc/msrpc/samr$SamrSamArray;)V
        //   105: astore          14
        //   107: aload           4
        //   109: aload           14
        //   111: invokevirtual   jcifs/dcerpc/DcerpcHandle.sendrecv:(Ljcifs/dcerpc/DcerpcMessage;)V
        //   114: aload           14
        //   116: getfield        jcifs/dcerpc/msrpc/MsrpcEnumerateAliasesInDomain.retval:I
        //   119: ifeq            189
        //   122: new             Ljcifs/smb/SmbException;
        //   125: dup            
        //   126: aload           14
        //   128: getfield        jcifs/dcerpc/msrpc/MsrpcEnumerateAliasesInDomain.retval:I
        //   131: iconst_0       
        //   132: invokespecial   jcifs/smb/SmbException.<init>:(IZ)V
        //   135: astore          15
        //   137: aload           15
        //   139: athrow         
        //   140: astore          8
        //   142: aload           13
        //   144: astore          9
        //   146: aload           12
        //   148: astore          10
        //   150: aload           4
        //   152: ifnull          180
        //   155: aload           10
        //   157: ifnull          175
        //   160: aload           9
        //   162: ifnull          170
        //   165: aload           9
        //   167: invokevirtual   jcifs/dcerpc/msrpc/SamrDomainHandle.close:()V
        //   170: aload           10
        //   172: invokevirtual   jcifs/dcerpc/msrpc/SamrPolicyHandle.close:()V
        //   175: aload           4
        //   177: invokevirtual   jcifs/dcerpc/DcerpcHandle.close:()V
        //   180: aload           8
        //   182: athrow         
        //   183: aload           6
        //   185: monitorexit    
        //   186: aload           11
        //   188: athrow         
        //   189: new             Ljava/util/HashMap;
        //   192: dup            
        //   193: invokespecial   java/util/HashMap.<init>:()V
        //   196: astore          16
        //   198: iconst_0       
        //   199: istore          17
        //   201: aload           14
        //   203: getfield        jcifs/dcerpc/msrpc/MsrpcEnumerateAliasesInDomain.sam:Ljcifs/dcerpc/msrpc/samr$SamrSamArray;
        //   206: getfield        jcifs/dcerpc/msrpc/samr$SamrSamArray.count:I
        //   209: istore          18
        //   211: iload           17
        //   213: iload           18
        //   215: if_icmplt       254
        //   218: aload           4
        //   220: ifnull          248
        //   223: aload           12
        //   225: ifnull          243
        //   228: aload           13
        //   230: ifnull          238
        //   233: aload           13
        //   235: invokevirtual   jcifs/dcerpc/msrpc/SamrDomainHandle.close:()V
        //   238: aload           12
        //   240: invokevirtual   jcifs/dcerpc/msrpc/SamrPolicyHandle.close:()V
        //   243: aload           4
        //   245: invokevirtual   jcifs/dcerpc/DcerpcHandle.close:()V
        //   248: aload           6
        //   250: monitorexit    
        //   251: aload           16
        //   253: areturn        
        //   254: aload           14
        //   256: getfield        jcifs/dcerpc/msrpc/MsrpcEnumerateAliasesInDomain.sam:Ljcifs/dcerpc/msrpc/samr$SamrSamArray;
        //   259: getfield        jcifs/dcerpc/msrpc/samr$SamrSamArray.entries:[Ljcifs/dcerpc/msrpc/samr$SamrSamEntry;
        //   262: iload           17
        //   264: aaload         
        //   265: astore          19
        //   267: aload           4
        //   269: aload           13
        //   271: aload_3        
        //   272: aload           19
        //   274: getfield        jcifs/dcerpc/msrpc/samr$SamrSamEntry.idx:I
        //   277: iload_2        
        //   278: invokestatic    jcifs/smb/SID.getGroupMemberSids0:(Ljcifs/dcerpc/DcerpcHandle;Ljcifs/dcerpc/msrpc/SamrDomainHandle;Ljcifs/smb/SID;II)[Ljcifs/smb/SID;
        //   281: astore          20
        //   283: new             Ljcifs/smb/SID;
        //   286: dup            
        //   287: aload_3        
        //   288: aload           19
        //   290: getfield        jcifs/dcerpc/msrpc/samr$SamrSamEntry.idx:I
        //   293: invokespecial   jcifs/smb/SID.<init>:(Ljcifs/smb/SID;I)V
        //   296: astore          21
        //   298: aload           21
        //   300: iconst_4       
        //   301: putfield        jcifs/smb/SID.type:I
        //   304: aload           21
        //   306: aload_3        
        //   307: invokevirtual   jcifs/smb/SID.getDomainName:()Ljava/lang/String;
        //   310: putfield        jcifs/smb/SID.domainName:Ljava/lang/String;
        //   313: new             Ljcifs/dcerpc/UnicodeString;
        //   316: dup            
        //   317: aload           19
        //   319: getfield        jcifs/dcerpc/msrpc/samr$SamrSamEntry.name:Ljcifs/dcerpc/rpc$unicode_string;
        //   322: iconst_0       
        //   323: invokespecial   jcifs/dcerpc/UnicodeString.<init>:(Ljcifs/dcerpc/rpc$unicode_string;Z)V
        //   326: astore          22
        //   328: aload           21
        //   330: aload           22
        //   332: invokevirtual   jcifs/dcerpc/UnicodeString.toString:()Ljava/lang/String;
        //   335: putfield        jcifs/smb/SID.acctName:Ljava/lang/String;
        //   338: iconst_0       
        //   339: istore          23
        //   341: iload           23
        //   343: aload           20
        //   345: arraylength    
        //   346: if_icmplt       355
        //   349: iinc            17, 1
        //   352: goto            201
        //   355: aload           16
        //   357: aload           20
        //   359: iload           23
        //   361: aaload         
        //   362: invokeinterface java/util/Map.get:(Ljava/lang/Object;)Ljava/lang/Object;
        //   367: checkcast       Ljava/util/ArrayList;
        //   370: astore          24
        //   372: aload           24
        //   374: ifnonnull       401
        //   377: new             Ljava/util/ArrayList;
        //   380: dup            
        //   381: invokespecial   java/util/ArrayList.<init>:()V
        //   384: astore          24
        //   386: aload           16
        //   388: aload           20
        //   390: iload           23
        //   392: aaload         
        //   393: aload           24
        //   395: invokeinterface java/util/Map.put:(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   400: pop            
        //   401: aload           24
        //   403: aload           21
        //   405: invokevirtual   java/util/ArrayList.contains:(Ljava/lang/Object;)Z
        //   408: ifne            419
        //   411: aload           24
        //   413: aload           21
        //   415: invokevirtual   java/util/ArrayList.add:(Ljava/lang/Object;)Z
        //   418: pop            
        //   419: iinc            23, 1
        //   422: goto            341
        //   425: astore          11
        //   427: goto            183
        //   430: astore          8
        //   432: aconst_null    
        //   433: astore          9
        //   435: aconst_null    
        //   436: astore          10
        //   438: goto            150
        //   441: astore          8
        //   443: aload           12
        //   445: astore          10
        //   447: aconst_null    
        //   448: astore          9
        //   450: goto            150
        //   453: astore          11
        //   455: goto            183
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  26     74     430    441    Any
        //  74     91     441    453    Any
        //  91     140    140    150    Any
        //  165    186    453    458    Any
        //  189    211    140    150    Any
        //  233    251    425    430    Any
        //  254    419    140    150    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IndexOutOfBoundsException: Index: 210, Size: 210
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
    
    public static SID getServerSid(final String p0, final NtlmPasswordAuthentication p1) throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aconst_null    
        //     1: astore_2       
        //     2: new             Ljcifs/dcerpc/msrpc/lsarpc$LsarDomainInfo;
        //     5: dup            
        //     6: invokespecial   jcifs/dcerpc/msrpc/lsarpc$LsarDomainInfo.<init>:()V
        //     9: astore_3       
        //    10: getstatic       jcifs/smb/SID.sid_cache:Ljava/util/Map;
        //    13: astore          4
        //    15: aload           4
        //    17: monitorenter   
        //    18: new             Ljava/lang/StringBuilder;
        //    21: dup            
        //    22: ldc_w           "ncacn_np:"
        //    25: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    28: aload_0        
        //    29: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    32: ldc_w           "[\\PIPE\\lsarpc]"
        //    35: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    38: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    41: aload_1        
        //    42: invokestatic    jcifs/dcerpc/DcerpcHandle.getHandle:(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/dcerpc/DcerpcHandle;
        //    45: astore_2       
        //    46: new             Ljcifs/dcerpc/msrpc/LsaPolicyHandle;
        //    49: dup            
        //    50: aload_2        
        //    51: aconst_null    
        //    52: iconst_1       
        //    53: invokespecial   jcifs/dcerpc/msrpc/LsaPolicyHandle.<init>:(Ljcifs/dcerpc/DcerpcHandle;Ljava/lang/String;I)V
        //    56: astore          8
        //    58: new             Ljcifs/dcerpc/msrpc/MsrpcQueryInformationPolicy;
        //    61: dup            
        //    62: aload           8
        //    64: iconst_5       
        //    65: aload_3        
        //    66: invokespecial   jcifs/dcerpc/msrpc/MsrpcQueryInformationPolicy.<init>:(Ljcifs/dcerpc/msrpc/LsaPolicyHandle;SLjcifs/dcerpc/ndr/NdrObject;)V
        //    69: astore          9
        //    71: aload_2        
        //    72: aload           9
        //    74: invokevirtual   jcifs/dcerpc/DcerpcHandle.sendrecv:(Ljcifs/dcerpc/DcerpcMessage;)V
        //    77: aload           9
        //    79: getfield        jcifs/dcerpc/msrpc/MsrpcQueryInformationPolicy.retval:I
        //    82: ifeq            132
        //    85: new             Ljcifs/smb/SmbException;
        //    88: dup            
        //    89: aload           9
        //    91: getfield        jcifs/dcerpc/msrpc/MsrpcQueryInformationPolicy.retval:I
        //    94: iconst_0       
        //    95: invokespecial   jcifs/smb/SmbException.<init>:(IZ)V
        //    98: athrow         
        //    99: astore          5
        //   101: aload           8
        //   103: astore          6
        //   105: aload_2        
        //   106: ifnull          123
        //   109: aload           6
        //   111: ifnull          119
        //   114: aload           6
        //   116: invokevirtual   jcifs/dcerpc/msrpc/LsaPolicyHandle.close:()V
        //   119: aload_2        
        //   120: invokevirtual   jcifs/dcerpc/DcerpcHandle.close:()V
        //   123: aload           5
        //   125: athrow         
        //   126: aload           4
        //   128: monitorexit    
        //   129: aload           7
        //   131: athrow         
        //   132: new             Ljcifs/smb/SID;
        //   135: dup            
        //   136: aload_3        
        //   137: getfield        jcifs/dcerpc/msrpc/lsarpc$LsarDomainInfo.sid:Ljcifs/dcerpc/rpc$sid_t;
        //   140: iconst_3       
        //   141: new             Ljcifs/dcerpc/UnicodeString;
        //   144: dup            
        //   145: aload_3        
        //   146: getfield        jcifs/dcerpc/msrpc/lsarpc$LsarDomainInfo.name:Ljcifs/dcerpc/rpc$unicode_string;
        //   149: iconst_0       
        //   150: invokespecial   jcifs/dcerpc/UnicodeString.<init>:(Ljcifs/dcerpc/rpc$unicode_string;Z)V
        //   153: invokevirtual   jcifs/dcerpc/UnicodeString.toString:()Ljava/lang/String;
        //   156: aconst_null    
        //   157: iconst_0       
        //   158: invokespecial   jcifs/smb/SID.<init>:(Ljcifs/dcerpc/rpc$sid_t;ILjava/lang/String;Ljava/lang/String;Z)V
        //   161: astore          10
        //   163: aload_2        
        //   164: ifnull          181
        //   167: aload           8
        //   169: ifnull          177
        //   172: aload           8
        //   174: invokevirtual   jcifs/dcerpc/msrpc/LsaPolicyHandle.close:()V
        //   177: aload_2        
        //   178: invokevirtual   jcifs/dcerpc/DcerpcHandle.close:()V
        //   181: aload           4
        //   183: monitorexit    
        //   184: aload           10
        //   186: areturn        
        //   187: astore          7
        //   189: goto            126
        //   192: astore          5
        //   194: aconst_null    
        //   195: astore          6
        //   197: goto            105
        //   200: astore          7
        //   202: goto            126
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  18     58     192    200    Any
        //  58     99     99     105    Any
        //  114    129    200    205    Any
        //  132    163    99     105    Any
        //  172    184    187    192    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0119:
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
    
    public static void resolveSids(final String s, final NtlmPasswordAuthentication ntlmPasswordAuthentication, final SID[] array) throws IOException {
        final ArrayList<SID> list = new ArrayList<SID>(array.length);
        final Map sid_cache = SID.sid_cache;
        // monitorenter(sid_cache)
        int n = 0;
        while (true) {
        Label_0176:
            while (true) {
                SID[] array2 = null;
                int n2 = 0;
                Label_0151: {
                    try {
                        if (n >= array.length) {
                            if (list.size() > 0) {
                                array2 = list.toArray(new SID[0]);
                                resolveSids0(s, ntlmPasswordAuthentication, array2);
                                n2 = 0;
                                if (n2 < array2.length) {
                                    break Label_0151;
                                }
                            }
                            return;
                        }
                        final SID sid = SID.sid_cache.get(array[n]);
                        if (sid != null) {
                            array[n].type = sid.type;
                            array[n].domainName = sid.domainName;
                            array[n].acctName = sid.acctName;
                            break Label_0176;
                        }
                        list.add(array[n]);
                        break Label_0176;
                    }
                    finally {}
                    // monitorexit(sid_cache)
                }
                SID.sid_cache.put(array2[n2], array2[n2]);
                ++n2;
                continue;
            }
            ++n;
        }
    }
    
    public static void resolveSids(final String s, final NtlmPasswordAuthentication ntlmPasswordAuthentication, final SID[] array, final int n, final int n2) throws IOException {
        final ArrayList<SID> list = new ArrayList<SID>(array.length);
        final Map sid_cache = SID.sid_cache;
        // monitorenter(sid_cache)
        int n3 = 0;
        while (true) {
            Label_0073: {
                if (n3 < n2) {
                    break Label_0073;
                }
                while (true) {
                    while (true) {
                        SID[] array2 = null;
                        int n4 = 0;
                        Label_0165: {
                            try {
                                if (list.size() > 0) {
                                    array2 = list.toArray(new SID[0]);
                                    resolveSids0(s, ntlmPasswordAuthentication, array2);
                                    n4 = 0;
                                    if (n4 < array2.length) {
                                        break Label_0165;
                                    }
                                }
                                return;
                                Label_0142: {
                                    list.add(array[n + n3]);
                                }
                                break;
                                while (true) {
                                    final SID sid;
                                    array[n + n3].type = sid.type;
                                    array[n + n3].domainName = sid.domainName;
                                    array[n + n3].acctName = sid.acctName;
                                    break;
                                    sid = SID.sid_cache.get(array[n + n3]);
                                    continue;
                                }
                            }
                            // iftrue(Label_0142:, sid == null)
                            finally {}
                            // monitorexit(sid_cache)
                        }
                        SID.sid_cache.put(array2[n4], array2[n4]);
                        ++n4;
                        continue;
                    }
                }
            }
            ++n3;
        }
    }
    
    static void resolveSids(final DcerpcHandle dcerpcHandle, final LsaPolicyHandle lsaPolicyHandle, final SID[] array) throws IOException {
        final MsrpcLookupSids msrpcLookupSids = new MsrpcLookupSids(lsaPolicyHandle, array);
        dcerpcHandle.sendrecv(msrpcLookupSids);
        switch (msrpcLookupSids.retval) {
            default: {
                throw new SmbException(msrpcLookupSids.retval, false);
            }
            case -1073741709:
            case 0:
            case 263: {
                for (int i = 0; i < array.length; ++i) {
                    array[i].type = msrpcLookupSids.names.names[i].sid_type;
                    array[i].domainName = null;
                    switch (array[i].type) {
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5: {
                            array[i].domainName = new UnicodeString(msrpcLookupSids.domains.domains[msrpcLookupSids.names.names[i].sid_index].name, false).toString();
                            break;
                        }
                    }
                    array[i].acctName = new UnicodeString(msrpcLookupSids.names.names[i].name, false).toString();
                    array[i].origin_server = null;
                    array[i].origin_auth = null;
                }
            }
        }
    }
    
    static void resolveSids0(final String p0, final NtlmPasswordAuthentication p1, final SID[] p2) throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aconst_null    
        //     1: astore_3       
        //     2: aconst_null    
        //     3: astore          4
        //     5: getstatic       jcifs/smb/SID.sid_cache:Ljava/util/Map;
        //     8: astore          5
        //    10: aload           5
        //    12: monitorenter   
        //    13: new             Ljava/lang/StringBuilder;
        //    16: dup            
        //    17: ldc_w           "ncacn_np:"
        //    20: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    23: aload_0        
        //    24: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    27: ldc_w           "[\\PIPE\\lsarpc]"
        //    30: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    33: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    36: aload_1        
        //    37: invokestatic    jcifs/dcerpc/DcerpcHandle.getHandle:(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/dcerpc/DcerpcHandle;
        //    40: astore_3       
        //    41: aload_0        
        //    42: astore          8
        //    44: aload           8
        //    46: bipush          46
        //    48: invokevirtual   java/lang/String.indexOf:(I)I
        //    51: istore          9
        //    53: iload           9
        //    55: ifle            80
        //    58: aload           8
        //    60: iconst_0       
        //    61: invokevirtual   java/lang/String.charAt:(I)C
        //    64: invokestatic    java/lang/Character.isDigit:(C)Z
        //    67: ifne            80
        //    70: aload           8
        //    72: iconst_0       
        //    73: iload           9
        //    75: invokevirtual   java/lang/String.substring:(II)Ljava/lang/String;
        //    78: astore          8
        //    80: new             Ljcifs/dcerpc/msrpc/LsaPolicyHandle;
        //    83: dup            
        //    84: aload_3        
        //    85: new             Ljava/lang/StringBuilder;
        //    88: dup            
        //    89: ldc_w           "\\\\"
        //    92: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    95: aload           8
        //    97: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   100: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   103: sipush          2048
        //   106: invokespecial   jcifs/dcerpc/msrpc/LsaPolicyHandle.<init>:(Ljcifs/dcerpc/DcerpcHandle;Ljava/lang/String;I)V
        //   109: astore          10
        //   111: aload_3        
        //   112: aload           10
        //   114: aload_2        
        //   115: invokestatic    jcifs/smb/SID.resolveSids:(Ljcifs/dcerpc/DcerpcHandle;Ljcifs/dcerpc/msrpc/LsaPolicyHandle;[Ljcifs/smb/SID;)V
        //   118: aload_3        
        //   119: ifnull          136
        //   122: aload           10
        //   124: ifnull          132
        //   127: aload           10
        //   129: invokevirtual   jcifs/dcerpc/msrpc/LsaPolicyHandle.close:()V
        //   132: aload_3        
        //   133: invokevirtual   jcifs/dcerpc/DcerpcHandle.close:()V
        //   136: aload           5
        //   138: monitorexit    
        //   139: return         
        //   140: astore          6
        //   142: aload_3        
        //   143: ifnull          160
        //   146: aload           4
        //   148: ifnull          156
        //   151: aload           4
        //   153: invokevirtual   jcifs/dcerpc/msrpc/LsaPolicyHandle.close:()V
        //   156: aload_3        
        //   157: invokevirtual   jcifs/dcerpc/DcerpcHandle.close:()V
        //   160: aload           6
        //   162: athrow         
        //   163: aload           5
        //   165: monitorexit    
        //   166: aload           7
        //   168: athrow         
        //   169: astore          7
        //   171: goto            163
        //   174: astore          6
        //   176: aload           10
        //   178: astore          4
        //   180: goto            142
        //   183: astore          7
        //   185: goto            163
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  13     111    140    142    Any
        //  111    118    174    183    Any
        //  127    139    169    174    Any
        //  151    166    183    188    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0132:
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
    
    public static byte[] toByteArray(final rpc.sid_t sid_t) {
        final byte[] array = new byte[8 + 4 * sid_t.sub_authority_count];
        final int n = 0 + 1;
        array[0] = sid_t.revision;
        final int n2 = n + 1;
        array[n] = sid_t.sub_authority_count;
        System.arraycopy(sid_t.identifier_authority, 0, array, n2, 6);
        int n3 = n2 + 6;
        for (byte b = 0; b < sid_t.sub_authority_count; ++b) {
            Encdec.enc_uint32le(sid_t.sub_authority[b], array, n3);
            n3 += 4;
        }
        return array;
    }
    
    public boolean equals(final Object o) {
        boolean b = true;
        if (!(o instanceof SID)) {
            return false;
        }
        final SID sid = (SID)o;
        Label_0019: {
            if (sid != this) {
                if (sid.sub_authority_count != this.sub_authority_count) {
                    return false;
                }
                int sub_authority_count = this.sub_authority_count;
                while (true) {
                    final int n = sub_authority_count - 1;
                    if (sub_authority_count <= 0) {
                        for (int i = 0; i < 6; ++i) {
                            if (sid.identifier_authority[i] != this.identifier_authority[i]) {
                                b = false;
                                break Label_0019;
                            }
                        }
                        if (sid.revision != this.revision) {
                            b = false;
                            break;
                        }
                        break;
                    }
                    else {
                        if (sid.sub_authority[n] != this.sub_authority[n]) {
                            b = false;
                            break;
                        }
                        sub_authority_count = n;
                    }
                }
            }
        }
        return b;
        b = false;
        return b;
    }
    
    public String getAccountName() {
        if (this.origin_server != null) {
            this.resolveWeak();
        }
        String s;
        if (this.type == 8) {
            s = new StringBuilder().append(this.sub_authority[-1 + this.sub_authority_count]).toString();
        }
        else if (this.type == 3) {
            s = "";
        }
        else {
            s = this.acctName;
        }
        return s;
    }
    
    public String getDomainName() {
        if (this.origin_server != null) {
            this.resolveWeak();
        }
        String s;
        if (this.type == 8) {
            final String string = this.toString();
            s = string.substring(0, -1 + (string.length() - this.getAccountName().length()));
        }
        else {
            s = this.domainName;
        }
        return s;
    }
    
    public SID getDomainSid() {
        return new SID(this, 3, this.domainName, null, this.getType() != 3);
    }
    
    public SID[] getGroupMemberSids(final String p0, final NtlmPasswordAuthentication p1, final int p2) throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: getfield        jcifs/smb/SID.type:I
        //     4: iconst_2       
        //     5: if_icmpeq       25
        //     8: aload_0        
        //     9: getfield        jcifs/smb/SID.type:I
        //    12: iconst_4       
        //    13: if_icmpeq       25
        //    16: iconst_0       
        //    17: anewarray       Ljcifs/smb/SID;
        //    20: astore          14
        //    22: aload           14
        //    24: areturn        
        //    25: aconst_null    
        //    26: astore          4
        //    28: aconst_null    
        //    29: astore          5
        //    31: aconst_null    
        //    32: astore          6
        //    34: aload_0        
        //    35: invokevirtual   jcifs/smb/SID.getDomainSid:()Ljcifs/smb/SID;
        //    38: astore          7
        //    40: getstatic       jcifs/smb/SID.sid_cache:Ljava/util/Map;
        //    43: astore          8
        //    45: aload           8
        //    47: monitorenter   
        //    48: new             Ljava/lang/StringBuilder;
        //    51: dup            
        //    52: ldc_w           "ncacn_np:"
        //    55: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    58: aload_1        
        //    59: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    62: ldc_w           "[\\PIPE\\samr]"
        //    65: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    68: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    71: aload_2        
        //    72: invokestatic    jcifs/dcerpc/DcerpcHandle.getHandle:(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/dcerpc/DcerpcHandle;
        //    75: astore          4
        //    77: new             Ljcifs/dcerpc/msrpc/SamrPolicyHandle;
        //    80: dup            
        //    81: aload           4
        //    83: aload_1        
        //    84: bipush          48
        //    86: invokespecial   jcifs/dcerpc/msrpc/SamrPolicyHandle.<init>:(Ljcifs/dcerpc/DcerpcHandle;Ljava/lang/String;I)V
        //    89: astore          11
        //    91: new             Ljcifs/dcerpc/msrpc/SamrDomainHandle;
        //    94: dup            
        //    95: aload           4
        //    97: aload           11
        //    99: sipush          512
        //   102: aload           7
        //   104: invokespecial   jcifs/dcerpc/msrpc/SamrDomainHandle.<init>:(Ljcifs/dcerpc/DcerpcHandle;Ljcifs/dcerpc/msrpc/SamrPolicyHandle;ILjcifs/dcerpc/rpc$sid_t;)V
        //   107: astore          12
        //   109: aload           4
        //   111: aload           12
        //   113: aload           7
        //   115: aload_0        
        //   116: invokevirtual   jcifs/smb/SID.getRid:()I
        //   119: iload_3        
        //   120: invokestatic    jcifs/smb/SID.getGroupMemberSids0:(Ljcifs/dcerpc/DcerpcHandle;Ljcifs/dcerpc/msrpc/SamrDomainHandle;Ljcifs/smb/SID;II)[Ljcifs/smb/SID;
        //   123: astore          13
        //   125: aload           13
        //   127: astore          14
        //   129: aload           4
        //   131: ifnull          159
        //   134: aload           11
        //   136: ifnull          154
        //   139: aload           12
        //   141: ifnull          149
        //   144: aload           12
        //   146: invokevirtual   jcifs/dcerpc/msrpc/SamrDomainHandle.close:()V
        //   149: aload           11
        //   151: invokevirtual   jcifs/dcerpc/msrpc/SamrPolicyHandle.close:()V
        //   154: aload           4
        //   156: invokevirtual   jcifs/dcerpc/DcerpcHandle.close:()V
        //   159: aload           8
        //   161: monitorexit    
        //   162: goto            22
        //   165: astore          10
        //   167: aload           8
        //   169: monitorexit    
        //   170: aload           10
        //   172: athrow         
        //   173: astore          9
        //   175: aload           4
        //   177: ifnull          205
        //   180: aload           5
        //   182: ifnull          200
        //   185: aload           6
        //   187: ifnull          195
        //   190: aload           6
        //   192: invokevirtual   jcifs/dcerpc/msrpc/SamrDomainHandle.close:()V
        //   195: aload           5
        //   197: invokevirtual   jcifs/dcerpc/msrpc/SamrPolicyHandle.close:()V
        //   200: aload           4
        //   202: invokevirtual   jcifs/dcerpc/DcerpcHandle.close:()V
        //   205: aload           9
        //   207: athrow         
        //   208: astore          10
        //   210: goto            167
        //   213: astore          9
        //   215: aload           11
        //   217: astore          5
        //   219: aconst_null    
        //   220: astore          6
        //   222: goto            175
        //   225: astore          9
        //   227: aload           12
        //   229: astore          6
        //   231: aload           11
        //   233: astore          5
        //   235: goto            175
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  48     91     173    175    Any
        //  91     109    213    225    Any
        //  109    125    225    238    Any
        //  144    162    165    167    Any
        //  167    170    208    213    Any
        //  190    208    208    213    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IndexOutOfBoundsException: Index: 112, Size: 112
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
    
    public int getRid() {
        if (this.getType() == 3) {
            throw new IllegalArgumentException("This SID is a domain sid");
        }
        return this.sub_authority[-1 + this.sub_authority_count];
    }
    
    public int getType() {
        if (this.origin_server != null) {
            this.resolveWeak();
        }
        return this.type;
    }
    
    public String getTypeText() {
        if (this.origin_server != null) {
            this.resolveWeak();
        }
        return SID.SID_TYPE_NAMES[this.type];
    }
    
    public int hashCode() {
        int n = this.identifier_authority[5];
        for (byte b = 0; b < this.sub_authority_count; ++b) {
            n += 65599 * this.sub_authority[b];
        }
        return n;
    }
    
    public void resolve(final String s, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws IOException {
        resolveSids(s, ntlmPasswordAuthentication, new SID[] { this });
    }
    
    void resolveWeak() {
        if (this.origin_server == null) {
            return;
        }
        try {
            this.resolve(this.origin_server, this.origin_auth);
        }
        catch (IOException ex) {
            this.origin_server = null;
            this.origin_auth = null;
        }
        finally {
            this.origin_server = null;
            this.origin_auth = null;
        }
    }
    
    public String toDisplayString() {
        if (this.origin_server != null) {
            this.resolveWeak();
        }
        String s;
        if (this.domainName != null) {
            if (this.type == 3) {
                s = this.domainName;
            }
            else if (this.type == 5 || this.domainName.equals("BUILTIN")) {
                if (this.type == 8) {
                    s = this.toString();
                }
                else {
                    s = this.acctName;
                }
            }
            else {
                s = String.valueOf(this.domainName) + "\\" + this.acctName;
            }
        }
        else {
            s = this.toString();
        }
        return s;
    }
    
    public String toString() {
        final String string = "S-" + (0xFF & this.revision) + "-";
        String s;
        if (this.identifier_authority[0] != 0 || this.identifier_authority[1] != 0) {
            s = String.valueOf(new StringBuilder(String.valueOf(string)).append("0x").toString()) + Hexdump.toHexString(this.identifier_authority, 0, 6);
        }
        else {
            long n = 0L;
            long n2 = 0L;
            for (int i = 5; i > 1; --i) {
                n2 += (0xFFL & this.identifier_authority[i]) << (int)n;
                n += 8L;
            }
            s = String.valueOf(string) + n2;
        }
        for (byte b = 0; b < this.sub_authority_count; ++b) {
            s = String.valueOf(s) + "-" + (0xFFFFFFFFL & this.sub_authority[b]);
        }
        return s;
    }
}
