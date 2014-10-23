package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;
import jcifs.dcerpc.ndr.*;

public class netdfs
{
    public static final int DFS_STORAGE_STATE_ACTIVE = 4;
    public static final int DFS_STORAGE_STATE_OFFLINE = 1;
    public static final int DFS_STORAGE_STATE_ONLINE = 2;
    public static final int DFS_VOLUME_FLAVOR_AD_BLOB = 512;
    public static final int DFS_VOLUME_FLAVOR_STANDALONE = 256;
    
    public static String getSyntax() {
        return "4fc742e0-4a10-11cf-8273-00aa004ae673:3.0";
    }
    
    public static class DfsEnumArray1 extends NdrObject
    {
        public int count;
        public DfsInfo1[] s;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 4);
                if (this.s == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.s = new DfsInfo1[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.s[i] == null) {
                        this.s[i] = new DfsInfo1();
                    }
                    this.s[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.s, 1);
            if (this.s != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 4);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.s[i].encode(derive);
                }
            }
        }
    }
    
    public static class DfsEnumArray200 extends NdrObject
    {
        public int count;
        public DfsInfo200[] s;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 4);
                if (this.s == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.s = new DfsInfo200[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.s[i] == null) {
                        this.s[i] = new DfsInfo200();
                    }
                    this.s[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.s, 1);
            if (this.s != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 4);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.s[i].encode(derive);
                }
            }
        }
    }
    
    public static class DfsEnumArray3 extends NdrObject
    {
        public int count;
        public DfsInfo3[] s;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 20);
                if (this.s == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.s = new DfsInfo3[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.s[i] == null) {
                        this.s[i] = new DfsInfo3();
                    }
                    this.s[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.s, 1);
            if (this.s != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 20);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.s[i].encode(derive);
                }
            }
        }
    }
    
    public static class DfsEnumArray300 extends NdrObject
    {
        public int count;
        public DfsInfo300[] s;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 8);
                if (this.s == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.s = new DfsInfo300[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.s[i] == null) {
                        this.s[i] = new DfsInfo300();
                    }
                    this.s[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.s, 1);
            if (this.s != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 8);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.s[i].encode(derive);
                }
            }
        }
    }
    
    public static class DfsEnumStruct extends NdrObject
    {
        public NdrObject e;
        public int level;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.level = ndrBuffer.dec_ndr_long();
            ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                if (this.e == null) {
                    this.e = new DfsEnumArray1();
                }
                this.e.decode(ndrBuffer.deferred);
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.level);
            ndrBuffer.enc_ndr_long(this.level);
            ndrBuffer.enc_ndr_referent(this.e, 1);
            if (this.e != null) {
                this.e.encode(ndrBuffer.deferred);
            }
        }
    }
    
    public static class DfsInfo1 extends NdrObject
    {
        public String entry_path;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            if (ndrBuffer.dec_ndr_long() != 0) {
                this.entry_path = ndrBuffer.deferred.dec_ndr_string();
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_referent(this.entry_path, 1);
            if (this.entry_path != null) {
                ndrBuffer.deferred.enc_ndr_string(this.entry_path);
            }
        }
    }
    
    public static class DfsInfo200 extends NdrObject
    {
        public String dfs_name;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            if (ndrBuffer.dec_ndr_long() != 0) {
                this.dfs_name = ndrBuffer.deferred.dec_ndr_string();
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_referent(this.dfs_name, 1);
            if (this.dfs_name != null) {
                ndrBuffer.deferred.enc_ndr_string(this.dfs_name);
            }
        }
    }
    
    public static class DfsInfo3 extends NdrObject
    {
        public String comment;
        public int num_stores;
        public String path;
        public int state;
        public DfsStorageInfo[] stores;
        
        public void decode(NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            final int dec_ndr_long = ndrBuffer.dec_ndr_long();
            final int dec_ndr_long2 = ndrBuffer.dec_ndr_long();
            this.state = ndrBuffer.dec_ndr_long();
            this.num_stores = ndrBuffer.dec_ndr_long();
            final int dec_ndr_long3 = ndrBuffer.dec_ndr_long();
            if (dec_ndr_long != 0) {
                ndrBuffer = ndrBuffer.deferred;
                this.path = ndrBuffer.dec_ndr_string();
            }
            if (dec_ndr_long2 != 0) {
                ndrBuffer = ndrBuffer.deferred;
                this.comment = ndrBuffer.dec_ndr_string();
            }
            if (dec_ndr_long3 != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long4 = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long4 * 12);
                if (this.stores == null) {
                    if (dec_ndr_long4 < 0 || dec_ndr_long4 > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.stores = new DfsStorageInfo[dec_ndr_long4];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long4; ++i) {
                    if (this.stores[i] == null) {
                        this.stores[i] = new DfsStorageInfo();
                    }
                    this.stores[i].decode(derive);
                }
            }
        }
        
        public void encode(NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_referent(this.path, 1);
            ndrBuffer.enc_ndr_referent(this.comment, 1);
            ndrBuffer.enc_ndr_long(this.state);
            ndrBuffer.enc_ndr_long(this.num_stores);
            ndrBuffer.enc_ndr_referent(this.stores, 1);
            if (this.path != null) {
                ndrBuffer = ndrBuffer.deferred;
                ndrBuffer.enc_ndr_string(this.path);
            }
            if (this.comment != null) {
                ndrBuffer = ndrBuffer.deferred;
                ndrBuffer.enc_ndr_string(this.comment);
            }
            if (this.stores != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int num_stores = this.num_stores;
                deferred.enc_ndr_long(num_stores);
                final int index = deferred.index;
                deferred.advance(num_stores * 12);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < num_stores; ++i) {
                    this.stores[i].encode(derive);
                }
            }
        }
    }
    
    public static class DfsInfo300 extends NdrObject
    {
        public String dfs_name;
        public int flags;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.flags = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                this.dfs_name = ndrBuffer.deferred.dec_ndr_string();
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.flags);
            ndrBuffer.enc_ndr_referent(this.dfs_name, 1);
            if (this.dfs_name != null) {
                ndrBuffer.deferred.enc_ndr_string(this.dfs_name);
            }
        }
    }
    
    public static class DfsStorageInfo extends NdrObject
    {
        public String server_name;
        public String share_name;
        public int state;
        
        public void decode(NdrBuffer deferred) throws NdrException {
            deferred.align(4);
            this.state = deferred.dec_ndr_long();
            final int dec_ndr_long = deferred.dec_ndr_long();
            final int dec_ndr_long2 = deferred.dec_ndr_long();
            if (dec_ndr_long != 0) {
                deferred = deferred.deferred;
                this.server_name = deferred.dec_ndr_string();
            }
            if (dec_ndr_long2 != 0) {
                this.share_name = deferred.deferred.dec_ndr_string();
            }
        }
        
        public void encode(NdrBuffer deferred) throws NdrException {
            deferred.align(4);
            deferred.enc_ndr_long(this.state);
            deferred.enc_ndr_referent(this.server_name, 1);
            deferred.enc_ndr_referent(this.share_name, 1);
            if (this.server_name != null) {
                deferred = deferred.deferred;
                deferred.enc_ndr_string(this.server_name);
            }
            if (this.share_name != null) {
                deferred.deferred.enc_ndr_string(this.share_name);
            }
        }
    }
    
    public static class NetrDfsEnumEx extends DcerpcMessage
    {
        public String dfs_name;
        public DfsEnumStruct info;
        public int level;
        public int prefmaxlen;
        public int retval;
        public NdrLong totalentries;
        
        public NetrDfsEnumEx(final String dfs_name, final int level, final int prefmaxlen, final DfsEnumStruct info, final NdrLong totalentries) {
            super();
            this.dfs_name = dfs_name;
            this.level = level;
            this.prefmaxlen = prefmaxlen;
            this.info = info;
            this.totalentries = totalentries;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            if (ndrBuffer.dec_ndr_long() != 0) {
                if (this.info == null) {
                    this.info = new DfsEnumStruct();
                }
                this.info.decode(ndrBuffer);
            }
            if (ndrBuffer.dec_ndr_long() != 0) {
                this.totalentries.decode(ndrBuffer);
            }
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.enc_ndr_string(this.dfs_name);
            ndrBuffer.enc_ndr_long(this.level);
            ndrBuffer.enc_ndr_long(this.prefmaxlen);
            ndrBuffer.enc_ndr_referent(this.info, 1);
            if (this.info != null) {
                this.info.encode(ndrBuffer);
            }
            ndrBuffer.enc_ndr_referent(this.totalentries, 1);
            if (this.totalentries != null) {
                this.totalentries.encode(ndrBuffer);
            }
        }
        
        public int getOpnum() {
            return 21;
        }
    }
}
