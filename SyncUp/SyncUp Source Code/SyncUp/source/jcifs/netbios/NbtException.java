package jcifs.netbios;

import java.io.*;

public class NbtException extends IOException
{
    public static final int ACT_ERR = 6;
    public static final int CALLED_NOT_PRESENT = 130;
    public static final int CFT_ERR = 7;
    public static final int CONNECTION_REFUSED = -1;
    public static final int ERR_NAM_SRVC = 1;
    public static final int ERR_SSN_SRVC = 2;
    public static final int FMT_ERR = 1;
    public static final int IMP_ERR = 4;
    public static final int NOT_LISTENING_CALLED = 128;
    public static final int NOT_LISTENING_CALLING = 129;
    public static final int NO_RESOURCES = 131;
    public static final int RFS_ERR = 5;
    public static final int SRV_ERR = 2;
    public static final int SUCCESS = 0;
    public static final int UNSPECIFIED = 143;
    public int errorClass;
    public int errorCode;
    
    public NbtException(final int errorClass, final int errorCode) {
        super(getErrorString(errorClass, errorCode));
        this.errorClass = errorClass;
        this.errorCode = errorCode;
    }
    
    public static String getErrorString(final int n, final int n2) {
        String s = null;
        Label_0053: {
            switch (n) {
                default: {
                    s = String.valueOf("") + "unknown error class: " + n;
                    break;
                }
                case 0: {
                    s = String.valueOf("") + "SUCCESS";
                    break;
                }
                case 1: {
                    String s2 = String.valueOf("") + "ERR_NAM_SRVC/";
                    switch (n2) {
                        case 1: {
                            s2 = String.valueOf(s2) + "FMT_ERR: Format Error";
                            break;
                        }
                    }
                    s = String.valueOf(s2) + "Unknown error code: " + n2;
                    break;
                }
                case 2: {
                    final String string = String.valueOf("") + "ERR_SSN_SRVC/";
                    switch (n2) {
                        default: {
                            s = String.valueOf(string) + "Unknown error code: " + n2;
                            break Label_0053;
                        }
                        case -1: {
                            s = String.valueOf(string) + "Connection refused";
                            break Label_0053;
                        }
                        case 128: {
                            s = String.valueOf(string) + "Not listening on called name";
                            break Label_0053;
                        }
                        case 129: {
                            s = String.valueOf(string) + "Not listening for calling name";
                            break Label_0053;
                        }
                        case 130: {
                            s = String.valueOf(string) + "Called name not present";
                            break Label_0053;
                        }
                        case 131: {
                            s = String.valueOf(string) + "Called name present, but insufficient resources";
                            break Label_0053;
                        }
                        case 143: {
                            s = String.valueOf(string) + "Unspecified error";
                            break Label_0053;
                        }
                    }
                    break;
                }
            }
        }
        return s;
    }
    
    public String toString() {
        return new String("errorClass=" + this.errorClass + ",errorCode=" + this.errorCode + ",errorString=" + getErrorString(this.errorClass, this.errorCode));
    }
}
