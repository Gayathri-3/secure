package com.bv.sync;

import java.util.*;

public class FileFilter implements IFileFilter
{
    private final IFileFilter.Action action;
    private final Set<String> paths;
    private final IFile[] roots;
    
    public FileFilter(final Set<String> paths, final IFileFilter.Action action, final IFile... roots) {
        super();
        this.roots = roots;
        this.paths = paths;
        this.action = action;
    }
    
    private boolean isParent(final String s, final String s2) {
        return s2.charAt(s.length()) == '/';
    }
    
    private boolean matches(final String s) {
        boolean b = true;
        if (s != null && s.length() != 0) {
            for (final String s2 : this.paths) {
                if (this.matches(s, s2)) {
                    return b;
                }
                if (this.matches(s2, s)) {
                    return b;
                }
            }
            b = false;
        }
        return b;
    }
    
    private boolean matches(final String s, final String s2) {
        return s.startsWith(s2) && (s.length() == s2.length() || this.isParent(s2, s));
    }
    
    public boolean accept(final IFile file) {
        final String relativePath = this.getRelativePath(file);
        return (this.action == IFileFilter.Action.Exclude && !this.paths.contains(relativePath)) || (this.action == IFileFilter.Action.Include && this.matches(relativePath));
    }
    
    protected String getFilePath(final IFile file) {
        return file.getAbsolutePath();
    }
    
    String getRelativePath(final IFile file) {
        String relativePath = null;
        final IFile[] roots = this.roots;
        for (int length = roots.length, i = 0; i < length; ++i) {
            relativePath = CifsSync.getRelativePath(this.getFilePath(file), this.getFilePath(roots[i]));
            if (relativePath != null) {
                break;
            }
        }
        return relativePath;
    }
}
