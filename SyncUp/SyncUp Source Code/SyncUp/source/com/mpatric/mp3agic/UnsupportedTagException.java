package com.mpatric.mp3agic;

public class UnsupportedTagException extends BaseException
{
    private static final long serialVersionUID = -606698954309762518L;
    
    public UnsupportedTagException() {
        super();
    }
    
    public UnsupportedTagException(final String s) {
        super(s);
    }
    
    public UnsupportedTagException(final String s, final Throwable t) {
        super(s, t);
    }
}
