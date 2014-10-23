package jcifs.ntlmssp;

import java.security.*;
import jcifs.*;
import jcifs.netbios.*;
import java.net.*;
import java.util.*;
import jcifs.smb.*;
import java.io.*;
import jcifs.util.*;

public class Type3Message extends NtlmMessage
{
    private static final String DEFAULT_DOMAIN;
    private static final int DEFAULT_FLAGS = 0;
    private static final String DEFAULT_PASSWORD;
    private static final String DEFAULT_USER;
    private static final String DEFAULT_WORKSTATION;
    private static final int LM_COMPATIBILITY = 0;
    static final long MILLISECONDS_BETWEEN_1970_AND_1601 = 11644473600000L;
    private static final SecureRandom RANDOM;
    private String domain;
    private byte[] lmResponse;
    private byte[] masterKey;
    private byte[] ntResponse;
    private byte[] sessionKey;
    private String user;
    private String workstation;
    
    static {
        int n = 1;
        RANDOM = new SecureRandom();
        Label_0079: {
            if (!Config.getBoolean("jcifs.smb.client.useUnicode", n != 0)) {
                break Label_0079;
            }
            while (true) {
                DEFAULT_FLAGS = (n | 0x200);
                DEFAULT_DOMAIN = Config.getProperty("jcifs.smb.client.domain", null);
                DEFAULT_USER = Config.getProperty("jcifs.smb.client.username", null);
                DEFAULT_PASSWORD = Config.getProperty("jcifs.smb.client.password", null);
                while (true) {
                    try {
                        final String hostName = NbtAddress.getLocalHost().getHostName();
                        DEFAULT_WORKSTATION = hostName;
                        LM_COMPATIBILITY = Config.getInt("jcifs.smb.lmCompatibility", 3);
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
    
    public Type3Message() {
        super();
        this.masterKey = null;
        this.sessionKey = null;
        this.setFlags(getDefaultFlags());
        this.setDomain(getDefaultDomain());
        this.setUser(getDefaultUser());
        this.setWorkstation(getDefaultWorkstation());
    }
    
    public Type3Message(final int flags, final byte[] lmResponse, final byte[] ntResponse, final String domain, final String user, final String workstation) {
        super();
        this.masterKey = null;
        this.sessionKey = null;
        this.setFlags(flags);
        this.setLMResponse(lmResponse);
        this.setNTResponse(ntResponse);
        this.setDomain(domain);
        this.setUser(user);
        this.setWorkstation(workstation);
    }
    
    public Type3Message(final Type2Message type2Message) {
        super();
        this.masterKey = null;
        this.sessionKey = null;
        this.setFlags(getDefaultFlags(type2Message));
        this.setWorkstation(getDefaultWorkstation());
        final String defaultDomain = getDefaultDomain();
        this.setDomain(defaultDomain);
        final String defaultUser = getDefaultUser();
        this.setUser(defaultUser);
        final String defaultPassword = getDefaultPassword();
        switch (Type3Message.LM_COMPATIBILITY) {
            default: {
                this.setLMResponse(getLMResponse(type2Message, defaultPassword));
                this.setNTResponse(getNTResponse(type2Message, defaultPassword));
                break;
            }
            case 0:
            case 1: {
                this.setLMResponse(getLMResponse(type2Message, defaultPassword));
                this.setNTResponse(getNTResponse(type2Message, defaultPassword));
                break;
            }
            case 2: {
                final byte[] ntResponse = getNTResponse(type2Message, defaultPassword);
                this.setLMResponse(ntResponse);
                this.setNTResponse(ntResponse);
                break;
            }
            case 3:
            case 4:
            case 5: {
                final byte[] array = new byte[8];
                Type3Message.RANDOM.nextBytes(array);
                this.setLMResponse(getLMv2Response(type2Message, defaultDomain, defaultUser, defaultPassword, array));
                break;
            }
        }
    }
    
    public Type3Message(final Type2Message type2Message, final String s, final String domain, final String user, String defaultWorkstation, final int n) {
        super();
        this.masterKey = null;
        this.sessionKey = null;
        this.setFlags(n | getDefaultFlags(type2Message));
        if (defaultWorkstation == null) {
            defaultWorkstation = getDefaultWorkstation();
        }
        this.setWorkstation(defaultWorkstation);
        this.setDomain(domain);
        this.setUser(user);
        switch (Type3Message.LM_COMPATIBILITY) {
            default: {
                this.setLMResponse(getLMResponse(type2Message, s));
                this.setNTResponse(getNTResponse(type2Message, s));
                break;
            }
            case 0:
            case 1: {
                if ((0x80000 & this.getFlags()) == 0x0) {
                    this.setLMResponse(getLMResponse(type2Message, s));
                    this.setNTResponse(getNTResponse(type2Message, s));
                    break;
                }
                final byte[] lmResponse = new byte[24];
                Type3Message.RANDOM.nextBytes(lmResponse);
                Arrays.fill(lmResponse, 8, 24, 0);
                final byte[] ntowFv1 = NtlmPasswordAuthentication.nTOWFv1(s);
                final byte[] ntlm2Response = NtlmPasswordAuthentication.getNTLM2Response(ntowFv1, type2Message.getChallenge(), lmResponse);
                this.setLMResponse(lmResponse);
                this.setNTResponse(ntlm2Response);
                if ((0x10 & this.getFlags()) != 0x10) {
                    break;
                }
                final byte[] array = new byte[16];
                System.arraycopy(type2Message.getChallenge(), 0, array, 0, 8);
                System.arraycopy(lmResponse, 0, array, 8, 8);
                final MD4 md4 = new MD4();
                md4.update(ntowFv1);
                final HMACT64 hmact64 = new HMACT64(md4.digest());
                hmact64.update(array);
                final byte[] digest = hmact64.digest();
                if ((0x40000000 & this.getFlags()) != 0x0) {
                    this.masterKey = new byte[16];
                    Type3Message.RANDOM.nextBytes(this.masterKey);
                    final byte[] sessionKey = new byte[16];
                    new RC4(digest).update(this.masterKey, 0, 16, sessionKey, 0);
                    this.setSessionKey(sessionKey);
                    break;
                }
                this.setSessionKey(this.masterKey = digest);
                break;
            }
            case 2: {
                final byte[] ntResponse = getNTResponse(type2Message, s);
                this.setLMResponse(ntResponse);
                this.setNTResponse(ntResponse);
                break;
            }
            case 3:
            case 4:
            case 5: {
                final byte[] ntowFv2 = NtlmPasswordAuthentication.nTOWFv2(domain, user, s);
                final byte[] array2 = new byte[8];
                Type3Message.RANDOM.nextBytes(array2);
                this.setLMResponse(getLMv2Response(type2Message, domain, user, s, array2));
                final byte[] array3 = new byte[8];
                Type3Message.RANDOM.nextBytes(array3);
                this.setNTResponse(getNTLMv2Response(type2Message, ntowFv2, array3));
                if ((0x10 & this.getFlags()) != 0x10) {
                    break;
                }
                final HMACT64 hmact2 = new HMACT64(ntowFv2);
                hmact2.update(this.ntResponse, 0, 16);
                final byte[] digest2 = hmact2.digest();
                if ((0x40000000 & this.getFlags()) != 0x0) {
                    this.masterKey = new byte[16];
                    Type3Message.RANDOM.nextBytes(this.masterKey);
                    final byte[] sessionKey2 = new byte[16];
                    new RC4(digest2).update(this.masterKey, 0, 16, sessionKey2, 0);
                    this.setSessionKey(sessionKey2);
                    break;
                }
                this.setSessionKey(this.masterKey = digest2);
                break;
            }
        }
    }
    
    public Type3Message(final byte[] array) throws IOException {
        super();
        this.masterKey = null;
        this.sessionKey = null;
        this.parse(array);
    }
    
    public static String getDefaultDomain() {
        return Type3Message.DEFAULT_DOMAIN;
    }
    
    public static int getDefaultFlags() {
        return Type3Message.DEFAULT_FLAGS;
    }
    
    public static int getDefaultFlags(final Type2Message type2Message) {
        int default_FLAGS;
        if (type2Message == null) {
            default_FLAGS = Type3Message.DEFAULT_FLAGS;
        }
        else {
            int n;
            if ((0x1 & type2Message.getFlags()) != 0x0) {
                n = 1;
            }
            else {
                n = 2;
            }
            default_FLAGS = (0x200 | n);
        }
        return default_FLAGS;
    }
    
    public static String getDefaultPassword() {
        return Type3Message.DEFAULT_PASSWORD;
    }
    
    public static String getDefaultUser() {
        return Type3Message.DEFAULT_USER;
    }
    
    public static String getDefaultWorkstation() {
        return Type3Message.DEFAULT_WORKSTATION;
    }
    
    public static byte[] getLMResponse(final Type2Message type2Message, final String s) {
        byte[] preNTLMResponse;
        if (type2Message == null || s == null) {
            preNTLMResponse = null;
        }
        else {
            preNTLMResponse = NtlmPasswordAuthentication.getPreNTLMResponse(s, type2Message.getChallenge());
        }
        return preNTLMResponse;
    }
    
    public static byte[] getLMv2Response(final Type2Message type2Message, final String s, final String s2, final String s3, final byte[] array) {
        byte[] lMv2Response;
        if (type2Message == null || s == null || s2 == null || s3 == null || array == null) {
            lMv2Response = null;
        }
        else {
            lMv2Response = NtlmPasswordAuthentication.getLMv2Response(s, s2, s3, type2Message.getChallenge(), array);
        }
        return lMv2Response;
    }
    
    public static byte[] getNTLMv2Response(final Type2Message type2Message, final byte[] array, final byte[] array2) {
        byte[] ntlMv2Response;
        if (type2Message == null || array == null || array2 == null) {
            ntlMv2Response = null;
        }
        else {
            ntlMv2Response = NtlmPasswordAuthentication.getNTLMv2Response(array, type2Message.getChallenge(), array2, 10000L * (11644473600000L + System.currentTimeMillis()), type2Message.getTargetInformation());
        }
        return ntlMv2Response;
    }
    
    public static byte[] getNTResponse(final Type2Message type2Message, final String s) {
        byte[] ntlmResponse;
        if (type2Message == null || s == null) {
            ntlmResponse = null;
        }
        else {
            ntlmResponse = NtlmPasswordAuthentication.getNTLMResponse(s, type2Message.getChallenge());
        }
        return ntlmResponse;
    }
    
    private void parse(final byte[] array) throws IOException {
        for (int i = 0; i < 8; ++i) {
            if (array[i] != Type3Message.NTLMSSP_SIGNATURE[i]) {
                throw new IOException("Not an NTLMSSP message.");
            }
        }
        if (NtlmMessage.readULong(array, 8) != 3) {
            throw new IOException("Not a Type 3 message.");
        }
        final byte[] securityBuffer = NtlmMessage.readSecurityBuffer(array, 12);
        final int uLong = NtlmMessage.readULong(array, 16);
        final byte[] securityBuffer2 = NtlmMessage.readSecurityBuffer(array, 20);
        final int uLong2 = NtlmMessage.readULong(array, 24);
        final byte[] securityBuffer3 = NtlmMessage.readSecurityBuffer(array, 28);
        final int uLong3 = NtlmMessage.readULong(array, 32);
        final byte[] securityBuffer4 = NtlmMessage.readSecurityBuffer(array, 36);
        final int uLong4 = NtlmMessage.readULong(array, 40);
        final byte[] securityBuffer5 = NtlmMessage.readSecurityBuffer(array, 44);
        final int uLong5 = NtlmMessage.readULong(array, 48);
        byte[] securityBuffer6 = null;
        int uLong6;
        String s;
        if (uLong == 52 || uLong2 == 52 || uLong3 == 52 || uLong4 == 52 || uLong5 == 52) {
            uLong6 = 514;
            s = NtlmMessage.getOEMEncoding();
        }
        else {
            securityBuffer6 = NtlmMessage.readSecurityBuffer(array, 52);
            uLong6 = NtlmMessage.readULong(array, 60);
            if ((uLong6 & 0x1) != 0x0) {
                s = "UTF-16LE";
            }
            else {
                s = NtlmMessage.getOEMEncoding();
            }
        }
        this.setSessionKey(securityBuffer6);
        this.setFlags(uLong6);
        this.setLMResponse(securityBuffer);
        this.setNTResponse(securityBuffer2);
        this.setDomain(new String(securityBuffer3, s));
        this.setUser(new String(securityBuffer4, s));
        this.setWorkstation(new String(securityBuffer5, s));
    }
    
    public String getDomain() {
        return this.domain;
    }
    
    public byte[] getLMResponse() {
        return this.lmResponse;
    }
    
    public byte[] getMasterKey() {
        return this.masterKey;
    }
    
    public byte[] getNTResponse() {
        return this.ntResponse;
    }
    
    public byte[] getSessionKey() {
        return this.sessionKey;
    }
    
    public String getUser() {
        return this.user;
    }
    
    public String getWorkstation() {
        return this.workstation;
    }
    
    public void setDomain(final String domain) {
        this.domain = domain;
    }
    
    public void setLMResponse(final byte[] lmResponse) {
        this.lmResponse = lmResponse;
    }
    
    public void setNTResponse(final byte[] ntResponse) {
        this.ntResponse = ntResponse;
    }
    
    public void setSessionKey(final byte[] sessionKey) {
        this.sessionKey = sessionKey;
    }
    
    public void setUser(final String user) {
        this.user = user;
    }
    
    public void setWorkstation(final String workstation) {
        this.workstation = workstation;
    }
    
    public byte[] toByteArray() {
    Label_0122_Outer:
        while (true) {
            int flags;
            int n;
            byte[] lmResponse;
            byte[] sessionKey;
            byte[] ntResponse;
            int length;
            String workstation;
            int length2;
            byte[] array;
            String user;
            int length3;
            byte[] array2;
            int length4;
            String oemEncoding;
            int length5;
            int length6;
            byte[] array3;
            String domain;
            int length7;
            int length8;
            byte[] array4;
            int n2;
            int n3;
            int n4;
            int n5;
            int length9;
            Label_0122:Label_0069_Outer:
            while (true) {
            Label_0069:
                while (true) {
                Block_12_Outer:
                    while (true) {
                        Label_0476: {
                            while (true) {
                            Label_0016:
                                while (true) {
                                    try {
                                        flags = this.getFlags();
                                        if ((flags & 0x1) != 0x0) {
                                            n = 1;
                                            break Label_0466;
                                        }
                                        break Label_0476;
                                        // iftrue(Label_0435:, lmResponse == null)
                                        // iftrue(Label_0447:, sessionKey == null)
                                        // iftrue(Label_0165:, length2 == 0)
                                        // iftrue(Label_0112:, length3 == 0)
                                        // iftrue(Label_0429:, array == null)
                                        // iftrue(Label_0487:, array2 == null)
                                        // iftrue(Label_0441:, ntResponse == null)
                                        // iftrue(Label_0481:, array3 == null)
                                        // iftrue(Label_0059:, domain == null)
                                        // iftrue(Label_0395:, n == 0)
                                        // iftrue(Label_0112:, user == null)
                                        // iftrue(Label_0383:, n == 0)
                                        // iftrue(Label_0059:, length9 == 0)
                                        // iftrue(Label_0410:, n == 0)
                                        // iftrue(Label_0165:, workstation == null)
                                    Label_0112:
                                        while (true) {
                                        Label_0059:
                                            while (true) {
                                            Block_6:
                                                while (true) {
                                                    Label_0207_Outer:Label_0165_Outer:Block_14_Outer:
                                                    while (true) {
                                                        lmResponse = this.getLMResponse();
                                                        while (true) {
                                                        Label_0191:
                                                            while (true) {
                                                                Block_16: {
                                                                    break Block_16;
                                                                Label_0165:
                                                                    while (true) {
                                                                        Block_15: {
                                                                            while (true) {
                                                                            Block_17_Outer:
                                                                                while (true) {
                                                                                    sessionKey = this.getSessionKey();
                                                                                    Label_0223: {
                                                                                    Block_7:
                                                                                        while (true) {
                                                                                            Block_9: {
                                                                                                while (true) {
                                                                                                    Block_18: {
                                                                                                        break Block_18;
                                                                                                        length = ntResponse.length;
                                                                                                        continue Block_17_Outer;
                                                                                                        length2 = workstation.length();
                                                                                                        array = null;
                                                                                                        break Label_0191;
                                                                                                        length3 = user.length();
                                                                                                        array2 = null;
                                                                                                        break Block_9;
                                                                                                        break Block_15;
                                                                                                        while (true) {
                                                                                                            length4 = array2.length;
                                                                                                            break Label_0122;
                                                                                                            continue Label_0122_Outer;
                                                                                                        }
                                                                                                        Label_0395: {
                                                                                                            array2 = user.toUpperCase().getBytes(oemEncoding);
                                                                                                        }
                                                                                                        continue Label_0112;
                                                                                                    }
                                                                                                    length5 = sessionKey.length;
                                                                                                    break Label_0223;
                                                                                                    ntResponse = this.getNTResponse();
                                                                                                    continue Block_12_Outer;
                                                                                                }
                                                                                                Label_0447: {
                                                                                                    length5 = 0;
                                                                                                }
                                                                                                break Label_0223;
                                                                                                Label_0435:
                                                                                                length6 = 0;
                                                                                                continue Label_0191;
                                                                                                Label_0410:
                                                                                                array = workstation.toUpperCase().getBytes(oemEncoding);
                                                                                                continue Label_0165;
                                                                                                break Block_7;
                                                                                                domain = this.getDomain();
                                                                                                array3 = null;
                                                                                                break Block_17_Outer;
                                                                                                oemEncoding = NtlmMessage.getOEMEncoding();
                                                                                                continue Label_0016;
                                                                                            }
                                                                                            break Label_0059;
                                                                                            user = this.getUser();
                                                                                            array2 = null;
                                                                                            continue Label_0165_Outer;
                                                                                        }
                                                                                        length7 = array3.length;
                                                                                        continue Label_0069;
                                                                                    }
                                                                                    array4 = new byte[length5 + (length + (length6 + (length8 + (length4 + (length7 + 64)))))];
                                                                                    System.arraycopy(Type3Message.NTLMSSP_SIGNATURE, 0, array4, 0, 8);
                                                                                    NtlmMessage.writeULong(array4, 8, 3);
                                                                                    NtlmMessage.writeSecurityBuffer(array4, 12, 64, lmResponse);
                                                                                    n2 = 64 + length6;
                                                                                    NtlmMessage.writeSecurityBuffer(array4, 20, n2, ntResponse);
                                                                                    n3 = n2 + length;
                                                                                    NtlmMessage.writeSecurityBuffer(array4, 28, n3, array3);
                                                                                    n4 = n3 + length7;
                                                                                    NtlmMessage.writeSecurityBuffer(array4, 36, n4, array2);
                                                                                    n5 = n4 + length4;
                                                                                    NtlmMessage.writeSecurityBuffer(array4, 44, n5, array);
                                                                                    NtlmMessage.writeSecurityBuffer(array4, 52, n5 + length8, sessionKey);
                                                                                    NtlmMessage.writeULong(array4, 60, flags);
                                                                                    return array4;
                                                                                    break Block_6;
                                                                                    Label_0441: {
                                                                                        length = 0;
                                                                                    }
                                                                                    continue Block_17_Outer;
                                                                                }
                                                                                length9 = domain.length();
                                                                                array3 = null;
                                                                                continue Block_14_Outer;
                                                                            }
                                                                        }
                                                                        length8 = array.length;
                                                                        continue Label_0207_Outer;
                                                                        array = workstation.getBytes("UTF-16LE");
                                                                        continue Label_0165;
                                                                    }
                                                                    Label_0383: {
                                                                        array3 = domain.getBytes(oemEncoding);
                                                                    }
                                                                    continue Label_0059;
                                                                }
                                                                length6 = lmResponse.length;
                                                                continue Label_0191;
                                                            }
                                                            continue;
                                                        }
                                                        Label_0429: {
                                                            length8 = 0;
                                                        }
                                                        continue Block_12_Outer;
                                                    }
                                                    workstation = this.getWorkstation();
                                                    array = null;
                                                    continue Label_0122_Outer;
                                                }
                                                array3 = domain.getBytes("UTF-16LE");
                                                continue Label_0059;
                                            }
                                            array2 = user.getBytes("UTF-16LE");
                                            continue Label_0112;
                                        }
                                    }
                                    catch (IOException ex) {
                                        throw new IllegalStateException(ex.getMessage());
                                    }
                                    if (n != 0) {
                                        oemEncoding = null;
                                        continue Label_0016;
                                    }
                                    break;
                                }
                                continue Label_0069_Outer;
                            }
                        }
                        n = 0;
                        continue Label_0122_Outer;
                    }
                    Label_0481: {
                        length7 = 0;
                    }
                    continue Label_0069;
                }
                Label_0487: {
                    length4 = 0;
                }
                continue Label_0122;
            }
        }
    }
    
    public String toString() {
        final String user = this.getUser();
        final String domain = this.getDomain();
        final String workstation = this.getWorkstation();
        final byte[] lmResponse = this.getLMResponse();
        final byte[] ntResponse = this.getNTResponse();
        final byte[] sessionKey = this.getSessionKey();
        final StringBuilder append = new StringBuilder("Type3Message[domain=").append(domain).append(",user=").append(user).append(",workstation=").append(workstation).append(",lmResponse=");
        String string;
        if (lmResponse == null) {
            string = "null";
        }
        else {
            string = "<" + lmResponse.length + " bytes>";
        }
        final StringBuilder append2 = append.append(string).append(",ntResponse=");
        String string2;
        if (ntResponse == null) {
            string2 = "null";
        }
        else {
            string2 = "<" + ntResponse.length + " bytes>";
        }
        final StringBuilder append3 = append2.append(string2).append(",sessionKey=");
        String string3;
        if (sessionKey == null) {
            string3 = "null";
        }
        else {
            string3 = "<" + sessionKey.length + " bytes>";
        }
        return append3.append(string3).append(",flags=0x").append(Hexdump.toHexString(this.getFlags(), 8)).append("]").toString();
    }
}
