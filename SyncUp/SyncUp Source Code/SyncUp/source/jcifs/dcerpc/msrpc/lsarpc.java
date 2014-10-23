package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;
import jcifs.dcerpc.ndr.*;

public class lsarpc
{
    public static final int POLICY_INFO_ACCOUNT_DOMAIN = 5;
    public static final int POLICY_INFO_AUDIT_EVENTS = 2;
    public static final int POLICY_INFO_DNS_DOMAIN = 12;
    public static final int POLICY_INFO_MODIFICATION = 9;
    public static final int POLICY_INFO_PRIMARY_DOMAIN = 3;
    public static final int POLICY_INFO_SERVER_ROLE = 6;
    public static final int SID_NAME_ALIAS = 4;
    public static final int SID_NAME_DELETED = 6;
    public static final int SID_NAME_DOMAIN = 3;
    public static final int SID_NAME_DOM_GRP = 2;
    public static final int SID_NAME_INVALID = 7;
    public static final int SID_NAME_UNKNOWN = 8;
    public static final int SID_NAME_USER = 1;
    public static final int SID_NAME_USE_NONE = 0;
    public static final int SID_NAME_WKN_GRP = 5;
    
    public static String getSyntax() {
        return "12345778-1234-abcd-ef00-0123456789ab:0.0";
    }
    
    public static class LsarClose extends DcerpcMessage
    {
        public rpc.policy_handle handle;
        public int retval;
        
        public LsarClose(final rpc.policy_handle handle) {
            super();
            this.handle = handle;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            this.handle.decode(ndrBuffer);
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            this.handle.encode(ndrBuffer);
        }
        
        public int getOpnum() {
            return 0;
        }
    }
    
    public static class LsarDnsDomainInfo extends NdrObject
    {
        public rpc.unicode_string dns_domain;
        public rpc.unicode_string dns_forest;
        public rpc.uuid_t domain_guid;
        public rpc.unicode_string name;
        public rpc.sid_t sid;
        
