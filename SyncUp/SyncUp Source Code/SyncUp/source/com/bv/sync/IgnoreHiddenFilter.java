package com.bv.sync;

import java.io.*;

public class IgnoreHiddenFilter implements IFileFilter
{
    public boolean accept(final IFile file) throws IOException {
        return !file.isHidden();
    }
}
