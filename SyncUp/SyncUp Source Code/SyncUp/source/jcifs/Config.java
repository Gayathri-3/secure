package jcifs;

import jcifs.util.*;
import java.net.*;
import java.io.*;
import java.util.*;

public class Config
{
    public static String DEFAULT_OEM_ENCODING;
    private static LogStream log;
    private static Properties prp;
    public static int socketCount;
    
    static {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: iconst_0       
        //     1: putstatic       jcifs/Config.socketCount:I
        //     4: new             Ljava/util/Properties;
        //     7: dup            
        //     8: invokespecial   java/util/Properties.<init>:()V
        //    11: putstatic       jcifs/Config.prp:Ljava/util/Properties;
        //    14: ldc             "Cp850"
        //    16: putstatic       jcifs/Config.DEFAULT_OEM_ENCODING:Ljava/lang/String;
        //    19: invokestatic    jcifs/util/LogStream.getInstance:()Ljcifs/util/LogStream;
        //    22: putstatic       jcifs/Config.log:Ljcifs/util/LogStream;
        //    25: ldc             "jcifs.properties"
        //    27: invokestatic    java/lang/System.getProperty:(Ljava/lang/String;)Ljava/lang/String;
        //    30: astore          5
        //    32: aconst_null    
        //    33: astore          6
        //    35: aload           5
        //    37: ifnull          67
        //    40: aload           5
        //    42: invokevirtual   java/lang/String.length:()I
        //    45: istore          7
        //    47: aconst_null    
        //    48: astore          6
        //    50: iload           7
        //    52: iconst_1       
        //    53: if_icmple       67
        //    56: new             Ljava/io/FileInputStream;
        //    59: dup            
        //    60: aload           5
        //    62: invokespecial   java/io/FileInputStream.<init>:(Ljava/lang/String;)V
        //    65: astore          6
        //    67: aload           6
        //    69: invokestatic    jcifs/Config.load:(Ljava/io/InputStream;)V
        //    72: aload           6
        //    74: ifnull          82
        //    77: aload           6
        //    79: invokevirtual   java/io/FileInputStream.close:()V
        //    82: ldc             "jcifs.util.loglevel"
        //    84: iconst_m1      
        //    85: invokestatic    jcifs/Config.getInt:(Ljava/lang/String;I)I
        //    88: istore_1       
        //    89: iload_1        
        //    90: iconst_m1      
        //    91: if_icmpeq       98
        //    94: iload_1        
        //    95: invokestatic    jcifs/util/LogStream.setLevel:(I)V
        //    98: ldc             ""
        //   100: getstatic       jcifs/Config.DEFAULT_OEM_ENCODING:Ljava/lang/String;
        //   103: invokevirtual   java/lang/String.getBytes:(Ljava/lang/String;)[B
        //   106: pop            
        //   107: getstatic       jcifs/util/LogStream.level:I
        //   110: iconst_4       
        //   111: if_icmplt       125
        //   114: getstatic       jcifs/Config.prp:Ljava/util/Properties;
        //   117: getstatic       jcifs/Config.log:Ljcifs/util/LogStream;
        //   120: ldc             "JCIFS PROPERTIES"
        //   122: invokevirtual   java/util/Properties.store:(Ljava/io/OutputStream;Ljava/lang/String;)V
        //   125: return         
        //   126: astore_0       
        //   127: getstatic       jcifs/util/LogStream.level:I
        //   130: ifle            82
        //   133: aload_0        
        //   134: getstatic       jcifs/Config.log:Ljcifs/util/LogStream;
        //   137: invokevirtual   java/io/IOException.printStackTrace:(Ljava/io/PrintStream;)V
        //   140: goto            82
        //   143: astore_2       
        //   144: getstatic       jcifs/util/LogStream.level:I
        //   147: iconst_2       
        //   148: if_icmplt       180
        //   151: getstatic       jcifs/Config.log:Ljcifs/util/LogStream;
        //   154: new             Ljava/lang/StringBuilder;
        //   157: dup            
        //   158: ldc             "WARNING: The default OEM encoding "
        //   160: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   163: getstatic       jcifs/Config.DEFAULT_OEM_ENCODING:Ljava/lang/String;
        //   166: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   169: ldc             " does not appear to be supported by this JRE. The default encoding will be US-ASCII."
        //   171: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   174: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   177: invokevirtual   jcifs/util/LogStream.println:(Ljava/lang/String;)V
        //   180: ldc             "US-ASCII"
        //   182: putstatic       jcifs/Config.DEFAULT_OEM_ENCODING:Ljava/lang/String;
        //   185: goto            107
        //   188: astore_3       
        //   189: goto            125
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                  
        //  -----  -----  -----  -----  --------------------------------------
        //  25     82     126    143    Ljava/io/IOException;
        //  98     107    143    188    Ljava/io/UnsupportedEncodingException;
        //  114    125    188    192    Ljava/io/IOException;
        // 
        // The error that occurred was:
        // 
        // java.lang.IndexOutOfBoundsException: Index: 84, Size: 84
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
    
    public static Object get(final String s) {
        return ((Hashtable<K, Object>)Config.prp).get(s);
    }
    
    public static boolean getBoolean(final String s, boolean equals) {
        final String property = getProperty(s);
        if (property != null) {
            equals = property.toLowerCase().equals("true");
        }
        return equals;
    }
    
    public static InetAddress getInetAddress(final String s, InetAddress byName) {
        final String property = Config.prp.getProperty(s);
        if (property == null) {
            return byName;
        }
        try {
            byName = InetAddress.getByName(property);
            return byName;
        }
        catch (UnknownHostException ex) {
            if (LogStream.level > 0) {
                Config.log.println(property);
                ex.printStackTrace(Config.log);
                return byName;
            }
            return byName;
        }
    }
    
    public static InetAddress[] getInetAddressArray(final String s, final String s2, InetAddress[] array) {
        final String property = getProperty(s);
        if (property != null) {
            final StringTokenizer stringTokenizer = new StringTokenizer(property, s2);
            final int countTokens = stringTokenizer.countTokens();
            final InetAddress[] array2 = new InetAddress[countTokens];
            int i = 0;
            while (i < countTokens) {
                final String nextToken = stringTokenizer.nextToken();
                try {
                    array2[i] = InetAddress.getByName(nextToken);
                    ++i;
                }
                catch (UnknownHostException ex) {
                    if (LogStream.level > 0) {
                        Config.log.println(nextToken);
                        ex.printStackTrace(Config.log);
                        return array;
                    }
                    return array;
                }
            }
            array = array2;
        }
        return array;
    }
    
    public static int getInt(final String s) {
        final String property = Config.prp.getProperty(s);
        int int1 = -1;
        if (property == null) {
            return int1;
        }
        try {
            int1 = Integer.parseInt(property);
            return int1;
        }
        catch (NumberFormatException ex) {
            if (LogStream.level > 0) {
                ex.printStackTrace(Config.log);
                return int1;
            }
            return int1;
        }
    }
    
    public static int getInt(final String s, int int1) {
        final String property = Config.prp.getProperty(s);
        if (property == null) {
            return int1;
        }
        try {
            int1 = Integer.parseInt(property);
            return int1;
        }
        catch (NumberFormatException ex) {
            if (LogStream.level > 0) {
                ex.printStackTrace(Config.log);
                return int1;
            }
            return int1;
        }
    }
    
    public static InetAddress getLocalHost() {
        final String property = Config.prp.getProperty("jcifs.smb.client.laddr");
        if (property == null) {
            return null;
        }
        try {
            return InetAddress.getByName(property);
        }
        catch (UnknownHostException ex) {
            if (LogStream.level > 0) {
                Config.log.println("Ignoring jcifs.smb.client.laddr address: " + property);
                ex.printStackTrace(Config.log);
            }
        }
        return null;
    }
    
    public static long getLong(final String s, long long1) {
        final String property = Config.prp.getProperty(s);
        if (property == null) {
            return long1;
        }
        try {
            long1 = Long.parseLong(property);
            return long1;
        }
        catch (NumberFormatException ex) {
            if (LogStream.level > 0) {
                ex.printStackTrace(Config.log);
                return long1;
            }
            return long1;
        }
    }
    
    public static String getProperty(final String s) {
        return Config.prp.getProperty(s);
    }
    
    public static String getProperty(final String s, final String s2) {
        return Config.prp.getProperty(s, s2);
    }
    
    public static void list(final PrintStream printStream) throws IOException {
        Config.prp.list(printStream);
    }
    
    public static void load(final InputStream inputStream) throws IOException {
        if (inputStream != null) {
            Config.prp.load(inputStream);
        }
        try {
            final Properties properties = System.getProperties();
            synchronized (properties) {
                Config.prp.putAll(properties);
            }
        }
        catch (SecurityException ex) {
            if (LogStream.level > 1) {
                Config.log.println("SecurityException: jcifs will ignore System properties");
            }
        }
    }
    
    public static void registerSmbURLHandler() {
        final String property = System.getProperty("java.version");
        if (property.startsWith("1.1.") || property.startsWith("1.2.")) {
            throw new RuntimeException("jcifs-0.7.0b4+ requires Java 1.3 or above. You are running " + property);
        }
        final String property2 = System.getProperty("java.protocol.handler.pkgs");
        if (property2 == null) {
            System.setProperty("java.protocol.handler.pkgs", "jcifs");
        }
        else if (property2.indexOf("jcifs") == -1) {
            System.setProperty("java.protocol.handler.pkgs", String.valueOf(property2) + "|jcifs");
        }
    }
    
    public static void setProperties(final Properties properties) {
        Config.prp = new Properties(properties);
        try {
            Config.prp.putAll(System.getProperties());
        }
        catch (SecurityException ex) {
            if (LogStream.level > 1) {
                Config.log.println("SecurityException: jcifs will ignore System properties");
            }
        }
    }
    
    public static Object setProperty(final String s, final String s2) {
        return Config.prp.setProperty(s, s2);
    }
    
    public static void store(final OutputStream outputStream, final String s) throws IOException {
        Config.prp.store(outputStream, s);
    }
}
