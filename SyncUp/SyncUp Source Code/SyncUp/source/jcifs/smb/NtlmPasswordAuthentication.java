package jcifs.smb;

import jcifs.*;
import java.io.*;
import java.security.*;
import jcifs.util.*;
import java.util.*;

public final class NtlmPasswordAuthentication implements Principal, Serializable
{
    public static final NtlmPasswordAuthentication ANONYMOUS;
    static final String BLANK = "";
    static final NtlmPasswordAuthentication DEFAULT;
    static String DEFAULT_DOMAIN;
    static String DEFAULT_PASSWORD;
    static String DEFAULT_USERNAME;
    static final NtlmPasswordAuthentication GUEST;
    private static final int LM_COMPATIBILITY;
    static final NtlmPasswordAuthentication NULL;
    private static final Random RANDOM;
    private static final byte[] S8;
    private static LogStream log;
    byte[] ansiHash;
    byte[] challenge;
    byte[] clientChallenge;
    String domain;
    boolean hashesExternal;
    String password;
    byte[] unicodeHash;
    String username;
    
    static {
        LM_COMPATIBILITY = Config.getInt("jcifs.smb.lmCompatibility", 3);
        RANDOM = new Random();
        NtlmPasswordAuthentication.log = LogStream.getInstance();
        S8 = new byte[] { 75, 71, 83, 33, 64, 35, 36, 37 };
        ANONYMOUS = new NtlmPasswordAuthentication("", "", "");
        NULL = new NtlmPasswordAuthentication("", "", "");
        GUEST = new NtlmPasswordAuthentication("?", "GUEST", "");
        DEFAULT = new NtlmPasswordAuthentication(null);
    }
    
    public NtlmPasswordAuthentication(String unescape) {
        super();
        this.hashesExternal = false;
        this.clientChallenge = null;
        this.challenge = null;
        this.password = null;
        this.username = null;
        this.domain = null;
        Label_0076: {
            if (unescape == null) {
                break Label_0076;
            }
            while (true) {
                try {
                    unescape = unescape(unescape);
                    final int length = unescape.length();
                    int i = 0;
                    int n = 0;
                    while (i < length) {
                        final char char1 = unescape.charAt(i);
                        if (char1 == ';') {
                            this.domain = unescape.substring(0, i);
                            n = i + 1;
                        }
                        else if (char1 == ':') {
                            this.password = unescape.substring(i + 1);
                            break;
                        }
                        ++i;
                    }
                    this.username = unescape.substring(n, i);
                    initDefaults();
                    if (this.domain == null) {
                        this.domain = NtlmPasswordAuthentication.DEFAULT_DOMAIN;
                    }
                    if (this.username == null) {
                        this.username = NtlmPasswordAuthentication.DEFAULT_USERNAME;
                    }
                    if (this.password == null) {
                        this.password = NtlmPasswordAuthentication.DEFAULT_PASSWORD;
                    }
                }
                catch (UnsupportedEncodingException ex) {
                    continue;
                }
                break;
            }
        }
    }
    
    public NtlmPasswordAuthentication(String domain, String username, final String password) {
        super();
        this.hashesExternal = false;
        this.clientChallenge = null;
        this.challenge = null;
        final int index = username.indexOf(64);
        if (index > 0) {
            domain = username.substring(index + 1);
            username = username.substring(0, index);
        }
        else {
            final int index2 = username.indexOf(92);
            if (index2 > 0) {
                domain = username.substring(0, index2);
                username = username.substring(index2 + 1);
            }
        }
        this.domain = domain;
        this.username = username;
        this.password = password;
        initDefaults();
        if (domain == null) {
            this.domain = NtlmPasswordAuthentication.DEFAULT_DOMAIN;
        }
        if (username == null) {
            this.username = NtlmPasswordAuthentication.DEFAULT_USERNAME;
        }
        if (password == null) {
            this.password = NtlmPasswordAuthentication.DEFAULT_PASSWORD;
        }
    }
    
