package com.mpatric.mp3agic;

public class NotSupportedException extends BaseException
{
    private static final long serialVersionUID = -7320965173627986179L;
    
    public NotSupportedException() {
        super();
    }
    
    public NotSupportedException(final String s) {
        super(s);
    }
    
    public NotSupportedException(final String s, final Throwable t) {
        super(s, t);
    }
}
