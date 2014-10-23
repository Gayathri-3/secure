package jcifs.smb;

import jcifs.util.*;
import java.io.*;

public class SmbException extends IOException implements NtStatus, DosError, WinError
{
    private Throwable rootCause;
    private int status;
    
    SmbException() {
        super();
    }
    
    SmbException(final int n, final Throwable rootCause) {
        super(getMessageByCode(n));
        this.status = getStatusByCode(n);
        this.rootCause = rootCause;
    }
    
    public SmbException(int statusByCode, final boolean b) {
        String s;
        if (b) {
            s = getMessageByWinerrCode(statusByCode);
        }
        else {
            s = getMessageByCode(statusByCode);
        }
        super(s);
        if (!b) {
            statusByCode = getStatusByCode(statusByCode);
        }
        this.status = statusByCode;
    }
    
    SmbException(final String s) {
        super(s);
        this.status = -1073741823;
    }
    
    SmbException(final String s, final Throwable rootCause) {
        super(s);
        this.rootCause = rootCause;
        this.status = -1073741823;
    }
    
    static String getMessageByCode(final int n) {
        String string;
        if (n == 0) {
            string = "NT_STATUS_SUCCESS";
        }
        else {
            if ((n & 0xC0000000) == 0xC0000000) {
                int n2 = 1;
                int i = -1 + SmbException.NT_STATUS_CODES.length;
                while (i >= n2) {
                    final int n3 = (n2 + i) / 2;
                    if (n > SmbException.NT_STATUS_CODES[n3]) {
                        n2 = n3 + 1;
                    }
                    else {
                        if (n >= SmbException.NT_STATUS_CODES[n3]) {
                            string = SmbException.NT_STATUS_MESSAGES[n3];
                            return string;
                        }
                        i = n3 - 1;
                    }
                }
            }
            else {
                int n4 = 0;
                int j = -1 + SmbException.DOS_ERROR_CODES.length;
                while (j >= n4) {
                    final int n5 = (n4 + j) / 2;
                    if (n > SmbException.DOS_ERROR_CODES[n5][0]) {
                        n4 = n5 + 1;
                    }
                    else {
                        if (n >= SmbException.DOS_ERROR_CODES[n5][0]) {
                            string = SmbException.DOS_ERROR_MESSAGES[n5];
                            return string;
                        }
                        j = n5 - 1;
                    }
                }
            }
            string = "0x" + Hexdump.toHexString(n, 8);
        }
        return string;
    }
    
    static String getMessageByWinerrCode(final int n) {
        int n2 = 0;
        int i = -1 + SmbException.WINERR_CODES.length;
        while (i >= n2) {
            final int n3 = (n2 + i) / 2;
            if (n > SmbException.WINERR_CODES[n3]) {
                n2 = n3 + 1;
            }
            else {
                if (n >= SmbException.WINERR_CODES[n3]) {
                    return SmbException.WINERR_MESSAGES[n3];
                }
                i = n3 - 1;
            }
        }
        return new StringBuilder(String.valueOf(n)).toString();
    }
    
    static int getStatusByCode(int n) {
        if ((0xC0000000 & n) == 0x0) {
            int n2 = 0;
            int i = -1 + SmbException.DOS_ERROR_CODES.length;
            while (i >= n2) {
                final int n3 = (n2 + i) / 2;
                if (n > SmbException.DOS_ERROR_CODES[n3][0]) {
                    n2 = n3 + 1;
                }
                else {
                    if (n >= SmbException.DOS_ERROR_CODES[n3][0]) {
                        n = SmbException.DOS_ERROR_CODES[n3][1];
                        return n;
                    }
                    i = n3 - 1;
                }
            }
            n = -1073741823;
        }
        return n;
    }
    
    public int getNtStatus() {
        return this.status;
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
