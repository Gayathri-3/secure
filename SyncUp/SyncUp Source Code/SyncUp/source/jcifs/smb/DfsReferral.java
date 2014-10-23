package jcifs.smb;

import java.util.*;

public class DfsReferral extends SmbException
{
    public long expiration;
    String key;
    public String link;
    Map map;
    DfsReferral next;
    public String path;
    public int pathConsumed;
    public boolean resolveHashes;
    public String server;
    public String share;
    public long ttl;
    
    public DfsReferral() {
        super();
        this.key = null;
        this.next = this;
    }
    
    void append(final DfsReferral next) {
        next.next = this.next;
        this.next = next;
    }
    
    public String toString() {
        return "DfsReferral[pathConsumed=" + this.pathConsumed + ",server=" + this.server + ",share=" + this.share + ",link=" + this.link + ",path=" + this.path + ",ttl=" + this.ttl + ",expiration=" + this.expiration + ",resolveHashes=" + this.resolveHashes + "]";
    }
}
