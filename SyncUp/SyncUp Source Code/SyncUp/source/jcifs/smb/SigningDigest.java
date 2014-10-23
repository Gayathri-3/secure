package jcifs.smb;

import jcifs.util.*;
import java.io.*;
import java.security.*;

public class SigningDigest implements SmbConstants
{
    static LogStream log;
    private boolean bypass;
    private MessageDigest digest;
    private byte[] macSigningKey;
    private int signSequence;
    private int updates;
    
    static {
        SigningDigest.log = LogStream.getInstance();
    }
    
    public SigningDigest(final SmbTransport p0, final NtlmPasswordAuthentication p1) throws SmbException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: invokespecial   java/lang/Object.<init>:()V
        //     4: aload_0        
        //     5: iconst_0       
        //     6: putfield        jcifs/smb/SigningDigest.bypass:Z
        //     9: aload_0        
        //    10: ldc             "MD5"
        //    12: invokestatic    java/security/MessageDigest.getInstance:(Ljava/lang/String;)Ljava/security/MessageDigest;
        //    15: putfield        jcifs/smb/SigningDigest.digest:Ljava/security/MessageDigest;
        //    18: getstatic       jcifs/smb/SigningDigest.LM_COMPATIBILITY:I
        //    21: tableswitch {
        //                0: 180
        //                1: 180
        //                2: 180
        //                3: 244
        //                4: 244
        //                5: 244
        //          default: 60
        //        }
        //    60: aload_0        
        //    61: bipush          40
        //    63: newarray        B
        //    65: putfield        jcifs/smb/SigningDigest.macSigningKey:[B
        //    68: aload_2        
        //    69: aload_1        
        //    70: getfield        jcifs/smb/SmbTransport.server:Ljcifs/smb/SmbTransport$ServerData;
        //    73: getfield        jcifs/smb/SmbTransport$ServerData.encryptionKey:[B
        //    76: aload_0        
        //    77: getfield        jcifs/smb/SigningDigest.macSigningKey:[B
        //    80: iconst_0       
        //    81: invokevirtual   jcifs/smb/NtlmPasswordAuthentication.getUserSessionKey:([B[BI)V
        //    84: aload_2        
        //    85: aload_1        
        //    86: getfield        jcifs/smb/SmbTransport.server:Ljcifs/smb/SmbTransport$ServerData;
        //    89: getfield        jcifs/smb/SmbTransport$ServerData.encryptionKey:[B
        //    92: invokevirtual   jcifs/smb/NtlmPasswordAuthentication.getUnicodeHash:([B)[B
        //    95: iconst_0       
        //    96: aload_0        
        //    97: getfield        jcifs/smb/SigningDigest.macSigningKey:[B
        //   100: bipush          16
        //   102: bipush          24
        //   104: invokestatic    java/lang/System.arraycopy:(Ljava/lang/Object;ILjava/lang/Object;II)V
        //   107: getstatic       jcifs/util/LogStream.level:I
        //   110: iconst_5       
        //   111: if_icmplt       154
        //   114: getstatic       jcifs/smb/SigningDigest.log:Ljcifs/util/LogStream;
        //   117: new             Ljava/lang/StringBuilder;
        //   120: dup            
        //   121: ldc             "LM_COMPATIBILITY="
        //   123: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   126: getstatic       jcifs/smb/SigningDigest.LM_COMPATIBILITY:I
        //   129: invokevirtual   java/lang/StringBuilder.append:(I)Ljava/lang/StringBuilder;
        //   132: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   135: invokevirtual   jcifs/util/LogStream.println:(Ljava/lang/String;)V
        //   138: getstatic       jcifs/smb/SigningDigest.log:Ljcifs/util/LogStream;
        //   141: aload_0        
        //   142: getfield        jcifs/smb/SigningDigest.macSigningKey:[B
        //   145: iconst_0       
        //   146: aload_0        
        //   147: getfield        jcifs/smb/SigningDigest.macSigningKey:[B
        //   150: arraylength    
        //   151: invokestatic    jcifs/util/Hexdump.hexdump:(Ljava/io/PrintStream;[BII)V
        //   154: return         
        //   155: astore_3       
        //   156: getstatic       jcifs/util/LogStream.level:I
        //   159: ifle            169
        //   162: aload_3        
        //   163: getstatic       jcifs/smb/SigningDigest.log:Ljcifs/util/LogStream;
        //   166: invokevirtual   java/security/NoSuchAlgorithmException.printStackTrace:(Ljava/io/PrintStream;)V
        //   169: new             Ljcifs/smb/SmbException;
        //   172: dup            
        //   173: ldc             "MD5"
        //   175: aload_3        
        //   176: invokespecial   jcifs/smb/SmbException.<init>:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   179: athrow         
        //   180: aload_0        
        //   181: bipush          40
        //   183: newarray        B
        //   185: putfield        jcifs/smb/SigningDigest.macSigningKey:[B
        //   188: aload_2        
        //   189: aload_1        
        //   190: getfield        jcifs/smb/SmbTransport.server:Ljcifs/smb/SmbTransport$ServerData;
        //   193: getfield        jcifs/smb/SmbTransport$ServerData.encryptionKey:[B
        //   196: aload_0        
        //   197: getfield        jcifs/smb/SigningDigest.macSigningKey:[B
        //   200: iconst_0       
        //   201: invokevirtual   jcifs/smb/NtlmPasswordAuthentication.getUserSessionKey:([B[BI)V
        //   204: aload_2        
        //   205: aload_1        
        //   206: getfield        jcifs/smb/SmbTransport.server:Ljcifs/smb/SmbTransport$ServerData;
        //   209: getfield        jcifs/smb/SmbTransport$ServerData.encryptionKey:[B
        //   212: invokevirtual   jcifs/smb/NtlmPasswordAuthentication.getUnicodeHash:([B)[B
        //   215: iconst_0       
        //   216: aload_0        
        //   217: getfield        jcifs/smb/SigningDigest.macSigningKey:[B
        //   220: bipush          16
        //   222: bipush          24
        //   224: invokestatic    java/lang/System.arraycopy:(Ljava/lang/Object;ILjava/lang/Object;II)V
        //   227: goto            107
        //   230: astore          4
        //   232: new             Ljcifs/smb/SmbException;
        //   235: dup            
        //   236: ldc             ""
        //   238: aload           4
        //   240: invokespecial   jcifs/smb/SmbException.<init>:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   243: athrow         
        //   244: aload_0        
        //   245: bipush          16
        //   247: newarray        B
        //   249: putfield        jcifs/smb/SigningDigest.macSigningKey:[B
        //   252: aload_2        
        //   253: aload_1        
        //   254: getfield        jcifs/smb/SmbTransport.server:Ljcifs/smb/SmbTransport$ServerData;
        //   257: getfield        jcifs/smb/SmbTransport$ServerData.encryptionKey:[B
        //   260: aload_0        
        //   261: getfield        jcifs/smb/SigningDigest.macSigningKey:[B
        //   264: iconst_0       
        //   265: invokevirtual   jcifs/smb/NtlmPasswordAuthentication.getUserSessionKey:([B[BI)V
        //   268: goto            107
        //    Exceptions:
        //  throws jcifs.smb.SmbException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                    
        //  -----  -----  -----  -----  ----------------------------------------
        //  9      18     155    180    Ljava/security/NoSuchAlgorithmException;
        //  18     107    230    244    Ljava/lang/Exception;
        //  180    227    230    244    Ljava/lang/Exception;
        //  244    268    230    244    Ljava/lang/Exception;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0060:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2607)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:100)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:668)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createConstructor(AstBuilder.java:604)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:490)
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
    
