package jcifs.netbios;

import java.util.*;
import jcifs.*;
import jcifs.util.*;
import java.net.*;

public final class NbtAddress
{
    private static final HashMap ADDRESS_CACHE;
    static final String ANY_HOSTS_NAME = "*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0";
    public static final int B_NODE = 0;
    private static final int CACHE_POLICY = 0;
    private static final NameServiceClient CLIENT;
    private static final int DEFAULT_CACHE_POLICY = 30;
    private static final int FOREVER = -1;
    public static final int H_NODE = 3;
    private static final HashMap LOOKUP_TABLE;
    public static final String MASTER_BROWSER_NAME = "\u0001\u0002__MSBROWSE__\u0002";
    public static final int M_NODE = 2;
    static final InetAddress[] NBNS;
    public static final int P_NODE = 1;
    public static final String SMBSERVER_NAME = "*SMBSERVER     ";
    static final NbtAddress UNKNOWN_ADDRESS;
    static final byte[] UNKNOWN_MAC_ADDRESS;
    static final Name UNKNOWN_NAME;
    static NbtAddress localhost;
    private static int nbnsIndex;
    int address;
    String calledName;
    boolean groupName;
    Name hostName;
    boolean isActive;
    boolean isBeingDeleted;
    boolean isDataFromNodeStatus;
    boolean isInConflict;
    boolean isPermanent;
    byte[] macAddress;
    int nodeType;
    
    static {
        NBNS = Config.getInetAddressArray("jcifs.netbios.wins", ",", new InetAddress[0]);
        CLIENT = new NameServiceClient();
        CACHE_POLICY = Config.getInt("jcifs.netbios.cachePolicy", 30);
        NbtAddress.nbnsIndex = 0;
        ADDRESS_CACHE = new HashMap();
        LOOKUP_TABLE = new HashMap();
        UNKNOWN_NAME = new Name("0.0.0.0", 0, null);
        UNKNOWN_ADDRESS = new NbtAddress(NbtAddress.UNKNOWN_NAME, 0, false, 0);
        UNKNOWN_MAC_ADDRESS = new byte[6];
        NbtAddress.ADDRESS_CACHE.put(NbtAddress.UNKNOWN_NAME, new CacheEntry(NbtAddress.UNKNOWN_NAME, NbtAddress.UNKNOWN_ADDRESS, -1L));
        InetAddress inetAddress = NbtAddress.CLIENT.laddr;
        Label_0140: {
            if (inetAddress != null) {
                break Label_0140;
            }
            try {
                inetAddress = InetAddress.getLocalHost();
                String s = Config.getProperty("jcifs.netbios.hostname", null);
                if (s == null || s.length() == 0) {
                    final byte[] address = inetAddress.getAddress();
                    s = "JCIFS" + (0xFF & address[2]) + "_" + (0xFF & address[3]) + "_" + Hexdump.toHexString((int)(255.0 * Math.random()), 2);
                }
                final Name name = new Name(s, 0, Config.getProperty("jcifs.netbios.scope", null));
                cacheAddress(name, NbtAddress.localhost = new NbtAddress(name, inetAddress.hashCode(), false, 0, false, false, true, false, NbtAddress.UNKNOWN_MAC_ADDRESS), -1L);
            }
            catch (UnknownHostException ex) {
                try {
                    inetAddress = InetAddress.getByName("127.0.0.1");
                }
                catch (UnknownHostException ex2) {}
            }
        }
    }
    
    NbtAddress(final Name hostName, final int address, final boolean groupName, final int nodeType) {
        super();
        this.hostName = hostName;
        this.address = address;
        this.groupName = groupName;
        this.nodeType = nodeType;
    }
    
    NbtAddress(final Name hostName, final int address, final boolean groupName, final int nodeType, final boolean isBeingDeleted, final boolean isInConflict, final boolean isActive, final boolean isPermanent, final byte[] macAddress) {
        super();
        this.hostName = hostName;
        this.address = address;
        this.groupName = groupName;
        this.nodeType = nodeType;
        this.isBeingDeleted = isBeingDeleted;
        this.isInConflict = isInConflict;
        this.isActive = isActive;
        this.isPermanent = isPermanent;
        this.macAddress = macAddress;
        this.isDataFromNodeStatus = true;
    }
    
