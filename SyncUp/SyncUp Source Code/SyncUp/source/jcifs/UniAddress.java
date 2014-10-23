package jcifs;

import jcifs.util.*;
import java.util.*;
import java.net.*;
import jcifs.netbios.*;
import java.io.*;

public class UniAddress
{
    private static final int RESOLVER_BCAST = 1;
    private static final int RESOLVER_DNS = 2;
    private static final int RESOLVER_LMHOSTS = 3;
    private static final int RESOLVER_WINS;
    private static InetAddress baddr;
    private static LogStream log;
    private static int[] resolveOrder;
    Object addr;
    String calledName;
    
    static {
        UniAddress.log = LogStream.getInstance();
        final String property = Config.getProperty("jcifs.resolveOrder");
        final InetAddress winsAddress = NbtAddress.getWINSAddress();
        while (true) {
            try {
                UniAddress.baddr = Config.getInetAddress("jcifs.netbios.baddr", InetAddress.getByName("255.255.255.255"));
                if (property == null || property.length() == 0) {
                    if (winsAddress == null) {
                        (UniAddress.resolveOrder = new int[3])[0] = 3;
                        UniAddress.resolveOrder[1] = 2;
                        UniAddress.resolveOrder[2] = 1;
                    }
                    else {
                        (UniAddress.resolveOrder = new int[4])[0] = 3;
                        UniAddress.resolveOrder[1] = 0;
                        UniAddress.resolveOrder[2] = 2;
                        UniAddress.resolveOrder[3] = 1;
                    }
                }
                else {
                    final int[] array = new int[4];
                    final StringTokenizer stringTokenizer = new StringTokenizer(property, ",");
                    int n = 0;
                    while (stringTokenizer.hasMoreTokens()) {
                        final String trim = stringTokenizer.nextToken().trim();
                        if (trim.equalsIgnoreCase("LMHOSTS")) {
                            final int n2 = n + 1;
                            array[n] = 3;
                            n = n2;
                        }
                        else if (trim.equalsIgnoreCase("WINS")) {
                            if (winsAddress == null) {
                                if (LogStream.level <= 1) {
                                    continue;
                                }
                                UniAddress.log.println("UniAddress resolveOrder specifies WINS however the jcifs.netbios.wins property has not been set");
                            }
                            else {
                                final int n3 = n + 1;
                                array[n] = 0;
                                n = n3;
                            }
                        }
                        else if (trim.equalsIgnoreCase("BCAST")) {
                            final int n4 = n + 1;
                            array[n] = 1;
                            n = n4;
                        }
                        else if (trim.equalsIgnoreCase("DNS")) {
                            final int n5 = n + 1;
                            array[n] = 2;
                            n = n5;
                        }
                        else {
                            if (LogStream.level <= 1) {
                                continue;
                            }
                            UniAddress.log.println("unknown resolver method: " + trim);
                        }
                    }
                    System.arraycopy(array, 0, UniAddress.resolveOrder = new int[n], 0, n);
                }
            }
            catch (UnknownHostException ex) {
                continue;
            }
            break;
        }
    }
    
    public UniAddress(final Object addr) {
        super();
        if (addr == null) {
            throw new IllegalArgumentException();
        }
        this.addr = addr;
    }
    
