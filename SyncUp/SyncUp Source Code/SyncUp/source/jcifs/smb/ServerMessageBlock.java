package jcifs.smb;

import jcifs.util.transport.*;
import java.util.*;
import jcifs.util.*;
import java.io.*;

abstract class ServerMessageBlock extends Response implements Request, SmbConstants
{
    static final byte SMB_COM_CHECK_DIRECTORY = 16;
    static final byte SMB_COM_CLOSE = 4;
    static final byte SMB_COM_CREATE_DIRECTORY = 0;
    static final byte SMB_COM_DELETE = 6;
    static final byte SMB_COM_DELETE_DIRECTORY = 1;
    static final byte SMB_COM_ECHO = 43;
    static final byte SMB_COM_FIND_CLOSE2 = 52;
    static final byte SMB_COM_LOGOFF_ANDX = 116;
    static final byte SMB_COM_MOVE = 42;
    static final byte SMB_COM_NEGOTIATE = 114;
    static final byte SMB_COM_NT_CREATE_ANDX = -94;
    static final byte SMB_COM_NT_TRANSACT = -96;
    static final byte SMB_COM_NT_TRANSACT_SECONDARY = -95;
    static final byte SMB_COM_OPEN_ANDX = 45;
    static final byte SMB_COM_QUERY_INFORMATION = 8;
    static final byte SMB_COM_READ_ANDX = 46;
    static final byte SMB_COM_RENAME = 7;
    static final byte SMB_COM_SESSION_SETUP_ANDX = 115;
    static final byte SMB_COM_TRANSACTION = 37;
    static final byte SMB_COM_TRANSACTION2 = 50;
    static final byte SMB_COM_TRANSACTION_SECONDARY = 38;
    static final byte SMB_COM_TREE_CONNECT_ANDX = 117;
    static final byte SMB_COM_TREE_DISCONNECT = 113;
    static final byte SMB_COM_WRITE = 11;
    static final byte SMB_COM_WRITE_ANDX = 47;
    static final byte[] header;
    static LogStream log;
    NtlmPasswordAuthentication auth;
    int batchLevel;
    int byteCount;
    byte command;
    SigningDigest digest;
    int errorCode;
    boolean extendedSecurity;
    byte flags;
    int flags2;
    int headerStart;
    int length;
    int mid;
    String path;
    int pid;
    boolean received;
    ServerMessageBlock response;
    long responseTimeout;
    int signSeq;
    int tid;
    int uid;
    boolean useUnicode;
    boolean verifyFailed;
    int wordCount;
    
    static {
        ServerMessageBlock.log = LogStream.getInstance();
        final byte[] header2 = new byte[24];
        header2[0] = -1;
        header2[1] = 83;
        header2[2] = 77;
        header2[3] = 66;
        header = header2;
    }
    
    ServerMessageBlock() {
        super();
        this.responseTimeout = 1L;
        this.auth = null;
        this.digest = null;
        this.flags = 24;
        this.pid = ServerMessageBlock.PID;
        this.batchLevel = 0;
    }
    
    static int readInt2(final byte[] array, final int n) {
        return (0xFF & array[n]) + ((0xFF & array[n + 1]) << 8);
    }
    
    static int readInt4(final byte[] array, final int n) {
        return (0xFF & array[n]) + ((0xFF & array[n + 1]) << 8) + ((0xFF & array[n + 2]) << 16) + ((0xFF & array[n + 3]) << 24);
    }
    
    static long readInt8(final byte[] array, final int n) {
        return (0xFFFFFFFFL & readInt4(array, n)) + (readInt4(array, n + 4) << 32);
    }
    
    static long readTime(final byte[] array, final int n) {
        return (readInt4(array, n + 4) << 32 | (0xFFFFFFFFL & readInt4(array, n))) / 10000L - 11644473600000L;
    }
    
    static long readUTime(final byte[] array, final int n) {
        return 1000L * readInt4(array, n);
    }
    
