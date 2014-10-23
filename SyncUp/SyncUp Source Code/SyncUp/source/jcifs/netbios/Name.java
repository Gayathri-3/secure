package jcifs.netbios;

import jcifs.*;
import java.io.*;
import jcifs.util.*;

public class Name
{
    private static final String DEFAULT_SCOPE;
    static final String OEM_ENCODING;
    private static final int SCOPE_OFFSET = 33;
    private static final int TYPE_OFFSET = 31;
    public int hexCode;
    public String name;
    public String scope;
    int srcHashCode;
    
    static {
        DEFAULT_SCOPE = Config.getProperty("jcifs.netbios.scope");
        OEM_ENCODING = Config.getProperty("jcifs.encoding", System.getProperty("file.encoding"));
    }
    
    Name() {
        super();
    }
    
    public Name(String substring, final int hexCode, String default_SCOPE) {
        super();
        if (substring.length() > 15) {
            substring = substring.substring(0, 15);
        }
        this.name = substring.toUpperCase();
        this.hexCode = hexCode;
        if (default_SCOPE == null || default_SCOPE.length() <= 0) {
            default_SCOPE = Name.DEFAULT_SCOPE;
        }
        this.scope = default_SCOPE;
        this.srcHashCode = 0;
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof Name;
        boolean b2 = false;
        if (b) {
            final Name name = (Name)o;
            if (this.scope == null && name.scope == null) {
                final boolean equals = this.name.equals(name.name);
                b2 = false;
                if (equals) {
                    final int hexCode = this.hexCode;
                    final int hexCode2 = name.hexCode;
                    b2 = false;
                    if (hexCode == hexCode2) {
                        b2 = true;
                    }
                }
            }
            else {
                final boolean equals2 = this.name.equals(name.name);
                b2 = false;
                if (equals2) {
                    final int hexCode3 = this.hexCode;
                    final int hexCode4 = name.hexCode;
                    b2 = false;
                    if (hexCode3 == hexCode4) {
                        final boolean equals3 = this.scope.equals(name.scope);
                        b2 = false;
                        if (equals3) {
                            b2 = true;
                        }
                    }
                }
            }
        }
        return b2;
    }
    
    public int hashCode() {
        int n = this.name.hashCode() + 65599 * this.hexCode + 65599 * this.srcHashCode;
        if (this.scope != null && this.scope.length() != 0) {
            n += this.scope.hashCode();
        }
        return n;
    }
    
    int readScopeWireFormat(final byte[] p0, final int p1) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: iconst_1       
        //     2: iadd           
        //     3: istore_3       
        //     4: sipush          255
        //     7: aload_1        
        //     8: iload_2        
        //     9: baload         
        //    10: iand           
        //    11: istore          4
        //    13: iload           4
        //    15: ifne            29
        //    18: aload_0        
        //    19: aconst_null    
        //    20: putfield        jcifs/netbios/Name.scope:Ljava/lang/String;
        //    23: iconst_1       
        //    24: istore          9
        //    26: iload           9
        //    28: ireturn        
        //    29: new             Ljava/lang/StringBuffer;
        //    32: dup            
        //    33: new             Ljava/lang/String;
        //    36: dup            
        //    37: aload_1        
        //    38: iload_3        
        //    39: iload           4
        //    41: getstatic       jcifs/netbios/Name.OEM_ENCODING:Ljava/lang/String;
        //    44: invokespecial   java/lang/String.<init>:([BIILjava/lang/String;)V
        //    47: invokespecial   java/lang/StringBuffer.<init>:(Ljava/lang/String;)V
        //    50: astore          5
        //    52: iload_3        
        //    53: iload           4
        //    55: iadd           
        //    56: istore          6
        //    58: iload           6
        //    60: iconst_1       
        //    61: iadd           
        //    62: istore          7
        //    64: sipush          255
        //    67: aload_1        
        //    68: iload           6
        //    70: baload         
        //    71: iand           
        //    72: istore          10
        //    74: iload           10
        //    76: ifne            91
        //    79: aload_0        
        //    80: aload           5
        //    82: invokevirtual   java/lang/StringBuffer.toString:()Ljava/lang/String;
        //    85: putfield        jcifs/netbios/Name.scope:Ljava/lang/String;
        //    88: goto            137
        //    91: aload           5
        //    93: bipush          46
        //    95: invokevirtual   java/lang/StringBuffer.append:(C)Ljava/lang/StringBuffer;
        //    98: new             Ljava/lang/String;
        //   101: dup            
        //   102: aload_1        
        //   103: iload           7
        //   105: iload           10
        //   107: getstatic       jcifs/netbios/Name.OEM_ENCODING:Ljava/lang/String;
        //   110: invokespecial   java/lang/String.<init>:([BIILjava/lang/String;)V
        //   113: invokevirtual   java/lang/StringBuffer.append:(Ljava/lang/String;)Ljava/lang/StringBuffer;
        //   116: pop            
        //   117: iload           7
        //   119: iload           10
        //   121: iadd           
        //   122: istore          6
        //   124: goto            58
        //   127: astore          12
        //   129: iload_3        
        //   130: istore          7
        //   132: goto            137
        //   135: astore          8
        //   137: iload           7
        //   139: iload_2        
        //   140: isub           
        //   141: istore          9
        //   143: goto            26
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                  
        //  -----  -----  -----  -----  --------------------------------------
        //  29     52     127    135    Ljava/io/UnsupportedEncodingException;
        //  64     117    135    137    Ljava/io/UnsupportedEncodingException;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0091:
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
    
