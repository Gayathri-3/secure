package com.mpatric.mp3agic;

import java.io.*;

public class BaseException extends IOException
{
    private static final long serialVersionUID = 1372565856359010109L;
    
    public BaseException() {
        super();
    }
    
    public BaseException(final String s) {
        super(s);
    }
    
    public BaseException(final String s, final Throwable t) {
        super(s, t);
    }
    
    public String getDetailedMessage() {
        Throwable cause = this;
        final StringBuffer sb = new StringBuffer();
        while (true) {
            sb.append('[');
            sb.append(((BaseException)cause).getClass().getName());
            if (cause.getMessage() != null && cause.getMessage().length() > 0) {
                sb.append(": ");
                sb.append(cause.getMessage());
            }
            sb.append(']');
            cause = cause.getCause();
            if (cause == null) {
                break;
            }
            sb.append(" caused by ");
        }
        return sb.toString();
    }
}
