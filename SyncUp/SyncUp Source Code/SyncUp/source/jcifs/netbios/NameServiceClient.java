package jcifs.netbios;

import jcifs.*;
import java.util.*;
import java.io.*;
import jcifs.util.*;
import java.net.*;

class NameServiceClient implements Runnable
{
    static final int DEFAULT_RCV_BUF_SIZE = 576;
    static final int DEFAULT_RETRY_COUNT = 2;
    static final int DEFAULT_RETRY_TIMEOUT = 3000;
    static final int DEFAULT_SND_BUF_SIZE = 576;
    static final int DEFAULT_SO_TIMEOUT = 5000;
    private static final InetAddress LADDR;
    private static final int LPORT = 0;
    static final int NAME_SERVICE_UDP_PORT = 137;
    private static final int RCV_BUF_SIZE = 0;
    static final int RESOLVER_BCAST = 2;
    static final int RESOLVER_LMHOSTS = 1;
    static final int RESOLVER_WINS = 3;
    private static final int RETRY_COUNT;
    private static final int RETRY_TIMEOUT;
    private static final String RO;
    private static final int SND_BUF_SIZE;
    private static final int SO_TIMEOUT;
    private static LogStream log;
    private final Object LOCK;
    InetAddress baddr;
    private int closeTimeout;
    private DatagramPacket in;
    InetAddress laddr;
    private int lport;
    private int nextNameTrnId;
    private DatagramPacket out;
    private byte[] rcv_buf;
    private int[] resolveOrder;
    private HashMap responseTable;
    private byte[] snd_buf;
    private DatagramSocket socket;
    private Thread thread;
    
    static {
        SND_BUF_SIZE = Config.getInt("jcifs.netbios.snd_buf_size", 576);
        RCV_BUF_SIZE = Config.getInt("jcifs.netbios.rcv_buf_size", 576);
        SO_TIMEOUT = Config.getInt("jcifs.netbios.soTimeout", 5000);
        RETRY_COUNT = Config.getInt("jcifs.netbios.retryCount", 2);
        RETRY_TIMEOUT = Config.getInt("jcifs.netbios.retryTimeout", 3000);
        LPORT = Config.getInt("jcifs.netbios.lport", 0);
        LADDR = Config.getInetAddress("jcifs.netbios.laddr", null);
        RO = Config.getProperty("jcifs.resolveOrder");
        NameServiceClient.log = LogStream.getInstance();
    }
    
    NameServiceClient() {
        this(NameServiceClient.LPORT, NameServiceClient.LADDR);
    }
    
    NameServiceClient(final int lport, final InetAddress laddr) {
        super();
        this.LOCK = new Object();
        this.responseTable = new HashMap();
        this.nextNameTrnId = 0;
        this.lport = lport;
        this.laddr = laddr;
        while (true) {
            try {
                this.baddr = Config.getInetAddress("jcifs.netbios.baddr", InetAddress.getByName("255.255.255.255"));
                this.snd_buf = new byte[NameServiceClient.SND_BUF_SIZE];
                this.rcv_buf = new byte[NameServiceClient.RCV_BUF_SIZE];
                this.out = new DatagramPacket(this.snd_buf, NameServiceClient.SND_BUF_SIZE, this.baddr, 137);
                this.in = new DatagramPacket(this.rcv_buf, NameServiceClient.RCV_BUF_SIZE);
                if (NameServiceClient.RO == null || NameServiceClient.RO.length() == 0) {
                    if (NbtAddress.getWINSAddress() == null) {
                        (this.resolveOrder = new int[2])[0] = 1;
                        this.resolveOrder[1] = 2;
                    }
                    else {
                        (this.resolveOrder = new int[3])[0] = 1;
                        this.resolveOrder[1] = 3;
                        this.resolveOrder[2] = 2;
                    }
                }
                else {
                    final int[] array = new int[3];
                    final StringTokenizer stringTokenizer = new StringTokenizer(NameServiceClient.RO, ",");
                    int n = 0;
                    while (stringTokenizer.hasMoreTokens()) {
                        final String trim = stringTokenizer.nextToken().trim();
                        if (trim.equalsIgnoreCase("LMHOSTS")) {
                            final int n2 = n + 1;
                            array[n] = 1;
                            n = n2;
                        }
                        else if (trim.equalsIgnoreCase("WINS")) {
                            if (NbtAddress.getWINSAddress() == null) {
                                if (LogStream.level <= 1) {
                                    continue;
                                }
                                NameServiceClient.log.println("NetBIOS resolveOrder specifies WINS however the jcifs.netbios.wins property has not been set");
                            }
                            else {
                                final int n3 = n + 1;
                                array[n] = 3;
                                n = n3;
                            }
                        }
                        else if (trim.equalsIgnoreCase("BCAST")) {
                            final int n4 = n + 1;
                            array[n] = 2;
                            n = n4;
                        }
                        else {
                            if (trim.equalsIgnoreCase("DNS") || LogStream.level <= 1) {
                                continue;
                            }
                            NameServiceClient.log.println("unknown resolver method: " + trim);
                        }
                    }
                    System.arraycopy(array, 0, this.resolveOrder = new int[n], 0, n);
                }
            }
            catch (UnknownHostException ex) {
                continue;
            }
            break;
        }
    }
    
