package jcifs.smb;

import jcifs.*;
import jcifs.util.*;

class Trans2FindFirst2 extends SmbComTransaction
{
    private static final int DEFAULT_LIST_COUNT = 200;
    private static final int DEFAULT_LIST_SIZE = 65535;
    private static final int FLAGS_CLOSE_AFTER_THIS_REQUEST = 1;
    private static final int FLAGS_CLOSE_IF_END_REACHED = 2;
    private static final int FLAGS_FIND_WITH_BACKUP_INTENT = 16;
    private static final int FLAGS_RESUME_FROM_PREVIOUS_END = 8;
    private static final int FLAGS_RETURN_RESUME_KEYS = 4;
    static final int LIST_COUNT = 0;
    static final int LIST_SIZE = 0;
    static final int SMB_FILE_BOTH_DIRECTORY_INFO = 260;
    static final int SMB_FILE_NAMES_INFO = 259;
    static final int SMB_FIND_FILE_DIRECTORY_INFO = 257;
    static final int SMB_FIND_FILE_FULL_DIRECTORY_INFO = 258;
    static final int SMB_INFO_QUERY_EAS_FROM_LIST = 3;
    static final int SMB_INFO_QUERY_EA_SIZE = 2;
    static final int SMB_INFO_STANDARD = 1;
    private int flags;
    private int informationLevel;
    private int searchAttributes;
    private int searchStorageType;
    private String wildcard;
    
    static {
        LIST_SIZE = Config.getInt("jcifs.smb.client.listSize", 65535);
        LIST_COUNT = Config.getInt("jcifs.smb.client.listCount", 200);
    }
    
    Trans2FindFirst2(final String path, final String wildcard, final int n) {
        super();
        this.searchStorageType = 0;
        if (path.equals("\\")) {
            this.path = path;
        }
        else {
            this.path = String.valueOf(path) + "\\";
        }
        this.wildcard = wildcard;
        this.searchAttributes = (n & 0x37);
        this.command = 50;
        this.subCommand = 1;
        this.flags = 0;
        this.informationLevel = 260;
        this.totalDataCount = 0;
        this.maxParameterCount = 10;
        this.maxDataCount = Trans2FindFirst2.LIST_SIZE;
        this.maxSetupCount = 0;
    }
    
    int readDataWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readParametersWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    public String toString() {
        return new String("Trans2FindFirst2[" + super.toString() + ",searchAttributes=0x" + Hexdump.toHexString(this.searchAttributes, 2) + ",searchCount=" + Trans2FindFirst2.LIST_COUNT + ",flags=0x" + Hexdump.toHexString(this.flags, 2) + ",informationLevel=0x" + Hexdump.toHexString(this.informationLevel, 3) + ",searchStorageType=" + this.searchStorageType + ",filename=" + this.path + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        ServerMessageBlock.writeInt2(this.searchAttributes, array, n);
        final int n2 = n + 2;
        ServerMessageBlock.writeInt2(Trans2FindFirst2.LIST_COUNT, array, n2);
        final int n3 = n2 + 2;
        ServerMessageBlock.writeInt2(this.flags, array, n3);
        final int n4 = n3 + 2;
        ServerMessageBlock.writeInt2(this.informationLevel, array, n4);
        final int n5 = n4 + 2;
        ServerMessageBlock.writeInt4(this.searchStorageType, array, n5);
        final int n6 = n5 + 4;
        return n6 + this.writeString(String.valueOf(this.path) + this.wildcard, array, n6) - n;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        final int n2 = n + 1;
        array[n] = this.subCommand;
        array[n2] = 0;
        return 2;
    }
}