    static void writeInt2(final long n, final byte[] array, final int n2) {
        array[n2] = (byte)n;
        array[n2 + 1] = (byte)(n >> 8);
    }
    
    static void writeInt4(final long n, final byte[] array, final int n2) {
        array[n2] = (byte)n;
        final int n3 = n2 + 1;
        final long n4 = n >> 8;
        array[n3] = (byte)n4;
        final int n5 = n3 + 1;
        final long n6 = n4 >> 8;
        array[n5] = (byte)n6;
        array[n5 + 1] = (byte)(n6 >> 8);
    }
    
    static void writeInt8(final long n, final byte[] array, final int n2) {
        array[n2] = (byte)n;
        final int n3 = n2 + 1;
        final long n4 = n >> 8;
        array[n3] = (byte)n4;
        final int n5 = n3 + 1;
        final long n6 = n4 >> 8;
        array[n5] = (byte)n6;
        final int n7 = n5 + 1;
        final long n8 = n6 >> 8;
        array[n7] = (byte)n8;
        final int n9 = n7 + 1;
        final long n10 = n8 >> 8;
        array[n9] = (byte)n10;
        final int n11 = n9 + 1;
        final long n12 = n10 >> 8;
        array[n11] = (byte)n12;
        final int n13 = n11 + 1;
        final long n14 = n12 >> 8;
        array[n13] = (byte)n14;
        array[n13 + 1] = (byte)(n14 >> 8);
    }
    
    static void writeTime(long n, final byte[] array, final int n2) {
        if (n != 0L) {
            n = 10000L * (11644473600000L + n);
        }
        writeInt8(n, array, n2);
    }
    
    static void writeUTime(long n, final byte[] array, final int n2) {
        if (n == 0L || n == -1L) {
            writeInt4(-1L, array, n2);
        }
        else {
            synchronized (ServerMessageBlock.TZ) {
                if (ServerMessageBlock.TZ.inDaylightTime(new Date())) {
                    if (!ServerMessageBlock.TZ.inDaylightTime(new Date(n))) {
                        n -= 3600000L;
                    }
                }
                else if (ServerMessageBlock.TZ.inDaylightTime(new Date(n))) {
                    n += 3600000L;
                }
                // monitorexit(ServerMessageBlock.TZ)
                writeInt4((int)(n / 1000L), array, n2);
            }
        }
    }
    
    int decode(final byte[] array, final int headerStart) {
        this.headerStart = headerStart;
        final int n = headerStart + this.readHeaderWireFormat(array, headerStart);
        final int n2 = n + 1;
        this.wordCount = array[n];
        int n3;
        if (this.wordCount != 0) {
            final int parameterWordsWireFormat = this.readParameterWordsWireFormat(array, n2);
            if (parameterWordsWireFormat != 2 * this.wordCount && LogStream.level >= 5) {
                ServerMessageBlock.log.println("wordCount * 2=" + 2 * this.wordCount + " but readParameterWordsWireFormat returned " + parameterWordsWireFormat);
            }
            n3 = n2 + 2 * this.wordCount;
        }
        else {
            n3 = n2;
        }
        this.byteCount = readInt2(array, n3);
        int n4 = n3 + 2;
        if (this.byteCount != 0) {
            final int bytesWireFormat = this.readBytesWireFormat(array, n4);
            if (bytesWireFormat != this.byteCount && LogStream.level >= 5) {
                ServerMessageBlock.log.println("byteCount=" + this.byteCount + " but readBytesWireFormat returned " + bytesWireFormat);
            }
            n4 += this.byteCount;
        }
        return this.length = n4 - headerStart;
    }
    