    static void cacheAddress(final Name name, final NbtAddress nbtAddress) {
        if (NbtAddress.CACHE_POLICY != 0) {
            long n = -1L;
            if (NbtAddress.CACHE_POLICY != -1) {
                n = System.currentTimeMillis() + 1000 * NbtAddress.CACHE_POLICY;
            }
            cacheAddress(name, nbtAddress, n);
        }
    }
    
    static void cacheAddress(final Name name, final NbtAddress address, final long expiration) {
        if (NbtAddress.CACHE_POLICY != 0) {
            while (true) {
                while (true) {
                    final CacheEntry cacheEntry;
                    synchronized (NbtAddress.ADDRESS_CACHE) {
                        cacheEntry = NbtAddress.ADDRESS_CACHE.get(name);
                        if (cacheEntry == null) {
                            NbtAddress.ADDRESS_CACHE.put(name, new CacheEntry(name, address, expiration));
                            break;
                        }
                    }
                    cacheEntry.address = address;
                    cacheEntry.expiration = expiration;
                    continue;
                }
            }
        }
    }
    
    static void cacheAddressArray(final NbtAddress[] array) {
        if (NbtAddress.CACHE_POLICY != 0) {
            long expiration = -1L;
            if (NbtAddress.CACHE_POLICY != -1) {
                expiration = System.currentTimeMillis() + 1000 * NbtAddress.CACHE_POLICY;
            }
            final HashMap address_CACHE = NbtAddress.ADDRESS_CACHE;
            // monitorenter(address_CACHE)
            int n = 0;
            while (true) {
                try {
                    if (n >= array.length) {
                        break;
                    }
                }
                finally {}
                // monitorexit(address_CACHE)
                final CacheEntry cacheEntry = NbtAddress.ADDRESS_CACHE.get(array[n].hostName);
                if (cacheEntry == null) {
                    NbtAddress.ADDRESS_CACHE.put(array[n].hostName, new CacheEntry(array[n].hostName, array[n], expiration));
                }
                else {
                    cacheEntry.address = array[n];
                    cacheEntry.expiration = expiration;
                }
                ++n;
            }
        }
    }
    
