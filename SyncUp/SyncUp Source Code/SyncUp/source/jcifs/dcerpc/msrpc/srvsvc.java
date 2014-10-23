package jcifs.dcerpc.msrpc;

import jcifs.dcerpc.*;
import jcifs.dcerpc.ndr.*;

public class srvsvc
{
    public static String getSyntax() {
        return "4b324fc8-1670-01d3-1278-5a47bf6ee188:3.0";
    }
    
    public static class RemoteTOD extends DcerpcMessage
    {
        public TimeOfDayInfo info;
        public int retval;
        public String servername;
        
        public RemoteTOD(final String servername, final TimeOfDayInfo info) {
            super();
            this.servername = servername;
            this.info = info;
        }
        
        public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
            if (ndrBuffer.dec_ndr_long() != 0) {
                if (this.info == null) {
                    this.info = new TimeOfDayInfo();
                }
                this.info.decode(ndrBuffer);
            }
            this.retval = ndrBuffer.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.enc_ndr_referent(this.servername, 1);
            if (this.servername != null) {
                ndrBuffer.enc_ndr_string(this.servername);
            }
        }
        
        public int getOpnum() {
            return 28;
        }
    }
    
    public static class ServerGetInfo extends DcerpcMessage
    {
        public NdrObject info;
        public int level;
        public int retval;
        public String servername;
        
        public ServerGetInfo(final String servername, final int level, final NdrObject info) {
            super();
            this.servername = servername;
            this.level = level;
            this.info = info;
        }
        
        public void decode_out(NdrBuffer deferred) throws NdrException {
            deferred.dec_ndr_long();
            if (deferred.dec_ndr_long() != 0) {
                if (this.info == null) {
                    this.info = new ServerInfo100();
                }
                deferred = deferred.deferred;
                this.info.decode(deferred);
            }
            this.retval = deferred.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.enc_ndr_referent(this.servername, 1);
            if (this.servername != null) {
                ndrBuffer.enc_ndr_string(this.servername);
            }
            ndrBuffer.enc_ndr_long(this.level);
        }
        
        public int getOpnum() {
            return 21;
        }
    }
    
    public static class ServerInfo100 extends NdrObject
    {
        public String name;
        public int platform_id;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.platform_id = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                this.name = ndrBuffer.deferred.dec_ndr_string();
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.platform_id);
            ndrBuffer.enc_ndr_referent(this.name, 1);
            if (this.name != null) {
                ndrBuffer.deferred.enc_ndr_string(this.name);
            }
        }
    }
    
    public static class ShareEnumAll extends DcerpcMessage
    {
        public NdrObject info;
        public int level;
        public int prefmaxlen;
        public int resume_handle;
        public int retval;
        public String servername;
        public int totalentries;
        
        public ShareEnumAll(final String servername, final int level, final NdrObject info, final int prefmaxlen, final int totalentries, final int resume_handle) {
            super();
            this.servername = servername;
            this.level = level;
            this.info = info;
            this.prefmaxlen = prefmaxlen;
            this.totalentries = totalentries;
            this.resume_handle = resume_handle;
        }
        
        public void decode_out(NdrBuffer deferred) throws NdrException {
            this.level = deferred.dec_ndr_long();
            deferred.dec_ndr_long();
            if (deferred.dec_ndr_long() != 0) {
                if (this.info == null) {
                    this.info = new ShareInfoCtr0();
                }
                deferred = deferred.deferred;
                this.info.decode(deferred);
            }
            this.totalentries = deferred.dec_ndr_long();
            this.resume_handle = deferred.dec_ndr_long();
            this.retval = deferred.dec_ndr_long();
        }
        
        public void encode_in(NdrBuffer deferred) throws NdrException {
            deferred.enc_ndr_referent(this.servername, 1);
            if (this.servername != null) {
                deferred.enc_ndr_string(this.servername);
            }
            deferred.enc_ndr_long(this.level);
            deferred.enc_ndr_long(this.level);
            deferred.enc_ndr_referent(this.info, 1);
            if (this.info != null) {
                deferred = deferred.deferred;
                this.info.encode(deferred);
            }
            deferred.enc_ndr_long(this.prefmaxlen);
            deferred.enc_ndr_long(this.resume_handle);
        }
        
        public int getOpnum() {
            return 15;
        }
    }
    
    public static class ShareGetInfo extends DcerpcMessage
    {
        public NdrObject info;
        public int level;
        public int retval;
        public String servername;
        public String sharename;
        
        public ShareGetInfo(final String servername, final String sharename, final int level, final NdrObject info) {
            super();
            this.servername = servername;
            this.sharename = sharename;
            this.level = level;
            this.info = info;
        }
        
        public void decode_out(NdrBuffer deferred) throws NdrException {
            deferred.dec_ndr_long();
            if (deferred.dec_ndr_long() != 0) {
                if (this.info == null) {
                    this.info = new ShareInfo0();
                }
                deferred = deferred.deferred;
                this.info.decode(deferred);
            }
            this.retval = deferred.dec_ndr_long();
        }
        
        public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.enc_ndr_referent(this.servername, 1);
            if (this.servername != null) {
                ndrBuffer.enc_ndr_string(this.servername);
            }
            ndrBuffer.enc_ndr_string(this.sharename);
            ndrBuffer.enc_ndr_long(this.level);
        }
        
        public int getOpnum() {
            return 16;
        }
    }
    
    public static class ShareInfo0 extends NdrObject
    {
        public String netname;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            if (ndrBuffer.dec_ndr_long() != 0) {
                this.netname = ndrBuffer.deferred.dec_ndr_string();
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_referent(this.netname, 1);
            if (this.netname != null) {
                ndrBuffer.deferred.enc_ndr_string(this.netname);
            }
        }
    }
    
    public static class ShareInfo1 extends NdrObject
    {
        public String netname;
        public String remark;
        public int type;
        
        public void decode(NdrBuffer deferred) throws NdrException {
            deferred.align(4);
            final int dec_ndr_long = deferred.dec_ndr_long();
            this.type = deferred.dec_ndr_long();
            final int dec_ndr_long2 = deferred.dec_ndr_long();
            if (dec_ndr_long != 0) {
                deferred = deferred.deferred;
                this.netname = deferred.dec_ndr_string();
            }
            if (dec_ndr_long2 != 0) {
                this.remark = deferred.deferred.dec_ndr_string();
            }
        }
        
        public void encode(NdrBuffer deferred) throws NdrException {
            deferred.align(4);
            deferred.enc_ndr_referent(this.netname, 1);
            deferred.enc_ndr_long(this.type);
            deferred.enc_ndr_referent(this.remark, 1);
            if (this.netname != null) {
                deferred = deferred.deferred;
                deferred.enc_ndr_string(this.netname);
            }
            if (this.remark != null) {
                deferred.deferred.enc_ndr_string(this.remark);
            }
        }
    }
    
    public static class ShareInfo502 extends NdrObject
    {
        public int current_uses;
        public int max_uses;
        public String netname;
        public String password;
        public String path;
        public int permissions;
        public String remark;
        public int sd_size;
        public byte[] security_descriptor;
        public int type;
        
        public void decode(NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            final int dec_ndr_long = ndrBuffer.dec_ndr_long();
            this.type = ndrBuffer.dec_ndr_long();
            final int dec_ndr_long2 = ndrBuffer.dec_ndr_long();
            this.permissions = ndrBuffer.dec_ndr_long();
            this.max_uses = ndrBuffer.dec_ndr_long();
            this.current_uses = ndrBuffer.dec_ndr_long();
            final int dec_ndr_long3 = ndrBuffer.dec_ndr_long();
            final int dec_ndr_long4 = ndrBuffer.dec_ndr_long();
            this.sd_size = ndrBuffer.dec_ndr_long();
            final int dec_ndr_long5 = ndrBuffer.dec_ndr_long();
            if (dec_ndr_long != 0) {
                ndrBuffer = ndrBuffer.deferred;
                this.netname = ndrBuffer.dec_ndr_string();
            }
            if (dec_ndr_long2 != 0) {
                ndrBuffer = ndrBuffer.deferred;
                this.remark = ndrBuffer.dec_ndr_string();
            }
            if (dec_ndr_long3 != 0) {
                ndrBuffer = ndrBuffer.deferred;
                this.path = ndrBuffer.dec_ndr_string();
            }
            if (dec_ndr_long4 != 0) {
                ndrBuffer = ndrBuffer.deferred;
                this.password = ndrBuffer.dec_ndr_string();
            }
            if (dec_ndr_long5 != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long6 = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long6 * 1);
                if (this.security_descriptor == null) {
                    if (dec_ndr_long6 < 0 || dec_ndr_long6 > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.security_descriptor = new byte[dec_ndr_long6];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long6; ++i) {
                    this.security_descriptor[i] = (byte)derive.dec_ndr_small();
                }
            }
        }
        
        public void encode(NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_referent(this.netname, 1);
            ndrBuffer.enc_ndr_long(this.type);
            ndrBuffer.enc_ndr_referent(this.remark, 1);
            ndrBuffer.enc_ndr_long(this.permissions);
            ndrBuffer.enc_ndr_long(this.max_uses);
            ndrBuffer.enc_ndr_long(this.current_uses);
            ndrBuffer.enc_ndr_referent(this.path, 1);
            ndrBuffer.enc_ndr_referent(this.password, 1);
            ndrBuffer.enc_ndr_long(this.sd_size);
            ndrBuffer.enc_ndr_referent(this.security_descriptor, 1);
            if (this.netname != null) {
                ndrBuffer = ndrBuffer.deferred;
                ndrBuffer.enc_ndr_string(this.netname);
            }
            if (this.remark != null) {
                ndrBuffer = ndrBuffer.deferred;
                ndrBuffer.enc_ndr_string(this.remark);
            }
            if (this.path != null) {
                ndrBuffer = ndrBuffer.deferred;
                ndrBuffer.enc_ndr_string(this.path);
            }
            if (this.password != null) {
                ndrBuffer = ndrBuffer.deferred;
                ndrBuffer.enc_ndr_string(this.password);
            }
            if (this.security_descriptor != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int sd_size = this.sd_size;
                deferred.enc_ndr_long(sd_size);
                final int index = deferred.index;
                deferred.advance(sd_size * 1);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < sd_size; ++i) {
                    derive.enc_ndr_small(this.security_descriptor[i]);
                }
            }
        }
    }
    
    public static class ShareInfoCtr0 extends NdrObject
    {
        public ShareInfo0[] array;
        public int count;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 4);
                if (this.array == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.array = new ShareInfo0[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.array[i] == null) {
                        this.array[i] = new ShareInfo0();
                    }
                    this.array[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.array, 1);
            if (this.array != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 4);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.array[i].encode(derive);
                }
            }
        }
    }
    
    public static class ShareInfoCtr1 extends NdrObject
    {
        public ShareInfo1[] array;
        public int count;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 12);
                if (this.array == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.array = new ShareInfo1[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.array[i] == null) {
                        this.array[i] = new ShareInfo1();
                    }
                    this.array[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.array, 1);
            if (this.array != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 12);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.array[i].encode(derive);
                }
            }
        }
    }
    
    public static class ShareInfoCtr502 extends NdrObject
    {
        public ShareInfo502[] array;
        public int count;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.count = ndrBuffer.dec_ndr_long();
            if (ndrBuffer.dec_ndr_long() != 0) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int dec_ndr_long = deferred.dec_ndr_long();
                final int index = deferred.index;
                deferred.advance(dec_ndr_long * 40);
                if (this.array == null) {
                    if (dec_ndr_long < 0 || dec_ndr_long > 65535) {
                        throw new NdrException("invalid array conformance");
                    }
                    this.array = new ShareInfo502[dec_ndr_long];
                }
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < dec_ndr_long; ++i) {
                    if (this.array[i] == null) {
                        this.array[i] = new ShareInfo502();
                    }
                    this.array[i].decode(derive);
                }
            }
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.count);
            ndrBuffer.enc_ndr_referent(this.array, 1);
            if (this.array != null) {
                final NdrBuffer deferred = ndrBuffer.deferred;
                final int count = this.count;
                deferred.enc_ndr_long(count);
                final int index = deferred.index;
                deferred.advance(count * 40);
                final NdrBuffer derive = deferred.derive(index);
                for (int i = 0; i < count; ++i) {
                    this.array[i].encode(derive);
                }
            }
        }
    }
    
    public static class TimeOfDayInfo extends NdrObject
    {
        public int day;
        public int elapsedt;
        public int hours;
        public int hunds;
        public int mins;
        public int month;
        public int msecs;
        public int secs;
        public int timezone;
        public int tinterval;
        public int weekday;
        public int year;
        
        public void decode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            this.elapsedt = ndrBuffer.dec_ndr_long();
            this.msecs = ndrBuffer.dec_ndr_long();
            this.hours = ndrBuffer.dec_ndr_long();
            this.mins = ndrBuffer.dec_ndr_long();
            this.secs = ndrBuffer.dec_ndr_long();
            this.hunds = ndrBuffer.dec_ndr_long();
            this.timezone = ndrBuffer.dec_ndr_long();
            this.tinterval = ndrBuffer.dec_ndr_long();
            this.day = ndrBuffer.dec_ndr_long();
            this.month = ndrBuffer.dec_ndr_long();
            this.year = ndrBuffer.dec_ndr_long();
            this.weekday = ndrBuffer.dec_ndr_long();
        }
        
        public void encode(final NdrBuffer ndrBuffer) throws NdrException {
            ndrBuffer.align(4);
            ndrBuffer.enc_ndr_long(this.elapsedt);
            ndrBuffer.enc_ndr_long(this.msecs);
            ndrBuffer.enc_ndr_long(this.hours);
            ndrBuffer.enc_ndr_long(this.mins);
            ndrBuffer.enc_ndr_long(this.secs);
            ndrBuffer.enc_ndr_long(this.hunds);
            ndrBuffer.enc_ndr_long(this.timezone);
            ndrBuffer.enc_ndr_long(this.tinterval);
            ndrBuffer.enc_ndr_long(this.day);
            ndrBuffer.enc_ndr_long(this.month);
            ndrBuffer.enc_ndr_long(this.year);
            ndrBuffer.enc_ndr_long(this.weekday);
        }
    }
}
