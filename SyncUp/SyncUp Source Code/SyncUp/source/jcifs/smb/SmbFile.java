package jcifs.smb;

import jcifs.util.*;
import jcifs.*;
import jcifs.dcerpc.*;
import jcifs.dcerpc.msrpc.*;
import java.util.*;
import java.net.*;
import jcifs.netbios.*;
import java.io.*;
import java.security.*;

public class SmbFile extends URLConnection implements SmbConstants
{
    public static final int ATTR_ARCHIVE = 32;
    static final int ATTR_COMPRESSED = 2048;
    public static final int ATTR_DIRECTORY = 16;
    static final int ATTR_GET_MASK = 32767;
    public static final int ATTR_HIDDEN = 2;
    static final int ATTR_NORMAL = 128;
    public static final int ATTR_READONLY = 1;
    static final int ATTR_SET_MASK = 12455;
    public static final int ATTR_SYSTEM = 4;
    static final int ATTR_TEMPORARY = 256;
    public static final int ATTR_VOLUME = 8;
    static final int DEFAULT_ATTR_EXPIRATION_PERIOD = 5000;
    public static final int FILE_NO_SHARE = 0;
    public static final int FILE_SHARE_DELETE = 4;
    public static final int FILE_SHARE_READ = 1;
    public static final int FILE_SHARE_WRITE = 2;
    static final int HASH_DOT = 0;
    static final int HASH_DOT_DOT = 0;
    static final int O_APPEND = 4;
    static final int O_CREAT = 16;
    static final int O_EXCL = 32;
    static final int O_RDONLY = 1;
    static final int O_RDWR = 3;
    static final int O_TRUNC = 64;
    static final int O_WRONLY = 2;
    public static final int TYPE_COMM = 64;
    public static final int TYPE_FILESYSTEM = 1;
    public static final int TYPE_NAMED_PIPE = 16;
    public static final int TYPE_PRINTER = 32;
    public static final int TYPE_SERVER = 4;
    public static final int TYPE_SHARE = 8;
    public static final int TYPE_WORKGROUP = 2;
    static long attrExpirationPeriod;
    protected static Dfs dfs;
    static boolean ignoreCopyToException;
    static LogStream log;
    int addressIndex;
    UniAddress[] addresses;
    private long attrExpiration;
    private int attributes;
    NtlmPasswordAuthentication auth;
    private SmbComBlankResponse blank_resp;
    private String canon;
    private long createTime;
    private DfsReferral dfsReferral;
    int fid;
    private boolean isExists;
    private long lastModified;
    boolean opened;
    private String share;
    private int shareAccess;
    private long size;
    private long sizeExpiration;
    SmbTree tree;
    int tree_num;
    int type;
    String unc;
    
    static {
        HASH_DOT = ".".hashCode();
        HASH_DOT_DOT = "..".hashCode();
        SmbFile.log = LogStream.getInstance();
        while (true) {
            try {
                Class.forName("jcifs.Config");
                SmbFile.attrExpirationPeriod = Config.getLong("jcifs.smb.client.attrExpirationPeriod", 5000L);
                SmbFile.ignoreCopyToException = Config.getBoolean("jcifs.smb.client.ignoreCopyToException", true);
                SmbFile.dfs = new Dfs();
            }
            catch (ClassNotFoundException ex) {
                ex.printStackTrace();
                continue;
            }
            break;
        }
    }
    
    public SmbFile(final String s) throws MalformedURLException {
        this(new URL(null, s, Handler.SMB_HANDLER));
    }
    
    public SmbFile(final String s, final String s2) throws MalformedURLException {
        this(new URL(new URL(null, s, Handler.SMB_HANDLER), s2, Handler.SMB_HANDLER));
    }
    