    public static UniAddress[] getAllByName(final String s, final boolean b) throws UnknownHostException {
        if (s == null || s.length() == 0) {
            throw new UnknownHostException();
        }
        if (!isDotQuadIP(s)) {
            for (int i = 0; i < UniAddress.resolveOrder.length; ++i) {
                try {
                    NbtAddress nbtAddress = null;
                    switch (UniAddress.resolveOrder[i]) {
                        default: {
                            throw new UnknownHostException(s);
                        }
                        case 3: {
                            nbtAddress = Lmhosts.getByName(s);
                            if (nbtAddress != null) {
                                break;
                            }
                            continue;
                        }
                        case 0: {
                            if (s == "\u0001\u0002__MSBROWSE__\u0002" || s.length() > 15) {
                                continue;
                            }
                            if (b) {
                                nbtAddress = lookupServerOrWorkgroup(s, NbtAddress.getWINSAddress());
                                break;
                            }
                            nbtAddress = NbtAddress.getByName(s, 32, null, NbtAddress.getWINSAddress());
                            break;
                        }
                        case 1: {
                            if (s.length() > 15) {
                                continue;
                            }
                            if (b) {
                                nbtAddress = lookupServerOrWorkgroup(s, UniAddress.baddr);
                                break;
                            }
                            nbtAddress = NbtAddress.getByName(s, 32, null, UniAddress.baddr);
                            break;
                        }
                        case 2: {
                            if (isAllDigits(s)) {
                                throw new UnknownHostException(s);
                            }
                            final InetAddress[] allByName = InetAddress.getAllByName(s);
                            final UniAddress[] array = new UniAddress[allByName.length];
                            for (int j = 0; j < allByName.length; ++j) {
                                array[j] = new UniAddress(allByName[j]);
                            }
                            return array;
                        }
                    }
                    return new UniAddress[] { new UniAddress(nbtAddress) };
                }
                catch (IOException ex) {}
            }
            throw new UnknownHostException(s);
        }
        return new UniAddress[] { new UniAddress(NbtAddress.getByName(s)) };
    }
    
    public static UniAddress getByName(final String s) throws UnknownHostException {
        return getByName(s, false);
    }
    
    public static UniAddress getByName(final String s, final boolean b) throws UnknownHostException {
        return getAllByName(s, b)[0];
    }
    
    static boolean isAllDigits(final String s) {
        for (int i = 0; i < s.length(); ++i) {
            if (!Character.isDigit(s.charAt(i))) {
                return false;
            }
        }
        return true;
    }
    
    static boolean isDotQuadIP(final String s) {
        final boolean digit = Character.isDigit(s.charAt(0));
        boolean b = false;
        if (digit) {
            int n = 0;
            final int length = s.length();
            final char[] charArray = s.toCharArray();
            int n2 = 0;
            while (true) {
                b = false;
                if (n2 >= length) {
                    return b;
                }
                final int n3 = n2 + 1;
                final boolean digit2 = Character.isDigit(charArray[n2]);
                b = false;
                if (!digit2) {
                    return b;
                }
                if (n3 == length && n == 3) {
                    break;
                }
                if (n3 < length && charArray[n3] == '.') {
                    ++n;
                    n2 = n3 + 1;
                }
                else {
                    n2 = n3;
                }
            }
            b = true;
        }
        return b;
    }
    
    static NbtAddress lookupServerOrWorkgroup(final String s, final InetAddress inetAddress) throws UnknownHostException {
        final Sem sem = new Sem(2);
        QueryThread queryThread = null;
        Label_0115: {
            if (!NbtAddress.isWINS(inetAddress)) {
                break Label_0115;
            }
            int n = 27;
            while (true) {
                queryThread = new QueryThread(sem, s, n, null, inetAddress);
                final QueryThread queryThread2 = new QueryThread(sem, s, 32, null, inetAddress);
                queryThread.setDaemon(true);
                queryThread2.setDaemon(true);
                Label_0146: {
                    try {
                        synchronized (sem) {
                            queryThread.start();
                            queryThread2.start();
                            while (sem.count > 0 && queryThread.ans == null && queryThread2.ans == null) {
                                sem.wait();
                            }
                            // monitorexit(sem)
                            if (queryThread.ans != null) {
                                return queryThread.ans;
                            }
                            break Label_0146;
                            n = 29;
                        }
                    }
                    catch (InterruptedException ex) {
                        throw new UnknownHostException(s);
                    }
                }
                if (queryThread2.ans != null) {
                    return queryThread2.ans;
                }
                break;
            }
        }
        throw queryThread.uhe;
    }
    
    public boolean equals(final Object o) {
        return o instanceof UniAddress && this.addr.equals(((UniAddress)o).addr);
    }
    