    public NtlmPasswordAuthentication(final String domain, final String username, final byte[] challenge, final byte[] ansiHash, final byte[] unicodeHash) {
        super();
        this.hashesExternal = false;
        this.clientChallenge = null;
        this.challenge = null;
        if (domain == null || username == null || ansiHash == null || unicodeHash == null) {
            throw new IllegalArgumentException("External credentials cannot be null");
        }
        this.domain = domain;
        this.username = username;
        this.password = null;
        this.challenge = challenge;
        this.ansiHash = ansiHash;
        this.unicodeHash = unicodeHash;
        this.hashesExternal = true;
    }
    
    private static void E(final byte[] array, final byte[] array2, final byte[] array3) {
        final byte[] array4 = new byte[7];
        final byte[] array5 = new byte[8];
        for (int i = 0; i < array.length / 7; ++i) {
            System.arraycopy(array, i * 7, array4, 0, 7);
            new DES(array4).encrypt(array2, array5);
            System.arraycopy(array5, 0, array3, i * 8, 8);
        }
    }
    
    static byte[] computeResponse(final byte[] array, final byte[] array2, final byte[] array3, final int n, final int n2) {
        final HMACT64 hmact64 = new HMACT64(array);
        hmact64.update(array2);
        hmact64.update(array3, n, n2);
        final byte[] digest = hmact64.digest();
        final byte[] array4 = new byte[digest.length + array3.length];
        System.arraycopy(digest, 0, array4, 0, digest.length);
        System.arraycopy(array3, 0, array4, digest.length, array3.length);
        return array4;
    }
    
    public static byte[] getLMv2Response(final String s, final String s2, final String s3, final byte[] array, final byte[] array2) {
        try {
            new byte[16];
            final byte[] array3 = new byte[24];
            final MD4 md4 = new MD4();
            md4.update(s3.getBytes("UTF-16LE"));
            final HMACT64 hmact64 = new HMACT64(md4.digest());
            hmact64.update(s2.toUpperCase().getBytes("UTF-16LE"));
            hmact64.update(s.toUpperCase().getBytes("UTF-16LE"));
            final HMACT64 hmact2 = new HMACT64(hmact64.digest());
            hmact2.update(array);
            hmact2.update(array2);
            hmact2.digest(array3, 0, 16);
            System.arraycopy(array2, 0, array3, 16, 8);
            return array3;
        }
        catch (Exception ex) {
            if (LogStream.level > 0) {
                ex.printStackTrace(NtlmPasswordAuthentication.log);
            }
            return null;
        }
    }
    
    public static byte[] getLMv2Response(final byte[] array, final byte[] array2, final byte[] array3) {
        return computeResponse(array, array2, array3, 0, array3.length);
    }
    
    public static byte[] getNTLM2Response(final byte[] array, final byte[] array2, final byte[] array3) {
        final byte[] array4 = new byte[8];
        try {
            final MessageDigest instance = MessageDigest.getInstance("MD5");
            instance.update(array2);
            instance.update(array3, 0, 8);
            System.arraycopy(instance.digest(), 0, array4, 0, 8);
            final byte[] array5 = new byte[21];
            System.arraycopy(array, 0, array5, 0, 16);
            final byte[] array6 = new byte[24];
            E(array5, array4, array6);
            return array6;
        }
        catch (GeneralSecurityException ex) {
            if (LogStream.level > 0) {
                ex.printStackTrace(NtlmPasswordAuthentication.log);
            }
            throw new RuntimeException("MD5", ex);
        }
    }
    
