package jcifs.dcerpc;

import jcifs.dcerpc.ndr.*;

public class rpc
{
    public static class policy_handle extends NdrObject
    {
        public int type;
        public uuid_t uuid;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.type = ndrBuffer.dec_ndr_long();
            ndrBuffer.align(4);
            if (this.uuid == null) {
                this.uuid = new uuid_t();
            }
            this.uuid.time_low = ndrBuffer.dec_ndr_long();
            this.uuid.time_mid = (short)ndrBuffer.dec_ndr_short();
            this.uuid.time_hi_and_version = (short)ndrBuffer.dec_ndr_short();
            this.uuid.clock_seq_hi_and_reserved = (byte)ndrBuffer.dec_ndr_small();
            this.uuid.clock_seq_low = (byte)ndrBuffer.dec_ndr_small();
            final int index = ndrBuffer.index;
            ndrBuffer.advance(6);
            if (this.uuid.node == null) {
                if (6 < 0 || 6 > 65535) {
                    throw new NdrException("invalid array conformance");
                }
                this.uuid.node = new byte[6];
            }
            final NdrBuffer derive = ndrBuffer.derive(index);
            for (int i = 0; i < 6; ++i) {
                this.uuid.node[i] = (byte)derive.dec_ndr_small();
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.type);
            ndrBuffer.enc_ndr_long(this.uuid.time_low);
            ndrBuffer.enc_ndr_short(this.uuid.time_mid);
            ndrBuffer.enc_ndr_short(this.uuid.time_hi_and_version);
            ndrBuffer.enc_ndr_small(this.uuid.clock_seq_hi_and_reserved);
            ndrBuffer.enc_ndr_small(this.uuid.clock_seq_low);
            final int index = ndrBuffer.index;
            ndrBuffer.advance(6);
            final NdrBuffer derive = ndrBuffer.derive(index);
            for (int i = 0; i < 6; ++i) {
                derive.enc_ndr_small(this.uuid.node[i]);
            }
        }
    }
    
    public static class sid_t extends NdrObject
    {
        public byte[] identifier_authority;
        public byte revision;
        public int[] sub_authority;
        public byte sub_authority_count;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            final int dec_ndr_long = ndrBuffer.dec_ndr_long();
            this.revision = (byte)ndrBuffer.dec_ndr_small();
            this.sub_authority_count = (byte)ndrBuffer.dec_ndr_small();
            final int index = ndrBuffer.index;
            ndrBuffer.advance(6);
            final int index2 = ndrBuffer.index;
            ndrBuffer.advance(dec_ndr_long * 4);
            if (this.identifier_authority == null) {
                if (6 < 0 || 6 > 65535) {
                    throw new NdrException("invalid array conformance");
                }
                this.identifier_authority = new byte[6];
            }
            final NdrBuffer derive = ndrBuffer.derive(index);
            for (int i = 0; i < 6; ++i) {
                this.identifier_authority[i] = (byte)derive.dec_ndr_small();
            }
            if (this.sub_authority == null) {
                if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                    throw new NdrException("invalid array conformance");
                }
                this.sub_authority = new int[dec_ndr_long];
            }
            final NdrBuffer derive2 = derive.derive(index2);
            for (int j = 0; j < dec_ndr_long; ++j) {
                this.sub_authority[j] = derive2.dec_ndr_long();
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            final byte sub_authority_count = this.sub_authority_count;
            ndrBuffer.enc_ndr_long(sub_authority_count);
            ndrBuffer.enc_ndr_small(this.revision);
            ndrBuffer.enc_ndr_small(this.sub_authority_count);
            final int index = ndrBuffer.index;
            ndrBuffer.advance(6);
            final int index2 = ndrBuffer.index;
            ndrBuffer.advance(sub_authority_count * 4);
            final NdrBuffer derive = ndrBuffer.derive(index);
            for (int i = 0; i < 6; ++i) {
                derive.enc_ndr_small(this.identifier_authority[i]);
            }
            final NdrBuffer derive2 = derive.derive(index2);
            for (byte b = 0; b < sub_authority_count; ++b) {
                derive2.enc_ndr_long(this.sub_authority[b]);
            }
        }
    }
    
    public static class unicode_string extends NdrObject
    {
        public short[] buffer;
        public short length;
        public short maximum_length;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.length = (short)ndrBuffer.dec_ndr_short();
            this.maximum_length = (short)ndrBuffer.dec_ndr_short();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                deferred.dec_ndr_long();
                final int dec_ndr_long2 = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long2 * 2);
                if (this.buffer == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.buffer = new short[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long2; ++i) {
                    this.buffer[i] = (short)derive.dec_ndr_short();
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_short(this.length);
            ndrBuffer.enc_ndr_short(this.maximum_length);
            ndrBuffer.enc_ndr_referent(this.buffer, 1);
            if (this.buffer != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final short n = this.length / 2;
                deferred.enc_ndr_long(this.maximum_length / 2);
                deferred.enc_ndr_long(0);
                deferred.enc_ndr_long(n);
                final int index = deferred.index;
                deferred.advance(n * 2);
                final NdrBuffer derive = deferred.derive(index);
                for (short n2 = 0; n2 < n; ++n2) {
                    derive.enc_ndr_short(this.buffer[n2]);
                }
            }
        }
    }
    
    public static class uuid_t extends NdrObject
    {
        public byte clock_seq_hi_and_reserved;
        public byte clock_seq_low;
        public byte[] node;
        public short time_hi_and_version;
        public int time_low;
        public short time_mid;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.time_low = ndrBuffer.dec_ndr_long();
            this.time_mid = (short)ndrBuffer.dec_ndr_short();
            this.time_hi_and_version = (short)ndrBuffer.dec_ndr_short();
            this.clock_seq_hi_and_reserved = (byte)ndrBuffer.dec_ndr_small();
            this.clock_seq_low = (byte)ndrBuffer.dec_ndr_small();
            final int index = ndrBuffer.index;
            ndrBuffer.advance(6);
            if (this.node == null) {
                if (6 < 0 || 6 > 65535) {
                    throw new NdrException("invalid array conformance");
                }
                this.node = new byte[6];
            }
            final NdrBuffer derive = ndrBuffer.derive(index);
            for (int i = 0; i < 6; ++i) {
                this.node[i] = (byte)derive.dec_ndr_small();
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.time_low);
            ndrBuffer.enc_ndr_short(this.time_mid);
            ndrBuffer.enc_ndr_short(this.time_hi_and_version);
            ndrBuffer.enc_ndr_small(this.clock_seq_hi_and_reserved);
            ndrBuffer.enc_ndr_small(this.clock_seq_low);
            final int index = ndrBuffer.index;
            ndrBuffer.advance(6);
            final NdrBuffer derive = ndrBuffer.derive(index);
            for (int i = 0; i < 6; ++i) {
                derive.enc_ndr_small(this.node[i]);
            }
        }
    }
}