    int encode(final byte[] array, final int headerStart) {
        this.headerStart = headerStart;
        final int n = headerStart + this.writeHeaderWireFormat(array, headerStart);
        this.wordCount = this.writeParameterWordsWireFormat(array, n + 1);
        final int n2 = n + 1;
        array[n] = (byte)(0xFF & this.wordCount / 2);
        final int n3 = n2 + this.wordCount;
        this.wordCount /= 2;
        this.byteCount = this.writeBytesWireFormat(array, n3 + 2);
        final int n4 = n3 + 1;
        array[n3] = (byte)(0xFF & this.byteCount);
        final int n5 = n4 + 1;
        array[n4] = (byte)(0xFF & this.byteCount >> 8);
        this.length = n5 + this.byteCount - headerStart;
        if (this.digest != null) {
            this.digest.sign(array, this.headerStart, this.length, this, this.response);
        }
        return this.length;
    }
    
    public boolean equals(final Object o) {
        return o instanceof ServerMessageBlock && ((ServerMessageBlock)o).mid == this.mid;
    }
    
    public int hashCode() {
        return this.mid;
    }
    
    boolean isResponse() {
        return (0x80 & this.flags) == 0x80;
    }
    
    abstract int readBytesWireFormat(final byte[] p0, final int p1);
    
    int readHeaderWireFormat(final byte[] array, final int n) {
        this.command = array[n + 4];
        this.errorCode = readInt4(array, n + 5);
        this.flags = array[n + 9];
        this.flags2 = readInt2(array, 1 + (n + 9));
        this.tid = readInt2(array, n + 24);
        this.pid = readInt2(array, 2 + (n + 24));
        this.uid = readInt2(array, 4 + (n + 24));
        this.mid = readInt2(array, 6 + (n + 24));
        return 32;
    }
    
    abstract int readParameterWordsWireFormat(final byte[] p0, final int p1);
    
    String readString(final byte[] array, final int n) {
        return this.readString(array, n, 256, this.useUnicode);
    }
    
    String readString(final byte[] array, int n, final int n2, final int n3, final boolean b) {
        int n4 = 128;
        String s = null;
        if (b) {
            int n5;
            int n6 = 0;
            byte b2;
            int level;
            PrintStream err;
            byte b3;
            Block_9_Outer:Label_0040_Outer:Label_0059_Outer:
            while (true) {
                while (true) {
                    while (true) {
                        Label_0301: {
                            Label_0298: {
                                try {
                                    n5 = (n - this.headerStart) % 2;
                                    s = null;
                                    if (n5 != 0) {
                                        ++n;
                                        s = null;
                                    }
                                    break Label_0298;
                                    // iftrue(Label_0178:, n6 <= n3)
                                    // iftrue(Label_0040:, b2 == 0)
                                Block_12_Outer:
                                    while (true) {
                                        Label_0138: {
                                            while (true) {
                                                Block_10: {
                                                    while (true) {
                                                        s = null;
                                                        break Block_10;
                                                        b2 = array[1 + (n + n6)];
                                                        s = null;
                                                        continue Block_9_Outer;
                                                    }
                                                    n4 = n3 + 8;
                                                    break Label_0138;
                                                }
                                                level = LogStream.level;
                                                s = null;
                                                Block_11: {
                                                    break Block_11;
                                                    s = new String(array, n, n6, "UTF-16LE");
                                                    break;
                                                }
                                                err = System.err;
                                                s = null;
                                                continue Label_0040_Outer;
                                            }
                                            Label_0147: {
                                                throw new RuntimeException("zero termination not found");
                                            }
                                        }
                                        Hexdump.hexdump(err, array, n, n4);
                                        throw new RuntimeException("zero termination not found");
                                        b3 = array[n + n6];
                                        s = null;
                                        continue Block_12_Outer;
                                    }
                                }
                                // iftrue(Label_0147:, level <= 0)
                                // iftrue(Label_0138:, n3 >= n4)
                                // iftrue(Label_0093:, b3 != 0)
                                catch (UnsupportedEncodingException ex) {
                                    if (LogStream.level > 1) {
                                        ex.printStackTrace(ServerMessageBlock.log);
                                        break;
                                    }
                                    break;
                                }
                                Label_0178: {
                                    n6 += 2;
                                }
                                break Label_0301;
                            }
                            n6 = 0;
                        }
                        if (1 + (n + n6) >= n2) {
                            continue Label_0059_Outer;
                        }
                        break;
                    }
                    continue;
                }
            }
        }
        else {
            int n7;
            for (n7 = 0; n < n2 && array[n + n7] != 0; ++n7) {
                if (n7 > n3) {
                    if (LogStream.level > 0) {
                        final PrintStream err2 = System.err;
                        if (n3 < n4) {
                            n4 = n3 + 8;
                        }
                        Hexdump.hexdump(err2, array, n, n4);
                    }
                    throw new RuntimeException("zero termination not found");
                }
            }
            s = new String(array, n, n7, ServerMessageBlock.OEM_ENCODING);
        }
        return s;
    }
    