    public String firstCalledName() {
        String s;
        if (this.addr instanceof NbtAddress) {
            s = ((NbtAddress)this.addr).firstCalledName();
        }
        else {
            this.calledName = ((InetAddress)this.addr).getHostName();
            if (isDotQuadIP(this.calledName)) {
                this.calledName = "*SMBSERVER     ";
            }
            else {
                final int index = this.calledName.indexOf(46);
                if (index > 1 && index < 15) {
                    this.calledName = this.calledName.substring(0, index).toUpperCase();
                }
                else if (this.calledName.length() > 15) {
                    this.calledName = "*SMBSERVER     ";
                }
                else {
                    this.calledName = this.calledName.toUpperCase();
                }
            }
            s = this.calledName;
        }
        return s;
    }
    
    public Object getAddress() {
        return this.addr;
    }
    
    public String getHostAddress() {
        String s;
        if (this.addr instanceof NbtAddress) {
            s = ((NbtAddress)this.addr).getHostAddress();
        }
        else {
            s = ((InetAddress)this.addr).getHostAddress();
        }
        return s;
    }
    
    public String getHostName() {
        String s;
        if (this.addr instanceof NbtAddress) {
            s = ((NbtAddress)this.addr).getHostName();
        }
        else {
            s = ((InetAddress)this.addr).getHostName();
        }
        return s;
    }
    
    public int hashCode() {
        return this.addr.hashCode();
    }
    
    public String nextCalledName() {
        String s;
        if (this.addr instanceof NbtAddress) {
            s = ((NbtAddress)this.addr).nextCalledName();
        }
        else if (this.calledName != "*SMBSERVER     ") {
            this.calledName = "*SMBSERVER     ";
            s = this.calledName;
        }
        else {
            s = null;
        }
        return s;
    }
    
    public String toString() {
        return this.addr.toString();
    }
    
    static class QueryThread extends Thread
    {
        NbtAddress ans;
        String host;
        String scope;
        Sem sem;
        InetAddress svr;
        int type;
        UnknownHostException uhe;
        
        QueryThread(final Sem sem, final String host, final int type, final String scope, final InetAddress svr) {
            super("JCIFS-QueryThread: " + host);
            this.ans = null;
            this.sem = sem;
            this.host = host;
            this.type = type;
            this.scope = scope;
            this.svr = svr;
        }
        
