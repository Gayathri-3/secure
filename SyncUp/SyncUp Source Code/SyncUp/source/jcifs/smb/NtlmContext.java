package jcifs.smb;

import jcifs.util.*;
import java.io.*;
import jcifs.ntlmssp.*;

public class NtlmContext
{
    NtlmPasswordAuthentication auth;
    boolean isEstablished;
    LogStream log;
    String netbiosName;
    int ntlmsspFlags;
    byte[] serverChallenge;
    byte[] signingKey;
    int state;
    String workstation;
    
    public NtlmContext(final NtlmPasswordAuthentication auth, final boolean b) {
        super();
        this.isEstablished = false;
        this.serverChallenge = null;
        this.signingKey = null;
        this.netbiosName = null;
        this.state = 1;
        this.auth = auth;
        this.ntlmsspFlags = (0x20000000 | (0x80000 | (0x4 | this.ntlmsspFlags)));
        if (b) {
            this.ntlmsspFlags |= 0x40008010;
        }
        this.workstation = Type1Message.getDefaultWorkstation();
        this.log = LogStream.getInstance();
    }
    
    private String getNtlmsspListItem(final byte[] array, final int n) {
        int n2 = 58;
        while (true) {
            final short dec_uint16le = Encdec.dec_uint16le(array, n2);
            final short dec_uint16le2 = Encdec.dec_uint16le(array, n2 + 2);
            final int n3 = n2 + 4;
            if (dec_uint16le == 0 || n3 + dec_uint16le2 > array.length) {
                break;
            }
            if (dec_uint16le == n) {
                try {
                    return new String(array, n3, dec_uint16le2, "UTF-16LE");
                }
                catch (UnsupportedEncodingException ex) {
                    break;
                }
            }
            n2 = n3 + dec_uint16le2;
        }
        return null;
    }
    
    public String getNetbiosName() {
        return this.netbiosName;
    }
    
    public byte[] getServerChallenge() {
        return this.serverChallenge;
    }
    
    public byte[] getSigningKey() {
        return this.signingKey;
    }
    
    public byte[] initSecContext(final byte[] array, final int n, final int n2) throws SmbException {
        byte[] array2 = null;
        switch (this.state) {
            default: {
                throw new SmbException("Invalid state");
            }
            case 1: {
                final Type1Message type1Message = new Type1Message(this.ntlmsspFlags, this.auth.getDomain(), this.workstation);
                array2 = type1Message.toByteArray();
                if (LogStream.level >= 4) {
                    this.log.println(type1Message);
                    if (LogStream.level >= 6) {
                        Hexdump.hexdump(this.log, array2, 0, array2.length);
                    }
                }
                this.state += 1;
                break;
            }
            case 2: {
                try {
                    final Type2Message type2Message = new Type2Message(array);
                    if (LogStream.level >= 4) {
                        this.log.println(type2Message);
                        if (LogStream.level >= 6) {
                            Hexdump.hexdump(this.log, array, 0, array.length);
                        }
                    }
                    this.serverChallenge = type2Message.getChallenge();
                    this.ntlmsspFlags &= type2Message.getFlags();
                    final Type3Message type3Message = new Type3Message(type2Message, this.auth.getPassword(), this.auth.getDomain(), this.auth.getUsername(), this.workstation, this.ntlmsspFlags);
                    array2 = type3Message.toByteArray();
                    if (LogStream.level >= 4) {
                        this.log.println(type3Message);
                        if (LogStream.level >= 6) {
                            Hexdump.hexdump(this.log, array2, 0, array2.length);
                        }
                    }
                    if ((0x10 & this.ntlmsspFlags) != 0x0) {
                        this.signingKey = type3Message.getMasterKey();
                    }
                    this.isEstablished = true;
                    this.state += 1;
                    break;
                }
                catch (Exception ex) {
                    throw new SmbException(ex.getMessage(), ex);
                }
                break;
            }
        }
        return array2;
    }
    
    public boolean isEstablished() {
        return this.isEstablished;
    }
    
    public String toString() {
        final String string = "NtlmContext[auth=" + this.auth + ",ntlmsspFlags=0x" + Hexdump.toHexString(this.ntlmsspFlags, 8) + ",workstation=" + this.workstation + ",isEstablished=" + this.isEstablished + ",state=" + this.state + ",serverChallenge=";
        String s;
        if (this.serverChallenge == null) {
            s = String.valueOf(string) + "null";
        }
        else {
            s = String.valueOf(string) + Hexdump.toHexString(this.serverChallenge, 0, 2 * this.serverChallenge.length);
        }
        final String string2 = String.valueOf(s) + ",signingKey=";
        String s2;
        if (this.signingKey == null) {
            s2 = String.valueOf(string2) + "null";
        }
        else {
            s2 = String.valueOf(string2) + Hexdump.toHexString(this.signingKey, 0, 2 * this.signingKey.length);
        }
        return String.valueOf(s2) + "]";
    }
}