    String readString(final byte[] array, int n, final int n2, final boolean b) {
        int n3 = 128;
        String s = null;
        int n4 = 0;
        while (true) {
            Label_0240: {
                if (!b) {
                    break Label_0240;
                }
                try {
                    final int n5 = (n - this.headerStart) % 2;
                    int i = 0;
                    s = null;
                    if (n5 != 0) {
                        ++n;
                    }
                    do {
                        final byte b2 = array[n + i];
                        s = null;
                        if (b2 == 0) {
                            final byte b3 = array[1 + (n + i)];
                            s = null;
                            if (b3 == 0) {
                                s = new String(array, n, i, "UTF-16LE");
                                return s;
                            }
                        }
                        i += 2;
                        s = null;
                    } while (i <= n2);
                    final int level = LogStream.level;
                    s = null;
                    if (level > 0) {
                        final PrintStream err = System.err;
                        s = null;
                        if (n2 < n3) {
                            n3 = n2 + 8;
                        }
                        Hexdump.hexdump(err, array, n, n3);
                    }
                    throw new RuntimeException("zero termination not found");
                }
                catch (UnsupportedEncodingException ex) {
                    if (LogStream.level > 1) {
                        ex.printStackTrace(ServerMessageBlock.log);
                        return s;
                    }
                    return s;
                }
                if (++n4 > n2) {
                    if (LogStream.level > 0) {
                        final PrintStream err2 = System.err;
                        if (n2 < n3) {
                            n3 = n2 + 8;
                        }
                        Hexdump.hexdump(err2, array, n, n3);
                    }
                    throw new RuntimeException("zero termination not found");
                }
            }
            if (array[n + n4] != 0) {
                continue;
            }
            break;
        }
        s = new String(array, n, n4, ServerMessageBlock.OEM_ENCODING);
        return s;
    }
    
    int readStringLength(final byte[] array, final int n, final int n2) {
        int n3;
        int n4;
        for (n3 = 0; array[n + n3] != 0; n3 = n4) {
            n4 = n3 + 1;
            if (n3 > n2) {
                throw new RuntimeException("zero termination not found: " + this);
            }
        }
        return n3;
    }
    
    void reset() {
        this.flags = 24;
        this.flags2 = 0;
        this.errorCode = 0;
        this.received = false;
        this.digest = null;
    }
    
    int stringWireLength(final String s, final int n) {
        int n2 = 1 + s.length();
        if (this.useUnicode) {
            n2 = 2 + 2 * s.length();
            if (n % 2 != 0) {
                ++n2;
            }
        }
        return n2;
    }
    
