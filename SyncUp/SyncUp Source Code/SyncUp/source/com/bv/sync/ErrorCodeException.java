package com.bv.sync;

import java.io.*;

public class ErrorCodeException extends IOException
{
    public static final int ERROR_CREATE_DIR = 3;
    public static final int ERROR_DELETE_FILE = 5;
    public static final int ERROR_INVALID_TIMESTAMP = 7;
    public static final int ERROR_NAME_COLLISION = 6;
    public static final int ERROR_OUT_OF_DISK_SPACE = 8;
    public static final int ERROR_READ_DIR = 2;
    public static final int ERROR_RENAME_FILE = 4;
    public static final int ERROR_SET_TIME = 1;
    private static final long serialVersionUID = 7714476384054211634L;
    public final int errorCode;
    
    public ErrorCodeException(final int errorCode, final String s) {
        super(s);
        this.errorCode = errorCode;
    }
}
