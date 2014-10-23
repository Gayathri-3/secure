package jcifs.smb;

import jcifs.util.*;

class NetServerEnum2Response extends SmbComTransactionResponse
{
    private int converter;
    String lastName;
    private int totalAvailableEntries;
    
    int readDataWireFormat(final byte[] array, int n, final int n2) {
        final int n3 = n;
        ServerInfo1 serverInfo1 = null;
        this.results = new ServerInfo1[this.numEntries];
        for (int i = 0; i < this.numEntries; ++i) {
            final FileEntry[] results = this.results;
            serverInfo1 = new ServerInfo1();
            results[i] = serverInfo1;
            serverInfo1.name = this.readString(array, n, 16, false);
            final int n4 = n + 16;
            final int n5 = n4 + 1;
            serverInfo1.versionMajor = (0xFF & array[n4]);
            final int n6 = n5 + 1;
            serverInfo1.versionMinor = (0xFF & array[n5]);
            serverInfo1.type = ServerMessageBlock.readInt4(array, n6);
            final int n7 = n6 + 4;
            final int int4 = ServerMessageBlock.readInt4(array, n7);
            n = n7 + 4;
            serverInfo1.commentOrMasterBrowser = this.readString(array, n3 + ((0xFFFF & int4) - this.converter), 48, false);
            final LogStream log = NetServerEnum2Response.log;
            if (LogStream.level >= 4) {
                NetServerEnum2Response.log.println(serverInfo1);
            }
        }
        String name;
        if (this.numEntries == 0) {
            name = null;
        }
        else {
            name = serverInfo1.name;
        }
        this.lastName = name;
        return n - n3;
    }
    
    int readParametersWireFormat(final byte[] array, final int n, final int n2) {
        this.status = ServerMessageBlock.readInt2(array, n);
        final int n3 = n + 2;
        this.converter = ServerMessageBlock.readInt2(array, n3);
        final int n4 = n3 + 2;
        this.numEntries = ServerMessageBlock.readInt2(array, n4);
        final int n5 = n4 + 2;
        this.totalAvailableEntries = ServerMessageBlock.readInt2(array, n5);
        return n5 + 2 - n;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    public String toString() {
        return new String("NetServerEnum2Response[" + super.toString() + ",status=" + this.status + ",converter=" + this.converter + ",entriesReturned=" + this.numEntries + ",totalAvailableEntries=" + this.totalAvailableEntries + ",lastName=" + this.lastName + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    class ServerInfo1 implements FileEntry
    {
        String commentOrMasterBrowser;
        String name;
        int type;
        int versionMajor;
        int versionMinor;
        
        public long createTime() {
            return 0L;
        }
        
        public int getAttributes() {
            return 17;
        }
        
        public String getName() {
            return this.name;
        }
        
        public int getType() {
            int n;
            if ((Integer.MIN_VALUE & this.type) != 0x0) {
                n = 2;
            }
            else {
                n = 4;
            }
            return n;
        }
        
        public long lastModified() {
            return 0L;
        }
        
        public long length() {
            return 0L;
        }
        
        public String toString() {
            return new String("ServerInfo1[name=" + this.name + ",versionMajor=" + this.versionMajor + ",versionMinor=" + this.versionMinor + ",type=0x" + Hexdump.toHexString(this.type, 8) + ",commentOrMasterBrowser=" + this.commentOrMasterBrowser + "]");
        }
    }
}
