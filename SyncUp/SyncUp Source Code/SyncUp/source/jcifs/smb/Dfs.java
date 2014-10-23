package jcifs.smb;

import jcifs.util.*;
import jcifs.*;
import java.io.*;
import java.util.*;

public class Dfs
{
    static final boolean DISABLED;
    protected static CacheEntry FALSE_ENTRY;
    static final long TTL;
    static LogStream log;
    static final boolean strictView;
    protected CacheEntry _domains;
    protected CacheEntry referrals;
    
    static {
        Dfs.log = LogStream.getInstance();
        strictView = Config.getBoolean("jcifs.smb.client.dfs.strictView", false);
        TTL = Config.getLong("jcifs.smb.client.dfs.ttl", 300L);
        DISABLED = Config.getBoolean("jcifs.smb.client.dfs.disabled", false);
        Dfs.FALSE_ENTRY = new CacheEntry(0L);
    }
    
    public Dfs() {
        super();
        this._domains = null;
        this.referrals = null;
    }
    
    public SmbTransport getDc(final String s, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws SmbAuthException {
        final boolean disabled = Dfs.DISABLED;
        SmbTransport smbTransport = null;
        if (!disabled) {
            try {
                DfsReferral dfsReferral = SmbTransport.getSmbTransport(UniAddress.getByName(s, true), 0).getDfsReferrals(ntlmPasswordAuthentication, "\\" + s, 1);
                smbTransport = null;
                if (dfsReferral != null) {
                    final DfsReferral dfsReferral2 = dfsReferral;
                    while (true) {
                        try {
                            smbTransport = SmbTransport.getSmbTransport(UniAddress.getByName(dfsReferral.server), 0);
                        }
                        catch (IOException ex) {
                            dfsReferral = dfsReferral.next;
                            if (dfsReferral == dfsReferral2) {
                                throw ex;
                            }
                            continue;
                        }
                        break;
                    }
                }
            }
            catch (IOException ex2) {
                if (LogStream.level >= 3) {
                    ex2.printStackTrace(Dfs.log);
                }
                final boolean strictView = Dfs.strictView;
                smbTransport = null;
                if (strictView) {
                    final boolean b = ex2 instanceof SmbAuthException;
                    smbTransport = null;
                    if (b) {
                        throw (SmbAuthException)ex2;
                    }
                }
            }
        }
        return smbTransport;
    }
    
    public DfsReferral getReferral(final SmbTransport smbTransport, final String s, final String s2, final String s3, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws SmbAuthException {
        DfsReferral dfsReferrals;
        if (Dfs.DISABLED) {
            dfsReferrals = null;
        }
        else {
            while (true) {
                try {
                    String s4 = "\\" + s + "\\" + s2;
                    if (s3 != null) {
                        s4 = String.valueOf(s4) + s3;
                    }
                    dfsReferrals = smbTransport.getDfsReferrals(ntlmPasswordAuthentication, s4, 0);
                    if (dfsReferrals == null) {
                        dfsReferrals = null;
                    }
                }
                catch (IOException ex) {
                    if (LogStream.level >= 4) {
                        ex.printStackTrace(Dfs.log);
                    }
                    if (Dfs.strictView && ex instanceof SmbAuthException) {
                        throw (SmbAuthException)ex;
                    }
                    continue;
                }
                break;
            }
        }
        return dfsReferrals;
    }
    
    public HashMap getTrustedDomains(final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws SmbAuthException {
        final boolean disabled = Dfs.DISABLED;
        HashMap hashMap = null;
        if (!disabled) {
            final String domain = ntlmPasswordAuthentication.domain;
            hashMap = null;
            if (domain != "?") {
                if (this._domains != null && System.currentTimeMillis() > this._domains.expiration) {
                    this._domains = null;
                }
                if (this._domains != null) {
                    hashMap = this._domains.map;
                }
                else {
                    try {
                        final SmbTransport smbTransport = SmbTransport.getSmbTransport(UniAddress.getByName(ntlmPasswordAuthentication.domain, true), 0);
                        final CacheEntry domains = new CacheEntry(10L * Dfs.TTL);
                        DfsReferral dfsReferral = smbTransport.getDfsReferrals(ntlmPasswordAuthentication, "", 0);
                        hashMap = null;
                        if (dfsReferral != null) {
                            do {
                                domains.map.put(dfsReferral.server.toLowerCase(), new HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap<String, HashMap>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>());
                                dfsReferral = dfsReferral.next;
                                hashMap = null;
                            } while (dfsReferral != dfsReferral);
                            this._domains = domains;
                            hashMap = this._domains.map;
                        }
                    }
                    catch (IOException ex) {
                        if (LogStream.level >= 3) {
                            ex.printStackTrace(Dfs.log);
                        }
                        if (Dfs.strictView && ex instanceof SmbAuthException) {
                            throw (SmbAuthException)ex;
                        }
                    }
                }
            }
        }
        return hashMap;
    }
    
    void insert(final String s, final DfsReferral dfsReferral) {
        while (true) {
            while (true) {
                int length = 0;
                Label_0213: {
                    synchronized (this) {
                        if (!Dfs.DISABLED) {
                            final int index = s.indexOf(92, 1);
                            final int index2 = s.indexOf(92, index + 1);
                            final String substring = s.substring(1, index);
                            final String substring2 = s.substring(index + 1, index2);
                            String s2 = s.substring(0, dfsReferral.pathConsumed).toLowerCase();
                            length = s2.length();
                            if (length > 1 && s2.charAt(length - 1) == '\\') {
                                break Label_0213;
                            }
                            if (length < s2.length()) {
                                s2 = s2.substring(0, length);
                            }
                            dfsReferral.pathConsumed -= 1 + (1 + substring.length()) + substring2.length();
                            if (this.referrals != null && 10000L + System.currentTimeMillis() > this.referrals.expiration) {
                                this.referrals = null;
                            }
                            if (this.referrals == null) {
                                this.referrals = new CacheEntry(0L);
                            }
                            this.referrals.map.put(s2, dfsReferral);
                        }
                        return;
                    }
                }
                --length;
                continue;
            }
        }
    }
    
    public boolean isTrustedDomain(final String s, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws SmbAuthException {
        final HashMap trustedDomains = this.getTrustedDomains(ntlmPasswordAuthentication);
        boolean b = false;
        if (trustedDomains != null) {
            final Object value = trustedDomains.get(s.toLowerCase());
            b = false;
            if (value != null) {
                b = true;
            }
        }
        return b;
    }
    
    public DfsReferral resolve(String lowerCase, String lowerCase2, final String s, final NtlmPasswordAuthentication ntlmPasswordAuthentication) throws SmbAuthException {
        while (true) {
            long currentTimeMillis = 0L;
            DfsReferral dfsReferral2 = null;
            Label_0481: {
                CacheEntry cacheEntry = null;
                SmbTransport smbTransport = null;
            Label_0419:
                while (true) {
                    Label_0385: {
                        synchronized (this) {
                            currentTimeMillis = System.currentTimeMillis();
                            DfsReferral dfsReferral;
                            if (Dfs.DISABLED || lowerCase2.equals("IPC$")) {
                                dfsReferral = null;
                            }
                            else {
                                final HashMap trustedDomains = this.getTrustedDomains(ntlmPasswordAuthentication);
                                dfsReferral2 = null;
                                if (trustedDomains == null) {
                                    break Label_0481;
                                }
                                lowerCase = lowerCase.toLowerCase();
                                final HashMap<K, CacheEntry> hashMap = trustedDomains.get(lowerCase);
                                dfsReferral2 = null;
                                if (hashMap == null) {
                                    break Label_0481;
                                }
                                lowerCase2 = lowerCase2.toLowerCase();
                                cacheEntry = hashMap.get(lowerCase2);
                                if (cacheEntry != null && currentTimeMillis > cacheEntry.expiration) {
                                    hashMap.remove(lowerCase2);
                                    cacheEntry = null;
                                }
                                if (cacheEntry != null) {
                                    break Label_0385;
                                }
                                smbTransport = this.getDc(lowerCase, ntlmPasswordAuthentication);
                                if (smbTransport == null) {
                                    dfsReferral = null;
                                }
                                else {
                                    dfsReferral2 = this.getReferral(smbTransport, lowerCase, lowerCase2, s, ntlmPasswordAuthentication);
                                    if (dfsReferral2 != null) {
                                        final int n = 1 + (1 + lowerCase.length()) + lowerCase2.length();
                                        cacheEntry = new CacheEntry(0L);
                                        DfsReferral next = dfsReferral2;
                                        do {
                                            if (s == null) {
                                                next.map = cacheEntry.map;
                                                next.key = "\\";
                                            }
                                            next.pathConsumed -= n;
                                            next = next.next;
                                        } while (next != dfsReferral2);
                                        if (dfsReferral2.key != null) {
                                            cacheEntry.map.put(dfsReferral2.key, dfsReferral2);
                                        }
                                        hashMap.put((K)lowerCase2, cacheEntry);
                                    }
                                    else if (s == null) {
                                        hashMap.put((K)lowerCase2, Dfs.FALSE_ENTRY);
                                    }
                                    if (cacheEntry == null) {
                                        break Label_0481;
                                    }
                                    dfsReferral2 = (DfsReferral)cacheEntry.map.get("\\");
                                    if (dfsReferral2 != null && currentTimeMillis > dfsReferral2.expiration) {
                                        cacheEntry.map.remove("\\");
                                        dfsReferral2 = null;
                                    }
                                    if (dfsReferral2 != null) {
                                        break Label_0481;
                                    }
                                    if (smbTransport != null) {
                                        break Label_0419;
                                    }
                                    smbTransport = this.getDc(lowerCase, ntlmPasswordAuthentication);
                                    if (smbTransport != null) {
                                        break Label_0419;
                                    }
                                    dfsReferral = null;
                                }
                            }
                            return dfsReferral;
                        }
                    }
                    final CacheEntry false_ENTRY = Dfs.FALSE_ENTRY;
                    final CacheEntry cacheEntry2 = cacheEntry;
                    smbTransport = null;
                    dfsReferral2 = null;
                    if (cacheEntry2 == false_ENTRY) {
                        smbTransport = null;
                        dfsReferral2 = null;
                        cacheEntry = null;
                        continue;
                    }
                    continue;
                }
                dfsReferral2 = this.getReferral(smbTransport, lowerCase, lowerCase2, s, ntlmPasswordAuthentication);
                if (dfsReferral2 != null) {
                    dfsReferral2.pathConsumed -= 1 + (1 + lowerCase.length()) + lowerCase2.length();
                    dfsReferral2.link = "\\";
                    cacheEntry.map.put("\\", dfsReferral2);
                }
            }
            if (dfsReferral2 == null && s != null) {
                if (this.referrals != null && currentTimeMillis > this.referrals.expiration) {
                    this.referrals = null;
                }
                if (this.referrals == null) {
                    this.referrals = new CacheEntry(0L);
                }
                String s2 = "\\" + lowerCase + "\\" + lowerCase2;
                if (!s.equals("\\")) {
                    s2 = String.valueOf(s2) + s;
                }
                final String lowerCase3 = s2.toLowerCase();
                for (final String s3 : this.referrals.map.keySet()) {
                    final int length = s3.length();
                    int equals;
                    if (length == lowerCase3.length()) {
                        equals = (s3.equals(lowerCase3) ? 1 : 0);
                    }
                    else {
                        final int length2 = lowerCase3.length();
                        equals = 0;
                        if (length < length2) {
                            if (s3.regionMatches(0, lowerCase3, 0, length) && lowerCase3.charAt(length) == '\\') {
                                equals = 1;
                            }
                            else {
                                equals = 0;
                            }
                        }
                    }
                    if (equals != 0) {
                        dfsReferral2 = (DfsReferral)this.referrals.map.get(s3);
                    }
                }
            }
            return dfsReferral2;
        }
    }
    
    static class CacheEntry
    {
        long expiration;
        HashMap map;
        
        CacheEntry(long ttl) {
            super();
            if (ttl == 0L) {
                ttl = Dfs.TTL;
            }
            this.expiration = System.currentTimeMillis() + 1000L * ttl;
            this.map = new HashMap();
        }
    }
}
