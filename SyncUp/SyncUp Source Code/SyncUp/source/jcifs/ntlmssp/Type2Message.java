package jcifs.ntlmssp;

import java.io.*;
import jcifs.util.*;

public class Type2Message extends NtlmMessage
{
    private static final String DEFAULT_DOMAIN;
    private static final int DEFAULT_FLAGS;
    private static final byte[] DEFAULT_TARGET_INFORMATION;
    private byte[] challenge;
    private byte[] context;
    private String target;
    private byte[] targetInformation;
    
    static {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: ldc             "jcifs.smb.client.useUnicode"
        //     2: iconst_1       
        //     3: invokestatic    jcifs/Config.getBoolean:(Ljava/lang/String;Z)Z
        //     6: ifeq            209
        //     9: iconst_1       
        //    10: istore_0       
        //    11: iload_0        
        //    12: sipush          512
        //    15: ior            
        //    16: putstatic       jcifs/ntlmssp/Type2Message.DEFAULT_FLAGS:I
        //    19: ldc             "jcifs.smb.client.domain"
        //    21: aconst_null    
        //    22: invokestatic    jcifs/Config.getProperty:(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
        //    25: putstatic       jcifs/ntlmssp/Type2Message.DEFAULT_DOMAIN:Ljava/lang/String;
        //    28: iconst_0       
        //    29: newarray        B
        //    31: astore_1       
        //    32: getstatic       jcifs/ntlmssp/Type2Message.DEFAULT_DOMAIN:Ljava/lang/String;
        //    35: ifnull          51
        //    38: getstatic       jcifs/ntlmssp/Type2Message.DEFAULT_DOMAIN:Ljava/lang/String;
        //    41: ldc             "UTF-16LE"
        //    43: invokevirtual   java/lang/String.getBytes:(Ljava/lang/String;)[B
        //    46: astore          16
        //    48: aload           16
        //    50: astore_1       
        //    51: aload_1        
        //    52: arraylength    
        //    53: istore_2       
        //    54: iconst_0       
        //    55: newarray        B
        //    57: astore_3       
        //    58: invokestatic    jcifs/netbios/NbtAddress.getLocalHost:()Ljcifs/netbios/NbtAddress;
        //    61: invokevirtual   jcifs/netbios/NbtAddress.getHostName:()Ljava/lang/String;
        //    64: astore          12
        //    66: aload           12
        //    68: ifnull          83
        //    71: aload           12
        //    73: ldc             "UTF-16LE"
        //    75: invokevirtual   java/lang/String.getBytes:(Ljava/lang/String;)[B
        //    78: astore          14
        //    80: aload           14
        //    82: astore_3       
        //    83: aload_3        
        //    84: arraylength    
        //    85: istore          5
        //    87: iload_2        
        //    88: ifle            214
        //    91: iload_2        
        //    92: iconst_4       
        //    93: iadd           
        //    94: istore          6
        //    96: iload           5
        //    98: ifle            220
        //   101: iload           5
        //   103: iconst_4       
        //   104: iadd           
        //   105: istore          7
        //   107: iconst_4       
        //   108: iload           7
        //   110: iload           6
        //   112: iadd           
        //   113: iadd           
        //   114: newarray        B
        //   116: astore          8
        //   118: iconst_0       
        //   119: istore          9
        //   121: iload_2        
        //   122: ifle            162
        //   125: aload           8
        //   127: iconst_0       
        //   128: iconst_2       
        //   129: invokestatic    jcifs/ntlmssp/Type2Message.writeUShort:([BII)V
        //   132: iconst_0       
        //   133: iconst_2       
        //   134: iadd           
        //   135: istore          11
        //   137: aload           8
        //   139: iload           11
        //   141: iload_2        
        //   142: invokestatic    jcifs/ntlmssp/Type2Message.writeUShort:([BII)V
        //   145: aload_1        
        //   146: iconst_0       
        //   147: aload           8
        //   149: iload           11
        //   151: iconst_2       
        //   152: iadd           
        //   153: iload_2        
        //   154: invokestatic    java/lang/System.arraycopy:(Ljava/lang/Object;ILjava/lang/Object;II)V
        //   157: iload_2        
        //   158: iconst_4       
        //   159: iadd           
        //   160: istore          9
        //   162: iload           5
        //   164: ifle            203
        //   167: aload           8
        //   169: iload           9
        //   171: iconst_1       
        //   172: invokestatic    jcifs/ntlmssp/Type2Message.writeUShort:([BII)V
        //   175: iload           9
        //   177: iconst_2       
        //   178: iadd           
        //   179: istore          10
        //   181: aload           8
        //   183: iload           10
        //   185: iload           5
        //   187: invokestatic    jcifs/ntlmssp/Type2Message.writeUShort:([BII)V
        //   190: aload_3        
        //   191: iconst_0       
        //   192: aload           8
        //   194: iload           10
        //   196: iconst_2       
        //   197: iadd           
        //   198: iload           5
        //   200: invokestatic    java/lang/System.arraycopy:(Ljava/lang/Object;ILjava/lang/Object;II)V
        //   203: aload           8
        //   205: putstatic       jcifs/ntlmssp/Type2Message.DEFAULT_TARGET_INFORMATION:[B
        //   208: return         
        //   209: iconst_2       
        //   210: istore_0       
        //   211: goto            11
        //   214: iconst_0       
        //   215: istore          6
        //   217: goto            96
        //   220: iconst_0       
        //   221: istore          7
        //   223: goto            107
        //   226: astore          4
        //   228: goto            83
        //   231: astore          13
        //   233: goto            83
        //   236: astore          15
        //   238: goto            51
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                           
        //  -----  -----  -----  -----  -------------------------------
        //  38     48     236    241    Ljava/io/IOException;
        //  58     66     226    231    Ljava/net/UnknownHostException;
        //  71     80     231    236    Ljava/io/IOException;
        //  71     80     226    231    Ljava/net/UnknownHostException;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0083:
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
    
    public Type2Message() {
        this(getDefaultFlags(), null, null);
    }
    
    public Type2Message(final int flags, final byte[] challenge, final String target) {
        super();
        this.setFlags(flags);
        this.setChallenge(challenge);
        this.setTarget(target);
        if (target != null) {
            this.setTargetInformation(getDefaultTargetInformation());
        }
    }
    
    public Type2Message(final Type1Message type1Message) {
        this(type1Message, null, null);
    }
    
    public Type2Message(final Type1Message type1Message, final byte[] array, String defaultDomain) {
        final int defaultFlags = getDefaultFlags(type1Message);
        if (type1Message != null && defaultDomain == null && type1Message.getFlag(4)) {
            defaultDomain = getDefaultDomain();
        }
        this(defaultFlags, array, defaultDomain);
    }
    
    public Type2Message(final byte[] array) throws IOException {
        super();
        this.parse(array);
    }
    
    public static String getDefaultDomain() {
        return Type2Message.DEFAULT_DOMAIN;
    }
    
    public static int getDefaultFlags() {
        return Type2Message.DEFAULT_FLAGS;
    }
    
    public static int getDefaultFlags(final Type1Message type1Message) {
        int default_FLAGS;
        if (type1Message == null) {
            default_FLAGS = Type2Message.DEFAULT_FLAGS;
        }
        else {
            final int flags = type1Message.getFlags();
            int n;
            if ((flags & 0x1) != 0x0) {
                n = 1;
            }
            else {
                n = 2;
            }
            default_FLAGS = (0x200 | n);
            if ((flags & 0x4) != 0x0 && getDefaultDomain() != null) {
                default_FLAGS |= 0x10004;
            }
        }
        return default_FLAGS;
    }
    
    public static byte[] getDefaultTargetInformation() {
        return Type2Message.DEFAULT_TARGET_INFORMATION;
    }
    
    private void parse(final byte[] array) throws IOException {
        for (int i = 0; i < 8; ++i) {
            if (array[i] != Type2Message.NTLMSSP_SIGNATURE[i]) {
                throw new IOException("Not an NTLMSSP message.");
            }
        }
        if (NtlmMessage.readULong(array, 8) != 2) {
            throw new IOException("Not a Type 2 message.");
        }
        final int uLong = NtlmMessage.readULong(array, 20);
        this.setFlags(uLong);
        final byte[] securityBuffer = NtlmMessage.readSecurityBuffer(array, 12);
        final int length = securityBuffer.length;
        String target = null;
        if (length != 0) {
            String oemEncoding;
            if ((uLong & 0x1) != 0x0) {
                oemEncoding = "UTF-16LE";
            }
            else {
                oemEncoding = NtlmMessage.getOEMEncoding();
            }
            target = new String(securityBuffer, oemEncoding);
        }
        this.setTarget(target);
        for (int j = 24; j < 32; ++j) {
            if (array[j] != 0) {
                final byte[] challenge = new byte[8];
                System.arraycopy(array, 24, challenge, 0, 8);
                this.setChallenge(challenge);
                break;
            }
        }
        final int uLong2 = NtlmMessage.readULong(array, 16);
        if (uLong2 != 32 && array.length != 32) {
            for (int k = 32; k < 40; ++k) {
                if (array[k] != 0) {
                    final byte[] context = new byte[8];
                    System.arraycopy(array, 32, context, 0, 8);
                    this.setContext(context);
                    break;
                }
            }
            if (uLong2 != 40 && array.length != 40) {
                final byte[] securityBuffer2 = NtlmMessage.readSecurityBuffer(array, 40);
                if (securityBuffer2.length != 0) {
                    this.setTargetInformation(securityBuffer2);
                }
            }
        }
    }
    
    public byte[] getChallenge() {
        return this.challenge;
    }
    
    public byte[] getContext() {
        return this.context;
    }
    
    public String getTarget() {
        return this.target;
    }
    
    public byte[] getTargetInformation() {
        return this.targetInformation;
    }
    
    public void setChallenge(final byte[] challenge) {
        this.challenge = challenge;
    }
    
    public void setContext(final byte[] context) {
        this.context = context;
    }
    
    public void setTarget(final String target) {
        this.target = target;
    }
    
    public void setTargetInformation(final byte[] targetInformation) {
        this.targetInformation = targetInformation;
    }
    
    public byte[] toByteArray() {
        byte[] array2;
        while (true) {
            String target;
            byte[] challenge;
            byte[] context = null;
            byte[] targetInformation = null;
            int flags = 0;
            byte[] array;
            int n;
            int length;
            int n2;
            Label_0166_Outer:Label_0194_Outer:Label_0092_Outer:
            while (true) {
                Label_0279: {
                    while (true) {
                        Label_0253: {
                            try {
                                target = this.getTarget();
                                challenge = this.getChallenge();
                                context = this.getContext();
                                targetInformation = this.getTargetInformation();
                                flags = this.getFlags();
                                array = new byte[0];
                                if ((flags & 0x4) != 0x0) {
                                    if (target == null || target.length() == 0) {
                                        break Label_0279;
                                    }
                                    if ((flags & 0x1) != 0x0) {
                                        array = target.getBytes("UTF-16LE");
                                    }
                                    else {
                                        array = target.toUpperCase().getBytes(NtlmMessage.getOEMEncoding());
                                    }
                                }
                                if (targetInformation == null) {
                                    break Label_0253;
                                }
                                flags |= 0x800000;
                                if (context == null) {
                                    context = new byte[8];
                                }
                                break Label_0253;
                                // iftrue(Label_0194:, context == null)
                                // iftrue(Label_0276:, targetInformation == null)
                                // iftrue(Label_0232:, challenge == null)
                                // iftrue(Label_0113:, targetInformation == null)
                                while (true) {
                                    Block_11: {
                                        while (true) {
                                            while (true) {
                                                while (true) {
                                                    NtlmMessage.writeSecurityBuffer(array2, 40, n + array.length, targetInformation);
                                                    break;
                                                    System.arraycopy(challenge, 0, array2, 24, 8);
                                                    break Block_11;
                                                    continue Label_0166_Outer;
                                                }
                                                Label_0232: {
                                                    challenge = new byte[8];
                                                }
                                                continue Label_0194_Outer;
                                                array2 = new byte[length + n2];
                                                System.arraycopy(Type2Message.NTLMSSP_SIGNATURE, 0, array2, 0, 8);
                                                NtlmMessage.writeULong(array2, 8, 2);
                                                NtlmMessage.writeSecurityBuffer(array2, 12, n, array);
                                                NtlmMessage.writeULong(array2, 20, flags);
                                                continue Label_0194_Outer;
                                            }
                                            n2 = n + array.length;
                                            length = 0;
                                            length = targetInformation.length;
                                            continue Label_0092_Outer;
                                        }
                                    }
                                    System.arraycopy(context, 0, array2, 32, 8);
                                    continue Label_0092_Outer;
                                }
                            }
                            catch (IOException ex) {
                                throw new IllegalStateException(ex.getMessage());
                            }
                        }
                        n = 32;
                        if (context != null) {
                            n += 8;
                        }
                        if (targetInformation != null) {
                            n += 8;
                            continue;
                        }
                        continue;
                    }
                }
                flags &= 0xFFFFFFFB;
                continue;
            }
        }
        Label_0276: {
            return array2;
        }
    }
    
    public String toString() {
        final String target = this.getTarget();
        final byte[] challenge = this.getChallenge();
        final byte[] context = this.getContext();
        final byte[] targetInformation = this.getTargetInformation();
        final StringBuilder append = new StringBuilder("Type2Message[target=").append(target).append(",challenge=");
        String string;
        if (challenge == null) {
            string = "null";
        }
        else {
            string = "<" + challenge.length + " bytes>";
        }
        final StringBuilder append2 = append.append(string).append(",context=");
        String string2;
        if (context == null) {
            string2 = "null";
        }
        else {
            string2 = "<" + context.length + " bytes>";
        }
        final StringBuilder append3 = append2.append(string2).append(",targetInformation=");
        String string3;
        if (targetInformation == null) {
            string3 = "null";
        }
        else {
            string3 = "<" + targetInformation.length + " bytes>";
        }
        return append3.append(string3).append(",flags=0x").append(Hexdump.toHexString(this.getFlags(), 8)).append("]").toString();
    }
}