    public SigningDigest(final byte[] macSigningKey, final boolean bypass) throws SmbException {
        super();
        this.bypass = false;
        try {
            this.digest = MessageDigest.getInstance("MD5");
            this.macSigningKey = macSigningKey;
            this.bypass = bypass;
            this.updates = 0;
            this.signSequence = 0;
            if (LogStream.level >= 5) {
                SigningDigest.log.println("macSigningKey:");
                Hexdump.hexdump(SigningDigest.log, macSigningKey, 0, macSigningKey.length);
            }
        }
        catch (NoSuchAlgorithmException ex) {
            if (LogStream.level > 0) {
                ex.printStackTrace(SigningDigest.log);
            }
            throw new SmbException("MD5", ex);
        }
    }
    
    public byte[] digest() {
        final byte[] digest = this.digest.digest();
        if (LogStream.level >= 5) {
            SigningDigest.log.println("digest: ");
            Hexdump.hexdump(SigningDigest.log, digest, 0, digest.length);
            SigningDigest.log.flush();
        }
        this.updates = 0;
        return digest;
    }
    
    void sign(final byte[] array, final int n, final int n2, final ServerMessageBlock serverMessageBlock, final ServerMessageBlock serverMessageBlock2) {
        serverMessageBlock.signSeq = this.signSequence;
        if (serverMessageBlock2 != null) {
            serverMessageBlock2.signSeq = 1 + this.signSequence;
            serverMessageBlock2.verifyFailed = false;
        }
        try {
            this.update(this.macSigningKey, 0, this.macSigningKey.length);
            final int n3 = n + 14;
            for (int i = 0; i < 8; ++i) {
                array[n3 + i] = 0;
            }
            ServerMessageBlock.writeInt4(this.signSequence, array, n3);
            this.update(array, n, n2);
            System.arraycopy(this.digest(), 0, array, n3, 8);
            if (this.bypass) {
                this.bypass = false;
                System.arraycopy("BSRSPYL ".getBytes(), 0, array, n3, 8);
            }
        }
        catch (Exception ex) {
            if (LogStream.level > 0) {
                ex.printStackTrace(SigningDigest.log);
            }
            this.signSequence += 2;
        }
        finally {
            this.signSequence += 2;
        }
    }
    