    void ensureOpen(final int n) throws IOException {
        this.closeTimeout = 0;
        if (NameServiceClient.SO_TIMEOUT != 0) {
            this.closeTimeout = Math.max(NameServiceClient.SO_TIMEOUT, n);
        }
        if (this.socket == null) {
            this.socket = new DatagramSocket(this.lport, this.laddr);
            (this.thread = new Thread(this, "JCIFS-NameServiceClient")).setDaemon(true);
            this.thread.start();
        }
    }
    
    NbtAddress[] getAllByName(final Name name, InetAddress winsAddress) throws UnknownHostException {
        final NameQueryRequest nameQueryRequest = new NameQueryRequest(name);
        final NameQueryResponse nameQueryResponse = new NameQueryResponse();
        while (true) {
        Label_0102_Outer:
            while (true) {
                boolean isBroadcast = false;
                Label_0037: {
                    while (true) {
                        Label_0022: {
                            if (winsAddress != null) {
                                break Label_0022;
                            }
                            Label_0095: {
                                break Label_0095;
                                while (true) {
                                    int retry_COUNT = 0;
                                    Label_0148: {
                                        try {
                                            this.send(nameQueryRequest, nameQueryResponse, NameServiceClient.RETRY_TIMEOUT);
                                            if (nameQueryResponse.received && nameQueryResponse.resultCode == 0) {
                                                return nameQueryResponse.addrEntry;
                                            }
                                            break Label_0148;
                                            isBroadcast = false;
                                            break Label_0037;
                                            winsAddress = NbtAddress.getWINSAddress();
                                            break Label_0022;
                                            nameQueryRequest.isBroadcast = false;
                                            retry_COUNT = 1;
                                            continue Label_0102_Outer;
                                        }
                                        catch (IOException ex) {
                                            if (LogStream.level > 1) {
                                                ex.printStackTrace(NameServiceClient.log);
                                            }
                                            throw new UnknownHostException(name.name);
                                        }
                                    }
                                    if (--retry_COUNT <= 0 || !nameQueryRequest.isBroadcast) {
                                        break;
                                    }
                                }
                            }
                            throw new UnknownHostException(name.name);
                        }
                        nameQueryRequest.addr = winsAddress;
                        if (nameQueryRequest.addr != null) {
                            continue;
                        }
                        break;
                    }
                    isBroadcast = true;
                }
                nameQueryRequest.isBroadcast = isBroadcast;
                if (nameQueryRequest.isBroadcast) {
                    nameQueryRequest.addr = this.baddr;
                    final int retry_COUNT = NameServiceClient.RETRY_COUNT;
                    continue Label_0102_Outer;
                }
                break;
            }
            continue;
        }
    }
    
