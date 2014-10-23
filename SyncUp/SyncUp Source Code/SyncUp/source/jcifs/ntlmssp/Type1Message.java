package jcifs.ntlmssp;

import jcifs.*;
import jcifs.netbios.*;
import java.net.*;
import java.io.*;
import jcifs.util.*;

public class Type1Message extends NtlmMessage
{
    private static final String DEFAULT_DOMAIN;
    private static final int DEFAULT_FLAGS;
    private static final String DEFAULT_WORKSTATION;
    private String suppliedDomain;
    private String suppliedWorkstation;
    
    static {
        int n = 1;
        Label_0042: {
            if (!Config.getBoolean("jcifs.smb.client.useUnicode", n != 0)) {
                break Label_0042;
            }
            while (true) {
                DEFAULT_FLAGS = (n | 0x200);
                DEFAULT_DOMAIN = Config.getProperty("jcifs.smb.client.domain", null);
                while (true) {
                    try {
                        final String hostName = NbtAddress.getLocalHost().getHostName();
                        DEFAULT_WORKSTATION = hostName;
                        return;
                        n = 2;
                    }
                    catch (UnknownHostException ex) {
                        final String hostName = null;
                        continue;
                    }
                    break;
                }
            }
        }
    }
    
    public Type1Message() {
        this(getDefaultFlags(), getDefaultDomain(), getDefaultWorkstation());
    }
    
    public Type1Message(final int n, final String suppliedDomain, String defaultWorkstation) {
        super();
        this.setFlags(n | getDefaultFlags());
        this.setSuppliedDomain(suppliedDomain);
        if (defaultWorkstation == null) {
            defaultWorkstation = getDefaultWorkstation();
        }
        this.setSuppliedWorkstation(defaultWorkstation);
    }
    
    public Type1Message(final byte[] array) throws IOException {
        super();
        this.parse(array);
    }
    
    public static String getDefaultDomain() {
        return Type1Message.DEFAULT_DOMAIN;
    }
    
    public static int getDefaultFlags() {
        return Type1Message.DEFAULT_FLAGS;
    }
    
    public static String getDefaultWorkstation() {
        return Type1Message.DEFAULT_WORKSTATION;
    }
    
    private void parse(final byte[] array) throws IOException {
        for (int i = 0; i < 8; ++i) {
            if (array[i] != Type1Message.NTLMSSP_SIGNATURE[i]) {
                throw new IOException("Not an NTLMSSP message.");
            }
        }
        if (NtlmMessage.readULong(array, 8) != 1) {
            throw new IOException("Not a Type 1 message.");
        }
        final int uLong = NtlmMessage.readULong(array, 12);
        final int n = uLong & 0x1000;
        String suppliedDomain = null;
        if (n != 0) {
            suppliedDomain = new String(NtlmMessage.readSecurityBuffer(array, 16), NtlmMessage.getOEMEncoding());
        }
        final int n2 = uLong & 0x2000;
        String suppliedWorkstation = null;
        if (n2 != 0) {
            suppliedWorkstation = new String(NtlmMessage.readSecurityBuffer(array, 24), NtlmMessage.getOEMEncoding());
        }
        this.setFlags(uLong);
        this.setSuppliedDomain(suppliedDomain);
        this.setSuppliedWorkstation(suppliedWorkstation);
    }
    
    public String getSuppliedDomain() {
        return this.suppliedDomain;
    }
    
    public String getSuppliedWorkstation() {
        return this.suppliedWorkstation;
    }
    
    public void setSuppliedDomain(final String suppliedDomain) {
        this.suppliedDomain = suppliedDomain;
    }
    
    public void setSuppliedWorkstation(final String suppliedWorkstation) {
        this.suppliedWorkstation = suppliedWorkstation;
    }
    
    public byte[] toByteArray() {
        int n = 16;
        try {
            final String suppliedDomain = this.getSuppliedDomain();
            final String suppliedWorkstation = this.getSuppliedWorkstation();
            final int flags = this.getFlags();
            byte[] bytes = new byte[0];
            boolean b;
            int n2;
            if (suppliedDomain != null && suppliedDomain.length() != 0) {
                b = true;
                n2 = (flags | 0x1000);
                bytes = suppliedDomain.toUpperCase().getBytes(NtlmMessage.getOEMEncoding());
            }
            else {
                n2 = (flags & 0xFFFFEFFF);
                b = false;
            }
            byte[] bytes2 = new byte[0];
            int n3;
            if (suppliedWorkstation != null && suppliedWorkstation.length() != 0) {
                b = true;
                n3 = (n2 | 0x2000);
                bytes2 = suppliedWorkstation.toUpperCase().getBytes(NtlmMessage.getOEMEncoding());
            }
            else {
                n3 = (n2 & 0xFFFFDFFF);
            }
            if (b) {
                n = 32 + bytes.length + bytes2.length;
            }
            final byte[] array = new byte[n];
            System.arraycopy(Type1Message.NTLMSSP_SIGNATURE, 0, array, 0, 8);
            NtlmMessage.writeULong(array, 8, 1);
            NtlmMessage.writeULong(array, 12, n3);
            if (b) {
                NtlmMessage.writeSecurityBuffer(array, 16, 32, bytes);
                NtlmMessage.writeSecurityBuffer(array, 24, 32 + bytes.length, bytes2);
            }
            return array;
        }
        catch (IOException ex) {
            throw new IllegalStateException(ex.getMessage());
        }
    }
    
    public String toString() {
        String suppliedDomain = this.getSuppliedDomain();
        String suppliedWorkstation = this.getSuppliedWorkstation();
        final StringBuilder sb = new StringBuilder("Type1Message[suppliedDomain=");
        if (suppliedDomain == null) {
            suppliedDomain = "null";
        }
        final StringBuilder append = sb.append(suppliedDomain).append(",suppliedWorkstation=");
        if (suppliedWorkstation == null) {
            suppliedWorkstation = "null";
        }
        return append.append(suppliedWorkstation).append(",flags=0x").append(Hexdump.toHexString(this.getFlags(), 8)).append("]").toString();
    }
}
