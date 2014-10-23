package com.mpatric.mp3agic;

public class InvalidDataException extends BaseException
{
    private static final long serialVersionUID = -752158835256784588L;
    
    public InvalidDataException() {
        super();
    }
    
    public InvalidDataException(final String s) {
        super(s);
    }
    
    public InvalidDataException(final String s, final Throwable t) {
        super(s, t);
    }
}