    NbtAddress getByName(final Name name, final InetAddress addr) throws UnknownHostException {
        final NameQueryRequest nameQueryRequest = new NameQueryRequest(name);
        final NameQueryResponse nameQueryResponse = new NameQueryResponse();
        if (addr == null) {
            int i = 0;
            NbtAddress byName;
            int retry_COUNT;
            int n = 0;
            Label_0314_Outer:Label_0450_Outer:
            while (i < this.resolveOrder.length) {
                while (true) {
                    try {
                        switch (this.resolveOrder[i]) {
                            case 1: {
                                byName = Lmhosts.getByName(name);
                                if (byName != null) {
                                    byName.hostName.srcHashCode = 0;
                                    return byName;
                                }
                                break;
                            }
                            case 2:
                            case 3: {
                                while (true) {
                                    Label_0383: {
                                        if (this.resolveOrder[i] != 3 || name.name == "\u0001\u0002__MSBROWSE__\u0002" || name.hexCode == 29) {
                                            break Label_0383;
                                        }
                                        nameQueryRequest.addr = NbtAddress.getWINSAddress();
                                        nameQueryRequest.isBroadcast = false;
                                        while (true) {
                                            retry_COUNT = NameServiceClient.RETRY_COUNT;
                                            n = retry_COUNT - 1;
                                            if (retry_COUNT <= 0) {
                                                break;
                                            }
                                            try {
                                                this.send(nameQueryRequest, nameQueryResponse, NameServiceClient.RETRY_TIMEOUT);
                                                if (nameQueryResponse.received && nameQueryResponse.resultCode == 0) {
                                                    nameQueryResponse.addrEntry[0].hostName.srcHashCode = nameQueryRequest.addr.hashCode();
                                                    byName = nameQueryResponse.addrEntry[0];
                                                    return byName;
                                                }
                                                break Label_0383;
                                                nameQueryRequest.addr = this.baddr;
                                                nameQueryRequest.isBroadcast = true;
                                                continue Label_0314_Outer;
                                            }
                                            catch (IOException ex) {
                                                if (LogStream.level > 1) {
                                                    ex.printStackTrace(NameServiceClient.log);
                                                }
                                                throw new UnknownHostException(name.name);
                                            }
                                            break;
                                        }
                                    }
                                    if (this.resolveOrder[i] != 3) {
                                        retry_COUNT = n;
                                        continue Label_0450_Outer;
                                    }
                                    break;
                                }
                                break;
                            }
                        }
                        ++i;
                    }
                    catch (IOException ex3) {
                        continue;
                    }
                    break;
                }
            }
            throw new UnknownHostException(name.name);
        }
        nameQueryRequest.addr = addr;
        final byte b = addr.getAddress()[3];
        boolean isBroadcast = false;
        if (b == -1) {
            isBroadcast = true;
        }
        nameQueryRequest.isBroadcast = isBroadcast;
        int retry_COUNT2 = NameServiceClient.RETRY_COUNT;
        do {
            try {
                this.send(nameQueryRequest, nameQueryResponse, NameServiceClient.RETRY_TIMEOUT);
                if (nameQueryResponse.received && nameQueryResponse.resultCode == 0) {
                    final int n2 = -1 + nameQueryResponse.addrEntry.length;
                    nameQueryResponse.addrEntry[n2].hostName.srcHashCode = addr.hashCode();
                    return nameQueryResponse.addrEntry[n2];
                }
            }
            catch (IOException ex2) {
                if (LogStream.level > 1) {
                    ex2.printStackTrace(NameServiceClient.log);
                }
                throw new UnknownHostException(name.name);
            }
        } while (--retry_COUNT2 > 0 && nameQueryRequest.isBroadcast);
        throw new UnknownHostException(name.name);
    }
    
    int getNextNameTrnId() {
        final int nextNameTrnId = 1 + this.nextNameTrnId;
        this.nextNameTrnId = nextNameTrnId;
        if ((nextNameTrnId & 0xFFFF) == 0x0) {
            this.nextNameTrnId = 1;
        }
        return this.nextNameTrnId;
    }
    