    public SmbFile(final String s, final String s2, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws MalformedURLException {
        this(new URL(new URL(null, s, Handler.SMB_HANDLER), s2, Handler.SMB_HANDLER), ntlmPasswordAuthentication);
    }
    
    public SmbFile(final String s, final String s2, final NtlmPasswordAuthentication ntlmPasswordAuthentication, final int shareAccess) throws MalformedURLException {
        this(new URL(new URL(null, s, Handler.SMB_HANDLER), s2, Handler.SMB_HANDLER), ntlmPasswordAuthentication);
        if ((shareAccess & 0xFFFFFFF8) != 0x0) {
            throw new RuntimeException("Illegal shareAccess parameter");
        }
        this.shareAccess = shareAccess;
    }
    
    public SmbFile(final String s, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws MalformedURLException {
        this(new URL(null, s, Handler.SMB_HANDLER), ntlmPasswordAuthentication);
    }
    
    public SmbFile(final String s, final NtlmPasswordAuthentication ntlmPasswordAuthentication, final int shareAccess) throws MalformedURLException {
        this(new URL(null, s, Handler.SMB_HANDLER), ntlmPasswordAuthentication);
        if ((shareAccess & 0xFFFFFFF8) != 0x0) {
            throw new RuntimeException("Illegal shareAccess parameter");
        }
        this.shareAccess = shareAccess;
    }
    
    public SmbFile(final URL url) {
        this(url, new NtlmPasswordAuthentication(url.getUserInfo()));
    }
    
    public SmbFile(final URL url, NtlmPasswordAuthentication auth) {
        super(url);
        this.shareAccess = 7;
        this.blank_resp = null;
        this.dfsReferral = null;
        this.tree = null;
        if (auth == null) {
            auth = new NtlmPasswordAuthentication(url.getUserInfo());
        }
        this.auth = auth;
        this.getUncPath0();
    }
    
    public SmbFile(final SmbFile smbFile, final String s) throws MalformedURLException, UnknownHostException {
        URL url;
        if (smbFile.isWorkgroup0()) {
            url = new URL(null, "smb://" + s, Handler.SMB_HANDLER);
        }
        else {
            url = new URL(smbFile.url, s, Handler.SMB_HANDLER);
        }
        this(url, smbFile.auth);
    }
    
    public SmbFile(final SmbFile smbFile, final String s, final int shareAccess) throws MalformedURLException, UnknownHostException {
        URL url;
        if (smbFile.isWorkgroup0()) {
            url = new URL(null, "smb://" + s, Handler.SMB_HANDLER);
        }
        else {
            url = new URL(smbFile.url, s, Handler.SMB_HANDLER);
        }
        this(url, smbFile.auth);
        if ((shareAccess & 0xFFFFFFF8) != 0x0) {
            throw new RuntimeException("Illegal shareAccess parameter");
        }
        this.shareAccess = shareAccess;
    }
    
    SmbFile(final SmbFile smbFile, String substring, final int type, final int attributes, final long createTime, final long lastModified, final long size) throws MalformedURLException, UnknownHostException {
        URL url;
        if (smbFile.isWorkgroup0()) {
            url = new URL(null, "smb://" + substring + "/", Handler.SMB_HANDLER);
        }
        else {
            final URL url2 = smbFile.url;
            final StringBuilder sb = new StringBuilder(String.valueOf(substring));
            String s;
            if ((attributes & 0x10) > 0) {
                s = "/";
            }
            else {
                s = "";
            }
            url = new URL(url2, sb.append(s).toString());
        }
        this(url);
        this.auth = smbFile.auth;
        if (smbFile.share != null) {
            this.tree = smbFile.tree;
            this.dfsReferral = smbFile.dfsReferral;
        }
        final int n = -1 + substring.length();
        if (substring.charAt(n) == '/') {
            substring = substring.substring(0, n);
        }
        if (smbFile.share == null) {
            this.unc = "\\";
        }
        else if (smbFile.unc.equals("\\")) {
            this.unc = String.valueOf('\\') + substring;
        }
        else {
            this.unc = String.valueOf(smbFile.unc) + '\\' + substring;
        }
        this.type = type;
        this.attributes = attributes;
        this.createTime = createTime;
        this.lastModified = lastModified;
        this.size = size;
        this.isExists = true;
        final long n2 = System.currentTimeMillis() + SmbFile.attrExpirationPeriod;
        this.sizeExpiration = n2;
        this.attrExpiration = n2;
    }
    
    private SmbComBlankResponse blank_resp() {
        if (this.blank_resp == null) {
            this.blank_resp = new SmbComBlankResponse();
        }
        return this.blank_resp;
    }
    
    private void processAces(final ACE[] array, final boolean b) throws IOException {
        final String serverWithDfs = this.getServerWithDfs();
        if (b) {
            final SID[] array2 = new SID[array.length];
            for (int i = 0; i < array.length; ++i) {
                array2[i] = array[i].sid;
            }
            for (int j = 0; j < array2.length; j += 64) {
                int n = array2.length - j;
                if (n > 64) {
                    n = 64;
                }
                SID.resolveSids(serverWithDfs, this.auth, array2, j, n);
            }
        }
        else {
            for (int k = 0; k < array.length; ++k) {
                array[k].sid.origin_server = serverWithDfs;
                array[k].sid.origin_auth = this.auth;
            }
        }
    }
    
    private long queryFSInformation(final int n) throws SmbException {
        final Trans2QueryFSInformationResponse trans2QueryFSInformationResponse = new Trans2QueryFSInformationResponse(n);
        this.send(new Trans2QueryFSInformation(n), trans2QueryFSInformationResponse);
        if (this.type == 8) {
            this.size = trans2QueryFSInformationResponse.info.getCapacity();
            this.sizeExpiration = System.currentTimeMillis() + SmbFile.attrExpirationPeriod;
        }
        return trans2QueryFSInformationResponse.info.getFree();
    }
    
    static String queryLookup(final String s, final String s2) {
        final char[] charArray = s.toCharArray();
        int n = 0;
        int n2 = 0;
        for (int i = 0; i < charArray.length; ++i) {
            final char c = charArray[i];
            if (c == '&') {
                if (n > n2 && new String(charArray, n2, n - n2).equalsIgnoreCase(s2)) {
                    final int n3 = n + 1;
                    return new String(charArray, n3, i - n3);
                }
                n2 = i + 1;
            }
            else if (c == '=') {
                n = i;
            }
        }
        if (n > n2 && new String(charArray, n2, n - n2).equalsIgnoreCase(s2)) {
            final int n4 = n + 1;
            return new String(charArray, n4, charArray.length - n4);
        }
        return null;
    }
    
    public boolean canRead() throws SmbException {
        return this.getType() == 16 || this.exists();
    }
    
    public boolean canWrite() throws SmbException {
        boolean b = true;
        if (this.getType() != 16 && (!this.exists() || (0x1 & this.attributes) != 0x0)) {
            b = false;
        }
        return b;
    }
    
    void close() throws SmbException {
        this.close(0L);
    }
    
    void close(final int n, final long n2) throws SmbException {
        if (LogStream.level >= 3) {
            SmbFile.log.println("close: " + n);
        }
        this.send(new SmbComClose(n, n2), this.blank_resp());
    }
    
    void close(final long n) throws SmbException {
        if (this.isOpen()) {
            this.close(this.fid, n);
            this.opened = false;
        }
    }
    
    public void connect() throws IOException {
        if (!this.isConnected()) {
            this.getUncPath0();
            this.getFirstAddress();
            while (true) {
                try {
                    this.doConnect();
                }
                catch (SmbAuthException ex) {
                    throw ex;
                }
                catch (SmbException ex2) {
                    if (this.getNextAddress() == null) {
                        throw ex2;
                    }
                    if (LogStream.level >= 3) {
                        ex2.printStackTrace(SmbFile.log);
                    }
                    continue;
                }
                break;
            }
        }
    }
    
    void connect0() throws SmbException {
        try {
            this.connect();
        }
        catch (UnknownHostException ex) {
            throw new SmbException("Failed to connect to server", ex);
        }
        catch (SmbException ex2) {
            throw ex2;
        }
        catch (IOException ex3) {
            throw new SmbException("Failed to connect to server", ex3);
        }
    }
    
    public void copyTo(final SmbFile smbFile) throws SmbException {
        if (this.share == null || smbFile.share == null) {
            throw new SmbException("Invalid operation for workgroups or servers");
        }
        final SmbComReadAndX smbComReadAndX = new SmbComReadAndX();
        final SmbComReadAndXResponse smbComReadAndXResponse = new SmbComReadAndXResponse();
        this.connect0();
        smbFile.connect0();
        this.resolveDfs(null);
        try {
            if (this.getAddress().equals(smbFile.getAddress()) && this.canon.regionMatches(true, 0, smbFile.canon, 0, Math.min(this.canon.length(), smbFile.canon.length()))) {
                throw new SmbException("Source and destination paths overlap.");
            }
        }
        catch (UnknownHostException ex) {}
        final WriterThread writerThread = new WriterThread();
        writerThread.setDaemon(true);
        writerThread.start();
        final SmbTransport transport = this.tree.session.transport;
        final SmbTransport transport2 = smbFile.tree.session.transport;
        Label_0254: {
            if (transport.snd_buf_size >= transport2.snd_buf_size) {
                break Label_0254;
            }
            transport2.snd_buf_size = transport.snd_buf_size;
            while (true) {
                final int min = Math.min(-70 + transport.rcv_buf_size, -70 + transport.snd_buf_size);
                final byte[][] array = (byte[][])Array.newInstance(Byte.TYPE, 2, min);
                try {
                    this.copyTo0(smbFile, array, min, writerThread, smbComReadAndX, smbComReadAndXResponse);
                    return;
                    transport.snd_buf_size = transport2.snd_buf_size;
                }
                finally {
                    writerThread.write(null, -1, null, 0L);
                }
            }
        }
    }
    
    void copyTo0(final SmbFile p0, final byte[][] p1, final int p2, final WriterThread p3, final SmbComReadAndX p4, final SmbComReadAndXResponse p5) throws SmbException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: getfield        jcifs/smb/SmbFile.attrExpiration:J
        //     4: invokestatic    java/lang/System.currentTimeMillis:()J
        //     7: lcmp           
        //     8: ifge            94
        //    11: aload_0        
        //    12: bipush          17
        //    14: putfield        jcifs/smb/SmbFile.attributes:I
        //    17: aload_0        
        //    18: lconst_0       
        //    19: putfield        jcifs/smb/SmbFile.createTime:J
        //    22: aload_0        
        //    23: lconst_0       
        //    24: putfield        jcifs/smb/SmbFile.lastModified:J
        //    27: aload_0        
        //    28: iconst_0       
        //    29: putfield        jcifs/smb/SmbFile.isExists:Z
        //    32: aload_0        
        //    33: aload_0        
        //    34: invokevirtual   jcifs/smb/SmbFile.getUncPath0:()Ljava/lang/String;
        //    37: sipush          257
        //    40: invokevirtual   jcifs/smb/SmbFile.queryPath:(Ljava/lang/String;I)Ljcifs/smb/Info;
        //    43: astore          23
        //    45: aload_0        
        //    46: aload           23
        //    48: invokeinterface jcifs/smb/Info.getAttributes:()I
        //    53: putfield        jcifs/smb/SmbFile.attributes:I
        //    56: aload_0        
        //    57: aload           23
        //    59: invokeinterface jcifs/smb/Info.getCreateTime:()J
        //    64: putfield        jcifs/smb/SmbFile.createTime:J
        //    67: aload_0        
        //    68: aload           23
        //    70: invokeinterface jcifs/smb/Info.getLastWriteTime:()J
        //    75: putfield        jcifs/smb/SmbFile.lastModified:J
        //    78: aload_0        
        //    79: iconst_1       
        //    80: putfield        jcifs/smb/SmbFile.isExists:Z
        //    83: aload_0        
        //    84: invokestatic    java/lang/System.currentTimeMillis:()J
        //    87: getstatic       jcifs/smb/SmbFile.attrExpirationPeriod:J
        //    90: ladd           
        //    91: putfield        jcifs/smb/SmbFile.attrExpiration:J
        //    94: aload_0        
        //    95: invokevirtual   jcifs/smb/SmbFile.isDirectory:()Z
        //    98: ifeq            308
        //   101: aload_1        
        //   102: invokevirtual   jcifs/smb/SmbFile.getUncPath0:()Ljava/lang/String;
        //   105: invokevirtual   java/lang/String.length:()I
        //   108: iconst_1       
        //   109: if_icmple       132
        //   112: aload_1        
        //   113: invokevirtual   jcifs/smb/SmbFile.mkdir:()V
        //   116: aload_1        
        //   117: aload_0        
        //   118: getfield        jcifs/smb/SmbFile.attributes:I
        //   121: aload_0        
        //   122: getfield        jcifs/smb/SmbFile.createTime:J
        //   125: aload_0        
        //   126: getfield        jcifs/smb/SmbFile.lastModified:J
        //   129: invokevirtual   jcifs/smb/SmbFile.setPathInformation:(IJJ)V
        //   132: aload_0        
        //   133: ldc_w           "*"
        //   136: bipush          22
        //   138: aconst_null    
        //   139: aconst_null    
        //   140: invokevirtual   jcifs/smb/SmbFile.listFiles:(Ljava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)[Ljcifs/smb/SmbFile;
        //   143: astore          16
        //   145: iconst_0       
        //   146: istore          17
        //   148: aload           16
        //   150: arraylength    
        //   151: istore          20
        //   153: iload           17
        //   155: iload           20
        //   157: if_icmplt       188
        //   160: return         
        //   161: astore          22
        //   163: aload           22
        //   165: invokevirtual   jcifs/smb/SmbException.getNtStatus:()I
        //   168: ldc_w           -1073741790
        //   171: if_icmpeq       132
        //   174: aload           22
        //   176: invokevirtual   jcifs/smb/SmbException.getNtStatus:()I
        //   179: ldc_w           -1073741771
        //   182: if_icmpeq       132
        //   185: aload           22
        //   187: athrow         
        //   188: new             Ljcifs/smb/SmbFile;
        //   191: dup            
        //   192: aload_1        
        //   193: aload           16
        //   195: iload           17
        //   197: aaload         
        //   198: invokevirtual   jcifs/smb/SmbFile.getName:()Ljava/lang/String;
        //   201: aload           16
        //   203: iload           17
        //   205: aaload         
        //   206: getfield        jcifs/smb/SmbFile.type:I
        //   209: aload           16
        //   211: iload           17
        //   213: aaload         
        //   214: getfield        jcifs/smb/SmbFile.attributes:I
        //   217: aload           16
        //   219: iload           17
        //   221: aaload         
        //   222: getfield        jcifs/smb/SmbFile.createTime:J
        //   225: aload           16
        //   227: iload           17
        //   229: aaload         
        //   230: getfield        jcifs/smb/SmbFile.lastModified:J
        //   233: aload           16
        //   235: iload           17
        //   237: aaload         
        //   238: getfield        jcifs/smb/SmbFile.size:J
        //   241: invokespecial   jcifs/smb/SmbFile.<init>:(Ljcifs/smb/SmbFile;Ljava/lang/String;IIJJJ)V
        //   244: astore          21
        //   246: aload           16
        //   248: iload           17
        //   250: aaload         
        //   251: aload           21
        //   253: aload_2        
        //   254: iload_3        
        //   255: aload           4
        //   257: aload           5
        //   259: aload           6
        //   261: invokevirtual   jcifs/smb/SmbFile.copyTo0:(Ljcifs/smb/SmbFile;[[BILjcifs/smb/SmbFile$WriterThread;Ljcifs/smb/SmbComReadAndX;Ljcifs/smb/SmbComReadAndXResponse;)V
        //   264: iinc            17, 1
        //   267: goto            148
        //   270: astore          19
        //   272: new             Ljcifs/smb/SmbException;
        //   275: dup            
        //   276: aload_0        
        //   277: getfield        jcifs/smb/SmbFile.url:Ljava/net/URL;
        //   280: invokevirtual   java/net/URL.toString:()Ljava/lang/String;
        //   283: aload           19
        //   285: invokespecial   jcifs/smb/SmbException.<init>:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   288: athrow         
        //   289: astore          18
        //   291: new             Ljcifs/smb/SmbException;
        //   294: dup            
        //   295: aload_0        
        //   296: getfield        jcifs/smb/SmbFile.url:Ljava/net/URL;
        //   299: invokevirtual   java/net/URL.toString:()Ljava/lang/String;
        //   302: aload           18
        //   304: invokespecial   jcifs/smb/SmbException.<init>:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   307: athrow         
        //   308: aload_0        
        //   309: iconst_1       
        //   310: iconst_0       
        //   311: sipush          128
        //   314: iconst_0       
        //   315: invokevirtual   jcifs/smb/SmbFile.open:(IIII)V
        //   318: aload_1        
        //   319: bipush          82
        //   321: sipush          258
        //   324: aload_0        
        //   325: getfield        jcifs/smb/SmbFile.attributes:I
        //   328: iconst_0       
        //   329: invokevirtual   jcifs/smb/SmbFile.open:(IIII)V
        //   332: iconst_0       
        //   333: istore          10
        //   335: lconst_0       
        //   336: lstore          11
        //   338: aload           5
        //   340: aload_0        
        //   341: getfield        jcifs/smb/SmbFile.fid:I
        //   344: lload           11
        //   346: iload_3        
        //   347: invokevirtual   jcifs/smb/SmbComReadAndX.setParam:(IJI)V
        //   350: aload           6
        //   352: aload_2        
        //   353: iload           10
        //   355: aaload         
        //   356: iconst_0       
        //   357: invokevirtual   jcifs/smb/SmbComReadAndXResponse.setParam:([BI)V
        //   360: aload_0        
        //   361: aload           5
        //   363: aload           6
        //   365: invokevirtual   jcifs/smb/SmbFile.send:(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
        //   368: aload           4
        //   370: monitorenter   
        //   371: aload           4
        //   373: getfield        jcifs/smb/SmbFile$WriterThread.e:Ljcifs/smb/SmbException;
        //   376: ifnull          508
        //   379: aload           4
        //   381: getfield        jcifs/smb/SmbFile$WriterThread.e:Ljcifs/smb/SmbException;
        //   384: athrow         
        //   385: astore          13
        //   387: aload           4
        //   389: monitorexit    
        //   390: aload           13
        //   392: athrow         
        //   393: astore          8
        //   395: getstatic       jcifs/smb/SmbFile.ignoreCopyToException:Z
        //   398: ifne            659
        //   401: new             Ljcifs/smb/SmbException;
        //   404: dup            
        //   405: new             Ljava/lang/StringBuilder;
        //   408: dup            
        //   409: ldc_w           "Failed to copy file from ["
        //   412: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   415: aload_0        
        //   416: invokevirtual   jcifs/smb/SmbFile.toString:()Ljava/lang/String;
        //   419: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   422: ldc_w           "] to ["
        //   425: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   428: aload_1        
        //   429: invokevirtual   jcifs/smb/SmbFile.toString:()Ljava/lang/String;
        //   432: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   435: ldc_w           "]"
        //   438: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   441: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   444: aload           8
        //   446: invokespecial   jcifs/smb/SmbException.<init>:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   449: athrow         
        //   450: astore          7
        //   452: aload_0        
        //   453: invokevirtual   jcifs/smb/SmbFile.close:()V
        //   456: aload           7
        //   458: athrow         
        //   459: astore          9
        //   461: iconst_1       
        //   462: aload_1        
        //   463: getfield        jcifs/smb/SmbFile.attributes:I
        //   466: iand           
        //   467: ifeq            500
        //   470: aload_1        
        //   471: bipush          -2
        //   473: aload_1        
        //   474: getfield        jcifs/smb/SmbFile.attributes:I
        //   477: iand           
        //   478: lconst_0       
        //   479: lconst_0       
        //   480: invokevirtual   jcifs/smb/SmbFile.setPathInformation:(IJJ)V
        //   483: aload_1        
        //   484: bipush          82
        //   486: sipush          258
        //   489: aload_0        
        //   490: getfield        jcifs/smb/SmbFile.attributes:I
        //   493: iconst_0       
        //   494: invokevirtual   jcifs/smb/SmbFile.open:(IIII)V
        //   497: goto            332
        //   500: aload           9
        //   502: athrow         
        //   503: aload           4
        //   505: invokevirtual   java/lang/Object.wait:()V
        //   508: aload           4
        //   510: getfield        jcifs/smb/SmbFile$WriterThread.ready:Z
        //   513: ifeq            503
        //   516: aload           4
        //   518: getfield        jcifs/smb/SmbFile$WriterThread.e:Ljcifs/smb/SmbException;
        //   521: ifnull          549
        //   524: aload           4
        //   526: getfield        jcifs/smb/SmbFile$WriterThread.e:Ljcifs/smb/SmbException;
        //   529: athrow         
        //   530: astore          15
        //   532: new             Ljcifs/smb/SmbException;
        //   535: dup            
        //   536: aload_1        
        //   537: getfield        jcifs/smb/SmbFile.url:Ljava/net/URL;
        //   540: invokevirtual   java/net/URL.toString:()Ljava/lang/String;
        //   543: aload           15
        //   545: invokespecial   jcifs/smb/SmbException.<init>:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   548: athrow         
        //   549: aload           6
        //   551: getfield        jcifs/smb/SmbComReadAndXResponse.dataLength:I
        //   554: ifgt            606
        //   557: aload           4
        //   559: monitorexit    
        //   560: aload_1        
        //   561: new             Ljcifs/smb/Trans2SetFileInformation;
        //   564: dup            
        //   565: aload_1        
        //   566: getfield        jcifs/smb/SmbFile.fid:I
        //   569: aload_0        
        //   570: getfield        jcifs/smb/SmbFile.attributes:I
        //   573: aload_0        
        //   574: getfield        jcifs/smb/SmbFile.createTime:J
        //   577: aload_0        
        //   578: getfield        jcifs/smb/SmbFile.lastModified:J
        //   581: invokespecial   jcifs/smb/Trans2SetFileInformation.<init>:(IIJJ)V
        //   584: new             Ljcifs/smb/Trans2SetFileInformationResponse;
        //   587: dup            
        //   588: invokespecial   jcifs/smb/Trans2SetFileInformationResponse.<init>:()V
        //   591: invokevirtual   jcifs/smb/SmbFile.send:(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
        //   594: aload_1        
        //   595: lconst_0       
        //   596: invokevirtual   jcifs/smb/SmbFile.close:(J)V
        //   599: aload_0        
        //   600: invokevirtual   jcifs/smb/SmbFile.close:()V
        //   603: goto            160
        //   606: aload           4
        //   608: aload_2        
        //   609: iload           10
        //   611: aaload         
        //   612: aload           6
        //   614: getfield        jcifs/smb/SmbComReadAndXResponse.dataLength:I
        //   617: aload_1        
        //   618: lload           11
        //   620: invokevirtual   jcifs/smb/SmbFile$WriterThread.write:([BILjcifs/smb/SmbFile;J)V
        //   623: aload           4
        //   625: monitorexit    
        //   626: iload           10
        //   628: iconst_1       
        //   629: if_icmpne       653
        //   632: iconst_0       
        //   633: istore          10
        //   635: aload           6
        //   637: getfield        jcifs/smb/SmbComReadAndXResponse.dataLength:I
        //   640: istore          14
        //   642: lload           11
        //   644: iload           14
        //   646: i2l            
        //   647: ladd           
        //   648: lstore          11
        //   650: goto            338
        //   653: iconst_1       
        //   654: istore          10
        //   656: goto            635
        //   659: getstatic       jcifs/util/LogStream.level:I
        //   662: iconst_1       
        //   663: if_icmple       674
        //   666: aload           8
        //   668: getstatic       jcifs/smb/SmbFile.log:Ljcifs/util/LogStream;
        //   671: invokevirtual   jcifs/smb/SmbException.printStackTrace:(Ljava/io/PrintStream;)V
        //   674: aload_0        
        //   675: invokevirtual   jcifs/smb/SmbFile.close:()V
        //   678: goto            160
        //    Exceptions:
        //  throws jcifs.smb.SmbException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                            
        //  -----  -----  -----  -----  --------------------------------
        //  112    132    161    188    Ljcifs/smb/SmbException;
        //  148    153    270    289    Ljava/net/UnknownHostException;
        //  148    153    289    308    Ljava/net/MalformedURLException;
        //  188    264    270    289    Ljava/net/UnknownHostException;
        //  188    264    289    308    Ljava/net/MalformedURLException;
        //  308    318    393    681    Ljcifs/smb/SmbException;
        //  308    318    450    459    Any
        //  318    332    459    503    Ljcifs/smb/SmbAuthException;
        //  318    332    393    681    Ljcifs/smb/SmbException;
        //  318    332    450    459    Any
        //  338    371    393    681    Ljcifs/smb/SmbException;
        //  338    371    450    459    Any
        //  371    390    385    393    Any
        //  390    393    393    681    Ljcifs/smb/SmbException;
        //  390    393    450    459    Any
        //  395    450    450    459    Any
        //  461    503    393    681    Ljcifs/smb/SmbException;
        //  461    503    450    459    Any
        //  503    508    530    549    Ljava/lang/InterruptedException;
        //  503    508    385    393    Any
        //  508    560    385    393    Any
        //  560    599    393    681    Ljcifs/smb/SmbException;
        //  560    599    450    459    Any
        //  606    626    385    393    Any
        //  635    642    393    681    Ljcifs/smb/SmbException;
        //  635    642    450    459    Any
        //  659    674    450    459    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0148:
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
    
    public void createNewFile() throws SmbException {
        if (this.getUncPath0().length() == 1) {
            throw new SmbException("Invalid operation for workgroups, servers, or shares");
        }
        this.close(this.open0(51, 0, 128, 0), 0L);
    }
    
    public long createTime() throws SmbException {
        long createTime;
        if (this.getUncPath0().length() > 1) {
            this.exists();
            createTime = this.createTime;
        }
        else {
            createTime = 0L;
        }
        return createTime;
    }
    
    public void delete() throws SmbException {
        this.exists();
        this.getUncPath0();
        this.delete(this.unc);
    }
    
    void delete(final String s) throws SmbException {
        if (this.getUncPath0().length() == 1) {
            throw new SmbException("Invalid operation for workgroups, servers, or shares");
        }
        if (System.currentTimeMillis() > this.attrExpiration) {
            this.attributes = 17;
            this.createTime = 0L;
            this.lastModified = 0L;
            this.isExists = false;
            final Info queryPath = this.queryPath(this.getUncPath0(), 257);
            this.attributes = queryPath.getAttributes();
            this.createTime = queryPath.getCreateTime();
            this.lastModified = queryPath.getLastWriteTime();
            this.attrExpiration = System.currentTimeMillis() + SmbFile.attrExpirationPeriod;
            this.isExists = true;
        }
        if ((0x1 & this.attributes) != 0x0) {
            this.setReadWrite();
        }
        if (LogStream.level >= 3) {
            SmbFile.log.println("delete: " + s);
        }
        while (true) {
            Label_0248: {
                if ((0x10 & this.attributes) == 0x0) {
                    break Label_0248;
                }
                while (true) {
                    try {
                        final SmbFile[] listFiles = this.listFiles("*", 22, null, null);
                        for (int i = 0; i < listFiles.length; ++i) {
                            listFiles[i].delete();
                        }
                        this.send(new SmbComDeleteDirectory(s), this.blank_resp());
                        this.sizeExpiration = 0L;
                        this.attrExpiration = 0L;
                        return;
                    }
                    catch (SmbException ex) {
                        if (ex.getNtStatus() != -1073741809) {
                            throw ex;
                        }
                        continue;
                    }
                    break;
                }
            }
            this.send(new SmbComDelete(s), this.blank_resp());
            continue;
        }
    }
    
    void doConnect() throws IOException {
        int inDomainDfs = 1;
        final UniAddress address = this.getAddress();
        Label_0128: {
            if (this.tree == null) {
                break Label_0128;
            }
            SmbTransport smbTransport = this.tree.session.transport;
        Label_0063_Outer:
            while (true) {
                final String serverWithDfs = this.getServerWithDfs();
                final SmbTree tree = this.tree;
                Label_0163: {
                    if (SmbFile.dfs.resolve(serverWithDfs, this.tree.share, null, this.auth) == null) {
                        break Label_0163;
                    }
                    boolean inDomainDfs2 = inDomainDfs != 0;
                    while (true) {
                        tree.inDomainDfs = inDomainDfs2;
                        if (this.tree.inDomainDfs) {
                            this.tree.connectionState = 2;
                        }
                        try {
                            if (LogStream.level >= 3) {
                                SmbFile.log.println("doConnect: " + address);
                            }
                            this.tree.treeConnect(null, null);
                            return;
                            smbTransport = SmbTransport.getSmbTransport(address, this.url.getPort());
                            this.tree = smbTransport.getSmbSession(this.auth).getSmbTree(this.share, null);
                            continue Label_0063_Outer;
                            inDomainDfs2 = false;
                            continue;
                        }
                        catch (SmbAuthException ex) {
                            if (this.share == null) {
                                (this.tree = smbTransport.getSmbSession(NtlmPasswordAuthentication.NULL).getSmbTree(null, null)).treeConnect(null, null);
                                return;
                            }
                            final NtlmPasswordAuthentication requestNtlmPasswordAuthentication = NtlmAuthenticator.requestNtlmPasswordAuthentication(this.url.toString(), ex);
                            if (requestNtlmPasswordAuthentication != null) {
                                this.auth = requestNtlmPasswordAuthentication;
                                this.tree = smbTransport.getSmbSession(this.auth).getSmbTree(this.share, null);
                                final SmbTree tree2 = this.tree;
                                if (SmbFile.dfs.resolve(serverWithDfs, this.tree.share, null, this.auth) == null) {
                                    inDomainDfs = 0;
                                }
                                tree2.inDomainDfs = (inDomainDfs != 0);
                                if (this.tree.inDomainDfs) {
                                    this.tree.connectionState = 2;
                                }
                                this.tree.treeConnect(null, null);
                                return;
                            }
                            if (LogStream.level >= inDomainDfs && this.hasNextAddress()) {
                                ex.printStackTrace(SmbFile.log);
                            }
                            throw ex;
                        }
                        break;
                    }
                }
                break;
            }
        }
    }
    
    FileEntry[] doDfsRootEnum() throws IOException {
        final DcerpcHandle handle = DcerpcHandle.getHandle("ncacn_np:" + this.getAddress().getHostAddress() + "[\\PIPE\\netdfs]", this.auth);
        while (true) {
            try {
                final MsrpcDfsRootEnum msrpcDfsRootEnum = new MsrpcDfsRootEnum(this.getServer());
                handle.sendrecv(msrpcDfsRootEnum);
                if (msrpcDfsRootEnum.retval != 0) {
                    throw new SmbException(msrpcDfsRootEnum.retval, true);
                }
                break Label_0079;
            }
            finally {
                try {
                    handle.close();
                    final MsrpcDfsRootEnum msrpcDfsRootEnum;
                    final FileEntry[] entries = msrpcDfsRootEnum.getEntries();
                    try {
                        handle.close();
                        return entries;
                    }
                    catch (IOException ex) {
                        if (LogStream.level >= 4) {
                            ex.printStackTrace(SmbFile.log);
                            return entries;
                        }
                        return entries;
                    }
                }
                catch (IOException ex2) {
                    if (LogStream.level >= 4) {
                        ex2.printStackTrace(SmbFile.log);
                    }
                    continue;
                }
            }
            break;
        }
    }
    
    void doEnum(final ArrayList list, final boolean b, String wildcard, int attributes, final SmbFilenameFilter smbFilenameFilter, final SmbFileFilter smbFileFilter) throws SmbException {
        if (smbFileFilter != null && smbFileFilter instanceof DosFileFilter) {
            final DosFileFilter dosFileFilter = (DosFileFilter)smbFileFilter;
            if (dosFileFilter.wildcard != null) {
                wildcard = dosFileFilter.wildcard;
            }
            attributes = dosFileFilter.attributes;
        }
        try {
            if (this.url.getHost().length() == 0 || this.getType() == 2) {
                this.doNetServerEnum(list, b, wildcard, attributes, smbFilenameFilter, smbFileFilter);
            }
            else {
                if (this.share != null) {
                    goto Label_0120;
                }
                this.doShareEnum(list, b, wildcard, attributes, smbFilenameFilter, smbFileFilter);
            }
        }
        catch (UnknownHostException ex) {
            throw new SmbException(this.url.toString(), ex);
        }
        catch (MalformedURLException ex2) {
            throw new SmbException(this.url.toString(), ex2);
        }
    }
    
    void doFindFirstNext(final ArrayList list, final boolean b, final String s, final int n, final SmbFilenameFilter smbFilenameFilter, final SmbFileFilter smbFileFilter) throws SmbException, UnknownHostException, MalformedURLException {
        final String uncPath0 = this.getUncPath0();
        final String path = this.url.getPath();
        if (path.lastIndexOf(47) != -1 + path.length()) {
            throw new SmbException(String.valueOf(this.url.toString()) + " directory must end with '/'");
        }
        final Trans2FindFirst2 trans2FindFirst2 = new Trans2FindFirst2(uncPath0, s, n);
        final Trans2FindFirst2Response trans2FindFirst2Response = new Trans2FindFirst2Response();
        if (LogStream.level >= 3) {
            SmbFile.log.println("doFindFirstNext: " + trans2FindFirst2.path);
        }
        this.send(trans2FindFirst2, trans2FindFirst2Response);
        final int sid = trans2FindFirst2Response.sid;
        final Trans2FindNext2 trans2FindNext2 = new Trans2FindNext2(sid, trans2FindFirst2Response.resumeKey, trans2FindFirst2Response.lastName);
        trans2FindFirst2Response.subCommand = 2;
        while (true) {
            int n2 = 0;
        Block_10_Outer:
            while (true) {
                Label_0216: {
                    if (n2 < trans2FindFirst2Response.numEntries) {
                        break Label_0216;
                    }
                    Label_0401: {
                        if (!trans2FindFirst2Response.isEndOfSearch) {
                            if (trans2FindFirst2Response.numEntries != 0) {
                                break Label_0401;
                            }
                        }
                        try {
                            this.send(new SmbComFindClose2(sid), this.blank_resp());
                            return;
                            String name = null;
                            FileEntry fileEntry = null;
                            SmbFile smbFile;
                            int hashCode;
                            Label_0287_Outer:Block_6_Outer:
                            while (true) {
                                smbFile = new SmbFile(this, name, 1, fileEntry.getAttributes(), fileEntry.createTime(), fileEntry.lastModified(), fileEntry.length());
                                while (true) {
                                    while (true) {
                                        Label_0377: {
                                            break Label_0377;
                                            ++n2;
                                            continue Block_10_Outer;
                                        }
                                        Block_12: {
                                            break Block_12;
                                            Label_0391: {
                                                list.add(name);
                                            }
                                            continue Block_6_Outer;
                                            hashCode = name.hashCode();
                                            continue Block_6_Outer;
                                        }
                                        list.add(smbFile);
                                        continue Block_6_Outer;
                                    }
                                    fileEntry = trans2FindFirst2Response.results[n2];
                                    name = fileEntry.getName();
                                    continue;
                                }
                                trans2FindNext2.reset(trans2FindFirst2Response.resumeKey, trans2FindFirst2Response.lastName);
                                trans2FindFirst2Response.reset();
                                this.send(trans2FindNext2, trans2FindFirst2Response);
                                break;
                                Label_0293: {
                                    continue Label_0287_Outer;
                                }
                            }
                        }
                        // iftrue(Label_0287:, smbFileFilter != null && !smbFileFilter.accept(smbFile))
                        // iftrue(Label_0391:, !b)
                        // iftrue(Label_0293:, hashCode != SmbFile.HASH_DOT && hashCode != SmbFile.HASH_DOT_DOT || !name.equals((Object)".") && !name.equals((Object)".."))
                        // iftrue(Label_0293:, name.length() >= 3)
                        // iftrue(Label_0287:, smbFilenameFilter != null && !smbFilenameFilter.accept(this, name) || name.length() <= 0)
                        catch (SmbException ex) {
                            if (LogStream.level >= 4) {
                                ex.printStackTrace(SmbFile.log);
                            }
                        }
                    }
                }
            }
        }
    }
    
    FileEntry[] doMsrpcShareEnum() throws IOException {
        final MsrpcShareEnum msrpcShareEnum = new MsrpcShareEnum(this.url.getHost());
        final DcerpcHandle handle = DcerpcHandle.getHandle("ncacn_np:" + this.getAddress().getHostAddress() + "[\\PIPE\\srvsvc]", this.auth);
        while (true) {
            try {
                handle.sendrecv(msrpcShareEnum);
                if (msrpcShareEnum.retval != 0) {
                    throw new SmbException(msrpcShareEnum.retval, true);
                }
                break Label_0082;
            }
            finally {
                try {
                    handle.close();
                    final FileEntry[] entries = msrpcShareEnum.getEntries();
                    try {
                        handle.close();
                        return entries;
                    }
                    catch (IOException ex) {
                        if (LogStream.level >= 4) {
                            ex.printStackTrace(SmbFile.log);
                            return entries;
                        }
                        return entries;
                    }
                }
                catch (IOException ex2) {
                    if (LogStream.level >= 4) {
                        ex2.printStackTrace(SmbFile.log);
                    }
                    continue;
                }
            }
            break;
        }
    }
    
    void doNetServerEnum(final ArrayList list, final boolean b, final String s, final int n, final SmbFilenameFilter smbFilenameFilter, final SmbFileFilter smbFileFilter) throws SmbException, UnknownHostException, MalformedURLException {
        int type;
        if (this.url.getHost().length() == 0) {
            type = 0;
        }
        else {
            type = this.getType();
        }
        NetServerEnum2 netServerEnum2;
        NetServerEnum2Response netServerEnum2Response;
        if (type == 0) {
            this.connect0();
            netServerEnum2 = new NetServerEnum2(this.tree.session.transport.server.oemDomainName, Integer.MIN_VALUE);
            netServerEnum2Response = new NetServerEnum2Response();
        }
        else {
            if (type != 2) {
                throw new SmbException("The requested list operations is invalid: " + this.url.toString());
            }
            netServerEnum2 = new NetServerEnum2(this.url.getHost(), -1);
            netServerEnum2Response = new NetServerEnum2Response();
        }
        int i;
        do {
            this.send(netServerEnum2, netServerEnum2Response);
            if (netServerEnum2Response.status != 0 && netServerEnum2Response.status != 234) {
                throw new SmbException(netServerEnum2Response.status, true);
            }
            if (netServerEnum2Response.status == 234) {
                i = 1;
            }
            else {
                i = 0;
            }
            int numEntries;
            if (i != 0) {
                numEntries = -1 + netServerEnum2Response.numEntries;
            }
            else {
                numEntries = netServerEnum2Response.numEntries;
            }
            for (int j = 0; j < numEntries; ++j) {
                final FileEntry fileEntry = netServerEnum2Response.results[j];
                final String name = fileEntry.getName();
                if ((smbFilenameFilter == null || smbFilenameFilter.accept(this, name)) && name.length() > 0) {
                    final SmbFile smbFile = new SmbFile(this, name, fileEntry.getType(), 17, 0L, 0L, 0L);
                    if (smbFileFilter == null || smbFileFilter.accept(smbFile)) {
                        if (b) {
                            list.add(smbFile);
                        }
                        else {
                            list.add(name);
                        }
                    }
                }
            }
            if (this.getType() != 2) {
                return;
            }
            netServerEnum2.subCommand = -41;
            netServerEnum2.reset(0, netServerEnum2Response.lastName);
            netServerEnum2Response.reset();
        } while (i != 0);
    }
    
    FileEntry[] doNetShareEnum() throws SmbException {
        final NetShareEnum netShareEnum = new NetShareEnum();
        final NetShareEnumResponse netShareEnumResponse = new NetShareEnumResponse();
        this.send(netShareEnum, netShareEnumResponse);
        if (netShareEnumResponse.status != 0) {
            throw new SmbException(netShareEnumResponse.status, true);
        }
        return netShareEnumResponse.results;
    }
    
    void doShareEnum(final ArrayList list, final boolean b, final String s, final int n, final SmbFilenameFilter smbFilenameFilter, final SmbFileFilter smbFileFilter) throws SmbException, UnknownHostException, MalformedURLException {
        final String path = this.url.getPath();
        Throwable t = null;
        if (path.lastIndexOf(47) != -1 + path.length()) {
            throw new SmbException(String.valueOf(this.url.toString()) + " directory must end with '/'");
        }
        if (this.getType() != 4) {
            throw new SmbException("The requested list operations is invalid: " + this.url.toString());
        }
        final HashMap<FileEntry, FileEntry> hashMap = new HashMap<FileEntry, FileEntry>();
    Label_0149:
        while (true) {
            if (SmbFile.dfs.isTrustedDomain(this.getServer(), this.auth)) {
                Label_0372: {
                Label_0366:
                    while (true) {
                    Label_0155:
                        while (true) {
                        Label_0160:
                            while (true) {
                                try {
                                    final FileEntry[] doDfsRootEnum = this.doDfsRootEnum();
                                    for (int i = 0; i < doDfsRootEnum.length; ++i) {
                                        final FileEntry fileEntry = doDfsRootEnum[i];
                                        if (!hashMap.containsKey(fileEntry)) {
                                            hashMap.put(fileEntry, fileEntry);
                                        }
                                    }
                                    final UniAddress uniAddress = this.getFirstAddress();
                                    if (uniAddress == null) {
                                        if (t == null || !hashMap.isEmpty()) {
                                            break Label_0372;
                                        }
                                        if (!(t instanceof SmbException)) {
                                            throw new SmbException(this.url.toString(), t);
                                        }
                                        break;
                                    }
                                }
                                catch (IOException ex) {
                                    if (LogStream.level >= 4) {
                                        ex.printStackTrace(SmbFile.log);
                                    }
                                    continue Label_0149;
                                }
                                while (true) {
                                    while (true) {
                                        int n2 = 0;
                                        Label_0507: {
                                            try {
                                                this.doConnect();
                                                try {
                                                    final FileEntry[] array = this.doMsrpcShareEnum();
                                                    n2 = 0;
                                                    if (n2 >= array.length) {
                                                        continue Label_0160;
                                                    }
                                                    final FileEntry fileEntry2 = array[n2];
                                                    if (!hashMap.containsKey(fileEntry2)) {
                                                        hashMap.put(fileEntry2, fileEntry2);
                                                    }
                                                    break Label_0507;
                                                }
                                                catch (IOException ex2) {
                                                    if (LogStream.level >= 3) {
                                                        ex2.printStackTrace(SmbFile.log);
                                                    }
                                                    final FileEntry[] array = this.doNetShareEnum();
                                                }
                                            }
                                            catch (IOException ex3) {
                                                if (LogStream.level >= 3) {
                                                    ex3.printStackTrace(SmbFile.log);
                                                }
                                                t = ex3;
                                                final UniAddress uniAddress = this.getNextAddress();
                                                continue Label_0155;
                                            }
                                            break Label_0366;
                                        }
                                        ++n2;
                                        continue;
                                    }
                                }
                                break;
                            }
                            break;
                        }
                    }
                    throw (SmbException)t;
                }
                for (final FileEntry fileEntry3 : hashMap.keySet()) {
                    final String name = fileEntry3.getName();
                    if ((smbFilenameFilter == null || smbFilenameFilter.accept(this, name)) && name.length() > 0) {
                        final SmbFile smbFile = new SmbFile(this, name, fileEntry3.getType(), 17, 0L, 0L, 0L);
                        if (smbFileFilter != null && !smbFileFilter.accept(smbFile)) {
                            continue;
                        }
                        if (b) {
                            list.add(smbFile);
                        }
                        else {
                            list.add(name);
                        }
                    }
                }
                return;
            }
            continue Label_0149;
        }
    }
    
    public boolean equals(final Object o) {
        if (!(o instanceof SmbFile)) {
            return false;
        }
        final SmbFile smbFile = (SmbFile)o;
        boolean b;
        if (this == smbFile) {
            b = true;
        }
        else {
            if (!this.pathNamesPossiblyEqual(this.url.getPath(), smbFile.url.getPath())) {
                return false;
            }
            this.getUncPath0();
            smbFile.getUncPath0();
            if (!this.canon.equalsIgnoreCase(smbFile.canon)) {
                return false;
            }
            try {
                b = this.getAddress().equals(smbFile.getAddress());
            }
            catch (UnknownHostException ex) {
                b = this.getServer().equalsIgnoreCase(smbFile.getServer());
            }
        }
        return b;
        b = false;
        return b;
    }
    
    public boolean exists() throws SmbException {
        boolean b = false;
        if (this.attrExpiration > System.currentTimeMillis()) {
            b = this.isExists;
        }
        else {
            this.attributes = 17;
            this.createTime = 0L;
            this.lastModified = 0L;
            this.isExists = false;
            while (true) {
                try {
                    if (this.url.getHost().length() != 0) {
                        if (this.share == null) {
                            if (this.getType() == 2) {
                                UniAddress.getByName(this.url.getHost(), true);
                            }
                            else {
                                UniAddress.getByName(this.url.getHost()).getHostName();
                            }
                        }
                        else {
                            if (this.getUncPath0().length() != 1 && !this.share.equalsIgnoreCase("IPC$")) {
                                goto Label_0202;
                            }
                            this.connect0();
                        }
                    }
                    this.isExists = true;
                    this.attrExpiration = System.currentTimeMillis() + SmbFile.attrExpirationPeriod;
                    b = this.isExists;
                }
                catch (SmbException ex) {
                    switch (ex.getNtStatus()) {
                        case -1073741809:
                        case -1073741773:
                        case -1073741772:
                        case -1073741766: {
                            continue;
                        }
                        default: {
                            throw ex;
                        }
                    }
                }
                catch (UnknownHostException ex2) {
                    continue;
                }
                break;
            }
        }
        return b;
    }
    
    UniAddress getAddress() throws UnknownHostException {
        synchronized (this) {
            UniAddress firstAddress;
            if (this.addressIndex == 0) {
                firstAddress = this.getFirstAddress();
            }
            else {
                firstAddress = this.addresses[-1 + this.addressIndex];
            }
            return firstAddress;
        }
    }
    
    public int getAttributes() throws SmbException {
        int n;
        if (this.getUncPath0().length() == 1) {
            n = 0;
        }
        else {
            this.exists();
            n = (0x7FFF & this.attributes);
        }
        return n;
    }
    
    public String getCanonicalPath() {
        final String authority = this.url.getAuthority();
        this.getUncPath0();
        String string;
        if (authority.length() > 0) {
            string = "smb://" + this.url.getAuthority() + this.canon;
        }
        else {
            string = "smb://";
        }
        return string;
    }
    
    public int getContentLength() {
        try {
            return (int)(this.length() & 0xFFFFFFFFL);
        }
        catch (SmbException ex) {
            return 0;
        }
    }
    
    public long getDate() {
        try {
            return this.lastModified();
        }
        catch (SmbException ex) {
            return 0L;
        }
    }
    
    public String getDfsPath() throws SmbException {
        this.resolveDfs(null);
        final DfsReferral dfsReferral = this.dfsReferral;
        String s = null;
        if (dfsReferral != null) {
            s = ("smb:/" + this.dfsReferral.server + "/" + this.dfsReferral.share + this.unc).replace('\\', '/');
            if (this.isDirectory()) {
                s = String.valueOf(s) + '/';
            }
        }
        return s;
    }
    
    public long getDiskFreeSpace() throws SmbException {
        if (this.getType() != 8) {
            if (this.type != 1) {
                return 0L;
            }
        }
        try {
            return this.queryFSInformation(1007);
        }
        catch (SmbException ex) {
            switch (ex.getNtStatus()) {
                default: {
                    throw ex;
                }
                case -1073741823:
                case -1073741821: {
                    return this.queryFSInformation(1);
                }
            }
        }
        return 0L;
    }
    
    UniAddress getFirstAddress() throws UnknownHostException {
        while (true) {
            while (true) {
                final String host;
                final String path;
                Label_0254: {
                    synchronized (this) {
                        this.addressIndex = 0;
                        host = this.url.getHost();
                        path = this.url.getPath();
                        final String query = this.url.getQuery();
                        Label_0163: {
                            if (query == null) {
                                break Label_0163;
                            }
                            final String queryLookup = queryLookup(query, "server");
                            UniAddress uniAddress;
                            if (queryLookup != null && queryLookup.length() > 0) {
                                (this.addresses = new UniAddress[1])[0] = UniAddress.getByName(queryLookup);
                                uniAddress = this.getNextAddress();
                            }
                            else {
                                final String queryLookup2 = queryLookup(query, "address");
                                if (queryLookup2 == null || queryLookup2.length() <= 0) {
                                    break Label_0163;
                                }
                                (this.addresses = new UniAddress[1])[0] = new UniAddress(InetAddress.getByAddress(host, InetAddress.getByName(queryLookup2).getAddress()));
                                uniAddress = this.getNextAddress();
                            }
                            return uniAddress;
                        }
                        if (host.length() != 0) {
                            break Label_0254;
                        }
                        try {
                            (this.addresses = new UniAddress[1])[0] = UniAddress.getByName(NbtAddress.getByName("\u0001\u0002__MSBROWSE__\u0002", 1, null).getHostAddress());
                            final UniAddress uniAddress = this.getNextAddress();
                        }
                        catch (UnknownHostException ex) {
                            NtlmPasswordAuthentication.initDefaults();
                            if (NtlmPasswordAuthentication.DEFAULT_DOMAIN.equals("?")) {
                                throw ex;
                            }
                        }
                    }
                    this.addresses = UniAddress.getAllByName(NtlmPasswordAuthentication.DEFAULT_DOMAIN, true);
                    continue;
                }
                if (path.length() == 0 || path.equals("/")) {
                    this.addresses = UniAddress.getAllByName(host, true);
                    continue;
                }
                this.addresses = UniAddress.getAllByName(host, false);
                continue;
            }
        }
    }
    
    public InputStream getInputStream() throws IOException {
        return new SmbFileInputStream(this);
    }
    
    public long getLastModified() {
        try {
            return this.lastModified();
        }
        catch (SmbException ex) {
            return 0L;
        }
    }
    
    public String getName() {
        this.getUncPath0();
        String s;
        if (this.canon.length() > 1) {
            int n;
            for (n = -2 + this.canon.length(); this.canon.charAt(n) != '/'; --n) {}
            s = this.canon.substring(n + 1);
        }
        else if (this.share != null) {
            s = String.valueOf(this.share) + '/';
        }
        else if (this.url.getHost().length() > 0) {
            s = String.valueOf(this.url.getHost()) + '/';
        }
        else {
            s = "smb://";
        }
        return s;
    }
    
    UniAddress getNextAddress() {
        synchronized (this) {
            final int addressIndex = this.addressIndex;
            final int length = this.addresses.length;
            UniAddress uniAddress = null;
            if (addressIndex < length) {
                uniAddress = this.addresses[this.addressIndex++];
            }
            return uniAddress;
        }
    }
    
    public OutputStream getOutputStream() throws IOException {
        return new SmbFileOutputStream(this);
    }
    
    public String getParent() {
        final String authority = this.url.getAuthority();
        String substring;
        if (authority.length() > 0) {
            final StringBuffer sb = new StringBuffer("smb://");
            sb.append(authority);
            this.getUncPath0();
            if (this.canon.length() > 1) {
                sb.append(this.canon);
            }
            else {
                sb.append('/');
            }
            String string;
            int n;
            for (string = sb.toString(), n = -2 + string.length(); string.charAt(n) != '/'; --n) {}
            substring = string.substring(0, n + 1);
        }
        else {
            substring = "smb://";
        }
        return substring;
    }
    
    public String getPath() {
        return this.url.toString();
    }
    
    public Principal getPrincipal() {
        return this.auth;
    }
    
    public ACE[] getSecurity() throws IOException {
        return this.getSecurity(false);
    }
    
    public ACE[] getSecurity(final boolean b) throws IOException {
        Label_0079: {
            if (!this.isDirectory()) {
                break Label_0079;
            }
            int n = 1;
            while (true) {
                final int open0 = this.open0(1, 131072, 0, n);
                final NtTransQuerySecurityDesc ntTransQuerySecurityDesc = new NtTransQuerySecurityDesc(open0, 4);
                final NtTransQuerySecurityDescResponse ntTransQuerySecurityDescResponse = new NtTransQuerySecurityDescResponse();
                try {
                    this.send(ntTransQuerySecurityDesc, ntTransQuerySecurityDescResponse);
                    this.close(open0, 0L);
                    final ACE[] aces = ntTransQuerySecurityDescResponse.securityDescriptor.aces;
                    if (aces != null) {
                        this.processAces(aces, b);
                    }
                    return aces;
                    n = 0;
                }
                finally {
                    this.close(open0, 0L);
                }
            }
        }
    }
    
    public String getServer() {
        String host = this.url.getHost();
        if (host.length() == 0) {
            host = null;
        }
        return host;
    }
    
    String getServerWithDfs() {
        String s;
        if (this.dfsReferral != null) {
            s = this.dfsReferral.server;
        }
        else {
            s = this.getServer();
        }
        return s;
    }
    
    public String getShare() {
        return this.share;
    }
    
    public ACE[] getShareSecurity(final boolean p0) throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: getfield        jcifs/smb/SmbFile.url:Ljava/net/URL;
        //     4: invokevirtual   java/net/URL.getPath:()Ljava/lang/String;
        //     7: pop            
        //     8: aload_0        
        //     9: aconst_null    
        //    10: invokevirtual   jcifs/smb/SmbFile.resolveDfs:(Ljcifs/smb/ServerMessageBlock;)V
        //    13: aload_0        
        //    14: invokevirtual   jcifs/smb/SmbFile.getServerWithDfs:()Ljava/lang/String;
        //    17: astore_3       
        //    18: new             Ljcifs/dcerpc/msrpc/MsrpcShareGetInfo;
        //    21: dup            
        //    22: aload_3        
        //    23: aload_0        
        //    24: getfield        jcifs/smb/SmbFile.tree:Ljcifs/smb/SmbTree;
        //    27: getfield        jcifs/smb/SmbTree.share:Ljava/lang/String;
        //    30: invokespecial   jcifs/dcerpc/msrpc/MsrpcShareGetInfo.<init>:(Ljava/lang/String;Ljava/lang/String;)V
        //    33: astore          4
        //    35: new             Ljava/lang/StringBuilder;
        //    38: dup            
        //    39: ldc_w           "ncacn_np:"
        //    42: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    45: aload_3        
        //    46: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    49: ldc_w           "[\\PIPE\\srvsvc]"
        //    52: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    55: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    58: aload_0        
        //    59: getfield        jcifs/smb/SmbFile.auth:Ljcifs/smb/NtlmPasswordAuthentication;
        //    62: invokestatic    jcifs/dcerpc/DcerpcHandle.getHandle:(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/dcerpc/DcerpcHandle;
        //    65: astore          5
        //    67: aload           5
        //    69: aload           4
        //    71: invokevirtual   jcifs/dcerpc/DcerpcHandle.sendrecv:(Ljcifs/dcerpc/DcerpcMessage;)V
        //    74: aload           4
        //    76: getfield        jcifs/dcerpc/msrpc/MsrpcShareGetInfo.retval:I
        //    79: ifeq            106
        //    82: new             Ljcifs/smb/SmbException;
        //    85: dup            
        //    86: aload           4
        //    88: getfield        jcifs/dcerpc/msrpc/MsrpcShareGetInfo.retval:I
        //    91: iconst_1       
        //    92: invokespecial   jcifs/smb/SmbException.<init>:(IZ)V
        //    95: athrow         
        //    96: astore          6
        //    98: aload           5
        //   100: invokevirtual   jcifs/dcerpc/DcerpcHandle.close:()V
        //   103: aload           6
        //   105: athrow         
        //   106: aload           4
        //   108: invokevirtual   jcifs/dcerpc/msrpc/MsrpcShareGetInfo.getSecurity:()[Ljcifs/smb/ACE;
        //   111: astore          8
        //   113: aload           8
        //   115: ifnull          125
        //   118: aload_0        
        //   119: aload           8
        //   121: iload_1        
        //   122: invokespecial   jcifs/smb/SmbFile.processAces:([Ljcifs/smb/ACE;Z)V
        //   125: aload           5
        //   127: invokevirtual   jcifs/dcerpc/DcerpcHandle.close:()V
        //   130: aload           8
        //   132: areturn        
        //   133: astore          7
        //   135: getstatic       jcifs/util/LogStream.level:I
        //   138: iconst_1       
        //   139: if_icmplt       103
        //   142: aload           7
        //   144: getstatic       jcifs/smb/SmbFile.log:Ljcifs/util/LogStream;
        //   147: invokevirtual   java/io/IOException.printStackTrace:(Ljava/io/PrintStream;)V
        //   150: goto            103
        //   153: astore          9
        //   155: getstatic       jcifs/util/LogStream.level:I
        //   158: iconst_1       
        //   159: if_icmplt       130
        //   162: aload           9
        //   164: getstatic       jcifs/smb/SmbFile.log:Ljcifs/util/LogStream;
        //   167: invokevirtual   java/io/IOException.printStackTrace:(Ljava/io/PrintStream;)V
        //   170: goto            130
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  67     96     96     153    Any
        //  98     103    133    153    Ljava/io/IOException;
        //  106    125    96     153    Any
        //  125    130    153    173    Ljava/io/IOException;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0125:
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
    
    public int getType() throws SmbException {
        if (this.type == 0) {
            if (this.getUncPath0().length() > 1) {
                this.type = 1;
            }
            else if (this.share != null) {
                this.connect0();
                if (this.share.equals("IPC$")) {
                    this.type = 16;
                }
                else if (this.tree.service.equals("LPT1:")) {
                    this.type = 32;
                }
                else if (this.tree.service.equals("COMM")) {
                    this.type = 64;
                }
                else {
                    this.type = 8;
                }
            }
            else if (this.url.getAuthority() == null || this.url.getAuthority().length() == 0) {
                this.type = 2;
            }
            else {
                try {
                    final UniAddress address = this.getAddress();
                    if (address.getAddress() instanceof NbtAddress) {
                        final int nameType = ((NbtAddress)address.getAddress()).getNameType();
                        if (nameType == 29 || nameType == 27) {
                            this.type = 2;
                            return this.type;
                        }
                    }
                }
                catch (UnknownHostException ex) {
                    throw new SmbException(this.url.toString(), ex);
                }
                this.type = 4;
            }
        }
        return this.type;
    }
    
    public String getUncPath() {
        this.getUncPath0();
        String s;
        if (this.share == null) {
            s = "\\\\" + this.url.getHost();
        }
        else {
            s = "\\\\" + this.url.getHost() + this.canon.replace('/', '\\');
        }
        return s;
    }
    
    String getUncPath0() {
        if (this.unc == null) {
            final char[] charArray = this.url.getPath().toCharArray();
            final char[] array = new char[charArray.length];
            final int length = charArray.length;
            int n = 0;
            int i = 0;
            int n2 = 0;
            while (i < length) {
                int n3 = 0;
                Label_0339: {
                    switch (n) {
                        default: {
                            n3 = n2;
                            break;
                        }
                        case 0: {
                            final char c = charArray[i];
                            final String unc = null;
                            if (c == '/') {
                                n3 = n2 + 1;
                                array[n2] = charArray[i];
                                n = 1;
                                break;
                            }
                            return unc;
                        }
                        case 1: {
                            if (charArray[i] == '/') {
                                n3 = n2;
                                break;
                            }
                            if (charArray[i] == '.' && (i + 1 >= length || charArray[i + 1] == '/')) {
                                ++i;
                                n3 = n2;
                                break;
                            }
                            if (i + 1 >= length || charArray[i] != '.' || charArray[i + 1] != '.' || (i + 2 < length && charArray[i + 2] != '/')) {
                                n = 2;
                                break Label_0339;
                            }
                            i += 2;
                            if (n2 == 1) {
                                n3 = n2;
                                break;
                            }
                            n3 = n2;
                            while (--n3 > 1) {
                                if (array[n3 - 1] == '/') {
                                    break;
                                }
                            }
                            break;
                        }
                        case 2: {
                            if (charArray[i] == '/') {
                                n = 1;
                            }
                            n3 = n2 + 1;
                            array[n2] = charArray[i];
                            break;
                        }
                    }
                }
                ++i;
                n2 = n3;
            }
            this.canon = new String(array, 0, n2);
            if (n2 > 1) {
                int n4 = n2 - 1;
                final int index = this.canon.indexOf(47, 1);
                if (index < 0) {
                    this.share = this.canon.substring(1);
                    this.unc = "\\";
                }
                else if (index == n4) {
                    this.share = this.canon.substring(1, index);
                    this.unc = "\\";
                }
                else {
                    this.share = this.canon.substring(1, index);
                    final String canon = this.canon;
                    if (array[n4] != '/') {
                        ++n4;
                    }
                    this.unc = canon.substring(index, n4);
                    this.unc = this.unc.replace('/', '\\');
                }
            }
            else {
                this.share = null;
                this.unc = "\\";
            }
        }
        return this.unc;
    }
    
    boolean hasNextAddress() {
        synchronized (this) {
            return this.addressIndex < this.addresses.length;
        }
    }
    
    public int hashCode() {
        while (true) {
            try {
                final int n = this.getAddress().hashCode();
                this.getUncPath0();
                return n + this.canon.toUpperCase().hashCode();
            }
            catch (UnknownHostException ex) {
                final int n = this.getServer().toUpperCase().hashCode();
                continue;
            }
            break;
        }
    }
    
    boolean isConnected() {
        return this.tree != null && this.tree.connectionState == 2;
    }
    
    public boolean isDirectory() throws SmbException {
        boolean b = true;
        if (this.getUncPath0().length() != b) {
            if (!this.exists()) {
                b = false;
            }
            else if ((0x10 & this.attributes) != 0x10) {
                b = false;
            }
        }
        return b;
    }
    
    public boolean isFile() throws SmbException {
        final int length = this.getUncPath0().length();
        boolean b = false;
        if (length != 1) {
            this.exists();
            final int n = 0x10 & this.attributes;
            b = false;
            if (n == 0) {
                b = true;
            }
        }
        return b;
    }
    
    public boolean isHidden() throws SmbException {
        final String share = this.share;
        boolean b = false;
        if (share != null) {
            if (this.getUncPath0().length() == 1) {
                final boolean endsWith = this.share.endsWith("$");
                b = false;
                if (endsWith) {
                    b = true;
                }
            }
            else {
                this.exists();
                final int n = 0x2 & this.attributes;
                b = false;
                if (n == 2) {
                    b = true;
                }
            }
        }
        return b;
    }
    
    boolean isOpen() {
        return this.opened && this.isConnected() && this.tree_num == this.tree.tree_num;
    }
    
    boolean isWorkgroup0() throws UnknownHostException {
        boolean b;
        if (this.type == 2 || this.url.getHost().length() == 0) {
            this.type = 2;
            b = true;
        }
        else {
            this.getUncPath0();
            if (this.share == null) {
                final UniAddress address = this.getAddress();
                if (address.getAddress() instanceof NbtAddress) {
                    final int nameType = ((NbtAddress)address.getAddress()).getNameType();
                    if (nameType == 29 || nameType == 27) {
                        this.type = 2;
                        b = true;
                        return b;
                    }
                }
                this.type = 4;
            }
            b = false;
        }
        return b;
    }
    
    public long lastModified() throws SmbException {
        long lastModified;
        if (this.getUncPath0().length() > 1) {
            this.exists();
            lastModified = this.lastModified;
        }
        else {
            lastModified = 0L;
        }
        return lastModified;
    }
    
    public long length() throws SmbException {
        long n;
        if (this.sizeExpiration > System.currentTimeMillis()) {
            n = this.size;
        }
        else {
            if (this.getType() == 8) {
                final Trans2QueryFSInformationResponse trans2QueryFSInformationResponse = new Trans2QueryFSInformationResponse(1);
                this.send(new Trans2QueryFSInformation(1), trans2QueryFSInformationResponse);
                this.size = trans2QueryFSInformationResponse.info.getCapacity();
            }
            else if (this.getUncPath0().length() > 1 && this.type != 16) {
                this.size = this.queryPath(this.getUncPath0(), 258).getSize();
            }
            else {
                this.size = 0L;
            }
            this.sizeExpiration = System.currentTimeMillis() + SmbFile.attrExpirationPeriod;
            n = this.size;
        }
        return n;
    }
    
    public String[] list() throws SmbException {
        return this.list("*", 22, null, null);
    }
    
    String[] list(final String s, final int n, final SmbFilenameFilter smbFilenameFilter, final SmbFileFilter smbFileFilter) throws SmbException {
        final ArrayList list = new ArrayList();
        this.doEnum(list, false, s, n, smbFilenameFilter, smbFileFilter);
        return (String[])list.toArray(new String[list.size()]);
    }
    
    public String[] list(final SmbFilenameFilter smbFilenameFilter) throws SmbException {
        return this.list("*", 22, smbFilenameFilter, null);
    }
    
    public SmbFile[] listFiles() throws SmbException {
        return this.listFiles("*", 22, null, null);
    }
    
    public SmbFile[] listFiles(final String s) throws SmbException {
        return this.listFiles(s, 22, null, null);
    }
    
    SmbFile[] listFiles(final String s, final int n, final SmbFilenameFilter smbFilenameFilter, final SmbFileFilter smbFileFilter) throws SmbException {
        final ArrayList list = new ArrayList();
        this.doEnum(list, true, s, n, smbFilenameFilter, smbFileFilter);
        return (SmbFile[])list.toArray(new SmbFile[list.size()]);
    }
    
    public SmbFile[] listFiles(final SmbFileFilter smbFileFilter) throws SmbException {
        return this.listFiles("*", 22, null, smbFileFilter);
    }
    
    public SmbFile[] listFiles(final SmbFilenameFilter smbFilenameFilter) throws SmbException {
        return this.listFiles("*", 22, smbFilenameFilter, null);
    }
    
    public void mkdir() throws SmbException {
        final String uncPath0 = this.getUncPath0();
        if (uncPath0.length() == 1) {
            throw new SmbException("Invalid operation for workgroups, servers, or shares");
        }
        if (LogStream.level >= 3) {
            SmbFile.log.println("mkdir: " + uncPath0);
        }
        this.send(new SmbComCreateDirectory(uncPath0), this.blank_resp());
        this.sizeExpiration = 0L;
        this.attrExpiration = 0L;
    }
    
    public void mkdirs() throws SmbException {
        try {
            final SmbFile smbFile = new SmbFile(this.getParent(), this.auth);
            if (!smbFile.exists()) {
                smbFile.mkdirs();
            }
            this.mkdir();
        }
        catch (IOException ex) {}
    }
    
    void open(final int n, final int n2, final int n3, final int n4) throws SmbException {
        if (!this.isOpen()) {
            this.fid = this.open0(n, n2, n3, n4);
            this.opened = true;
            this.tree_num = this.tree.tree_num;
        }
    }
    
    int open0(final int n, final int n2, final int n3, final int n4) throws SmbException {
        this.connect0();
        if (LogStream.level >= 3) {
            SmbFile.log.println("open0: " + this.unc);
        }
        int n5;
        if (this.tree.session.transport.hasCapability(16)) {
            final SmbComNTCreateAndXResponse smbComNTCreateAndXResponse = new SmbComNTCreateAndXResponse();
            final SmbComNTCreateAndX smbComNTCreateAndX = new SmbComNTCreateAndX(this.unc, n, n2, this.shareAccess, n3, n4, null);
            if (this instanceof SmbNamedPipe) {
                smbComNTCreateAndX.flags0 |= 0x16;
                smbComNTCreateAndX.desiredAccess |= 0x20000;
                smbComNTCreateAndXResponse.isExtended = true;
            }
            this.send(smbComNTCreateAndX, smbComNTCreateAndXResponse);
            n5 = smbComNTCreateAndXResponse.fid;
            this.attributes = (0x7FFF & smbComNTCreateAndXResponse.extFileAttributes);
            this.attrExpiration = System.currentTimeMillis() + SmbFile.attrExpirationPeriod;
            this.isExists = true;
        }
        else {
            final SmbComOpenAndXResponse smbComOpenAndXResponse = new SmbComOpenAndXResponse();
            this.send(new SmbComOpenAndX(this.unc, n2, n, null), smbComOpenAndXResponse);
            n5 = smbComOpenAndXResponse.fid;
        }
        return n5;
    }
    
    protected boolean pathNamesPossiblyEqual(final String s, final String s2) {
        int n = 1;
        final int lastIndex = s.lastIndexOf(47);
        final int lastIndex2 = s2.lastIndexOf(47);
        final int n2 = s.length() - lastIndex;
        final int n3 = s2.length() - lastIndex2;
        if ((n2 <= n || s.charAt(lastIndex + 1) != '.') && (n3 <= n || s2.charAt(lastIndex2 + 1) != '.') && (n2 != n3 || !s.regionMatches(n != 0, lastIndex, s2, lastIndex2, n2))) {
            n = 0;
        }
        return n != 0;
    }
    
    Info queryPath(final String s, final int n) throws SmbException {
        this.connect0();
        if (LogStream.level >= 3) {
            SmbFile.log.println("queryPath: " + s);
        }
        Info info;
        if (this.tree.session.transport.hasCapability(16)) {
            final Trans2QueryPathInformationResponse trans2QueryPathInformationResponse = new Trans2QueryPathInformationResponse(n);
            this.send(new Trans2QueryPathInformation(s, n), trans2QueryPathInformationResponse);
            info = trans2QueryPathInformationResponse.info;
        }
        else {
            info = new SmbComQueryInformationResponse(60L * (1000 * this.tree.session.transport.server.serverTimeZone));
            this.send(new SmbComQueryInformation(s), (ServerMessageBlock)info);
        }
        return info;
    }
    
    void refresh() {
        this.attrExpiration = 0L;
        this.sizeExpiration = 0L;
    }
    
    public void renameTo(final SmbFile smbFile) throws SmbException {
        if (this.getUncPath0().length() == 1 || smbFile.getUncPath0().length() == 1) {
            throw new SmbException("Invalid operation for workgroups, servers, or shares");
        }
        this.resolveDfs(null);
        smbFile.resolveDfs(null);
        if (!this.tree.equals(smbFile.tree)) {
            throw new SmbException("Invalid operation for workgroups, servers, or shares");
        }
        if (LogStream.level >= 3) {
            SmbFile.log.println("renameTo: " + this.unc + " -> " + smbFile.unc);
        }
        this.sizeExpiration = 0L;
        this.attrExpiration = 0L;
        smbFile.attrExpiration = 0L;
        this.send(new SmbComRename(this.unc, smbFile.unc), this.blank_resp());
    }
    
    void resolveDfs(final ServerMessageBlock serverMessageBlock) throws SmbException {
        if (!(serverMessageBlock instanceof SmbComClose)) {
            this.connect0();
            DfsReferral dfsReferral = SmbFile.dfs.resolve(this.tree.session.transport.tconHostName, this.tree.share, this.unc, this.auth);
            if (dfsReferral != null) {
                String s = null;
                Label_0209: {
                    if (serverMessageBlock != null) {
                        switch (serverMessageBlock.command) {
                            default: {
                                s = "A:";
                                break;
                            }
                            case 37:
                            case 50: {
                                break Label_0209;
                            }
                        }
                    }
                Label_0095_Outer:
                    while (true) {
                        final DfsReferral dfsReferral2 = dfsReferral;
                    Label_0201_Outer:
                        while (true) {
                            while (true) {
                                try {
                                    if (LogStream.level >= 2) {
                                        SmbFile.log.println("DFS redirect: " + dfsReferral);
                                    }
                                    final SmbTransport smbTransport = SmbTransport.getSmbTransport(UniAddress.getByName(dfsReferral.server), this.url.getPort());
                                    smbTransport.connect();
                                    this.tree = smbTransport.getSmbSession(this.auth).getSmbTree(dfsReferral.share, s);
                                    if (dfsReferral != dfsReferral2 && dfsReferral.key != null) {
                                        dfsReferral.map.put(dfsReferral.key, dfsReferral);
                                    }
                                    final SmbException ex = null;
                                    if (ex != null) {
                                        throw ex;
                                    }
                                    break Label_0209;
                                    final int n = 0xFF & ((SmbComTransaction)serverMessageBlock).subCommand;
                                    s = null;
                                    // switch([Lcom.strobel.decompiler.ast.Label;@40302bbb, n)
                                    Label_0244: {
                                        s = "A:";
                                    }
                                    continue Label_0095_Outer;
                                }
                                catch (IOException ex2) {
                                    if (ex2 instanceof SmbException) {
                                        final SmbException ex = (SmbException)ex2;
                                    }
                                    else {
                                        final SmbException ex = new SmbException(dfsReferral.server, ex2);
                                    }
                                    dfsReferral = dfsReferral.next;
                                    if (dfsReferral == dfsReferral2) {
                                        continue;
                                    }
                                    continue Label_0201_Outer;
                                }
                                break;
                            }
                            break;
                        }
                        break;
                    }
                }
                if (LogStream.level >= 3) {
                    SmbFile.log.println(dfsReferral);
                }
                this.dfsReferral = dfsReferral;
                if (dfsReferral.pathConsumed < 0) {
                    dfsReferral.pathConsumed = 0;
                }
                else if (dfsReferral.pathConsumed > this.unc.length()) {
                    dfsReferral.pathConsumed = this.unc.length();
                }
                String s2 = this.unc.substring(dfsReferral.pathConsumed);
                if (s2.equals("")) {
                    s2 = "\\";
                }
                if (!dfsReferral.path.equals("")) {
                    s2 = "\\" + dfsReferral.path + s2;
                }
                this.unc = s2;
                if (serverMessageBlock != null && serverMessageBlock.path != null && serverMessageBlock.path.endsWith("\\") && !s2.endsWith("\\")) {
                    s2 = String.valueOf(s2) + "\\";
                }
                if (serverMessageBlock != null) {
                    serverMessageBlock.path = s2;
                    serverMessageBlock.flags2 |= 0x1000;
                }
            }
            else {
                if (this.tree.inDomainDfs && !(serverMessageBlock instanceof NtTransQuerySecurityDesc) && !(serverMessageBlock instanceof SmbComClose) && !(serverMessageBlock instanceof SmbComFindClose2)) {
                    throw new SmbException(-1073741275, false);
                }
                if (serverMessageBlock != null) {
                    serverMessageBlock.flags2 &= 0xFFFFEFFF;
                }
            }
        }
    }
    
    void send(final ServerMessageBlock serverMessageBlock, final ServerMessageBlock serverMessageBlock2) throws SmbException {
        while (true) {
            this.resolveDfs(serverMessageBlock);
            try {
                this.tree.send(serverMessageBlock, serverMessageBlock2);
            }
            catch (DfsReferral dfsReferral) {
                if (dfsReferral.resolveHashes) {
                    throw dfsReferral;
                }
                serverMessageBlock.reset();
            }
        }
    }
    
    public void setAttributes(final int n) throws SmbException {
        if (this.getUncPath0().length() == 1) {
            throw new SmbException("Invalid operation for workgroups, servers, or shares");
        }
        this.setPathInformation(n & 0x30A7, 0L, 0L);
    }
    
    public void setCreateTime(final long n) throws SmbException {
        if (this.getUncPath0().length() == 1) {
            throw new SmbException("Invalid operation for workgroups, servers, or shares");
        }
        this.setPathInformation(0, n, 0L);
    }
    
    public void setLastModified(final long n) throws SmbException {
        if (this.getUncPath0().length() == 1) {
            throw new SmbException("Invalid operation for workgroups, servers, or shares");
        }
        this.setPathInformation(0, 0L, n);
    }
    
    void setPathInformation(final int n, final long n2, final long n3) throws SmbException {
        this.exists();
        final int n4 = 0x10 & this.attributes;
        int n5;
        if (n4 != 0) {
            n5 = 1;
        }
        else {
            n5 = 64;
        }
        final int open0 = this.open0(1, 256, n4, n5);
        this.send(new Trans2SetFileInformation(open0, n | n4, n2, n3), new Trans2SetFileInformationResponse());
        this.close(open0, 0L);
        this.attrExpiration = 0L;
    }
    
    public void setReadOnly() throws SmbException {
        this.setAttributes(0x1 | this.getAttributes());
    }
    
    public void setReadWrite() throws SmbException {
        this.setAttributes(0xFFFFFFFE & this.getAttributes());
    }
    
    public String toString() {
        return this.url.toString();
    }
    
    public URL toURL() throws MalformedURLException {
        return this.url;
    }
    
    class WriterThread extends Thread
    {
        byte[] b;
        SmbFile dest;
        SmbException e;
        int n;
        long off;
        boolean ready;
        SmbComWrite req;
        SmbComWriteAndX reqx;
        ServerMessageBlock resp;
        boolean useNTSmbs;
        
        WriterThread() throws SmbException {
            super("JCIFS-WriterThread");
            this.e = null;
            this.useNTSmbs = SmbFile.this.tree.session.transport.hasCapability(16);
            if (this.useNTSmbs) {
                this.reqx = new SmbComWriteAndX();
                this.resp = new SmbComWriteAndXResponse();
            }
            else {
                this.req = new SmbComWrite();
                this.resp = new SmbComWriteResponse();
            }
            this.ready = false;
        }
        
        public void run() {
            while (true) {
                synchronized (this) {
                    while (true) {
                        try {
                            this.notify();
                            this.ready = true;
                            while (this.ready) {
                                this.wait();
                            }
                            if (this.n == -1) {
                                return;
                            }
                            goto Label_0060;
                        }
                        catch (SmbException e) {
                            this.e = e;
                            this.notify();
                            // monitorexit(this)
                            return;
                        }
                        catch (Exception ex) {
                            this.e = new SmbException("WriterThread", ex);
                            continue;
                        }
                        break;
                    }
                }
                this.req.setParam(this.dest.fid, this.off, this.n, this.b, 0, this.n);
                this.dest.send(this.req, this.resp);
                continue;
            }
        }
        
        void write(final byte[] b, final int n, final SmbFile dest, final long off) {
            synchronized (this) {
                this.b = b;
                this.n = n;
                this.dest = dest;
                this.off = off;
                this.ready = false;
                this.notify();
            }
        }
    }
}
