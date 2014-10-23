package com.bv.sync;

import jcifs.smb.*;
import java.io.*;

public class IgnoreReadProtectedFilter implements IFileFilter
{
    private boolean canRead(final IFile file) throws IOException {
        boolean canRead = file.canRead();
        if (canRead && file instanceof RemoteFile) {
            try {
                if (file.isDirectory()) {
                    file.listFiles();
                }
                else {
                    file.getInputStream().close();
                }
            }
            catch (SmbAuthException ex) {
                if (ex.getNtStatus() != -1073741790) {
                    throw ex;
                }
                canRead = false;
            }
        }
        return canRead;
    }
    
    public boolean accept(final IFile file) throws IOException {
        return this.canRead(file);
    }
}
