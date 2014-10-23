package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;
import jcifs.dcerpc.ndr.*;

public class samr
{
    public static final int ACB_AUTOLOCK = 1024;
    public static final int ACB_DISABLED = 1;
    public static final int ACB_DOMTRUST = 64;
    public static final int ACB_DONT_REQUIRE_PREAUTH = 65536;
    public static final int ACB_ENC_TXT_PWD_ALLOWED = 2048;
    public static final int ACB_HOMDIRREQ = 2;
    public static final int ACB_MNS = 32;
    public static final int ACB_NORMAL = 16;
    public static final int ACB_NOT_DELEGATED = 16384;
    public static final int ACB_PWNOEXP = 512;
    public static final int ACB_PWNOTREQ = 4;
    public static final int ACB_SMARTCARD_REQUIRED = 4096;
    public static final int ACB_SVRTRUST = 256;
    public static final int ACB_TEMPDUP = 8;
    public static final int ACB_TRUSTED_FOR_DELEGATION = 8192;
    public static final int ACB_USE_DES_KEY_ONLY = 32768;
    public static final int ACB_WSTRUST = 128;
    public static final int SE_GROUP_ENABLED = 4;
    public static final int SE_GROUP_ENABLED_BY_DEFAULT = 2;
    public static final int SE_GROUP_LOGON_ID = -1073741824;
    public static final int SE_GROUP_MANDATORY = 1;
    public static final int SE_GROUP_OWNER = 8;
    public static final int SE_GROUP_RESOURCE = 536870912;
    public static final int SE_GROUP_USE_FOR_DENY_ONLY = 16;
    
    public static String getSyntax() {
        return "12345778-1234-abcd-ef00-0123456789ac:1.0";
    }
    
    public static class SamrCloseHandle extends DcerpcMessage
    {
        public rpc.policy_handle handle;
        public int retval;
        
        public SamrCloseHandle(final rpc.policy_handle handle) {
            super();
            this.handle = handle;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            this.handle.encode(ndrBuffer);
        }
        
        public int getOpnum() {
            return 1;
        }
    }
    
    public static class SamrConnect2 extends DcerpcMessage
    {
        public int access_mask;
        public rpc.policy_handle handle;
        public int retval;
        public String system_name;
        
        public SamrConnect2(final String system_name, final int access_mask, final rpc.policy_handle handle) {
            super();
            this.system_name = system_name;
            this.access_mask = access_mask;
            this.handle = handle;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            this.handle.decode(ndrBuffer);
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.enc_ndr_referent(this.system_name, 1);
            if (this.system_name != null) {
                ndrBuffer.enc_ndr_string(this.system_name);
            }
            ndrBuffer.enc_ndr_long(this.access_mask);
        }
        
        public int getOpnum() {
            return 57;
        }
    }
    
    public static class SamrConnect4 extends DcerpcMessage
    {
        public int access_mask;
        public rpc.policy_handle handle;
        public int retval;
        public String system_name;
        public int unknown;
        
        public SamrConnect4(final String system_name, final int unknown, final int access_mask, final rpc.policy_handle handle) {
            super();
            this.system_name = system_name;
            this.unknown = unknown;
            this.access_mask = access_mask;
            this.handle = handle;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            this.handle.decode(ndrBuffer);
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.enc_ndr_referent(this.system_name, 1);
            if (this.system_name != null) {
                ndrBuffer.enc_ndr_string(this.system_name);
            }
            ndrBuffer.enc_ndr_long(this.unknown);
            ndrBuffer.enc_ndr_long(this.access_mask);
        }
        
        public int getOpnum() {
            return 62;
        }
    }
    
    public static class SamrEnumerateAliasesInDomain extends DcerpcMessage
    {
        public int acct_flags;
        public rpc.policy_handle domain_handle;
        public int num_entries;
        public int resume_handle;
        public int retval;
        public SamrSamArray sam;
        
        public SamrEnumerateAliasesInDomain(final rpc.policy_handle domain_handle, final int resume_handle, final int acct_flags, final SamrSamArray sam, final int num_entries) {
            super();
            this.domain_handle = domain_handle;
            this.resume_handle = resume_handle;
            this.acct_flags = acct_flags;
            this.sam = sam;
            this.num_entries = num_entries;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            this.resume_handle = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                if (this.sam == null) {
                    this.sam = new SamrSamArray();
                }
                this.sam.decode(ndrBuffer);
            }
            this.num_entries = ndrBuffer.dec_ndr_long();
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            this.domain_handle.encode(ndrBuffer);
            ndrBuffer.enc_ndr_long(this.resume_handle);
            ndrBuffer.enc_ndr_long(this.acct_flags);
        }
        
