package com.bv.sync;

import java.util.*;
import java.util.regex.*;
import java.io.*;

public class ExtensionFilter implements IFileFilter
{
    private final IFileFilter.Action action;
    private final Set<Pattern> expressions;
    private final Set<String> extensions;
    
    public ExtensionFilter(final Set<String> set, final IFileFilter.Action action) {
        super();
        this.extensions = new HashSet<String>();
        this.expressions = new HashSet<Pattern>();
        for (final String s : set) {
            if (s.startsWith(".")) {
                this.extensions.add(s);
            }
            else {
                this.expressions.add(compile(s));
            }
        }
        this.action = action;
    }
    
    public static Pattern compile(final String s) throws PatternSyntaxException {
        String s2 = "^";
        for (int i = 0; i < s.length(); ++i) {
            final char char1 = s.charAt(i);
            switch (char1) {
                default: {
                    s2 = String.valueOf(s2) + char1;
                    break;
                }
                case 42: {
                    s2 = String.valueOf(s2) + ".*";
                    break;
                }
                case 63: {
                    s2 = String.valueOf(s2) + '.';
                    break;
                }
                case 46: {
                    s2 = String.valueOf(s2) + "\\.";
                    break;
                }
                case 92: {
                    s2 = String.valueOf(s2) + "\\\\";
                    break;
                }
            }
        }
        return Pattern.compile(String.valueOf(s2) + '$', 2);
    }
    
    private String getExtension(final String s) {
        final int lastIndex = s.lastIndexOf(".");
        String substring;
        if (lastIndex != -1) {
            int length = s.length();
            if (s.charAt(-1 + s.length()) == '/') {
                --length;
            }
            substring = s.substring(lastIndex, length);
        }
        else {
            substring = null;
        }
        return substring;
    }
    
    private boolean matches(final IFile file) {
        boolean b = true;
        final String name = file.getName();
        Label_0049: {
            if (this.extensions.size() == 0) {
                break Label_0049;
            }
            final String extension = this.getExtension(name);
            if (extension == null || !this.extensions.contains(extension)) {
                break Label_0049;
            }
            return b;
        }
        final Iterator<Pattern> iterator = this.expressions.iterator();
        while (iterator.hasNext()) {
            if (iterator.next().matcher(name).matches()) {
                return b;
            }
        }
        b = false;
        return b;
    }
    
    public boolean accept(final IFile file) throws IOException {
        boolean b = true;
        if (this.action != IFileFilter.Action.Include || !file.isDirectory()) {
            boolean matches = this.matches(file);
            if (this.action == IFileFilter.Action.Exclude) {
                matches = (!matches && b);
            }
            b = matches;
        }
        return b;
    }
}