    public static byte[] getNTLMResponse(final String p0, final byte[] p1) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: bipush          21
        //     2: newarray        B
        //     4: astore_2       
        //     5: bipush          24
        //     7: newarray        B
        //     9: astore_3       
        //    10: aload_0        
        //    11: ldc             "UTF-16LE"
        //    13: invokevirtual   java/lang/String.getBytes:(Ljava/lang/String;)[B
        //    16: astore          10
        //    18: aload           10
        //    20: astore          6
        //    22: new             Ljcifs/util/MD4;
        //    25: dup            
        //    26: invokespecial   jcifs/util/MD4.<init>:()V
        //    29: astore          7
        //    31: aload           7
        //    33: aload           6
        //    35: invokevirtual   jcifs/util/MD4.update:([B)V
        //    38: aload           7
        //    40: aload_2        
        //    41: iconst_0       
        //    42: bipush          16
        //    44: invokevirtual   jcifs/util/MD4.digest:([BII)I
        //    47: pop            
        //    48: aload_2        
        //    49: aload_1        
        //    50: aload_3        
        //    51: invokestatic    jcifs/smb/NtlmPasswordAuthentication.E:([B[B[B)V
        //    54: aload_3        
        //    55: areturn        
        //    56: astore          4
        //    58: getstatic       jcifs/util/LogStream.level:I
        //    61: istore          5
        //    63: aconst_null    
        //    64: astore          6
        //    66: iload           5
        //    68: ifle            22
        //    71: aload           4
        //    73: getstatic       jcifs/smb/NtlmPasswordAuthentication.log:Ljcifs/util/LogStream;
        //    76: invokevirtual   java/io/UnsupportedEncodingException.printStackTrace:(Ljava/io/PrintStream;)V
        //    79: aconst_null    
        //    80: astore          6
        //    82: goto            22
        //    85: astore          8
        //    87: getstatic       jcifs/util/LogStream.level:I
        //    90: ifle            48
        //    93: aload           8
        //    95: getstatic       jcifs/smb/NtlmPasswordAuthentication.log:Ljcifs/util/LogStream;
        //    98: invokevirtual   java/lang/Exception.printStackTrace:(Ljava/io/PrintStream;)V
        //   101: goto            48
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                  
        //  -----  -----  -----  -----  --------------------------------------
        //  10     18     56     85     Ljava/io/UnsupportedEncodingException;
        //  38     48     85     104    Ljava/lang/Exception;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0048:
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
    
    public static byte[] getNTLMv2Response(final byte[] array, final byte[] array2, final byte[] array3, final long n, final byte[] array4) {
        int length;
        if (array4 != null) {
            length = array4.length;
        }
        else {
            length = 0;
        }
        final byte[] array5 = new byte[4 + (length + 28)];
        Encdec.enc_uint32le(257, array5, 0);
        Encdec.enc_uint32le(0, array5, 4);
        Encdec.enc_uint64le(n, array5, 8);
        System.arraycopy(array3, 0, array5, 16, 8);
        Encdec.enc_uint32le(0, array5, 24);
        if (array4 != null) {
            System.arraycopy(array4, 0, array5, 28, length);
        }
        Encdec.enc_uint32le(0, array5, length + 28);
        return computeResponse(array, array2, array5, 0, array5.length);
    }
    
    public static byte[] getPreNTLMResponse(final String s, final byte[] array) {
        final byte[] array2 = new byte[14];
        final byte[] array3 = new byte[21];
        final byte[] array4 = new byte[24];
        try {
            final byte[] bytes = s.toUpperCase().getBytes(ServerMessageBlock.OEM_ENCODING);
            int length = bytes.length;
            if (length > 14) {
                length = 14;
            }
            System.arraycopy(bytes, 0, array2, 0, length);
            E(array2, NtlmPasswordAuthentication.S8, array3);
            E(array3, array, array4);
            return array4;
        }
        catch (UnsupportedEncodingException ex) {
            throw new RuntimeException("Try setting jcifs.encoding=US-ASCII", ex);
        }
    }
    
    static void initDefaults() {
        if (NtlmPasswordAuthentication.DEFAULT_DOMAIN == null) {
            NtlmPasswordAuthentication.DEFAULT_DOMAIN = Config.getProperty("jcifs.smb.client.domain", "?");
            NtlmPasswordAuthentication.DEFAULT_USERNAME = Config.getProperty("jcifs.smb.client.username", "GUEST");
            NtlmPasswordAuthentication.DEFAULT_PASSWORD = Config.getProperty("jcifs.smb.client.password", "");
        }
    }
    