        public void decode(NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.align(4);
            if (this.name == null) {
                this.name = new rpc.unicode_string();
            }
            this.name.length = (short)ndrBuffer.dec_ndr_short();
            this.name.maximum_length = (short)ndrBuffer.dec_ndr_short();
            final int dec_ndr_long = ndrBuffer.dec_ndr_long();
            ndrBuffer.align(4);
            if (this.dns_domain == null) {
                this.dns_domain = new rpc.unicode_string();
            }
            this.dns_domain.length = (short)ndrBuffer.dec_ndr_short();
            this.dns_domain.maximum_length = (short)ndrBuffer.dec_ndr_short();
            final int dec_ndr_long2 = ndrBuffer.dec_ndr_long();
            ndrBuffer.align(4);
            if (this.dns_forest == null) {
                this.dns_forest = new rpc.unicode_string();
            }
            this.dns_forest.length = (short)ndrBuffer.dec_ndr_short();
            this.dns_forest.maximum_length = (short)ndrBuffer.dec_ndr_short();
            final int dec_ndr_long3 = ndrBuffer.dec_ndr_long();
            ndrBuffer.align(4);
            if (this.domain_guid == null) {
                this.domain_guid = new rpc.uuid_t();
            }
            this.domain_guid.time_low = ndrBuffer.dec_ndr_long();
            this.domain_guid.time_mid = (short)ndrBuffer.dec_ndr_short();
            this.domain_guid.time_hi_and_version = (short)ndrBuffer.dec_ndr_short();
            this.domain_guid.clock_seq_hi_and_reserved = (byte)ndrBuffer.dec_ndr_small();
            this.domain_guid.clock_seq_low = (byte)ndrBuffer.dec_ndr_small();
            final int index = ndrBuffer.index;
            ndrBuffer.advance(6);
            final int dec_ndr_long4 = ndrBuffer.dec_ndr_long();
            if (dec_ndr_long != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long5 = deferred.dec_ndr_long();
                deferred.dec_ndr_long();
                final int dec_ndr_long6 = deferred.dec_ndr_long();
                final int index2 = deferred.index;
                deferred.advance(dec_ndr_long6 * 2);
                if (this.name.buffer == null) {
                    if (dec_ndr_long5 < 0 || dec_ndr_long5 > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.name.buffer = new short[dec_ndr_long5];
                }
                ndrBuffer = deferred.derive(index2);
                for (int i = 0; i < dec_ndr_long6; ++i) {
                    this.name.buffer[i] = (short)ndrBuffer.dec_ndr_short();
                }
            }
            if (dec_ndr_long2 != 0) {
                final NdrBuffer deferred2 = ndrBuffer.deferred;
                final int dec_ndr_long7 = deferred2.dec_ndr_long();
                deferred2.dec_ndr_long();
                final int dec_ndr_long8 = deferred2.dec_ndr_long();
                final int index3 = deferred2.index;
                deferred2.advance(dec_ndr_long8 * 2);
                if (this.dns_domain.buffer == null) {
                    if (dec_ndr_long7 < 0 || dec_ndr_long7 > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.dns_domain.buffer = new short[dec_ndr_long7];
                }
                ndrBuffer = deferred2.derive(index3);
                for (int j = 0; j < dec_ndr_long8; ++j) {
                    this.dns_domain.buffer[j] = (short)ndrBuffer.dec_ndr_short();
                }
            }
            if (dec_ndr_long3 != 0) {
                final NdrBuffer deferred3 = ndrBuffer.deferred;
                final int dec_ndr_long9 = deferred3.dec_ndr_long();
                deferred3.dec_ndr_long();
                final int dec_ndr_long10 = deferred3.dec_ndr_long();
                final int index4 = deferred3.index;
                deferred3.advance(dec_ndr_long10 * 2);
                if (this.dns_forest.buffer == null) {
                    if (dec_ndr_long9 < 0 || dec_ndr_long9 > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.dns_forest.buffer = new short[dec_ndr_long9];
                }
                ndrBuffer = deferred3.derive(index4);
                for (int k = 0; k < dec_ndr_long10; ++k) {
                    this.dns_forest.buffer[k] = (short)ndrBuffer.dec_ndr_short();
                }
            }
            if (this.domain_guid.node == null) {
                if (6 < 0 || 6 > 65535) {
                    throw new NdrException("invalid array conformance");
                }
                this.domain_guid.node = new byte[6];
            }
            final NdrBuffer derive = ndrBuffer.derive(index);
            for (int l = 0; l < 6; ++l) {
                this.domain_guid.node[l] = (byte)derive.dec_ndr_small();
            }
            if (dec_ndr_long4 != 0) {
                if (this.sid == null) {
                    this.sid = new rpc.sid_t();
                }
                this.sid.decode(derive.deferred);
            }
        }
        
        public void encode(NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_short(this.name.length);
            ndrBuffer.enc_ndr_short(this.name.maximum_length);
            ndrBuffer.enc_ndr_referent(this.name.buffer, 1);
            ndrBuffer.enc_ndr_short(this.dns_domain.length);
            ndrBuffer.enc_ndr_short(this.dns_domain.maximum_length);
            ndrBuffer.enc_ndr_referent(this.dns_domain.buffer, 1);
            ndrBuffer.enc_ndr_short(this.dns_forest.length);
            ndrBuffer.enc_ndr_short(this.dns_forest.maximum_length);
            ndrBuffer.enc_ndr_referent(this.dns_forest.buffer, 1);
            ndrBuffer.enc_ndr_long(this.domain_guid.time_low);
            ndrBuffer.enc_ndr_short(this.domain_guid.time_mid);
            ndrBuffer.enc_ndr_short(this.domain_guid.time_hi_and_version);
            ndrBuffer.enc_ndr_small(this.domain_guid.clock_seq_hi_and_reserved);
            ndrBuffer.enc_ndr_small(this.domain_guid.clock_seq_low);
            final int index = ndrBuffer.index;
            ndrBuffer.advance(6);
            ndrBuffer.enc_ndr_referent(this.sid, 1);
            if (this.name.buffer != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final short n = this.name.length / 2;
                deferred.enc_ndr_long(this.name.maximum_length / 2);
                deferred.enc_ndr_long(0);
                deferred.enc_ndr_long(n);
                final int index2 = deferred.index;
                deferred.advance(n * 2);
                ndrBuffer = deferred.derive(index2);
                for (short n2 = 0; n2 < n; ++n2) {
                    ndrBuffer.enc_ndr_short(this.name.buffer[n2]);
                }
            }
            if (this.dns_domain.buffer != null) {
                final NdrBuffer deferred2 = ndrBuffer.deferred;
                final short n3 = this.dns_domain.length / 2;
                deferred2.enc_ndr_long(this.dns_domain.maximum_length / 2);
                deferred2.enc_ndr_long(0);
                deferred2.enc_ndr_long(n3);
                final int index3 = deferred2.index;
                deferred2.advance(n3 * 2);
                ndrBuffer = deferred2.derive(index3);
                for (short n4 = 0; n4 < n3; ++n4) {
                    ndrBuffer.enc_ndr_short(this.dns_domain.buffer[n4]);
                }
            }
            if (this.dns_forest.buffer != null) {
                final NdrBuffer deferred3 = ndrBuffer.deferred;
                final short n5 = this.dns_forest.length / 2;
                deferred3.enc_ndr_long(this.dns_forest.maximum_length / 2);
                deferred3.enc_ndr_long(0);
                deferred3.enc_ndr_long(n5);
                final int index4 = deferred3.index;
                deferred3.advance(n5 * 2);
                ndrBuffer = deferred3.derive(index4);
                for (short n6 = 0; n6 < n5; ++n6) {
                    ndrBuffer.enc_ndr_short(this.dns_forest.buffer[n6]);
                }
            }
            final NdrBuffer derive = ndrBuffer.derive(index);
            for (int i = 0; i < 6; ++i) {
                derive.enc_ndr_small(this.domain_guid.node[i]);
            }
            if (this.sid != null) {
                this.sid.encode(derive.deferred);
            }
        }
    }
    
    public static class LsarDomainInfo extends NdrObject
    {
        public rpc.unicode_string name;
        public rpc.sid_t sid;
        
        public void decode(NdrBuffer derive) throws NdrException {
            derive.align(4);
            derive.align(4);
            if (this.name == null) {
                this.name = new rpc.unicode_string();
            }
            this.name.length = (short)derive.dec_ndr_short();
            this.name.maximum_length = (short)derive.dec_ndr_short();
            final int dec_ndr_long = derive.dec_ndr_long();
            final int dec_ndr_long2 = derive.dec_ndr_long();
            if (dec_ndr_long != 0) {
                final NdrBuffer deferred = derive.deferred;
                final int dec_ndr_long3 = deferred.dec_ndr_long();
                deferred.dec_ndr_long();
                final int dec_ndr_long4 = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long4 * 2);
                if (this.name.buffer == null) {
                    if (dec_ndr_long3 < 0 || dec_ndr_long3 > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.name.buffer = new short[dec_ndr_long3];
                }
                derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long4; ++i) {
                    this.name.buffer[i] = (short)derive.dec_ndr_short();
                }
            }
            if (dec_ndr_long2 != 0) {
                if (this.sid == null) {
                    this.sid = new rpc.sid_t();
                }
                this.sid.decode(derive.deferred);
            }
        }
        
        public void encode(NdrBuffer derive) throws NdrException {
            derive.align(4);
            derive.enc_ndr_short(this.name.length);
            derive.enc_ndr_short(this.name.maximum_length);
            derive.enc_ndr_referent(this.name.buffer, 1);
            derive.enc_ndr_referent(this.sid, 1);
            if (this.name.buffer != null) {
                final NdrBuffer deferred = derive.deferred;
                final short n = this.name.length / 2;
                deferred.enc_ndr_long(this.name.maximum_length / 2);
                deferred.enc_ndr_long(0);
                deferred.enc_ndr_long(n);
                final int index = deferred.index;
                deferred.advance(n * 2);
                derive = deferred.derive(index);
                for (short n2 = 0; n2 < n; ++n2) {
                    derive.enc_ndr_short(this.name.buffer[n2]);
                }
            }
            if (this.sid != null) {
                this.sid.encode(derive.deferred);
            }
        }
    }
    
    public static class LsarLookupSids extends DcerpcMessage
    {
        public int count;
        public LsarRefDomainList domains;
        public rpc.policy_handle handle;
        public short level;
        public LsarTransNameArray names;
        public int retval;
        public LsarSidArray sids;
        
        public LsarLookupSids(final rpc.policy_handle handle, final LsarSidArray sids, final LsarRefDomainList domains, final LsarTransNameArray names, final short level, final int count) {
            super();
            this.handle = handle;
            this.sids = sids;
            this.domains = domains;
            this.names = names;
            this.level = level;
            this.count = count;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            if (ndrBuffer.dec_ndr_long() != 0) {
                if (this.domains == null) {
                    this.domains = new LsarRefDomainList();
                }
                this.domains.decode(ndrBuffer);
            }
            this.names.decode(ndrBuffer);
            this.count = ndrBuffer.dec_ndr_long();
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            this.handle.encode(ndrBuffer);
            this.sids.encode(ndrBuffer);
            this.names.encode(ndrBuffer);
            ndrBuffer.enc_ndr_short(this.level);
            ndrBuffer.enc_ndr_long(this.count);
        }
        
        public int getOpnum() {
            return 15;
        }
    }
    
    public static class LsarObjectAttributes extends NdrObject
    {
        public int attributes;
        public int length;
        public rpc.unicode_string object_name;
        public NdrSmall root_directory;
        public int security_descriptor;
        public LsarQosInfo security_quality_of_service;
        
        public void decode(NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.length = ndrBuffer.dec_ndr_long();
            final int dec_ndr_long = ndrBuffer.dec_ndr_long();
            final int dec_ndr_long2 = ndrBuffer.dec_ndr_long();
            this.attributes = ndrBuffer.dec_ndr_long();
            this.security_descriptor = ndrBuffer.dec_ndr_long();
            final int dec_ndr_long3 = ndrBuffer.dec_ndr_long();
            if (dec_ndr_long != 0) {
                ndrBuffer = ndrBuffer.deferred;
                this.root_directory.decode(ndrBuffer);
            }
            if (dec_ndr_long2 != 0) {
                if (this.object_name == null) {
                    this.object_name = new rpc.unicode_string();
                }
                ndrBuffer = ndrBuffer.deferred;
                this.object_name.decode(ndrBuffer);
            }
            if (dec_ndr_long3 != 0) {
                if (this.security_quality_of_service == null) {
                    this.security_quality_of_service = new LsarQosInfo();
                }
                this.security_quality_of_service.decode(ndrBuffer.deferred);
            }
        }
        
        public void encode(NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.length);
            ndrBuffer.enc_ndr_referent(this.root_directory, 1);
            ndrBuffer.enc_ndr_referent(this.object_name, 1);
            ndrBuffer.enc_ndr_long(this.attributes);
            ndrBuffer.enc_ndr_long(this.security_descriptor);
            ndrBuffer.enc_ndr_referent(this.security_quality_of_service, 1);
            if (this.root_directory != null) {
                ndrBuffer = ndrBuffer.deferred;
                this.root_directory.encode(ndrBuffer);
            }
            if (this.object_name != null) {
                ndrBuffer = ndrBuffer.deferred;
                this.object_name.encode(ndrBuffer);
            }
            if (this.security_quality_of_service != null) {
                this.security_quality_of_service.encode(ndrBuffer.deferred);
            }
        }
    }
    