        public int getOpnum() {
            return 15;
        }
    }
    
    public static class SamrGetMembersInAlias extends DcerpcMessage
    {
        public rpc.policy_handle alias_handle;
        public int retval;
        public lsarpc.LsarSidArray sids;
        
        public SamrGetMembersInAlias(final rpc.policy_handle alias_handle, final lsarpc.LsarSidArray sids) {
            super();
            this.alias_handle = alias_handle;
            this.sids = sids;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            this.sids.decode(ndrBuffer);
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            this.alias_handle.encode(ndrBuffer);
        }
        
        public int getOpnum() {
            return 33;
        }
    }
    
    public static class SamrOpenAlias extends DcerpcMessage
    {
        public int access_mask;
        public rpc.policy_handle alias_handle;
        public rpc.policy_handle domain_handle;
        public int retval;
        public int rid;
        
        public SamrOpenAlias(final rpc.policy_handle domain_handle, final int access_mask, final int rid, final rpc.policy_handle alias_handle) {
            super();
            this.domain_handle = domain_handle;
            this.access_mask = access_mask;
            this.rid = rid;
            this.alias_handle = alias_handle;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            this.alias_handle.decode(ndrBuffer);
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            this.domain_handle.encode(ndrBuffer);
            ndrBuffer.enc_ndr_long(this.access_mask);
            ndrBuffer.enc_ndr_long(this.rid);
        }
        
        public int getOpnum() {
            return 27;
        }
    }
    
    public static class SamrOpenDomain extends DcerpcMessage
    {
        public int access_mask;
        public rpc.policy_handle domain_handle;
        public rpc.policy_handle handle;
        public int retval;
        public rpc.sid_t sid;
        
        public SamrOpenDomain(final rpc.policy_handle handle, final int access_mask, final rpc.sid_t sid, final rpc.policy_handle domain_handle) {
            super();
            this.handle = handle;
            this.access_mask = access_mask;
            this.sid = sid;
            this.domain_handle = domain_handle;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            this.domain_handle.decode(ndrBuffer);
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            this.handle.encode(ndrBuffer);
            ndrBuffer.enc_ndr_long(this.access_mask);
            this.sid.encode(ndrBuffer);
        }
        
        public int getOpnum() {
            return 7;
        }
    }
    
    public static class SamrRidWithAttribute extends NdrObject
    {
        public int attributes;
        public int rid;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.rid = ndrBuffer.dec_ndr_long();
            this.attributes = ndrBuffer.dec_ndr_long();
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.rid);
            ndrBuffer.enc_ndr_long(this.attributes);
        }
    }
    
    public static class SamrRidWithAttributeArray extends NdrObject
    {
        public int count;
        public SamrRidWithAttribute[] rids;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 8);
                if (this.rids == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.rids = new SamrRidWithAttribute[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.rids[i] == null) {
                        this.rids[i] = new SamrRidWithAttribute();
                    }
                    this.rids[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.rids, 1);
            if (this.rids != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 8);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.rids[i].encode(derive);
                }
            }
        }
    }
    
    public static class SamrSamArray extends NdrObject
    {
        public int count;
        public SamrSamEntry[] entries;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 12);
                if (this.entries == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.entries = new SamrSamEntry[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.entries[i] == null) {
                        this.entries[i] = new SamrSamEntry();
                    }
                    this.entries[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.entries, 1);
            if (this.entries != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 12);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.entries[i].encode(derive);
                }
            }
        }
    }
    
    public static class SamrSamEntry extends NdrObject
    {
        public int idx;
        public rpc.unicode_string name;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.idx = ndrBuffer.dec_ndr_long();
            ndrBuffer.align(4);
            if (this.name == null) {
                this.name = new rpc.unicode_string();
            }
            this.name.length = (short)ndrBuffer.dec_ndr_short();
            this.name.maximum_length = (short)ndrBuffer.dec_ndr_short();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                deferred.dec_ndr_long();
                final int dec_ndr_long2 = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long2 * 2);
                if (this.name.buffer == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.name.buffer = new short[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long2; ++i) {
                    this.name.buffer[i] = (short)derive.dec_ndr_short();
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.idx);
            ndrBuffer.enc_ndr_short(this.name.length);
            ndrBuffer.enc_ndr_short(this.name.maximum_length);
            ndrBuffer.enc_ndr_referent(this.name.buffer, 1);
            if (this.name.buffer != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final short n = this.name.length / 2;
                deferred.enc_ndr_long(this.name.maximum_length / 2);
                deferred.enc_ndr_long(0);
                deferred.enc_ndr_long(n);
                final int index = deferred.index;
                deferred.advance(n * 2);
                final NdrBuffer derive = deferred.derive(index);
                for (short n2 = 0; n2 < n; ++n2) {
                    derive.enc_ndr_short(this.name.buffer[n2]);
                }
            }
        }
    }
}