    NbtAddress[] getNodeStatus(final NbtAddress nbtAddress) throws UnknownHostException {
        final NodeStatusResponse nodeStatusResponse = new NodeStatusResponse(nbtAddress);
        final NodeStatusRequest nodeStatusRequest = new NodeStatusRequest(new Name("*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 0, null));
        nodeStatusRequest.addr = nbtAddress.getInetAddress();
        int retry_COUNT = NameServiceClient.RETRY_COUNT;
        while (true) {
            final int n = retry_COUNT - 1;
            if (retry_COUNT <= 0) {
                break;
            }
            while (true) {
                while (true) {
                    int hashCode;
                    int n2;
                    try {
                        this.send(nodeStatusRequest, nodeStatusResponse, NameServiceClient.RETRY_TIMEOUT);
                        if (!nodeStatusResponse.received || nodeStatusResponse.resultCode != 0) {
                            break;
                        }
                        hashCode = nodeStatusRequest.addr.hashCode();
                        n2 = 0;
                        if (n2 >= nodeStatusResponse.addressArray.length) {
                            return nodeStatusResponse.addressArray;
                        }
                    }
                    catch (IOException ex) {
                        if (LogStream.level > 1) {
                            ex.printStackTrace(NameServiceClient.log);
                        }
                        throw new UnknownHostException(nbtAddress.toString());
                    }
                    nodeStatusResponse.addressArray[n2].hostName.srcHashCode = hashCode;
                    ++n2;
                    continue;
                }
            }
            retry_COUNT = n;
        }
        throw new UnknownHostException(nbtAddress.hostName.name);
    }
    
    public void run() {
        try {
            while (this.thread == Thread.currentThread()) {
                this.in.setLength(NameServiceClient.RCV_BUF_SIZE);
                this.socket.setSoTimeout(this.closeTimeout);
                this.socket.receive(this.in);
                if (LogStream.level > 3) {
                    NameServiceClient.log.println("NetBIOS: new data read from socket");
                }
                final NameServicePacket nameServicePacket = this.responseTable.get(new Integer(NameServicePacket.readNameTrnId(this.rcv_buf, 0)));
                if (nameServicePacket != null && !nameServicePacket.received) {
                    synchronized (nameServicePacket) {
                        nameServicePacket.readWireFormat(this.rcv_buf, 0);
                        nameServicePacket.received = true;
                        if (LogStream.level > 3) {
                            NameServiceClient.log.println(nameServicePacket);
                            Hexdump.hexdump(NameServiceClient.log, this.rcv_buf, 0, this.in.getLength());
                        }
                        nameServicePacket.notify();
                    }
                }
            }
        }
        catch (SocketTimeoutException ex2) {}
        catch (Exception ex) {
            if (LogStream.level > 2) {
                ex.printStackTrace(NameServiceClient.log);
            }
        }
        finally {
            this.tryClose();
        }
    }
    
    void send(final NameServicePacket p0, final NameServicePacket p1, final int p2) throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     3: arraylength    
        //     4: istore          4
        //     6: iload           4
        //     8: ifne            14
        //    11: iconst_1       
        //    12: istore          4
        //    14: aload_2        
        //    15: monitorenter   
        //    16: iload           4
        //    18: istore          5
        //    20: aconst_null    
        //    21: astore          6
        //    23: iload           5
        //    25: iconst_1       
        //    26: isub           
        //    27: istore          7
        //    29: iload           5
        //    31: ifgt            40
        //    34: aload           6
        //    36: pop            
        //    37: aload_2        
        //    38: monitorexit    
        //    39: return         
        //    40: aload_0        
        //    41: getfield        jcifs/netbios/NameServiceClient.LOCK:Ljava/lang/Object;
        //    44: astore          13
        //    46: aload           13
        //    48: monitorenter   
        //    49: aload_1        
        //    50: aload_0        
        //    51: invokevirtual   jcifs/netbios/NameServiceClient.getNextNameTrnId:()I
        //    54: putfield        jcifs/netbios/NameServicePacket.nameTrnId:I
        //    57: new             Ljava/lang/Integer;
        //    60: dup            
        //    61: aload_1        
        //    62: getfield        jcifs/netbios/NameServicePacket.nameTrnId:I
        //    65: invokespecial   java/lang/Integer.<init>:(I)V
        //    68: astore          9
        //    70: aload_0        
        //    71: getfield        jcifs/netbios/NameServiceClient.out:Ljava/net/DatagramPacket;
        //    74: aload_1        
        //    75: getfield        jcifs/netbios/NameServicePacket.addr:Ljava/net/InetAddress;
        //    78: invokevirtual   java/net/DatagramPacket.setAddress:(Ljava/net/InetAddress;)V
        //    81: aload_0        
        //    82: getfield        jcifs/netbios/NameServiceClient.out:Ljava/net/DatagramPacket;
        //    85: aload_1        
        //    86: aload_0        
        //    87: getfield        jcifs/netbios/NameServiceClient.snd_buf:[B
        //    90: iconst_0       
        //    91: invokevirtual   jcifs/netbios/NameServicePacket.writeWireFormat:([BI)I
        //    94: invokevirtual   java/net/DatagramPacket.setLength:(I)V
        //    97: aload_2        
        //    98: iconst_0       
        //    99: putfield        jcifs/netbios/NameServicePacket.received:Z
        //   102: aload_0        
        //   103: getfield        jcifs/netbios/NameServiceClient.responseTable:Ljava/util/HashMap;
        //   106: aload           9
        //   108: aload_2        
        //   109: invokevirtual   java/util/HashMap.put:(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        //   112: pop            
        //   113: aload_0        
        //   114: iload_3        
        //   115: sipush          1000
        //   118: iadd           
        //   119: invokevirtual   jcifs/netbios/NameServiceClient.ensureOpen:(I)V
        //   122: aload_0        
        //   123: getfield        jcifs/netbios/NameServiceClient.socket:Ljava/net/DatagramSocket;
        //   126: aload_0        
        //   127: getfield        jcifs/netbios/NameServiceClient.out:Ljava/net/DatagramPacket;
        //   130: invokevirtual   java/net/DatagramSocket.send:(Ljava/net/DatagramPacket;)V
        //   133: getstatic       jcifs/util/LogStream.level:I
        //   136: iconst_3       
        //   137: if_icmple       165
        //   140: getstatic       jcifs/netbios/NameServiceClient.log:Ljcifs/util/LogStream;
        //   143: aload_1        
        //   144: invokevirtual   jcifs/util/LogStream.println:(Ljava/lang/Object;)V
        //   147: getstatic       jcifs/netbios/NameServiceClient.log:Ljcifs/util/LogStream;
        //   150: aload_0        
        //   151: getfield        jcifs/netbios/NameServiceClient.snd_buf:[B
        //   154: iconst_0       
        //   155: aload_0        
        //   156: getfield        jcifs/netbios/NameServiceClient.out:Ljava/net/DatagramPacket;
        //   159: invokevirtual   java/net/DatagramPacket.getLength:()I
        //   162: invokestatic    jcifs/util/Hexdump.hexdump:(Ljava/io/PrintStream;[BII)V
        //   165: aload           13
        //   167: monitorexit    
        //   168: invokestatic    java/lang/System.currentTimeMillis:()J
        //   171: lstore          16
        //   173: iload_3        
        //   174: ifgt            269
        //   177: aload_0        
        //   178: getfield        jcifs/netbios/NameServiceClient.responseTable:Ljava/util/HashMap;
        //   181: aload           9
        //   183: invokevirtual   java/util/HashMap.remove:(Ljava/lang/Object;)Ljava/lang/Object;
        //   186: pop            
        //   187: aload_0        
        //   188: getfield        jcifs/netbios/NameServiceClient.LOCK:Ljava/lang/Object;
        //   191: astore          28
        //   193: aload           28
        //   195: monitorenter   
        //   196: aload_1        
        //   197: getfield        jcifs/netbios/NameServicePacket.addr:Ljava/net/InetAddress;
        //   200: invokestatic    jcifs/netbios/NbtAddress.isWINS:(Ljava/net/InetAddress;)Z
        //   203: ifne            347
        //   206: aload           28
        //   208: monitorexit    
        //   209: goto            37
        //   212: astore          29
        //   214: aload           28
        //   216: monitorexit    
        //   217: aload           29
        //   219: athrow         
        //   220: astore          12
        //   222: aload_2        
        //   223: monitorexit    
        //   224: aload           12
        //   226: athrow         
        //   227: astore          14
        //   229: aload           6
        //   231: astore          9
        //   233: aload           13
        //   235: monitorexit    
        //   236: aload           14
        //   238: athrow         
        //   239: astore          8
        //   241: new             Ljava/io/IOException;
        //   244: dup            
        //   245: aload           8
        //   247: invokevirtual   java/lang/InterruptedException.getMessage:()Ljava/lang/String;
        //   250: invokespecial   java/io/IOException.<init>:(Ljava/lang/String;)V
        //   253: athrow         
        //   254: astore          10
        //   256: aload_0        
        //   257: getfield        jcifs/netbios/NameServiceClient.responseTable:Ljava/util/HashMap;
        //   260: aload           9
        //   262: invokevirtual   java/util/HashMap.remove:(Ljava/lang/Object;)Ljava/lang/Object;
        //   265: pop            
        //   266: aload           10
        //   268: athrow         
        //   269: iload_3        
        //   270: i2l            
        //   271: lstore          18
        //   273: aload_2        
        //   274: lload           18
        //   276: invokevirtual   java/lang/Object.wait:(J)V
        //   279: aload_2        
        //   280: getfield        jcifs/netbios/NameServicePacket.received:Z
        //   283: ifeq            320
        //   286: aload_1        
        //   287: getfield        jcifs/netbios/NameServicePacket.questionType:I
        //   290: istore          24
        //   292: aload_2        
        //   293: getfield        jcifs/netbios/NameServicePacket.recordType:I
        //   296: istore          25
        //   298: iload           24
        //   300: iload           25
        //   302: if_icmpne       320
        //   305: aload_0        
        //   306: getfield        jcifs/netbios/NameServiceClient.responseTable:Ljava/util/HashMap;
        //   309: aload           9
        //   311: invokevirtual   java/util/HashMap.remove:(Ljava/lang/Object;)Ljava/lang/Object;
        //   314: pop            
        //   315: aload_2        
        //   316: monitorexit    
        //   317: goto            39
        //   320: aload_2        
        //   321: iconst_0       
        //   322: putfield        jcifs/netbios/NameServicePacket.received:Z
        //   325: iload_3        
        //   326: i2l            
        //   327: lstore          20
        //   329: invokestatic    java/lang/System.currentTimeMillis:()J
        //   332: lstore          22
        //   334: lload           20
        //   336: lload           22
        //   338: lload           16
        //   340: lsub           
        //   341: lsub           
        //   342: l2i            
        //   343: istore_3       
        //   344: goto            173
        //   347: aload_1        
        //   348: getfield        jcifs/netbios/NameServicePacket.addr:Ljava/net/InetAddress;
        //   351: invokestatic    jcifs/netbios/NbtAddress.getWINSAddress:()Ljava/net/InetAddress;
        //   354: if_acmpne       361
        //   357: invokestatic    jcifs/netbios/NbtAddress.switchWINS:()Ljava/net/InetAddress;
        //   360: pop            
        //   361: aload_1        
        //   362: invokestatic    jcifs/netbios/NbtAddress.getWINSAddress:()Ljava/net/InetAddress;
        //   365: putfield        jcifs/netbios/NameServicePacket.addr:Ljava/net/InetAddress;
        //   368: aload           28
        //   370: monitorexit    
        //   371: iload           7
        //   373: istore          5
        //   375: aload           9
        //   377: astore          6
        //   379: goto            23
        //   382: astore          10
        //   384: aload           6
        //   386: astore          9
        //   388: goto            256
        //   391: astore          8
        //   393: aload           6
        //   395: astore          9
        //   397: goto            241
        //   400: astore          14
        //   402: goto            233
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                            
        //  -----  -----  -----  -----  --------------------------------
        //  37     39     220    227    Any
        //  40     49     391    400    Ljava/lang/InterruptedException;
        //  40     49     382    391    Any
        //  49     70     227    233    Any
        //  70     168    400    405    Any
        //  168    173    239    241    Ljava/lang/InterruptedException;
        //  168    173    254    256    Any
        //  177    196    220    227    Any
        //  196    217    212    220    Any
        //  217    224    220    227    Any
        //  233    236    400    405    Any
        //  236    239    239    241    Ljava/lang/InterruptedException;
        //  236    239    254    256    Any
        //  241    254    254    256    Any
        //  256    269    220    227    Any
        //  273    298    239    241    Ljava/lang/InterruptedException;
        //  273    298    254    256    Any
        //  305    317    220    227    Any
        //  320    334    239    241    Ljava/lang/InterruptedException;
        //  320    334    254    256    Any
        //  347    371    212    220    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IndexOutOfBoundsException: Index: 208, Size: 208
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
    
    void tryClose() {
        synchronized (this.LOCK) {
            if (this.socket != null) {
                this.socket.close();
                this.socket = null;
            }
            this.thread = null;
            this.responseTable.clear();
        }
    }
}
