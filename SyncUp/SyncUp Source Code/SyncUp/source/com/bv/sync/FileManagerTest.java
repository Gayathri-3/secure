package com.bv.sync;

import java.io.*;
import java.util.*;

public class FileManagerTest extends SyncTest
{
    private IFile[] createFiles(final IFile file) throws IOException {
        final IFile[] array = { null };
        for (int i = 0; i < array.length; ++i) {
            (array[i] = file.createFile(new StringBuilder().append(i).toString())).mkdir();
        }
        for (final IFile file2 : array) {
            for (int k = 0; k < 1; ++k) {
                TestUtils.createFile(file2, new StringBuilder().append(k).toString(), "test" + k);
            }
        }
        return array;
    }
    
    private int getFilesCount(final IFile[] array) throws IOException {
        int n = 0;
        for (final IFile file : array) {
            if (file.isDirectory()) {
                n += this.getFilesCount(file.listFiles());
            }
            ++n;
        }
        return n;
    }
    
    private void testCopy(final IFile file, final IFile file2) throws IOException {
        this.testCutCopy(file, file2, (Action)new Action() {
            public void execute(final IFile[] array, final IFile file, final List<SyncItem> list) throws IOException {
                FileManager.copy(array, file, new TestUtils.TestProgress(), list);
                for (int length = array.length, i = 0; i < length; ++i) {
                    FileManagerTest.assertTrue(array[i].exists());
                }
            }
        });
    }
    
    private void testCut(final IFile file, final IFile file2) throws IOException {
        this.testCutCopy(file, file2, (Action)new Action() {
            public void execute(final IFile[] array, final IFile file, final List<SyncItem> list) throws IOException {
                int n = 0;
                FileManager.move(array, file, new TestUtils.TestProgress(), list);
            Label_0031:
                while (true) {
                    if (!(array[0] instanceof RemoteFile)) {
                        break Label_0031;
                    }
                    while (true) {
                        while (true) {
                            try {
                                Thread.sleep(5000L);
                                final int length = array.length;
                                if (n >= length) {
                                    return;
                                }
                            }
                            catch (InterruptedException ex) {
                                ex.printStackTrace();
                                continue Label_0031;
                            }
                            final IFile file2 = array[n];
                            FileManagerTest.assertFalse(file2.getAbsolutePath(), file2.exists());
                            ++n;
                            continue;
                        }
                    }
                    break;
                }
            }
        });
    }
    
    private void testCutCopy(final IFile file, final IFile file2, final Action action) throws IOException {
        final IFile[] files = this.createFiles(file);
        final LinkedList<SyncItem> list = new LinkedList<SyncItem>();
        final IFile file3 = file2.createFile("destination");
        file3.mkdir();
        file3.createFile(files[0].getName()).mkdir();
        final int filesCount = this.getFilesCount(files);
        action.execute(files, file3, list);
        final Iterator<Object> iterator = list.iterator();
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
        assertEquals(filesCount, list.size());
    }
    
    private void testDelete(final IFile file) throws IOException, InterruptedException {
        final IFile[] files = this.createFiles(file);
        final int filesCount = this.getFilesCount(files);
        final LinkedList<SyncItem> list = new LinkedList<SyncItem>();
        FileManager.delete(files, new TestUtils.TestProgress(), list);
        assertEquals(filesCount, list.size());
        if (file instanceof RemoteFile) {
            Thread.sleep(5000L);
        }
        for (final IFile file2 : files) {
            assertFalse(file2.getAbsolutePath(), file2.exists());
        }
    }
    
    public void testCopy() throws Exception {
        this.testCopy(this.leftDir, this.leftDir);
        this.setUp();
        this.testCopy(this.leftDir, this.rightDir);
        this.setUp();
        this.testCopy(this.rightDir, this.rightDir);
    }
    
    public void testCut() throws Exception {
        this.testCut(this.leftDir, this.leftDir);
        this.setUp();
        this.testCut(this.leftDir, this.rightDir);
        this.setUp();
        this.testCut(this.rightDir, this.rightDir);
    }
    
    public void testDelete() throws Exception {
        this.testDelete(this.leftDir);
        this.setUp();
        this.testDelete(this.rightDir);
    }
    
    private interface Action
    {
        void execute(IFile[] p0, IFile p1, List<SyncItem> p2) throws IOException;
    }
}
