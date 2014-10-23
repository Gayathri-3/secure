package com.bv.sync;

import java.io.*;
import java.util.*;

public class DeleteTest extends SyncTest
{
    private final Random random;
    
    public DeleteTest() throws IOException {
        super();
        this.random = new Random();
    }
    
    private boolean contains(final List<IFile> list, final IFile file) {
        IFile file2;
        if (file instanceof RemoteFile) {
            file2 = this.rightDir;
        }
        else {
            file2 = this.leftDir;
        }
        final String relativePath = this.getRelativePath(file, file2);
        final Iterator<IFile> iterator = list.iterator();
        while (iterator.hasNext()) {
            if (this.getRelativePath(iterator.next(), this.leftDir).equals(relativePath)) {
                return true;
            }
        }
        return false;
    }
    
    private void deleteBoth(final boolean mirror) throws IOException, InterruptedException {
        final List<IFile> leftFiles = SyncTest.makeLeftFiles(this.leftDir);
        final List<IFile> rightFiles = SyncTest.makeRightFiles(this.rightDir);
        final CifsSync.Options options = new CifsSync.Options(CifsSync.Options.Direction.Both, true, CifsSync.Options.VerifyTimeZone.OneHour, null);
        final HashMap<String, Long> hashMap = new HashMap<String, Long>();
        assertEquals(leftFiles.size() + rightFiles.size(), new TestSync(options, hashMap).sync(this.leftDir, this.rightDir, new TestUtils.TestProgress()).size());
        options.direction = CifsSync.Options.Direction.Both;
        options.mirror = mirror;
        final List<IFile> removeFiles = this.removeFiles(this.listFiles(this.leftDir));
        final List<IFile> removeFiles2 = this.removeFiles(this.listFiles(this.rightDir));
        leftFiles.add(TestUtils.createFile(this.leftDir, "added1.txt", "added1"));
        rightFiles.add(TestUtils.createFile(this.rightDir, "added2.txt", "added2"));
        new TestSync(options, hashMap).sync(this.leftDir, this.rightDir, new TestUtils.TestProgress());
        SyncTest.verifySynced(this.leftDir, this.rightDir);
        final HashSet<String> set = new HashSet<String>();
        final Iterator<IFile> iterator = leftFiles.iterator();
        while (iterator.hasNext()) {
            set.add(this.getRelativePath(iterator.next(), this.leftDir));
        }
        final Iterator<IFile> iterator2 = rightFiles.iterator();
        while (iterator2.hasNext()) {
            set.add(this.getRelativePath(iterator2.next(), this.rightDir));
        }
        final Iterator<IFile> iterator3 = removeFiles.iterator();
        while (iterator3.hasNext()) {
            set.remove(this.getRelativePath(iterator3.next(), this.leftDir));
        }
        final Iterator<IFile> iterator4 = removeFiles2.iterator();
        while (iterator4.hasNext()) {
            set.remove(this.getRelativePath(iterator4.next(), this.rightDir));
        }
        final ArrayList<String> list = new ArrayList<String>();
        final Iterator<IFile> iterator5 = this.listFiles(this.leftDir).iterator();
        while (iterator5.hasNext()) {
            list.add(this.getRelativePath(iterator5.next(), this.leftDir));
        }
        this.verifyEqualsString(new ArrayList<String>(set), list);
    }
    
    private void enumerate(final Map<String, Long> map, final IFile file, final IFile file2) throws IOException {
        map.put(this.getRelativePath(file, file2), file.getLastModified());
        if (file.isDirectory()) {
            final IFile[] listFiles = file.listFiles();
            for (int length = listFiles.length, i = 0; i < length; ++i) {
                this.enumerate(map, listFiles[i], file2);
            }
        }
    }
    
    private List<SyncItem> failedSync(final Map<String, Long> map, final ProgressNotification progressNotification) throws IOException, InterruptedException {
        List<SyncItem> syncResult = null;
        try {
            new CifsSync(new CifsSync.Options(CifsSync.Options.Direction.Both, true, CifsSync.Options.VerifyTimeZone.OneHour, null), map).sync(this.leftDir, this.rightDir, progressNotification);
            return syncResult;
        }
        catch (CifsSync.SyncCancellationException ex) {
            syncResult = ex.syncResult;
            return syncResult;
        }
    }
    