    public String toString() {
        String s = null;
        switch (this.command) {
            default: {
                s = "UNKNOWN";
                break;
            }
            case 114: {
                s = "SMB_COM_NEGOTIATE";
                break;
            }
            case 115: {
                s = "SMB_COM_SESSION_SETUP_ANDX";
                break;
            }
            case 117: {
                s = "SMB_COM_TREE_CONNECT_ANDX";
                break;
            }
            case 8: {
                s = "SMB_COM_QUERY_INFORMATION";
                break;
            }
            case 16: {
                s = "SMB_COM_CHECK_DIRECTORY";
                break;
            }
            case 37: {
                s = "SMB_COM_TRANSACTION";
                break;
            }
            case 50: {
                s = "SMB_COM_TRANSACTION2";
                break;
            }
            case 38: {
                s = "SMB_COM_TRANSACTION_SECONDARY";
                break;
            }
            case 52: {
                s = "SMB_COM_FIND_CLOSE2";
                break;
            }
            case 113: {
                s = "SMB_COM_TREE_DISCONNECT";
                break;
            }
            case 116: {
                s = "SMB_COM_LOGOFF_ANDX";
                break;
            }
            case 43: {
                s = "SMB_COM_ECHO";
                break;
            }
            case 42: {
                s = "SMB_COM_MOVE";
                break;
            }
            case 7: {
                s = "SMB_COM_RENAME";
                break;
            }
            case 6: {
                s = "SMB_COM_DELETE";
                break;
            }
            case 1: {
                s = "SMB_COM_DELETE_DIRECTORY";
                break;
            }
            case -94: {
                s = "SMB_COM_NT_CREATE_ANDX";
                break;
            }
            case 45: {
                s = "SMB_COM_OPEN_ANDX";
                break;
            }
            case 46: {
                s = "SMB_COM_READ_ANDX";
                break;
            }
            case 4: {
                s = "SMB_COM_CLOSE";
                break;
            }
            case 47: {
                s = "SMB_COM_WRITE_ANDX";
                break;
            }
            case 0: {
                s = "SMB_COM_CREATE_DIRECTORY";
                break;
            }
            case -96: {
                s = "SMB_COM_NT_TRANSACT";
                break;
            }
            case -95: {
                s = "SMB_COM_NT_TRANSACT_SECONDARY";
                break;
            }
        }
        String messageByCode;
        if (this.errorCode == 0) {
            messageByCode = "0";
        }
        else {
            messageByCode = SmbException.getMessageByCode(this.errorCode);
        }
        return new String("command=" + s + ",received=" + this.received + ",errorCode=" + messageByCode + ",flags=0x" + Hexdump.toHexString(0xFF & this.flags, 4) + ",flags2=0x" + Hexdump.toHexString(this.flags2, 4) + ",signSeq=" + this.signSeq + ",tid=" + this.tid + ",pid=" + this.pid + ",uid=" + this.uid + ",mid=" + this.mid + ",wordCount=" + this.wordCount + ",byteCount=" + this.byteCount);
    }
    
    abstract int writeBytesWireFormat(final byte[] p0, final int p1);
    
    int writeHeaderWireFormat(final byte[] array, final int n) {
        System.arraycopy(ServerMessageBlock.header, 0, array, n, ServerMessageBlock.header.length);
        array[n + 4] = this.command;
        array[n + 9] = this.flags;
        writeInt2(this.flags2, array, 1 + (n + 9));
        final int n2 = n + 24;
        writeInt2(this.tid, array, n2);
        writeInt2(this.pid, array, n2 + 2);
        writeInt2(this.uid, array, n2 + 4);
        writeInt2(this.mid, array, n2 + 6);
        return 32;
    }
    
    abstract int writeParameterWordsWireFormat(final byte[] p0, final int p1);
    
    int writeString(final String s, final byte[] array, final int n) {
        return this.writeString(s, array, n, this.useUnicode);
    }
    
