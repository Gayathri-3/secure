package com.bv.wifisync;

import jcifs.netbios.*;
import com.bv.sync.*;
import android.content.*;
import java.io.*;
import android.util.*;
import jcifs.*;
import java.util.*;
import java.security.*;
import java.net.*;

class Host implements Serializable
{
    private static final int IS_UP_CACHE_TIMEOUT = 1000;
    private static final String TAG = "Host";
    private static final long serialVersionUID = -4004222647404056876L;
    private transient boolean connected;
    String domain;
    int id;
    private String ip;
    transient boolean isUp;
    transient long isUpExpiryTime;
    private List<Job> jobs;
    transient long lastResolve;
    private long lastWakeUp;
    private long mac;
    String name;
    private String password;
    String user;
    
    Host() {
        super();
        this.jobs = new ArrayList<Job>();
    }
    
    private long bytesToLong(final byte[] array) {
        long n;
        if (array == null) {
            n = 0L;
        }
        else {
            n = (0xFFL & array[5]) + ((0xFFL & array[4]) << 8) + ((0xFFL & array[3]) << 16) + ((0xFFL & array[2]) << 24) + ((0xFFL & array[1]) << 32) + ((0xFFL & array[0]) << 40);
        }
        return n;
    }
    
    private String getFirstOnline(final NbtAddress[] array) {
        final HashSet<String> set = new HashSet<String>();
        for (final NbtAddress nbtAddress : array) {
            if (nbtAddress.getHostAddress() != null) {
                set.add(nbtAddress.getHostAddress());
            }
        }
        String s = null;
        final Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()) {
            s = iterator.next();
            try {
                final InetAddress byName = InetAddress.getByName(s);
                Utils.setHostName(byName);
                if (Utils.smbReachable(byName)) {
                    break;
                }
                continue;
            }
            catch (Exception ex) {}
        }
        return s;
    }
    
    private boolean getIsUp() {
        final String ip = this.getIp();
        try {
            final InetAddress byName = InetAddress.getByName(ip);
            Utils.setHostName(byName);
            boolean smbReachable = Utils.smbReachable(byName);
            if (smbReachable) {
                final CifsUtils.HostInfo netbiosInfo = CifsUtils.getNetbiosInfo(ip);
                smbReachable = (netbiosInfo != null && this.name.equals(netbiosInfo.name));
                if (smbReachable && this.mac == 0L) {
                    this.setMac(netbiosInfo.mac);
                }
            }
            return smbReachable;
        }
        catch (Exception ex) {
            return false;
        }
    }
    
    private boolean isEmpty(final byte[] array) {
        if (array != null) {
            for (final byte b : array) {
                final boolean b2 = false;
                if (b != 0) {
                    return b2;
                }
            }
        }
        return true;
    }
    
    private byte[] longToBytes(final long n) {
        final long n2 = lcmp(n, 0L);
        byte[] array = null;
        if (n2 != 0) {
            array = new byte[6];
            final int n3 = 0 + 1;
            array[0] = (byte)(n >> 40);
            final int n4 = n3 + 1;
            array[n3] = (byte)(n >> 32);
            final int n5 = n4 + 1;
            array[n4] = (byte)(n >> 24);
            final int n6 = n5 + 1;
            array[n5] = (byte)(n >> 16);
            final int n7 = n6 + 1;
            array[n6] = (byte)(n >> 8);
            array[n7] = (byte)n;
        }
        return array;
    }
    
    static byte[] parseMacAddress(final String s) {
        final String[] split = s.split(":");
        byte[] array;
        if (split != null && split.length == 6) {
            array = new byte[6];
            for (int i = 0; i < array.length; ++i) {
                array[i] = (byte)Integer.parseInt(split[i], 16);
            }
        }
        else {
            array = null;
        }
        return array;
    }
    
    private byte[] resolveMacUsingIp(final Context context) throws InterruptedException, IOException {
        final String string = "ip neigh show " + this.ip;
        final byte[] array = new byte[1024];
        byte[] macAddress = null;
        try {
            final Process exec = Runtime.getRuntime().exec(string);
            try {
                final int wait = exec.waitFor();
                if (wait == 0) {
                    final int read = exec.getInputStream().read(array);
                    macAddress = null;
                    if (read > 0) {
                        final String[] split = new String(array, 0, read).split(" ");
                        macAddress = null;
                        if (split != null) {
                            final int length = split.length;
                            macAddress = null;
                            if (length > 5) {
                                macAddress = parseMacAddress(split[4]);
                            }
                        }
                    }
                }
                else {
                    final int read2 = exec.getErrorStream().read(array);
                    String s = "";
                    if (read2 > 0) {
                        s = new String(array, 0, read2);
                    }
                    Log.i("Host", Errors.getErrorMessage(context, new IOException(String.valueOf(s) + " exit code: " + wait)));
                    macAddress = null;
                }
                return macAddress;
            }
            finally {
                exec.destroy();
            }
        }
        catch (Exception ex) {
            Log.i("Host", Errors.getErrorMessage(context, ex));
            return macAddress;
        }
    }
    
    private byte[] resolveMacUsingProc(final Context p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: new             Ljava/io/BufferedReader;
        //     3: dup            
        //     4: new             Ljava/io/FileReader;
        //     7: dup            
        //     8: ldc             "/proc/net/arp"
        //    10: invokespecial   java/io/FileReader.<init>:(Ljava/lang/String;)V
        //    13: invokespecial   java/io/BufferedReader.<init>:(Ljava/io/Reader;)V
        //    16: astore_2       
        //    17: aload_2        
        //    18: invokevirtual   java/io/BufferedReader.readLine:()Ljava/lang/String;
        //    21: astore          8
        //    23: aload           8
        //    25: ifnonnull       38
        //    28: aload_2        
        //    29: invokevirtual   java/io/BufferedReader.close:()V
        //    32: aconst_null    
        //    33: astore          7
        //    35: aload           7
        //    37: areturn        
        //    38: aload           8
        //    40: ldc             " +"
        //    42: invokevirtual   java/lang/String.split:(Ljava/lang/String;)[Ljava/lang/String;
        //    45: astore          9
        //    47: aload           9
        //    49: ifnull          17
        //    52: aload           9
        //    54: arraylength    
        //    55: iconst_4       
        //    56: if_icmplt       17
        //    59: aload_0        
        //    60: getfield        com/bv/wifisync/Host.ip:Ljava/lang/String;
        //    63: aload           9
        //    65: iconst_0       
        //    66: aaload         
        //    67: invokevirtual   java/lang/String.equals:(Ljava/lang/Object;)Z
        //    70: ifeq            17
        //    73: aload           9
        //    75: iconst_3       
        //    76: aaload         
        //    77: astore          10
        //    79: aload           10
        //    81: ldc             "..:..:..:..:..:.."
        //    83: invokevirtual   java/lang/String.matches:(Ljava/lang/String;)Z
        //    86: ifeq            129
        //    89: aload           10
        //    91: invokestatic    com/bv/wifisync/Host.parseMacAddress:(Ljava/lang/String;)[B
        //    94: astore          12
        //    96: aload           12
        //    98: astore          7
        //   100: aload_2        
        //   101: invokevirtual   java/io/BufferedReader.close:()V
        //   104: goto            35
        //   107: astore          13
        //   109: aload           13
        //   111: invokevirtual   java/io/IOException.printStackTrace:()V
        //   114: goto            35
        //   117: astore          5
        //   119: aload_1        
        //   120: aload           5
        //   122: invokestatic    com/bv/wifisync/Errors.getErrorMessage:(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;
        //   125: pop            
        //   126: goto            32
        //   129: aload_2        
        //   130: invokevirtual   java/io/BufferedReader.close:()V
        //   133: aconst_null    
        //   134: astore          7
        //   136: goto            35
        //   139: astore          11
        //   141: aload           11
        //   143: invokevirtual   java/io/IOException.printStackTrace:()V
        //   146: goto            133
        //   149: astore_3       
        //   150: aload_2        
        //   151: invokevirtual   java/io/BufferedReader.close:()V
        //   154: aload_3        
        //   155: athrow         
        //   156: astore          4
        //   158: aload           4
        //   160: invokevirtual   java/io/IOException.printStackTrace:()V
        //   163: goto            154
        //   166: astore          14
        //   168: aload           14
        //   170: invokevirtual   java/io/IOException.printStackTrace:()V
        //   173: goto            32
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  0      17     117    129    Ljava/lang/Exception;
        //  17     23     149    166    Any
        //  28     32     166    176    Ljava/io/IOException;
        //  28     32     117    129    Ljava/lang/Exception;
        //  38     96     149    166    Any
        //  100    104    107    117    Ljava/io/IOException;
        //  100    104    117    129    Ljava/lang/Exception;
        //  109    114    117    129    Ljava/lang/Exception;
        //  129    133    139    149    Ljava/io/IOException;
        //  129    133    117    129    Ljava/lang/Exception;
        //  141    146    117    129    Ljava/lang/Exception;
        //  150    154    156    166    Ljava/io/IOException;
        //  150    154    117    129    Ljava/lang/Exception;
        //  154    173    117    129    Ljava/lang/Exception;
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
    
    private boolean resolveNBT(final Context context) {
        final CifsUtils.HostInfo netbiosInfo = CifsUtils.getNetbiosInfo(this.getIp());
        boolean b;
        if (netbiosInfo != null && netbiosInfo.name.equals(this.name)) {
            if (this.mac == 0L) {
                this.setMac(netbiosInfo.mac);
            }
            b = true;
        }
        else {
            b = false;
        }
        return b;
    }
    
    private boolean resolveNBTBroadcast(final Context context) {
        boolean b = false;
        Block_0: {
            break Block_0;
            int i;
            int length;
            do {
                while (true) {
                    break Label_0017;
                    Label_0054: {
                        try {
                            final String[] broadcastAddress = Utils.getBroadcastAddress(context);
                            length = broadcastAddress.length;
                            i = 0;
                            break Label_0054;
                            Label_0038: {
                                ++i;
                            }
                            break Label_0054;
                            // iftrue(Label_0038:, !this.resolveNBTBroadcast(broadcastAddress[i]))
                            b = true;
                            break;
                        }
                        catch (Exception ex) {
                            ex.printStackTrace();
                            b = false;
                            break;
                        }
                    }
                    b = false;
                    continue;
                }
            } while (i < length);
        }
        return b;
    }
    
    private boolean resolveNBTBroadcast(final String s) {
        boolean b = true;
        try {
            Config.setProperty("jcifs.netbios.baddr", s);
            final NbtAddress[] allByName = NbtAddress.getAllByName(this.name, 32, null, InetAddress.getByName(s));
            String ip;
            if (allByName.length == b) {
                ip = allByName[0].getHostAddress();
            }
            else {
                ip = this.getFirstOnline(allByName);
            }
            if (ip != null) {
                Log.i("Host", "Resolved broadcast to new ip: " + ip);
                this.setIp(ip);
                return b;
            }
        }
        catch (Exception ex) {}
        b = false;
        return b;
    }
    
    private String toHex(final byte[] array) {
        String string = "";
        if (array != null) {
            for (int i = 0; i < array.length; ++i) {
                string = String.valueOf(string) + Integer.toString(256 + (0xFF & array[i]), 16).substring(1);
            }
        }
        return string;
    }
    
    private void waitForTerminate(final Job job) {
        int n = 0;
        while (job.running && n < 1000) {
            try {
                Thread.sleep(100L);
                n += 100;
            }
            catch (InterruptedException ex) {
                break;
            }
        }
    }
    
    void addJob(final Job job) {
        synchronized (this.jobs) {
            this.jobs.add(job);
        }
    }
    
    boolean changedSince(final long n) {
        synchronized (this) {
            return this.lastWakeUp > n;
        }
    }
    
    boolean getConnected() {
        synchronized (this) {
            return this.connected;
        }
    }
    
    String getIp() {
        synchronized (this) {
            return this.ip;
        }
    }
    
    List<Job> getJobs() {
        synchronized (this.jobs) {
            return new ArrayList<Job>(this.jobs);
        }
    }
    
    long getLastWakeUp() {
        synchronized (this) {
            return this.lastWakeUp;
        }
    }
    
    byte[] getMac() {
        synchronized (this) {
            return this.longToBytes(this.mac);
        }
    }
    
    String getPassword(final Context context) throws IOException {
        while (true) {
            try {
                if (this.password != null && this.password.length() != 0) {
                    return SimpleCrypto.decrypt(this.password);
                }
            }
            catch (GeneralSecurityException ex2) {
                final IOException ex = new IOException(context.getString(2131099827));
                ex.initCause(ex2);
                throw ex;
            }
            return null;
        }
    }
    
    boolean isUp() {
        if (this.isUpExpiryTime < System.currentTimeMillis()) {
            this.isUp = this.getIsUp();
            this.isUpExpiryTime = 1000L + System.currentTimeMillis();
        }
        return this.isUp;
    }
    
    void remove(final Context context) throws IOException {
        while (true) {
            while (true) {
                final Iterator<Job> iterator;
                synchronized (this.jobs) {
                    final ArrayList<Job> list = new ArrayList<Job>(this.jobs);
                    // monitorexit(this.jobs)
                    iterator = list.iterator();
                    if (!iterator.hasNext()) {
                        return;
                    }
                }
                final Job job = iterator.next();
                job.cancel();
                this.waitForTerminate(job);
                job.remove(context);
                continue;
            }
        }
    }
    
    void remove(final Job job) {
        synchronized (this.jobs) {
            this.jobs.remove(job);
        }
    }
    
    void resolveMacAddress(final Context context) throws InterruptedException, IOException {
        byte[] mac = this.resolveMacUsingProc(context);
        if (this.isEmpty(mac)) {
            mac = this.resolveMacUsingIp(context);
        }
        if (this.isEmpty(mac)) {
            throw new IOException(context.getString(2131099806));
        }
        this.setMac(mac);
    }
    
    String resolveName(final Context context) {
        String s;
        if (this.resolveNBT(context) || this.resolveNBTBroadcast(context)) {
            s = this.getIp();
        }
        else {
            s = this.name;
        }
        return s;
    }
    
    void setConnected(final boolean connected) {
        synchronized (this) {
            this.connected = connected;
        }
    }
    
    void setIp(final String ip) {
        synchronized (this) {
            this.ip = ip;
        }
    }
    
    void setMac(final byte[] array) {
        synchronized (this) {
            final long bytesToLong = this.bytesToLong(array);
            if (bytesToLong != 0L) {
                this.mac = bytesToLong;
            }
        }
    }
    
    void setPassword(final String s) throws Exception {
        if (s == null || s.length() == 0) {
            this.password = null;
        }
        else {
            this.password = SimpleCrypto.encrypt(s);
        }
    }
    
    public String toString() {
        String s;
        if (this.name != null) {
            s = this.name;
        }
        else {
            s = super.toString();
        }
        return s;
    }
    
    void update(final Host host) {
        this.domain = host.domain;
        this.name = host.name;
        this.setIp(host.getIp());
        this.user = host.user;
        this.password = host.password;
        this.mac = host.mac;
    }
    
    void validate(final Context context) {
        Log.i("Host", "Validating host " + this.name + " id: " + this.id);
    }
    
    void wakeup(final Context context) throws IOException, InterruptedException {
        synchronized (this) {
            this.lastWakeUp = System.currentTimeMillis();
            // monitorexit(this)
            if (this.mac == 0L) {
                this.resolveMacAddress(context);
            }
            if (this.mac == 0L) {
                throw new IOException(context.getString(2131099806));
            }
        }
        final byte[] mac = this.getMac();
        final byte[] array = new byte[6 + 16 * mac.length];
        int n = 0;
    Label_0085_Outer:
        while (true) {
            Label_0209: {
                if (n < 6) {
                    break Label_0209;
                }
                int n2 = 6;
                while (true) {
                    Label_0221: {
                        if (n2 < array.length) {
                            break Label_0221;
                        }
                        final List<Utils.NetInfo> netInfo = Utils.getNetInfo(context);
                        if (netInfo.size() <= 0) {
                            return;
                        }
                        final InetAddress byAddress = InetAddress.getByAddress(Utils.getBroadcastBytes((Utils.NetInfo)netInfo.get(0)));
                        final DatagramPacket datagramPacket = new DatagramPacket(array, array.length, byAddress, 9);
                        final DatagramSocket datagramSocket = new DatagramSocket();
                        try {
                            datagramSocket.send(datagramPacket);
                            datagramSocket.close();
                            Log.i("Host", "Send WOL packet to " + byAddress.getHostAddress() + " with mac " + this.toHex(mac));
                            return;
                            array[n] = -1;
                            ++n;
                            continue Label_0085_Outer;
                            System.arraycopy(mac, 0, array, n2, mac.length);
                            n2 += mac.length;
                            continue;
                        }
                        finally {
                            datagramSocket.close();
                        }
                    }
                    break;
                }
            }
        }
    }
}