    public static class LsarOpenPolicy2 extends DcerpcMessage
    {
        public int desired_access;
        public LsarObjectAttributes object_attributes;
        public rpc.policy_handle policy_handle;
        public int retval;
        public String system_name;
        
        public LsarOpenPolicy2(final String system_name, final LsarObjectAttributes object_attributes, final int desired_access, final rpc.policy_handle policy_handle) {
            super();
            this.system_name = system_name;
            this.object_attributes = object_attributes;
            this.desired_access = desired_access;
            this.policy_handle = policy_handle;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            this.policy_handle.decode(ndrBuffer);
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.enc_ndr_referent(this.system_name, 1);
            if (this.system_name != null) {
                ndrBuffer.enc_ndr_string(this.system_name);
            }
            this.object_attributes.encode(ndrBuffer);
            ndrBuffer.enc_ndr_long(this.desired_access);
        }
        
        public int getOpnum() {
            return 44;
        }
    }
    
    public static class LsarQosInfo extends NdrObject
    {
        public byte context_mode;
        public byte effective_only;
        public short impersonation_level;
        public int length;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.length = ndrBuffer.dec_ndr_long();
            this.impersonation_level = (short)ndrBuffer.dec_ndr_short();
            this.context_mode = (byte)ndrBuffer.dec_ndr_small();
            this.effective_only = (byte)ndrBuffer.dec_ndr_small();
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.length);
            ndrBuffer.enc_ndr_short(this.impersonation_level);
            ndrBuffer.enc_ndr_small(this.context_mode);
            ndrBuffer.enc_ndr_small(this.effective_only);
        }
    }
    
    public static class LsarQueryInformationPolicy extends DcerpcMessage
    {
        public rpc.policy_handle handle;
        public NdrObject info;
        public short level;
        public int retval;
        
        public LsarQueryInformationPolicy(final rpc.policy_handle handle, final short level, final NdrObject info) {
            super();
            this.handle = handle;
            this.level = level;
            this.info = info;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            if (ndrBuffer.dec_ndr_long() != 0) {
                ndrBuffer.dec_ndr_short();
                this.info.decode(ndrBuffer);
            }
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            this.handle.encode(ndrBuffer);
            ndrBuffer.enc_ndr_short(this.level);
        }
        
        public int getOpnum() {
            return 7;
        }
    }
    
    public static class LsarQueryInformationPolicy2 extends DcerpcMessage
    {
        public rpc.policy_handle handle;
        public NdrObject info;
        public short level;
        public int retval;
        
        public LsarQueryInformationPolicy2(final rpc.policy_handle handle, final short level, final NdrObject info) {
            super();
            this.handle = handle;
            this.level = level;
            this.info = info;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            if (ndrBuffer.dec_ndr_long() != 0) {
                ndrBuffer.dec_ndr_short();
                this.info.decode(ndrBuffer);
            }
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            this.handle.encode(ndrBuffer);
            ndrBuffer.enc_ndr_short(this.level);
        }
        
        public int getOpnum() {
            return 46;
        }
    }
    
    public static class LsarRefDomainList extends NdrObject
    {
        public int count;
        public LsarTrustInformation[] domains;
        public int max_count;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            final int dec_ndr_long = ndrBuffer.dec_ndr_long();
            this.max_count = ndrBuffer.dec_ndr_long();
            if (dec_ndr_long != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long2 = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long2 * 12);
                if (this.domains == null) {
                    if (dec_ndr_long2 < 0 || dec_ndr_long2 > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.domains = new LsarTrustInformation[dec_ndr_long2];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long2; ++i) {
                    if (this.domains[i] == null) {
                        this.domains[i] = new LsarTrustInformation();
                    }
                    this.domains[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.domains, 1);
            ndrBuffer.enc_ndr_long(this.max_count);
            if (this.domains != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 12);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.domains[i].encode(derive);
                }
            }
        }
    }
    
    public static class LsarSidArray extends NdrObject
    {
        public int num_sids;
        public LsarSidPtr[] sids;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.num_sids = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 4);
                if (this.sids == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.sids = new LsarSidPtr[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.sids[i] == null) {
                        this.sids[i] = new LsarSidPtr();
                    }
                    this.sids[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.num_sids);
            ndrBuffer.enc_ndr_referent(this.sids, 1);
            if (this.sids != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int num_sids = this.num_sids;
                deferred.enc_ndr_long(num_sids);
                final int index = deferred.index;
                deferred.advance(num_sids * 4);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < num_sids; ++i) {
                    this.sids[i].encode(derive);
                }
            }
        }
    }
    
    public static class LsarSidPtr extends NdrObject
    {
        public rpc.sid_t sid;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            if (ndrBuffer.dec_ndr_long() != 0) {
                if (this.sid == null) {
                    this.sid = new rpc.sid_t();
                }
                this.sid.decode(ndrBuffer.deferred);
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_referent(this.sid, 1);
            if (this.sid != null) {
                this.sid.encode(ndrBuffer.deferred);
            }
        }
    }
    
    public static class LsarTransNameArray extends NdrObject
    {
        public int count;
        public LsarTranslatedName[] names;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 16);
                if (this.names == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.names = new LsarTranslatedName[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.names[i] == null) {
                        this.names[i] = new LsarTranslatedName();
                    }
                    this.names[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.names, 1);
            if (this.names != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 16);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.names[i].encode(derive);
                }
            }
        }
    }
    
    public static class LsarTransSidArray extends NdrObject
    {
        public int count;
        public LsarTranslatedSid[] sids;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 12);
                if (this.sids == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.sids = new LsarTranslatedSid[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.sids[i] == null) {
                        this.sids[i] = new LsarTranslatedSid();
                    }
                    this.sids[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.sids, 1);
            if (this.sids != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 12);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.sids[i].encode(derive);
                }
            }
        }
    }
    
    public static class LsarTranslatedName extends NdrObject
    {
        public rpc.unicode_string name;
        public int sid_index;
        public short sid_type;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.sid_type = (short)ndrBuffer.dec_ndr_short();
            ndrBuffer.align(4);
            if (this.name == null) {
                this.name = new rpc.unicode_string();
            }
            this.name.length = (short)ndrBuffer.dec_ndr_short();
            this.name.maximum_length = (short)ndrBuffer.dec_ndr_short();
            final int dec_ndr_long = ndrBuffer.dec_ndr_long();
            this.sid_index = ndrBuffer.dec_ndr_long();
            if (dec_ndr_long != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long2 = deferred.dec_ndr_long();
                deferred.dec_ndr_long();
                final int dec_ndr_long3 = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long3 * 2);
                if (this.name.buffer == null) {
                    if (dec_ndr_long2 < 0 || dec_ndr_long2 > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.name.buffer = new short[dec_ndr_long2];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long3; ++i) {
                    this.name.buffer[i] = (short)derive.dec_ndr_short();
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_short(this.sid_type);
            ndrBuffer.enc_ndr_short(this.name.length);
            ndrBuffer.enc_ndr_short(this.name.maximum_length);
            ndrBuffer.enc_ndr_referent(this.name.buffer, 1);
            ndrBuffer.enc_ndr_long(this.sid_index);
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
    
    public static class LsarTranslatedSid extends NdrObject
    {
        public int rid;
        public int sid_index;
        public int sid_type;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.sid_type = ndrBuffer.dec_ndr_short();
            this.rid = ndrBuffer.dec_ndr_long();
            this.sid_index = ndrBuffer.dec_ndr_long();
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_short(this.sid_type);
            ndrBuffer.enc_ndr_long(this.rid);
            ndrBuffer.enc_ndr_long(this.sid_index);
        }
    }
    
    public static class LsarTrustInformation extends NdrObject
    {
        public rpc.unicode_string name;
        public rpc.sid_t sid;
        
        public void decode(NdrBuffer derive) throws NdrException {
            derive.align(4);
            derive.align(4);
            if (this.name == null) {
                this.name = new rpc.unicode_string();
            }
            this.name.length = (short)derive.dec_ndr_short();
            this.name.maximum_length = (short)derive.dec_ndr_short();
            final int dec_ndr_long = derive.dec_ndr_long();
            final int dec_ndr_long2 = derive.dec_ndr_long();
            if (dec_ndr_long != 0) {
                final NdrBuffer deferred = derive.deferred;
                final int dec_ndr_long3 = deferred.dec_ndr_long();
                deferred.dec_ndr_long();
                final int dec_ndr_long4 = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long4 * 2);
                if (this.name.buffer == null) {
                    if (dec_ndr_long3 < 0 || dec_ndr_long3 > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.name.buffer = new short[dec_ndr_long3];
                }
                derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long4; ++i) {
                    this.name.buffer[i] = (short)derive.dec_ndr_short();
                }
            }
            if (dec_ndr_long2 != 0) {
                if (this.sid == null) {
                    this.sid = new rpc.sid_t();
                }
                this.sid.decode(derive.deferred);
            }
        }
        
        public void encode(NdrBuffer derive) throws NdrException {
            derive.align(4);
            derive.enc_ndr_short(this.name.length);
            derive.enc_ndr_short(this.name.maximum_length);
            derive.enc_ndr_referent(this.name.buffer, 1);
            derive.enc_ndr_referent(this.sid, 1);
            if (this.name.buffer != null) {
                final NdrBuffer deferred = derive.deferred;
                final short n = this.name.length / 2;
                deferred.enc_ndr_long(this.name.maximum_length / 2);
                deferred.enc_ndr_long(0);
                deferred.enc_ndr_long(n);
                final int index = deferred.index;
                deferred.advance(n * 2);
                derive = deferred.derive(index);
                for (short n2 = 0; n2 < n; ++n2) {
                    derive.enc_ndr_short(this.name.buffer[n2]);
                }
            }
            if (this.sid != null) {
                this.sid.encode(derive.deferred);
            }
        }
    }
}
