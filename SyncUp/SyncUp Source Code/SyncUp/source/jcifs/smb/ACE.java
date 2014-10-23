package jcifs.smb;

import jcifs.util.*;

public class ACE
{
    public static final int DELETE = 65536;
    public static final int FILE_APPEND_DATA = 4;
    public static final int FILE_DELETE = 64;
    public static final int FILE_EXECUTE = 32;
    public static final int FILE_READ_ATTRIBUTES = 128;
    public static final int FILE_READ_DATA = 1;
    public static final int FILE_READ_EA = 8;
    public static final int FILE_WRITE_ATTRIBUTES = 256;
    public static final int FILE_WRITE_DATA = 2;
    public static final int FILE_WRITE_EA = 16;
    public static final int FLAGS_CONTAINER_INHERIT = 2;
    public static final int FLAGS_INHERITED = 16;
    public static final int FLAGS_INHERIT_ONLY = 8;
    public static final int FLAGS_NO_PROPAGATE = 4;
    public static final int FLAGS_OBJECT_INHERIT = 1;
    public static final int GENERIC_ALL = 268435456;
    public static final int GENERIC_EXECUTE = 536870912;
    public static final int GENERIC_READ = Integer.MIN_VALUE;
    public static final int GENERIC_WRITE = 1073741824;
    public static final int READ_CONTROL = 131072;
    public static final int SYNCHRONIZE = 1048576;
    public static final int WRITE_DAC = 262144;
    public static final int WRITE_OWNER = 524288;
    int access;
    boolean allow;
    int flags;
    SID sid;
    
    void appendCol(final StringBuffer sb, final String s, final int n) {
        sb.append(s);
        for (int n2 = n - s.length(), i = 0; i < n2; ++i) {
            sb.append(' ');
        }
    }
    
    int decode(final byte[] array, final int n) {
        final int n2 = n + 1;
        this.allow = (array[n] == 0);
        final int n3 = n2 + 1;
        this.flags = (0xFF & array[n2]);
        final int int2 = ServerMessageBlock.readInt2(array, n3);
        final int n4 = n3 + 2;
        this.access = ServerMessageBlock.readInt4(array, n4);
        this.sid = new SID(array, n4 + 4);
        return int2;
    }
    
    public int getAccessMask() {
        return this.access;
    }
    
    public String getApplyToText() {
        String s = null;
        switch (0xB & this.flags) {
            default: {
                s = "Invalid";
                break;
            }
            case 0: {
                s = "This folder only";
                break;
            }
            case 3: {
                s = "This folder, subfolders and files";
                break;
            }
            case 11: {
                s = "Subfolders and files only";
                break;
            }
            case 2: {
                s = "This folder and subfolders";
                break;
            }
            case 10: {
                s = "Subfolders only";
                break;
            }
            case 1: {
                s = "This folder and files";
                break;
            }
            case 9: {
                s = "Files only";
                break;
            }
        }
        return s;
    }
    
    public int getFlags() {
        return this.flags;
    }
    
    public SID getSID() {
        return this.sid;
    }
    
    public boolean isAllow() {
        return this.allow;
    }
    
    public boolean isInherited() {
        return (0x10 & this.flags) != 0x0;
    }
    
    public String toString() {
        final StringBuffer sb = new StringBuffer();
        String s;
        if (this.isAllow()) {
            s = "Allow ";
        }
        else {
            s = "Deny  ";
        }
        sb.append(s);
        this.appendCol(sb, this.sid.toDisplayString(), 25);
        sb.append(" 0x").append(Hexdump.toHexString(this.access, 8)).append(' ');
        String s2;
        if (this.isInherited()) {
            s2 = "Inherited ";
        }
        else {
            s2 = "Direct    ";
        }
        sb.append(s2);
        this.appendCol(sb, this.getApplyToText(), 34);
        return sb.toString();
    }
}
