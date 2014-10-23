package com.bv.sync;

import java.io.*;
import java.util.*;
import junit.framework.*;

public class TestUtils
{
    static IFile createFile(final IFile file, final String s, final String s2) throws IOException {
        final IFile file2 = file.createFile(s);
        final OutputStream outputStream = file2.getOutputStream();
        try {
            outputStream.write(s2.getBytes());
            return file2;
        }
        finally {
            outputStream.close();
        }
    }
    
    static void exec(final String s) throws IOException, InterruptedException {
        final Process exec = Runtime.getRuntime().exec(s);
        final int wait = exec.waitFor();
        if (wait != 0) {
            throw new IOException("Failed to execute command: " + s + ", exit code: " + wait);
        }
        printStream(exec.getErrorStream(), System.err);
        printStream(exec.getInputStream(), System.out);
    }
    
    private static void printStream(final InputStream inputStream, final PrintStream printStream) throws IOException {
        final byte[] array = new byte[1024];
        final int read = inputStream.read(array);
        if (read > 0) {
            printStream.println(new String(array, 0, read));
        }
    }
    
    static void remove(final IFile file, final List<IFile> list) throws IOException {
        if (file.isDirectory()) {
            final IFile[] listFiles = file.listFiles();
            for (int length = listFiles.length, i = 0; i < length; ++i) {
                remove(listFiles[i], list);
            }
        }
        file.delete();
        System.err.println("Test deleting: " + file.getAbsolutePath());
        if (list != null) {
            list.add(file);
        }
    }
    
    private static void remove(final IFile[] array) throws IOException {
        if (array != null) {
            for (int length = array.length, i = 0; i < length; ++i) {
                remove(array[i], null);
            }
        }
    }
    
    static void wipe(final IFile... array) throws IOException {
        for (int length = array.length, i = 0; i < length; ++i) {
            remove(array[i].listFiles());
        }
    }
    
    static class FileComparator implements Comparator<IFile>
    {
        public int compare(final IFile file, final IFile file2) {
            int n = file.getName().compareTo(file2.getName());
            if (n == 0) {
                n = file.getAbsolutePath().compareTo(file2.getAbsolutePath());
            }
            return n;
        }
    }
    
    static class TestProgress implements ProgressNotification
    {
        int percent;
        
        public boolean update(final ProgressNotification.ProgressAction progressAction, final int percent, final IFile file) {
            System.out.println(progressAction + " " + percent + " " + file.getAbsolutePath());
            System.out.flush();
            if (percent < 0 || percent > 100) {
                throw new AssertionFailedError("Invalid percent " + percent);
            }
            if (percent > this.percent) {
                this.percent = percent;
            }
            return true;
        }
    }
}