    private List<IFile> listFiles(final IFile file) throws IOException {
        final ArrayList<IFile> list = new ArrayList<IFile>();
        final IFile[] listFiles = file.listFiles();
        for (int length = listFiles.length, i = 0; i < length; ++i) {
            this.listFiles(list, listFiles[i]);
        }
        return list;
    }
    
    private void listFiles(final List<IFile> list, final IFile file) throws IOException {
        if (file.isDirectory()) {
            final IFile[] listFiles = file.listFiles();
            for (int length = listFiles.length, i = 0; i < length; ++i) {
                this.listFiles(list, listFiles[i]);
            }
        }
        list.add(file);
    }
    
    private List<IFile> removeFiles(final List<IFile> list) throws IOException {
        final ArrayList<IFile> list2 = new ArrayList<IFile>();
        for (int i = 0; i < list.size(); i += this.random.nextInt(4)) {
            if (list.get(i).exists()) {
                TestUtils.remove(list.get(i), list2);
            }
        }
        assertTrue(list2.size() >= 3);
        return list2;
    }
    
    private Map<String, Long> takeSnapshot(final IFile file) throws IOException {
        final HashMap<String, Long> hashMap = new HashMap<String, Long>();
        final IFile[] listFiles = file.listFiles();
        for (int length = listFiles.length, i = 0; i < length; ++i) {
            this.enumerate(hashMap, listFiles[i], file);
        }
        return hashMap;
    }
    
    private void testDelete(final boolean b, final boolean mirror) throws Exception {
        final List<IFile> leftFiles = SyncTest.makeLeftFiles(this.leftDir);
        List<IFile> rightFiles = SyncTest.makeRightFiles(this.rightDir);
        final CifsSync.Options options = new CifsSync.Options();
        CifsSync.Options.Direction direction;
        if (b) {
            direction = CifsSync.Options.Direction.toRemote;
        }
        else {
            direction = CifsSync.Options.Direction.toLocal;
        }
        options.direction = direction;
        options.mirror = mirror;
        IFile file;
        if (b) {
            file = this.leftDir;
        }
        else {
            file = this.rightDir;
        }
        final HashMap<String, Long> hashMap = new HashMap<String, Long>();
        new TestSync(options, hashMap).sync(this.leftDir, this.rightDir, new TestUtils.TestProgress());
        List<IFile> list;
        if (b) {
            list = leftFiles;
        }
        else {
            list = rightFiles;
        }
        final List<IFile> removeFiles = this.removeFiles(list);
        new TestSync(options, hashMap).sync(this.leftDir, this.rightDir, new TestUtils.TestProgress());
        IFile file2;
        if (b) {
            file2 = this.rightDir;
        }
        else {
            file2 = this.leftDir;
        }
        List<IFile> list2;
        if (b) {
            list2 = leftFiles;
        }
        else {
            list2 = rightFiles;
        }
        list2.removeAll(removeFiles);
        this.verifyEquals(list2, this.listFiles(file));
        if (mirror) {
            SyncTest.verifySynced(this.leftDir, this.rightDir);
        }
        else {
            final HashSet<String> set = new HashSet<String>();
            final Iterator<IFile> iterator = list2.iterator();
            while (iterator.hasNext()) {
                set.add(this.getRelativePath(iterator.next(), file));
            }
            if (!b) {
                rightFiles = leftFiles;
            }
            final Iterator<IFile> iterator2 = rightFiles.iterator();
            while (iterator2.hasNext()) {
                set.add(this.getRelativePath(iterator2.next(), file2));
            }
            final Iterator<IFile> iterator3 = removeFiles.iterator();
            while (iterator3.hasNext()) {
                set.remove(this.getRelativePath(iterator3.next(), file));
            }
            final ArrayList<String> list3 = new ArrayList<String>();
            final Iterator<IFile> iterator4 = this.listFiles(file2).iterator();
            while (iterator4.hasNext()) {
                list3.add(this.getRelativePath(iterator4.next(), file2));
            }
            this.verifyEqualsString(new ArrayList<String>(set), list3);
        }
    }
    
