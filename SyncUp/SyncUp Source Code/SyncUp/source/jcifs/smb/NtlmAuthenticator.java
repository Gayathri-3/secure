package jcifs.smb;

public abstract class NtlmAuthenticator
{
    private static NtlmAuthenticator auth;
    private SmbAuthException sae;
    private String url;
    
    public static NtlmPasswordAuthentication requestNtlmPasswordAuthentication(final String url, final SmbAuthException sae) {
        NtlmPasswordAuthentication ntlmPasswordAuthentication;
        if (NtlmAuthenticator.auth == null) {
            ntlmPasswordAuthentication = null;
        }
        else {
            synchronized (NtlmAuthenticator.auth) {
                NtlmAuthenticator.auth.url = url;
                NtlmAuthenticator.auth.sae = sae;
                ntlmPasswordAuthentication = NtlmAuthenticator.auth.getNtlmPasswordAuthentication();
            }
        }
        return ntlmPasswordAuthentication;
    }
    
    private void reset() {
        this.url = null;
        this.sae = null;
    }
    
    public static void setDefault(final NtlmAuthenticator auth) {
        synchronized (NtlmAuthenticator.class) {
            if (NtlmAuthenticator.auth == null) {
                NtlmAuthenticator.auth = auth;
            }
        }
    }
    
    protected NtlmPasswordAuthentication getNtlmPasswordAuthentication() {
        return null;
    }
    
    protected final SmbAuthException getRequestingException() {
        return this.sae;
    }
    
    protected final String getRequestingURL() {
        return this.url;
    }
}
