package jcifs.dcerpc;

import jcifs.dcerpc.msrpc.*;
import java.util.*;

public class DcerpcBinding
{
    private static HashMap INTERFACES;
    String endpoint;
    int major;
    int minor;
    HashMap options;
    String proto;
    String server;
    UUID uuid;
    
    static {
        (DcerpcBinding.INTERFACES = new HashMap()).put("srvsvc", srvsvc.getSyntax());
        DcerpcBinding.INTERFACES.put("lsarpc", lsarpc.getSyntax());
        DcerpcBinding.INTERFACES.put("samr", samr.getSyntax());
        DcerpcBinding.INTERFACES.put("netdfs", netdfs.getSyntax());
    }
    
    DcerpcBinding(final String proto, final String server) {
        super();
        this.endpoint = null;
        this.options = null;
        this.uuid = null;
        this.proto = proto;
        this.server = server;
    }
    
    public static void addInterface(final String s, final String s2) {
        DcerpcBinding.INTERFACES.put(s, s2);
    }
    
    Object getOption(final String s) {
        String s2;
        if (s.equals("endpoint")) {
            s2 = this.endpoint;
        }
        else if (this.options != null) {
            s2 = this.options.get(s);
        }
        else {
            s2 = null;
        }
        return s2;
    }
    
    void setOption(final String s, final Object o) throws DcerpcException {
        if (s.equals("endpoint")) {
            this.endpoint = o.toString().toLowerCase();
            if (this.endpoint.startsWith("\\pipe\\")) {
                final String s2 = DcerpcBinding.INTERFACES.get(this.endpoint.substring(6));
                if (s2 != null) {
                    final int index = s2.indexOf(58);
                    final int index2 = s2.indexOf(46, index + 1);
                    this.uuid = new UUID(s2.substring(0, index));
                    this.major = Integer.parseInt(s2.substring(index + 1, index2));
                    this.minor = Integer.parseInt(s2.substring(index2 + 1));
                    return;
                }
            }
            throw new DcerpcException("Bad endpoint: " + this.endpoint);
        }
        if (this.options == null) {
            this.options = new HashMap();
        }
        this.options.put(s, o);
    }
    
    public String toString() {
        String s = String.valueOf(this.proto) + ":" + this.server + "[" + this.endpoint;
        if (this.options != null) {
            for (final Object next : this.options.keySet()) {
                s = String.valueOf(s) + "," + next + "=" + this.options.get(next);
            }
        }
        return String.valueOf(s) + "]";
    }
}
