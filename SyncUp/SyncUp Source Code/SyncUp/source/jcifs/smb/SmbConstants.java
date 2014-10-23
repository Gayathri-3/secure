package jcifs.smb;

import java.net.*;
import java.util.*;
import jcifs.*;

interface SmbConstants
{
    public static final int ATTR_ARCHIVE = 32;
    public static final int ATTR_COMPRESSED = 2048;
    public static final int ATTR_DIRECTORY = 16;
    public static final int ATTR_HIDDEN = 2;
    public static final int ATTR_NORMAL = 128;
    public static final int ATTR_READONLY = 1;
    public static final int ATTR_SYSTEM = 4;
    public static final int ATTR_TEMPORARY = 256;
    public static final int ATTR_VOLUME = 8;
    public static final int CAPABILITIES = 0;
    public static final int CAP_DFS = 4096;
    public static final int CAP_EXTENDED_SECURITY = Integer.MIN_VALUE;
    public static final int CAP_LARGE_FILES = 8;
    public static final int CAP_LARGE_READX = 16384;
    public static final int CAP_LARGE_WRITEX = 32768;
    public static final int CAP_LEVEL_II_OPLOCKS = 128;
    public static final int CAP_LOCK_AND_READ = 256;
    public static final int CAP_MPX_MODE = 2;
    public static final int CAP_NONE = 0;
    public static final int CAP_NT_FIND = 512;
    public static final int CAP_NT_SMBS = 16;
    public static final int CAP_RAW_MODE = 1;
    public static final int CAP_RPC_REMOTE_APIS = 32;
    public static final int CAP_STATUS32 = 64;
    public static final int CAP_UNICODE = 4;
    public static final int CMD_OFFSET = 4;
    public static final LinkedList CONNECTIONS = new LinkedList();
    public static final int DEFAULT_CAPABILITIES = 0;
    public static final int DEFAULT_FLAGS2 = 0;
    public static final int DEFAULT_MAX_MPX_COUNT = 10;
    public static final int DEFAULT_PORT = 445;
    public static final int DEFAULT_RCV_BUF_SIZE = 65535;
    public static final int DEFAULT_RESPONSE_TIMEOUT = 30000;
    public static final int DEFAULT_SND_BUF_SIZE = 65535;
    public static final int DEFAULT_SO_TIMEOUT = 35000;
    public static final int DEFAULT_SSN_LIMIT = 250;
    public static final int DELETE = 65536;
    public static final int ERROR_CODE_OFFSET = 5;
    public static final int FILE_APPEND_DATA = 4;
    public static final int FILE_DELETE = 64;
    public static final int FILE_EXECUTE = 32;
    public static final int FILE_READ_ATTRIBUTES = 128;
    public static final int FILE_READ_DATA = 1;
    public static final int FILE_READ_EA = 8;
    public static final int FILE_WRITE_ATTRIBUTES = 256;
    public static final int FILE_WRITE_DATA = 2;
    public static final int FILE_WRITE_EA = 16;
    public static final int FLAGS2 = 0;
    public static final int FLAGS2_EXTENDED_ATTRIBUTES = 2;
    public static final int FLAGS2_EXTENDED_SECURITY_NEGOTIATION = 2048;
    public static final int FLAGS2_LONG_FILENAMES = 1;
    public static final int FLAGS2_NONE = 0;
    public static final int FLAGS2_PERMIT_READ_IF_EXECUTE_PERM = 8192;
    public static final int FLAGS2_RESOLVE_PATHS_IN_DFS = 4096;
    public static final int FLAGS2_SECURITY_SIGNATURES = 4;
    public static final int FLAGS2_STATUS32 = 16384;
    public static final int FLAGS2_UNICODE = 32768;
    public static final int FLAGS_COPY_SOURCE_MODE_ASCII = 8;
    public static final int FLAGS_COPY_TARGET_MODE_ASCII = 4;
    public static final int FLAGS_LOCK_AND_READ_WRITE_AND_UNLOCK = 1;
    public static final int FLAGS_NONE = 0;
    public static final int FLAGS_NOTIFY_OF_MODIFY_ACTION = 64;
    public static final int FLAGS_OFFSET = 9;
    public static final int FLAGS_OPLOCK_REQUESTED_OR_GRANTED = 32;
    public static final int FLAGS_PATH_NAMES_CANONICALIZED = 16;
    public static final int FLAGS_PATH_NAMES_CASELESS = 8;
    public static final int FLAGS_RECEIVE_BUFFER_POSTED = 2;
    public static final int FLAGS_RESPONSE = 128;
    public static final int FLAGS_TARGET_MUST_BE_DIRECTORY = 2;
    public static final int FLAGS_TARGET_MUST_BE_FILE = 1;
    public static final int FLAGS_TREE_COPY = 32;
    public static final int FLAGS_VERIFY_ALL_WRITES = 16;
    public static final boolean FORCE_UNICODE = false;
    public static final int GENERIC_ALL = 268435456;
    public static final int GENERIC_EXECUTE = 536870912;
    public static final int GENERIC_READ = Integer.MIN_VALUE;
    public static final int GENERIC_WRITE = 1073741824;
    public static final int HEADER_LENGTH = 32;
    public static final InetAddress LADDR = Config.getLocalHost();
    public static final int LM_COMPATIBILITY = 0;
    public static final int LPORT = 0;
    public static final int MAX_MPX_COUNT = 0;
    public static final long MILLISECONDS_BETWEEN_1970_AND_1601 = 11644473600000L;
    public static final String NATIVE_LANMAN = Config.getProperty("jcifs.smb.client.nativeLanMan", "jCIFS");
    public static final String NATIVE_OS = Config.getProperty("jcifs.smb.client.nativeOs", System.getProperty("os.name"));
    public static final String NETBIOS_HOSTNAME = Config.getProperty("jcifs.netbios.hostname", null);
    public static final SmbTransport NULL_TRANSPORT = new SmbTransport(null, 0, null, 0);
    public static final String OEM_ENCODING = Config.getProperty("jcifs.encoding", Config.DEFAULT_OEM_ENCODING);
    public static final int OPEN_FUNCTION_FAIL_IF_EXISTS = 0;
    public static final int OPEN_FUNCTION_OVERWRITE_IF_EXISTS = 32;
    public static final int PID = 0;
    public static final int RCV_BUF_SIZE = 0;
    public static final int READ_CONTROL = 131072;
    public static final int RESPONSE_TIMEOUT = 0;
    public static final int SECURITY_SHARE = 0;
    public static final int SECURITY_USER = 1;
    public static final int SIGNATURE_OFFSET = 14;
    public static final boolean SIGNPREF = false;
    public static final int SND_BUF_SIZE = 0;
    public static final int SO_TIMEOUT = 0;
    public static final int SSN_LIMIT = 0;
    public static final int SYNCHRONIZE = 1048576;
    public static final boolean TCP_NODELAY = false;
    public static final int TID_OFFSET = 24;
    public static final TimeZone TZ = TimeZone.getDefault();
    public static final String UNI_ENCODING = "UTF-16LE";
    public static final boolean USE_BATCHING = false;
    public static final boolean USE_EXTSEC = false;
    public static final boolean USE_NTSMBS = false;
    public static final boolean USE_NTSTATUS = false;
    public static final boolean USE_UNICODE = false;
    public static final int VC_NUMBER = 1;
    public static final int WRITE_DAC = 262144;
    public static final int WRITE_OWNER = 524288;
    
