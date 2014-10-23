package jcifs.smb;

import java.net.*;
import java.io.*;

public class Handler extends URLStreamHandler
{
    static final URLStreamHandler SMB_HANDLER;
    
    static {
        SMB_HANDLER = new Handler();
    }
    
    protected int getDefaultPort() {
        return 445;
    }
    
    public URLConnection openConnection(final URL url) throws IOException {
        return new SmbFile(url);
    }
    
    protected void parseURL(final URL url, String string, final int n, int n2) {
        final String host = url.getHost();
        if (string.equals("smb://")) {
            string = "smb:////";
            n2 += 2;
        }
        else if (!string.startsWith("smb://") && host != null && host.length() == 0) {
            string = "//" + string;
            n2 += 2;
        }
        super.parseURL(url, string, n, n2);
        String s = url.getPath();
        final String ref = url.getRef();
        if (ref != null) {
            s = String.valueOf(s) + '#' + ref;
        }
        int n3 = url.getPort();
        if (n3 == -1) {
            n3 = this.getDefaultPort();
        }
        this.setURL(url, "smb", url.getHost(), n3, url.getAuthority(), url.getUserInfo(), s, url.getQuery(), null);
    }
}