    public String toString() {
        return "LM_COMPATIBILITY=" + SigningDigest.LM_COMPATIBILITY + " MacSigningKey=" + Hexdump.toHexString(this.macSigningKey, 0, this.macSigningKey.length);
    }
    
    public void update(final byte[] array, final int n, final int n2) {
        if (LogStream.level >= 5) {
            SigningDigest.log.println("update: " + this.updates + " " + n + ":" + n2);
            Hexdump.hexdump(SigningDigest.log, array, n, Math.min(n2, 256));
            SigningDigest.log.flush();
        }
        if (n2 != 0) {
            this.digest.update(array, n, n2);
            this.updates += 1;
        }
    }
    
    boolean verify(final byte[] array, final int n, final ServerMessageBlock serverMessageBlock) {
        boolean verifyFailed = false;
        this.update(this.macSigningKey, 0, this.macSigningKey.length);
        this.update(array, n, 14);
        final int n2 = n + 14;
        final byte[] array2 = new byte[8];
        ServerMessageBlock.writeInt4(serverMessageBlock.signSeq, array2, 0);
        this.update(array2, 0, array2.length);
        final int n3 = n2 + 8;
        if (serverMessageBlock.command == 46) {
            final SmbComReadAndXResponse smbComReadAndXResponse = (SmbComReadAndXResponse)serverMessageBlock;
            this.update(array, n3, -8 + (-14 + (serverMessageBlock.length - smbComReadAndXResponse.dataLength)));
            this.update(smbComReadAndXResponse.b, smbComReadAndXResponse.off, smbComReadAndXResponse.dataLength);
        }
        else {
            this.update(array, n3, -8 + (-14 + serverMessageBlock.length));
        }
        final byte[] digest = this.digest();
        for (int i = 0; i < 8; ++i) {
            if (digest[i] != array[i + (n + 14)]) {
                if (LogStream.level >= 2) {
                    SigningDigest.log.println("signature verification failure");
                    Hexdump.hexdump(SigningDigest.log, digest, 0, 8);
                    Hexdump.hexdump(SigningDigest.log, array, n + 14, 8);
                }
                verifyFailed = true;
                serverMessageBlock.verifyFailed = verifyFailed;
                return verifyFailed;
            }
        }
        serverMessageBlock.verifyFailed = false;
        return verifyFailed;
    }
}