    private void verifyEquals(final List<IFile> list, final List<IFile> list2) throws IOException {
        assertEquals("Size is different", list.size(), list2.size());
        Collections.sort((List<Object>)list, (Comparator<? super Object>)new TestUtils.FileComparator());
        Collections.sort((List<Object>)list2, (Comparator<? super Object>)new TestUtils.FileComparator());
        for (int i = 0; i < list.size(); ++i) {
            final IFile file = list.get(i);
            final IFile file2 = list2.get(i);
            System.out.println("Compare " + file.getAbsolutePath() + " and " + file2.getAbsolutePath());
            assertTrue(SyncTest.equals(file, file2));
        }
    }
    
    private void verifyEqualsString(final List<String> list, final List<String> list2) {
        assertEquals(list.size(), list2.size());
        Collections.sort((List<Comparable>)list);
        Collections.sort(list2);
        for (int i = 0; i < list.size(); ++i) {
            assertEquals((String)list.get(i), (String)list2.get(i));
        }
    }
    
    public void testDeleteBoth() throws IOException, InterruptedException {
        this.deleteBoth(false);
    }
    
    public void testDeleteBothMirror() throws IOException, InterruptedException {
        this.deleteBoth(true);
    }
    
    public void testDeleteFail() throws IOException, InterruptedException {
        final int size = SyncTest.makeFiles(this.leftDir, this.rightDir).size();
        final CifsSync.Options options = new CifsSync.Options(CifsSync.Options.Direction.Both, true, CifsSync.Options.VerifyTimeZone.OneHour, null);
        assertEquals(size, this.sync(options).size());
        final Map<String, Long> takeSnapshot = this.takeSnapshot(this.leftDir);
        final List<IFile> removeFiles = this.removeFiles(this.listFiles(this.leftDir));
        assertEquals(0, this.failedSync(takeSnapshot, new ProgressNotification() {
            public boolean update(final ProgressNotification.ProgressAction progressAction, final int n, final IFile file) {
                return false;
            }
        }).size());
        assertEquals(1, this.failedSync(takeSnapshot, new ProgressNotification() {
            public boolean update(final ProgressNotification.ProgressAction progressAction, final int n, final IFile file) {
                boolean b = true;
                if (progressAction != ProgressNotification.ProgressAction.Listing) {
                    System.out.println("Update: " + file.getAbsolutePath());
                    if (DeleteTest.this.contains(removeFiles, file)) {
                        b = false;
                    }
                }
                return b;
            }
        }).size());
        assertEquals(-1 + removeFiles.size(), new CifsSync(options, takeSnapshot).sync(this.leftDir, this.rightDir, new TestUtils.TestProgress()).size());
        SyncTest.verifySynced(this.leftDir, this.rightDir);
        for (final IFile file : removeFiles) {
            assertFalse("File exists: " + file.getAbsolutePath(), file.exists());
        }
    }
    
    public void testDeleteLeft() throws Exception {
        this.testDelete(true, false);
    }
    
    public void testDeleteLeftMirror() throws Exception {
        this.testDelete(true, true);
    }
    
    public void testDeleteRight() throws Exception {
        this.testDelete(false, false);
    }
    
    public void testDeleteRightMirror() throws Exception {
        this.testDelete(false, true);
    }
    
    private static class TestSync extends CifsSync
    {
        public TestSync(final CifsSync.Options options, final Map<String, Long> map) {
            super(options, map);
        }
        
        String normalizePath(final String s) {
            return SyncTest.replaceSeparator(super.normalizePath(s));
        }
        
        protected void trackDeletions() throws IOException {
            System.out.println("Left count: " + this.leftCount);
            System.out.println("Right count: " + this.rightCount);
            super.trackDeletions();
        }
    }
}
