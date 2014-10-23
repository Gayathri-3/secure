package com.mpatric.mp3agic;

public class NoSuchTagException extends BaseException
{
    private static final long serialVersionUID = 5945423171536888341L;
    
    public NoSuchTagException() {
        super();
    }
    
    public NoSuchTagException(final String s) {
        super(s);
    }
    
    public NoSuchTagException(final String s, final Throwable t) {
        super(s, t);
    }
}