    int writeString(final String p0, final byte[] p1, final int p2, final boolean p3) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: istore          5
        //     3: iload           4
        //     5: ifeq            92
        //     8: iload_3        
        //     9: aload_0        
        //    10: getfield        jcifs/smb/ServerMessageBlock.headerStart:I
        //    13: isub           
        //    14: iconst_2       
        //    15: irem           
        //    16: istore          11
        //    18: iload           11
        //    20: ifeq            35
        //    23: iload_3        
        //    24: iconst_1       
        //    25: iadd           
        //    26: istore          10
        //    28: aload_2        
        //    29: iload_3        
        //    30: iconst_0       
        //    31: bastore        
        //    32: iload           10
        //    34: istore_3       
        //    35: aload_1        
        //    36: ldc_w           "UTF-16LE"
        //    39: invokevirtual   java/lang/String.getBytes:(Ljava/lang/String;)[B
        //    42: iconst_0       
        //    43: aload_2        
        //    44: iload_3        
        //    45: iconst_2       
        //    46: aload_1        
        //    47: invokevirtual   java/lang/String.length:()I
        //    50: imul           
        //    51: invokestatic    java/lang/System.arraycopy:(Ljava/lang/Object;ILjava/lang/Object;II)V
        //    54: aload_1        
        //    55: invokevirtual   java/lang/String.length:()I
        //    58: istore          12
        //    60: iload_3        
        //    61: iload           12
        //    63: iconst_2       
        //    64: imul           
        //    65: iadd           
        //    66: istore          13
        //    68: iload           13
        //    70: iconst_1       
        //    71: iadd           
        //    72: istore          10
        //    74: aload_2        
        //    75: iload           13
        //    77: iconst_0       
        //    78: bastore        
        //    79: iload           10
        //    81: iconst_1       
        //    82: iadd           
        //    83: istore_3       
        //    84: aload_2        
        //    85: iload           10
        //    87: iconst_0       
        //    88: bastore        
        //    89: goto            168
        //    92: aload_1        
        //    93: getstatic       jcifs/smb/ServerMessageBlock.OEM_ENCODING:Ljava/lang/String;
        //    96: invokevirtual   java/lang/String.getBytes:(Ljava/lang/String;)[B
        //    99: astore          7
        //   101: aload           7
        //   103: iconst_0       
        //   104: aload_2        
        //   105: iload_3        
        //   106: aload           7
        //   108: arraylength    
        //   109: invokestatic    java/lang/System.arraycopy:(Ljava/lang/Object;ILjava/lang/Object;II)V
        //   112: aload           7
        //   114: arraylength    
        //   115: istore          8
        //   117: iload_3        
        //   118: iload           8
        //   120: iadd           
        //   121: istore          9
        //   123: iload           9
        //   125: iconst_1       
        //   126: iadd           
        //   127: istore          10
        //   129: aload_2        
        //   130: iload           9
        //   132: iconst_0       
        //   133: bastore        
        //   134: iload           10
        //   136: istore_3       
        //   137: goto            168
        //   140: astore          6
        //   142: getstatic       jcifs/util/LogStream.level:I
        //   145: iconst_1       
        //   146: if_icmple       168
        //   149: aload           6
        //   151: getstatic       jcifs/smb/ServerMessageBlock.log:Ljcifs/util/LogStream;
        //   154: invokevirtual   java/io/UnsupportedEncodingException.printStackTrace:(Ljava/io/PrintStream;)V
        //   157: goto            168
        //   160: astore          6
        //   162: iload           10
        //   164: istore_3       
        //   165: goto            142
        //   168: iload_3        
        //   169: iload           5
        //   171: isub           
        //   172: ireturn        
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                  
        //  -----  -----  -----  -----  --------------------------------------
        //  8      18     140    142    Ljava/io/UnsupportedEncodingException;
        //  28     32     160    168    Ljava/io/UnsupportedEncodingException;
        //  35     60     140    142    Ljava/io/UnsupportedEncodingException;
        //  74     79     160    168    Ljava/io/UnsupportedEncodingException;
        //  84     117    140    142    Ljava/io/UnsupportedEncodingException;
        //  129    134    160    168    Ljava/io/UnsupportedEncodingException;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0035:
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
}
