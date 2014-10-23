package com.bv.sync;

import java.util.*;

class Utils
{
    private static final char[] invalidChars;
    static Boolean isWindows;
    
    static {
        invalidChars = new char[] { '\\', '/', ':', '*', '?', '\"', '<', '>', '|', '\0' };
    }
    
    static boolean isValidFileName(final String s) {
        final int length = s.trim().length();
        boolean b = false;
        if (length != 0) {
            for (int i = 0; i < s.length(); ++i) {
                for (int j = 0; j < Utils.invalidChars.length; ++j) {
                    final char char1 = s.charAt(i);
                    final char c = Utils.invalidChars[j];
                    b = false;
                    if (char1 == c) {
                        return b;
                    }
                }
            }
            b = true;
        }
        return b;
    }
    
    static boolean isWindows() {
        if (Utils.isWindows == null) {
            Utils.isWindows = System.getProperty("os.name").contains("Windows");
        }
        return Utils.isWindows;
    }
    
    static class FileComparator implements Comparator<IFile>
    {
        public int compare(final IFile file, final IFile file2) {
            return this.stripSeparator(file.getName()).compareToIgnoreCase(this.stripSeparator(file2.getName()));
        }
        
        String stripSeparator(String substring) {
            if (substring.endsWith("/")) {
                substring = substring.substring(0, -1 + substring.length());
            }
            return substring;
        }
    }
}
