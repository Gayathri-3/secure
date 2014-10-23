package jcifs.util.transport;

import java.io.*;

public class TransportException extends IOException
{
    private Throwable rootCause;
    
    public TransportException() {
        super();
    }
    
    public TransportException(final String s) {
        super(s);
    }
    
    public TransportException(final String s, final Throwable rootCause) {
        super(s);
        this.rootCause = rootCause;
    }
    
    public TransportException(final Throwable rootCause) {
        super();
        this.rootCause = rootCause;
    }
    
    public Throwable getRootCause() {
        return this.rootCause;
    }
    
    public String toString() {
        String s;
        if (this.rootCause != null) {
            final StringWriter stringWriter = new StringWriter();
            this.rootCause.printStackTrace(new PrintWriter(stringWriter));
            s = String.valueOf(super.toString()) + "\n" + stringWriter;
        }
        else {
            s = super.toString();
        }
        return s;
    }
}
