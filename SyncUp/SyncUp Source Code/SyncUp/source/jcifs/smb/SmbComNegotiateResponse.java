package jcifs.smb;

import java.io.*;
import jcifs.util.*;
import java.util.*;

class SmbComNegotiateResponse extends ServerMessageBlock
{
    int dialectIndex;
    SmbTransport.ServerData server;
    
    SmbComNegotiateResponse(final SmbTransport.ServerData server) {
        super();
        this.server = server;
    }
    
    int readBytesWireFormat(final byte[] array, int n) {
        final int n2 = n;
        if ((Integer.MIN_VALUE & this.server.capabilities) == 0x0) {
            System.arraycopy(array, n, this.server.encryptionKey = new byte[this.server.encryptionKeyLength], 0, this.server.encryptionKeyLength);
            n += this.server.encryptionKeyLength;
            if (this.byteCount > this.server.encryptionKeyLength) {
                int n3 = 0;
                Label_0299: {
                    while (true) {
                        Label_0206: {
                            try {
                                final int n4 = 0x8000 & this.flags2;
                                n3 = 0;
                                if (n4 == 32768) {
                                    while (array[n + n3] != 0 || array[1 + (n + n3)] != 0) {
                                        n3 += 2;
                                        if (n3 > 256) {
                                            throw new RuntimeException("zero termination not found");
                                        }
                                    }
                                    this.server.oemDomainName = new String(array, n, n3, "UTF-16LE");
                                    break Label_0299;
                                }
                                break Label_0206;
                            }
                            catch (UnsupportedEncodingException ex) {
                                final LogStream log = SmbComNegotiateResponse.log;
                                if (LogStream.level > 1) {
                                    ex.printStackTrace(SmbComNegotiateResponse.log);
                                }
                                break Label_0299;
                            }
                            if (++n3 > 256) {
                                throw new RuntimeException("zero termination not found");
                            }
                        }
                        if (array[n + n3] != 0) {
                            continue;
                        }
                        break;
                    }
                    this.server.oemDomainName = new String(array, n, n3, ServerMessageBlock.OEM_ENCODING);
                }
                n += n3;
            }
            else {
                this.server.oemDomainName = new String();
            }
        }
        else {
            System.arraycopy(array, n, this.server.guid = new byte[16], 0, 16);
            this.server.oemDomainName = new String();
        }
        return n - n2;
    }
    
    int readParameterWordsWireFormat(final byte[] array, final int n) {
        boolean signaturesRequired = true;
        this.dialectIndex = ServerMessageBlock.readInt2(array, n);
        final int n2 = n + 2;
        int n3;
        if (this.dialectIndex > 10) {
            n3 = n2 - n;
        }
        else {
            final SmbTransport.ServerData server = this.server;
            final int n4 = n2 + 1;
            server.securityMode = (0xFF & array[n2]);
            this.server.security = (0x1 & this.server.securityMode);
            this.server.encryptedPasswords = ((0x2 & this.server.securityMode) == 0x2 && signaturesRequired);
            this.server.signaturesEnabled = ((0x4 & this.server.securityMode) == 0x4 && signaturesRequired);
            final SmbTransport.ServerData server2 = this.server;
            if ((0x8 & this.server.securityMode) != 0x8) {
                signaturesRequired = false;
            }
            server2.signaturesRequired = signaturesRequired;
            this.server.maxMpxCount = ServerMessageBlock.readInt2(array, n4);
            final int n5 = n4 + 2;
            this.server.maxNumberVcs = ServerMessageBlock.readInt2(array, n5);
            final int n6 = n5 + 2;
            this.server.maxBufferSize = ServerMessageBlock.readInt4(array, n6);
            final int n7 = n6 + 4;
            this.server.maxRawSize = ServerMessageBlock.readInt4(array, n7);
            final int n8 = n7 + 4;
            this.server.sessionKey = ServerMessageBlock.readInt4(array, n8);
            final int n9 = n8 + 4;
            this.server.capabilities = ServerMessageBlock.readInt4(array, n9);
            final int n10 = n9 + 4;
            this.server.serverTime = ServerMessageBlock.readTime(array, n10);
            final int n11 = n10 + 8;
            this.server.serverTimeZone = (short)ServerMessageBlock.readInt2(array, n11);
            final int n12 = n11 + 2;
            final SmbTransport.ServerData server3 = this.server;
            final int n13 = n12 + 1;
            server3.encryptionKeyLength = (0xFF & array[n12]);
            n3 = n13 - n;
        }
        return n3;
    }
    
    public String toString() {
        final StringBuilder append = new StringBuilder("SmbComNegotiateResponse[").append(super.toString()).append(",wordCount=").append(this.wordCount).append(",dialectIndex=").append(this.dialectIndex).append(",securityMode=0x").append(Hexdump.toHexString(this.server.securityMode, 1)).append(",security=");
        String s;
        if (this.server.security == 0) {
            s = "share";
        }
        else {
            s = "user";
        }
        return new String(append.append(s).append(",encryptedPasswords=").append(this.server.encryptedPasswords).append(",maxMpxCount=").append(this.server.maxMpxCount).append(",maxNumberVcs=").append(this.server.maxNumberVcs).append(",maxBufferSize=").append(this.server.maxBufferSize).append(",maxRawSize=").append(this.server.maxRawSize).append(",sessionKey=0x").append(Hexdump.toHexString(this.server.sessionKey, 8)).append(",capabilities=0x").append(Hexdump.toHexString(this.server.capabilities, 8)).append(",serverTime=").append(new Date(this.server.serverTime)).append(",serverTimeZone=").append(this.server.serverTimeZone).append(",encryptionKeyLength=").append(this.server.encryptionKeyLength).append(",byteCount=").append(this.byteCount).append(",oemDomainName=").append(this.server.oemDomainName).append("]").toString());
    }
    
    int writeBytesWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParameterWordsWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
