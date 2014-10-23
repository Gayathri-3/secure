package com.bv.sync;

import java.io.*;

public interface IFileFilter
{
    boolean accept(IFile p0) throws IOException;
    
    public enum Action
    {
        Exclude("Exclude", 1), 
        Include("Include", 0);
    }
}