    default static {
        int n;
        int n2;
        int n3;
        int n4;
        int n5;
        int n6;
        int n7;
        int n8;
        int n9;
        int n10;
        int n11;
        n = 4;
        LPORT = Config.getInt("jcifs.smb.client.lport", 0);
        MAX_MPX_COUNT = Config.getInt("jcifs.smb.client.maxMpxCount", 10);
        SND_BUF_SIZE = Config.getInt("jcifs.smb.client.snd_buf_size", 65535);
        RCV_BUF_SIZE = Config.getInt("jcifs.smb.client.rcv_buf_size", 65535);
        USE_UNICODE = Config.getBoolean("jcifs.smb.client.useUnicode", true);
        FORCE_UNICODE = Config.getBoolean("jcifs.smb.client.useUnicode", false);
        USE_NTSTATUS = Config.getBoolean("jcifs.smb.client.useNtStatus", true);
        SIGNPREF = Config.getBoolean("jcifs.smb.client.signingPreferred", false);
        USE_NTSMBS = Config.getBoolean("jcifs.smb.client.useNTSmbs", true);
        USE_EXTSEC = Config.getBoolean("jcifs.smb.client.useExtendedSecurity", true);
        LM_COMPATIBILITY = Config.getInt("jcifs.smb.lmCompatibility", 3);
        PID = (int)(65536.0 * Math.random());
        USE_BATCHING = Config.getBoolean("jcifs.smb.client.useBatching", true);
        if (SmbConstants.USE_EXTSEC) {
            n2 = 2048;
        }
        else {
            n2 = 0;
        }
        n3 = (n2 | 0x3);
        if (SmbConstants.SIGNPREF) {
            n4 = n;
        }
        else {
            n4 = 0;
        }
        n5 = (n3 | n4);
        if (SmbConstants.USE_NTSTATUS) {
            n6 = 16384;
        }
        else {
            n6 = 0;
        }
        n7 = (n5 | n6);
        if (SmbConstants.USE_UNICODE) {
            n8 = 32768;
        }
        else {
            n8 = 0;
        }
        DEFAULT_FLAGS2 = (n8 | n7);
        if (SmbConstants.USE_NTSMBS) {
            n9 = 16;
        }
        else {
            n9 = 0;
        }
        if (SmbConstants.USE_NTSTATUS) {
            n10 = 64;
        }
        else {
            n10 = 0;
        }
        n11 = (n9 | n10);
        if (!SmbConstants.USE_UNICODE) {
            n = 0;
        }
        DEFAULT_CAPABILITIES = (0x1000 | (n11 | n));
        FLAGS2 = Config.getInt("jcifs.smb.client.flags2", SmbConstants.DEFAULT_FLAGS2);
        CAPABILITIES = Config.getInt("jcifs.smb.client.capabilities", SmbConstants.DEFAULT_CAPABILITIES);
        TCP_NODELAY = Config.getBoolean("jcifs.smb.client.tcpNoDelay", false);
        RESPONSE_TIMEOUT = Config.getInt("jcifs.smb.client.responseTimeout", 30000);
        SSN_LIMIT = Config.getInt("jcifs.smb.client.ssnLimit", 250);
        SO_TIMEOUT = Config.getInt("jcifs.smb.client.soTimeout", 35000);
    }
}