    public static byte[] nTOWFv1(final String s) {
        if (s == null) {
            throw new RuntimeException("Password parameter is required");
        }
        try {
            final MD4 md4 = new MD4();
            md4.update(s.getBytes("UTF-16LE"));
            return md4.digest();
        }
        catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }
    
    public static byte[] nTOWFv2(final String s, final String s2, final String s3) {
        try {
            final MD4 md4 = new MD4();
            md4.update(s3.getBytes("UTF-16LE"));
            final HMACT64 hmact64 = new HMACT64(md4.digest());
            hmact64.update(s2.toUpperCase().getBytes("UTF-16LE"));
            hmact64.update(s.getBytes("UTF-16LE"));
            return hmact64.digest();
        }
        catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }
    
    static String unescape(final String s) throws NumberFormatException, UnsupportedEncodingException {
        final byte[] array = { 0 };
        String s2;
        if (s == null) {
            s2 = null;
        }
        else {
            final int length = s.length();
            final char[] array2 = new char[length];
            int n = 0;
            int i = 0;
            int n2 = 0;
            while (i < length) {
                int n3 = 0;
                switch (n) {
                    default: {
                        n3 = n2;
                        break;
                    }
                    case 0: {
                        final char char1 = s.charAt(i);
                        if (char1 == '%') {
                            n = 1;
                            n3 = n2;
                            break;
                        }
                        n3 = n2 + 1;
                        array2[n2] = char1;
                        break;
                    }
                    case 1: {
                        array[0] = (byte)(0xFF & Integer.parseInt(s.substring(i, i + 2), 16));
                        n3 = n2 + 1;
                        array2[n2] = new String(array, 0, 1, "ASCII").charAt(0);
                        ++i;
                        n = 0;
                        break;
                    }
                }
                ++i;
                n2 = n3;
            }
            s2 = new String(array2, 0, n2);
        }
        return s2;
    }
    
    public boolean equals(final Object o) {
        boolean b = true;
        if (!(o instanceof NtlmPasswordAuthentication)) {
            return false;
        }
        final NtlmPasswordAuthentication ntlmPasswordAuthentication = (NtlmPasswordAuthentication)o;
        if (!ntlmPasswordAuthentication.domain.toUpperCase().equals(this.domain.toUpperCase()) || !ntlmPasswordAuthentication.username.toUpperCase().equals(this.username.toUpperCase())) {
            return false;
        }
        if (this.hashesExternal && ntlmPasswordAuthentication.hashesExternal) {
            if (!Arrays.equals(this.ansiHash, ntlmPasswordAuthentication.ansiHash) || !Arrays.equals(this.unicodeHash, ntlmPasswordAuthentication.unicodeHash)) {
                b = false;
            }
        }
        else if (this.hashesExternal || !this.password.equals(ntlmPasswordAuthentication.password)) {
            return false;
        }
        return b;
        b = false;
        return b;
    }
    
    public byte[] getAnsiHash(final byte[] array) {
        byte[] array2 = null;
        if (this.hashesExternal) {
            array2 = this.ansiHash;
        }
        else {
            switch (NtlmPasswordAuthentication.LM_COMPATIBILITY) {
                default: {
                    array2 = getPreNTLMResponse(this.password, array);
                    break;
                }
                case 0:
                case 1: {
                    array2 = getPreNTLMResponse(this.password, array);
                    break;
                }
                case 2: {
                    array2 = getNTLMResponse(this.password, array);
                    break;
                }
                case 3:
                case 4:
                case 5: {
                    if (this.clientChallenge == null) {
                        this.clientChallenge = new byte[8];
                        NtlmPasswordAuthentication.RANDOM.nextBytes(this.clientChallenge);
                    }
                    array2 = getLMv2Response(this.domain, this.username, this.password, array, this.clientChallenge);
                    break;
                }
            }
        }
        return array2;
    }
    
    public String getDomain() {
        return this.domain;
    }
    
