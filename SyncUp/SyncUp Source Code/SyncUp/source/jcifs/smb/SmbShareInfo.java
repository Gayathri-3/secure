package jcifs.smb;

import jcifs.util.*;

public class SmbShareInfo implements FileEntry
{
    protected String netName;
    protected String remark;
    protected int type;
    
    public SmbShareInfo() {
        super();
    }
    
    public SmbShareInfo(final String netName, final int type, final String remark) {
        super();
        this.netName = netName;
        this.type = type;
        this.remark = remark;
    }
    
    public long createTime() {
        return 0L;
    }
    
    public boolean equals(final Object o) {
        return o instanceof SmbShareInfo && this.netName.equals(((SmbShareInfo)o).netName);
    }
    
    public int getAttributes() {
        return 17;
    }
    
    public String getName() {
        return this.netName;
    }
    
    public int getType() {
        int n = 0;
        switch (0xFFFF & this.type) {
            default: {
                n = 8;
                break;
            }
            case 1: {
                n = 32;
                break;
            }
            case 3: {
                n = 16;
                break;
            }
        }
        return n;
    }
    
    public int hashCode() {
        return this.netName.hashCode();
    }
    
    public long lastModified() {
        return 0L;
    }
    
    public long length() {
        return 0L;
    }
    
    public String toString() {
        return new String("SmbShareInfo[netName=" + this.netName + ",type=0x" + Hexdump.toHexString(this.type, 8) + ",remark=" + this.remark + "]");
    }
}