    int readWireFormat(final byte[] array, final int n) {
        final byte[] array2 = new byte[33];
        int n2 = 15;
        int n3 = 0;
    Label_0037_Outer:
        while (true) {
            Label_0096: {
                if (n3 < 15) {
                    break Label_0096;
                }
                while (true) {
                    try {
                        this.name = new String(array2, 0, n2, Name.OEM_ENCODING);
                        this.hexCode = -65 + (0xFF & array[n + 31]) << 4;
                        this.hexCode |= (0xF & -65 + (0xFF & array[1 + (n + 31)]));
                        return 33 + this.readScopeWireFormat(array, n + 33);
                        while (true) {
                            n2 = n3 + 1;
                            Label_0166: {
                                ++n3;
                            }
                            continue Label_0037_Outer;
                            array2[n3] = (byte)(-65 + (0xFF & array[n + (1 + n3 * 2)]) << 4);
                            array2[n3] |= (byte)(0xF & -65 + (0xFF & array[n + (2 + n3 * 2)]));
                            continue;
                        }
                    }
                    // iftrue(Label_0166:, array2[n3] == 32)
                    catch (UnsupportedEncodingException ex) {
                        continue;
                    }
                    break;
                }
            }
        }
    }
    
    public String toString() {
        final StringBuffer sb = new StringBuffer();
        String name = this.name;
        if (name == null) {
            name = "null";
        }
        else if (name.charAt(0) == '\u0001') {
            final char[] charArray = name.toCharArray();
            charArray[0] = '.';
            charArray[14] = (charArray[1] = '.');
            name = new String(charArray);
        }
        sb.append(name).append("<").append(Hexdump.toHexString(this.hexCode, 2)).append(">");
        if (this.scope != null) {
            sb.append(".").append(this.scope);
        }
        return sb.toString();
    }
    
    int writeScopeWireFormat(final byte[] array, final int n) {
        int n2 = 0;
        if (this.scope == null) {
            array[n] = 0;
            n2 = 1;
        }
        else {
        Label_0092_Outer:
            while (true) {
                final int n3 = n + 1;
                array[n] = 46;
                while (true) {
                    int n9;
                    while (true) {
                        try {
                            System.arraycopy(this.scope.getBytes(Name.OEM_ENCODING), 0, array, n3, this.scope.length());
                            final int n4 = n3 + this.scope.length();
                            final int n5 = n4 + 1;
                            array[n4] = 0;
                            final int n6 = n5 - 2;
                            final int n7 = n6 - this.scope.length();
                            int n8 = 0;
                            if (array[n6] == 46) {
                                array[n6] = (byte)n8;
                                n8 = 0;
                            }
                            else {
                                ++n8;
                            }
                            n9 = n6 - 1;
                            if (n6 <= n7) {
                                n2 = 2 + this.scope.length();
                                break;
                            }
                        }
                        catch (UnsupportedEncodingException ex) {
                            continue Label_0092_Outer;
                        }
                        break;
                    }
                    final int n6 = n9;
                    continue;
                }
            }
        }
        return n2;
    }
    
    int writeWireFormat(final byte[] array, final int n) {
        array[n] = 32;
        try {
            byte[] bytes;
            int i;
            for (bytes = this.name.getBytes(Name.OEM_ENCODING), i = 0; i < bytes.length; ++i) {
                array[n + (1 + i * 2)] = (byte)(65 + ((0xF0 & bytes[i]) >> 4));
                array[n + (2 + i * 2)] = 65 + (0xF & bytes[i]);
            }
            while (i < 15) {
                array[n + (1 + i * 2)] = 67;
                array[n + (2 + i * 2)] = 65;
                ++i;
            }
            array[n + 31] = (byte)(65 + ((0xF0 & this.hexCode) >> 4));
            array[1 + (n + 31)] = (byte)(65 + (0xF & this.hexCode));
            return 33 + this.writeScopeWireFormat(array, n + 33);
        }
        catch (UnsupportedEncodingException ex) {
            return 33 + this.writeScopeWireFormat(array, n + 33);
        }
    }
}