    public String getName() {
        int n;
        if (this.domain.length() > 0 && !this.domain.equals("?")) {
            n = 1;
        }
        else {
            n = 0;
        }
        String s;
        if (n != 0) {
            s = String.valueOf(this.domain) + "\\" + this.username;
        }
        else {
            s = this.username;
        }
        return s;
    }
    
    public String getPassword() {
        return this.password;
    }
    
    public byte[] getSigningKey(final byte[] array) throws SmbException {
        byte[] array2 = null;
        switch (NtlmPasswordAuthentication.LM_COMPATIBILITY) {
            default: {
                array2 = null;
                break;
            }
            case 0:
            case 1:
            case 2: {
                array2 = new byte[40];
                this.getUserSessionKey(array, array2, 0);
                System.arraycopy(this.getUnicodeHash(array), 0, array2, 16, 24);
                break;
            }
            case 3:
            case 4:
            case 5: {
                throw new SmbException("NTLMv2 requires extended security (jcifs.smb.client.useExtendedSecurity must be true if jcifs.smb.lmCompatibility >= 3)");
            }
        }
        return array2;
    }
    
    public byte[] getUnicodeHash(final byte[] array) {
        byte[] array2 = null;
        if (this.hashesExternal) {
            array2 = this.unicodeHash;
        }
        else {
            switch (NtlmPasswordAuthentication.LM_COMPATIBILITY) {
                default: {
                    array2 = getNTLMResponse(this.password, array);
                    break;
                }
                case 0:
                case 1:
                case 2: {
                    array2 = getNTLMResponse(this.password, array);
                    break;
                }
                case 3:
                case 4:
                case 5: {
                    array2 = new byte[0];
                    break;
                }
            }
        }
        return array2;
    }
    
    void getUserSessionKey(final byte[] array, final byte[] array2, final int n) throws SmbException {
        if (!this.hashesExternal) {
            MD4 md4 = null;
            Label_0132: {
                try {
                    md4 = new MD4();
                    md4.update(this.password.getBytes("UTF-16LE"));
                    switch (NtlmPasswordAuthentication.LM_COMPATIBILITY) {
                        default: {
                            md4.update(md4.digest());
                            md4.digest(array2, n, 16);
                            return;
                        }
                        case 0:
                        case 1:
                        case 2: {
                            break;
                        }
                        case 3:
                        case 4:
                        case 5: {
                            break Label_0132;
                        }
                    }
                }
                catch (Exception ex) {
                    throw new SmbException("", ex);
                }
                md4.update(md4.digest());
                md4.digest(array2, n, 16);
                return;
            }
            if (this.clientChallenge == null) {
                this.clientChallenge = new byte[8];
                NtlmPasswordAuthentication.RANDOM.nextBytes(this.clientChallenge);
            }
            final HMACT64 hmact64 = new HMACT64(md4.digest());
            hmact64.update(this.username.toUpperCase().getBytes("UTF-16LE"));
            hmact64.update(this.domain.toUpperCase().getBytes("UTF-16LE"));
            final byte[] digest = hmact64.digest();
            final HMACT64 hmact2 = new HMACT64(digest);
            hmact2.update(array);
            hmact2.update(this.clientChallenge);
            final HMACT64 hmact3 = new HMACT64(digest);
            hmact3.update(hmact2.digest());
            hmact3.digest(array2, n, 16);
        }
    }
    
    public byte[] getUserSessionKey(final byte[] array) {
        byte[] array2;
        if (this.hashesExternal) {
            array2 = null;
        }
        else {
            array2 = new byte[16];
            try {
                this.getUserSessionKey(array, array2, 0);
            }
            catch (Exception ex) {
                if (LogStream.level > 0) {
                    ex.printStackTrace(NtlmPasswordAuthentication.log);
                }
            }
        }
        return array2;
    }
    
    public String getUsername() {
        return this.username;
    }
    
    public int hashCode() {
        return this.getName().toUpperCase().hashCode();
    }
    
    public String toString() {
        return this.getName();
    }
}