        public void run() {
            // 
            // This method could not be decompiled.
            // 
            // Original Bytecode:
            // 
            //     0: aload_0        
            //     1: aload_0        
            //     2: getfield        jcifs/UniAddress$QueryThread.host:Ljava/lang/String;
            //     5: aload_0        
            //     6: getfield        jcifs/UniAddress$QueryThread.type:I
            //     9: aload_0        
            //    10: getfield        jcifs/UniAddress$QueryThread.scope:Ljava/lang/String;
            //    13: aload_0        
            //    14: getfield        jcifs/UniAddress$QueryThread.svr:Ljava/net/InetAddress;
            //    17: invokestatic    jcifs/netbios/NbtAddress.getByName:(Ljava/lang/String;ILjava/lang/String;Ljava/net/InetAddress;)Ljcifs/netbios/NbtAddress;
            //    20: putfield        jcifs/UniAddress$QueryThread.ans:Ljcifs/netbios/NbtAddress;
            //    23: aload_0        
            //    24: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //    27: astore          13
            //    29: aload           13
            //    31: monitorenter   
            //    32: aload_0        
            //    33: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //    36: astore          15
            //    38: aload           15
            //    40: iconst_m1      
            //    41: aload           15
            //    43: getfield        jcifs/UniAddress$Sem.count:I
            //    46: iadd           
            //    47: putfield        jcifs/UniAddress$Sem.count:I
            //    50: aload_0        
            //    51: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //    54: invokevirtual   java/lang/Object.notify:()V
            //    57: aload           13
            //    59: monitorexit    
            //    60: return         
            //    61: astore          9
            //    63: aload_0        
            //    64: aload           9
            //    66: putfield        jcifs/UniAddress$QueryThread.uhe:Ljava/net/UnknownHostException;
            //    69: aload_0        
            //    70: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //    73: astore          10
            //    75: aload           10
            //    77: monitorenter   
            //    78: aload_0        
            //    79: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //    82: astore          12
            //    84: aload           12
            //    86: iconst_m1      
            //    87: aload           12
            //    89: getfield        jcifs/UniAddress$Sem.count:I
            //    92: iadd           
            //    93: putfield        jcifs/UniAddress$Sem.count:I
            //    96: aload_0        
            //    97: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //   100: invokevirtual   java/lang/Object.notify:()V
            //   103: aload           10
            //   105: monitorexit    
            //   106: goto            60
            //   109: astore          11
            //   111: aload           10
            //   113: monitorexit    
            //   114: aload           11
            //   116: athrow         
            //   117: astore          5
            //   119: aload_0        
            //   120: new             Ljava/net/UnknownHostException;
            //   123: dup            
            //   124: aload           5
            //   126: invokevirtual   java/lang/Exception.getMessage:()Ljava/lang/String;
            //   129: invokespecial   java/net/UnknownHostException.<init>:(Ljava/lang/String;)V
            //   132: putfield        jcifs/UniAddress$QueryThread.uhe:Ljava/net/UnknownHostException;
            //   135: aload_0        
            //   136: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //   139: astore          6
            //   141: aload           6
            //   143: monitorenter   
            //   144: aload_0        
            //   145: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //   148: astore          8
            //   150: aload           8
            //   152: iconst_m1      
            //   153: aload           8
            //   155: getfield        jcifs/UniAddress$Sem.count:I
            //   158: iadd           
            //   159: putfield        jcifs/UniAddress$Sem.count:I
            //   162: aload_0        
            //   163: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //   166: invokevirtual   java/lang/Object.notify:()V
            //   169: aload           6
            //   171: monitorexit    
            //   172: goto            60
            //   175: astore          7
            //   177: aload           6
            //   179: monitorexit    
            //   180: aload           7
            //   182: athrow         
            //   183: astore_1       
            //   184: aload_0        
            //   185: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //   188: astore_2       
            //   189: aload_2        
            //   190: monitorenter   
            //   191: aload_0        
            //   192: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //   195: astore          4
            //   197: aload           4
            //   199: iconst_m1      
            //   200: aload           4
            //   202: getfield        jcifs/UniAddress$Sem.count:I
            //   205: iadd           
            //   206: putfield        jcifs/UniAddress$Sem.count:I
            //   209: aload_0        
            //   210: getfield        jcifs/UniAddress$QueryThread.sem:Ljcifs/UniAddress$Sem;
            //   213: invokevirtual   java/lang/Object.notify:()V
            //   216: aload_2        
            //   217: monitorexit    
            //   218: aload_1        
            //   219: athrow         
            //   220: astore_3       
            //   221: aload_2        
            //   222: monitorexit    
            //   223: aload_3        
            //   224: athrow         
            //   225: astore          14
            //   227: aload           13
            //   229: monitorexit    
            //   230: aload           14
            //   232: athrow         
            //    Exceptions:
            //  Try           Handler
            //  Start  End    Start  End    Type                           
            //  -----  -----  -----  -----  -------------------------------
            //  0      23     61     117    Ljava/net/UnknownHostException;
            //  0      23     117    183    Ljava/lang/Exception;
            //  0      23     183    225    Any
            //  32     60     225    233    Any
            //  63     69     183    225    Any
            //  78     114    109    117    Any
            //  119    135    183    225    Any
            //  144    180    175    183    Any
            //  191    218    220    225    Any
            //  221    223    220    225    Any
            //  227    230    225    233    Any
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
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:567)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:493)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:460)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:507)
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
    
    static class Sem
    {
        int count;
        
        Sem(final int count) {
            super();
            this.count = count;
        }
    }
}
