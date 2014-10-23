package com.bv.sync;

import java.io.*;

public class DateFilter implements IFileFilter
{
    private final IFileFilter.Action action;
    private final long date;
    
    public DateFilter(final long date, final IFileFilter.Action action) {
        super();
        this.date = date;
        this.action = action;
    }
    
    public boolean accept(final IFile file) throws IOException {
        boolean b = true;
        if (!file.isDirectory()) {
            boolean b2 = file.getLastModified() >= this.date && b;
            if (this.action != IFileFilter.Action.Include) {
                b2 = (!b2 && b);
            }
            b = b2;
        }
        return b;
    }
}