    private static Object checkLookupTable(final Name p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: getstatic       jcifs/netbios/NbtAddress.LOOKUP_TABLE:Ljava/util/HashMap;
        //     3: astore_1       
        //     4: aload_1        
        //     5: monitorenter   
        //     6: getstatic       jcifs/netbios/NbtAddress.LOOKUP_TABLE:Ljava/util/HashMap;
        //     9: aload_0        
        //    10: invokevirtual   java/util/HashMap.containsKey:(Ljava/lang/Object;)Z
        //    13: ifne            37
        //    16: getstatic       jcifs/netbios/NbtAddress.LOOKUP_TABLE:Ljava/util/HashMap;
        //    19: aload_0        
        //    20: aload_0        
        //    21: invokevirtual   java/util/HashMap.put:(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //    24: pop            
        //    25: aload_1        
        //    26: monitorexit    
        //    27: aconst_null    
        //    28: astore_3       
        //    29: aload_3        
        //    30: areturn        
        //    31: getstatic       jcifs/netbios/NbtAddress.LOOKUP_TABLE:Ljava/util/HashMap;
        //    34: invokevirtual   java/lang/Object.wait:()V
        //    37: getstatic       jcifs/netbios/NbtAddress.LOOKUP_TABLE:Ljava/util/HashMap;
        //    40: aload_0        
        //    41: invokevirtual   java/util/HashMap.containsKey:(Ljava/lang/Object;)Z
        //    44: ifne            31
        //    47: aload_1        
        //    48: monitorexit    
        //    49: aload_0        
        //    50: invokestatic    jcifs/netbios/NbtAddress.getCachedAddress:(Ljcifs/netbios/Name;)Ljcifs/netbios/NbtAddress;
        //    53: astore_3       
        //    54: aload_3        
        //    55: ifnonnull       29
        //    58: getstatic       jcifs/netbios/NbtAddress.LOOKUP_TABLE:Ljava/util/HashMap;
        //    61: astore          4
        //    63: aload           4
        //    65: monitorenter   
        //    66: getstatic       jcifs/netbios/NbtAddress.LOOKUP_TABLE:Ljava/util/HashMap;
        //    69: aload_0        
        //    70: aload_0        
        //    71: invokevirtual   java/util/HashMap.put:(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //    74: pop            
        //    75: aload           4
        //    77: monitorexit    
        //    78: goto            29
        //    81: astore          5
        //    83: aload           4
        //    85: monitorexit    
        //    86: aload           5
        //    88: athrow         
        //    89: astore_2       
        //    90: aload_1        
        //    91: monitorexit    
        //    92: aload_2        
        //    93: athrow         
        //    94: astore          7
        //    96: goto            37
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                            
        //  -----  -----  -----  -----  --------------------------------
        //  6      27     89     94     Any
        //  31     37     94     99     Ljava/lang/InterruptedException;
        //  31     37     89     94     Any
        //  37     49     89     94     Any
        //  66     86     81     89     Any
        //  90     92     89     94     Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0031:
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
    
    static NbtAddress doNameQuery(final Name name, InetAddress baddr) throws UnknownHostException {
        if (name.hexCode == 29 && baddr == null) {
            baddr = NbtAddress.CLIENT.baddr;
        }
        NbtAddress nbtAddress = null;
        Label_0096: {
            if (baddr == null) {
                break Label_0096;
            }
            int hashCode = baddr.hashCode();
        Label_0077_Outer:
            while (true) {
                name.srcHashCode = hashCode;
                nbtAddress = getCachedAddress(name);
                while (true) {
                    if (nbtAddress != null) {
                        break Label_0077;
                    }
                    nbtAddress = (NbtAddress)checkLookupTable(name);
                    if (nbtAddress != null) {
                        break Label_0077;
                    }
                    try {
                        nbtAddress = NbtAddress.CLIENT.getByName(name, baddr);
                        cacheAddress(name, nbtAddress);
                        updateLookupTable(name);
                        if (nbtAddress == NbtAddress.UNKNOWN_ADDRESS) {
                            throw new UnknownHostException(name.toString());
                        }
                        return nbtAddress;
                        hashCode = 0;
                        continue Label_0077_Outer;
                    }
                    catch (UnknownHostException ex) {
                        nbtAddress = NbtAddress.UNKNOWN_ADDRESS;
                        cacheAddress(name, nbtAddress);
                        updateLookupTable(name);
                        continue;
                    }
                    finally {
                        cacheAddress(name, nbtAddress);
                        updateLookupTable(name);
                    }
                    break;
                }
                break;
            }
        }
        return nbtAddress;
    }
    
    public static NbtAddress[] getAllByAddress(final String s) throws UnknownHostException {
        return getAllByAddress(getByName(s, 0, null));
    }
    
    public static NbtAddress[] getAllByAddress(final String s, final int n, final String s2) throws UnknownHostException {
        return getAllByAddress(getByName(s, n, s2));
    }
    
    public static NbtAddress[] getAllByAddress(final NbtAddress nbtAddress) throws UnknownHostException {
        try {
            final NbtAddress[] nodeStatus = NbtAddress.CLIENT.getNodeStatus(nbtAddress);
            cacheAddressArray(nodeStatus);
            return nodeStatus;
        }
        catch (UnknownHostException ex) {
            final StringBuilder append = new StringBuilder("no name with type 0x").append(Hexdump.toHexString(nbtAddress.hostName.hexCode, 2));
            String string;
            if (nbtAddress.hostName.scope == null || nbtAddress.hostName.scope.length() == 0) {
                string = " with no scope";
            }
            else {
                string = " with scope " + nbtAddress.hostName.scope;
            }
            throw new UnknownHostException(append.append(string).append(" for host ").append(nbtAddress.getHostAddress()).toString());
        }
    }
    
    public static NbtAddress[] getAllByName(final String s, final int n, final String s2, final InetAddress inetAddress) throws UnknownHostException {
        return NbtAddress.CLIENT.getAllByName(new Name(s, n, s2), inetAddress);
    }
    
    public static NbtAddress getByName(final String s) throws UnknownHostException {
        return getByName(s, 0, null);
    }
    
    public static NbtAddress getByName(final String s, final int n, final String s2) throws UnknownHostException {
        return getByName(s, n, s2, null);
    }
    
    public static NbtAddress getByName(final String s, final int n, final String s2, final InetAddress inetAddress) throws UnknownHostException {
        NbtAddress nbtAddress;
        if (s == null || s.length() == 0) {
            nbtAddress = getLocalHost();
        }
        else if (!Character.isDigit(s.charAt(0))) {
            nbtAddress = doNameQuery(new Name(s, n, s2), inetAddress);
        }
        else {
            int n2 = 0;
            int n3 = 0;
            final char[] charArray = s.toCharArray();
            for (int i = 0; i < charArray.length; ++i) {
                char c = charArray[i];
                if (c < '0' || c > '9') {
                    nbtAddress = doNameQuery(new Name(s, n, s2), inetAddress);
                    return nbtAddress;
                }
                int n4 = 0;
                while (c != '.') {
                    if (c < '0' || c > '9') {
                        nbtAddress = doNameQuery(new Name(s, n, s2), inetAddress);
                        return nbtAddress;
                    }
                    n4 = -48 + (c + n4 * 10);
                    if (++i >= charArray.length) {
                        break;
                    }
                    c = charArray[i];
                }
                if (n4 > 255) {
                    nbtAddress = doNameQuery(new Name(s, n, s2), inetAddress);
                    return nbtAddress;
                }
                n2 = n4 + (n2 << 8);
                ++n3;
            }
            if (n3 != 4 || s.endsWith(".")) {
                nbtAddress = doNameQuery(new Name(s, n, s2), inetAddress);
            }
            else {
                nbtAddress = new NbtAddress(NbtAddress.UNKNOWN_NAME, n2, false, 0);
            }
        }
        return nbtAddress;
    }
    
    static NbtAddress getCachedAddress(final Name name) {
        final int cache_POLICY = NbtAddress.CACHE_POLICY;
        NbtAddress address = null;
        if (cache_POLICY != 0) {
            synchronized (NbtAddress.ADDRESS_CACHE) {
                CacheEntry cacheEntry = NbtAddress.ADDRESS_CACHE.get(name);
                if (cacheEntry != null && cacheEntry.expiration < System.currentTimeMillis() && cacheEntry.expiration >= 0L) {
                    cacheEntry = null;
                }
                address = null;
                if (cacheEntry != null) {
                    address = cacheEntry.address;
                }
            }
        }
        return address;
    }
    
    public static NbtAddress getLocalHost() throws UnknownHostException {
        return NbtAddress.localhost;
    }
    
    public static Name getLocalName() {
        return NbtAddress.localhost.hostName;
    }
    
    public static InetAddress getWINSAddress() {
        InetAddress inetAddress;
        if (NbtAddress.NBNS.length == 0) {
            inetAddress = null;
        }
        else {
            inetAddress = NbtAddress.NBNS[NbtAddress.nbnsIndex];
        }
        return inetAddress;
    }
    
    public static boolean isWINS(final InetAddress inetAddress) {
        for (int n = 0; inetAddress != null && n < NbtAddress.NBNS.length; ++n) {
            if (inetAddress.hashCode() == NbtAddress.NBNS[n].hashCode()) {
                return true;
            }
        }
        return false;
    }
    
    static InetAddress switchWINS() {
        int nbnsIndex;
        if (1 + NbtAddress.nbnsIndex < NbtAddress.NBNS.length) {
            nbnsIndex = 1 + NbtAddress.nbnsIndex;
        }
        else {
            nbnsIndex = 0;
        }
        NbtAddress.nbnsIndex = nbnsIndex;
        InetAddress inetAddress;
        if (NbtAddress.NBNS.length == 0) {
            inetAddress = null;
        }
        else {
            inetAddress = NbtAddress.NBNS[NbtAddress.nbnsIndex];
        }
        return inetAddress;
    }
    
    private static void updateLookupTable(final Name name) {
        synchronized (NbtAddress.LOOKUP_TABLE) {
            NbtAddress.LOOKUP_TABLE.remove(name);
            NbtAddress.LOOKUP_TABLE.notifyAll();
        }
    }
    
    void checkData() throws UnknownHostException {
        if (this.hostName == NbtAddress.UNKNOWN_NAME) {
            getAllByAddress(this);
        }
    }
    
    void checkNodeStatusData() throws UnknownHostException {
        if (!this.isDataFromNodeStatus) {
            getAllByAddress(this);
        }
    }
    
    public boolean equals(final Object o) {
        return o != null && o instanceof NbtAddress && ((NbtAddress)o).address == this.address;
    }
    
    public String firstCalledName() {
        this.calledName = this.hostName.name;
        if (Character.isDigit(this.calledName.charAt(0))) {
            int n = 0;
            final int length = this.calledName.length();
            final char[] charArray = this.calledName.toCharArray();
            int i = 0;
            while (i < length) {
                final int n2 = i + 1;
                if (!Character.isDigit(charArray[i])) {
                    break;
                }
                if (n2 == length && n == 3) {
                    this.calledName = "*SMBSERVER     ";
                    break;
                }
                if (n2 < length && charArray[n2] == '.') {
                    ++n;
                    i = n2 + 1;
                }
                else {
                    i = n2;
                }
            }
        }
        else {
            switch (this.hostName.hexCode) {
                case 27:
                case 28:
                case 29: {
                    this.calledName = "*SMBSERVER     ";
                    break;
                }
            }
        }
        return this.calledName;
    }
    
    public byte[] getAddress() {
        return new byte[] { (byte)(0xFF & this.address >>> 24), (byte)(0xFF & this.address >>> 16), (byte)(0xFF & this.address >>> 8), (byte)(0xFF & this.address) };
    }
    
    public String getHostAddress() {
        return String.valueOf(0xFF & this.address >>> 24) + "." + (0xFF & this.address >>> 16) + "." + (0xFF & this.address >>> 8) + "." + (0xFF & this.address >>> 0);
    }
    
    public String getHostName() {
        String s;
        if (this.hostName == NbtAddress.UNKNOWN_NAME) {
            s = this.getHostAddress();
        }
        else {
            s = this.hostName.name;
        }
        return s;
    }
    
    public InetAddress getInetAddress() throws UnknownHostException {
        return InetAddress.getByName(this.getHostAddress());
    }
    
    public byte[] getMacAddress() throws UnknownHostException {
        this.checkNodeStatusData();
        return this.macAddress;
    }
    
    public int getNameType() {
        return this.hostName.hexCode;
    }
    
    public int getNodeType() throws UnknownHostException {
        this.checkData();
        return this.nodeType;
    }
    
    public int hashCode() {
        return this.address;
    }
    
    public boolean isActive() throws UnknownHostException {
        this.checkNodeStatusData();
        return this.isActive;
    }
    
    public boolean isBeingDeleted() throws UnknownHostException {
        this.checkNodeStatusData();
        return this.isBeingDeleted;
    }
    
    public boolean isGroupAddress() throws UnknownHostException {
        this.checkData();
        return this.groupName;
    }
    
    public boolean isInConflict() throws UnknownHostException {
        this.checkNodeStatusData();
        return this.isInConflict;
    }
    
    public boolean isPermanent() throws UnknownHostException {
        this.checkNodeStatusData();
        return this.isPermanent;
    }
    
    public String nextCalledName() {
        String calledName = null;
        if (this.calledName == this.hostName.name) {
            this.calledName = "*SMBSERVER     ";
        }
        else {
            if (this.calledName == "*SMBSERVER     ") {
                while (true) {
                    while (true) {
                        int n = 0;
                        Label_0161: {
                            try {
                                final NbtAddress[] nodeStatus = NbtAddress.CLIENT.getNodeStatus(this);
                                final int hexCode = this.hostName.hexCode;
                                calledName = null;
                                if (hexCode == 29) {
                                    n = 0;
                                    final int length = nodeStatus.length;
                                    calledName = null;
                                    if (n >= length) {
                                        return calledName;
                                    }
                                    final int hexCode2 = nodeStatus[n].hostName.hexCode;
                                    calledName = null;
                                    if (hexCode2 == 32) {
                                        calledName = nodeStatus[n].hostName.name;
                                        return calledName;
                                    }
                                    break Label_0161;
                                }
                                else {
                                    final boolean isDataFromNodeStatus = this.isDataFromNodeStatus;
                                    calledName = null;
                                    if (isDataFromNodeStatus) {
                                        this.calledName = null;
                                        calledName = this.hostName.name;
                                        return calledName;
                                    }
                                    return this.calledName;
                                }
                            }
                            catch (UnknownHostException ex) {
                                this.calledName = calledName;
                                return this.calledName;
                            }
                            break;
                        }
                        ++n;
                        continue;
                    }
                }
            }
            this.calledName = null;
        }
        calledName = this.calledName;
        return calledName;
    }
    
    public String toString() {
        return String.valueOf(this.hostName.toString()) + "/" + this.getHostAddress();
    }
    
    static final class CacheEntry
    {
        NbtAddress address;
        long expiration;
        Name hostName;
        
        CacheEntry(final Name hostName, final NbtAddress address, final long expiration) {
            super();
            this.hostName = hostName;
            this.address = address;
            this.expiration = expiration;
        }
    }
}
