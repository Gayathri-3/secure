package jcifs.util;

import java.io.*;

public class LogStream extends PrintStream
{
    private static LogStream inst;
    public static int level;
    
    static {
        LogStream.level = 1;
    }
    
    public LogStream(final PrintStream printStream) {
        super(printStream);
    }
    
    public static LogStream getInstance() {
        if (LogStream.inst == null) {
            setInstance(System.err);
        }
        return LogStream.inst;
    }
    
    public static void setInstance(final PrintStream printStream) {
        LogStream.inst = new LogStream(printStream);
    }
    
    public static void setLevel(final int level) {
        LogStream.level = level;
    }
}
