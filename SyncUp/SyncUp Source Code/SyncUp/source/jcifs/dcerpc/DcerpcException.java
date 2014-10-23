package jcifs.dcerpc;

import jcifs.smb.*;
import jcifs.util.*;
import java.io.*;

public class DcerpcException extends IOException implements DcerpcError, WinError
{
    private int error;
    private Throwable rootCause;
    
    DcerpcException(final int error) {
        super(getMessageByDcerpcError(error));
        this.error = error;
    }
    
    public DcerpcException(final String s) {
        super(s);
    }
    
    public DcerpcException(final String s, final Throwable rootCause) {
        super(s);
        this.rootCause = rootCause;
    }
    
    static String getMessageByDcerpcError(final int n) {
        int n2 = 0;
        int i = DcerpcException.DCERPC_FAULT_CODES.length;
        while (i >= n2) {
            final int n3 = (n2 + i) / 2;
            if (n > DcerpcException.DCERPC_FAULT_CODES[n3]) {
                n2 = n3 + 1;
            }
            else {
                if (n >= DcerpcException.DCERPC_FAULT_CODES[n3]) {
                    return DcerpcException.DCERPC_FAULT_MESSAGES[n3];
                }
                i = n3 - 1;
            }
        }
        return "0x" + Hexdump.toHexString(n, 8);
    }
    
    public int getErrorCode() {
        return this.error;
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
