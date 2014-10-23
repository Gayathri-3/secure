package com.bv.sync;

import java.io.*;
import jcifs.smb.*;
import java.util.*;

public class FilterTest extends SyncTest
{
    private void addFilterFiles(final IFile file, final Collection<IFile> collection, final Collection<IFile> collection2) throws IOException, InterruptedException {
        final IFile file2 = TestUtils.createFile(file, "FilterFile", "FilterFile");
        collection.add(file2);
        collection2.add(file2);
        final IFile dir = SyncTest.createDir(file, "FilterDir");
        collection.add(dir);
        final IFile file3 = TestUtils.createFile(dir, "FilterFile", "FilterFile");
        collection.add(file3);
        collection2.add(file3);
    }
    
    private void addHiddenFiles(final IFile file) throws IOException, InterruptedException {
        this.setHidden(TestUtils.createFile(file, ".HiddenFile", "HiddenFile"));
        final IFile dir = SyncTest.createDir(file, ".HiddenDir");
        this.setHidden(dir);
        this.setHidden(TestUtils.createFile(dir, ".HiddenDir", ".HiddenDir"));
    }
    
    private Collection<IFile> addReadProtectedFiles(final IFile file) throws IOException, InterruptedException {
        final LinkedList<IFile> list = new LinkedList<IFile>();
        final IFile file2 = TestUtils.createFile(file, "ReadProtected", "ReadProtected");
        list.add(file2);
        this.setReadable(new File(file2.getAbsolutePath()), false);
        final IFile dir = SyncTest.createDir(file, "ReadProtectedDir");
        this.setReadable(new File(dir.getAbsolutePath()), false);
        list.add(dir);
        final IFile file3 = TestUtils.createFile(dir, "ReadProtected", "ReadProtected");
        this.setReadable(new File(file3.getAbsolutePath()), false);
        list.add(file3);
        return list;
    }
    
    private int countMatching(final Collection<IFile> collection, final String[] array, final IFileFilter.Action action) throws IOException {
        int n = 0;
        final Iterator<IFile> iterator = collection.iterator();
        while (iterator.hasNext()) {
            if (this.matches(iterator.next(), array, action)) {
                ++n;
            }
        }
        assertTrue(n != 0);
        return n;
    }
    
    private int countMovedAndCopied(final IFile file, final Collection<IFile> collection) throws IOException {
        int n = 2 * collection.size();
        final IFile[] listFiles = file.listFiles();
        for (int length = listFiles.length, i = 0; i < length; ++i) {
            if (listFiles[i].isDirectory()) {
                --n;
            }
        }
        return n;
    }
    
    private boolean matches(final IFile file, final String[] array, final IFileFilter.Action action) throws IOException {
        boolean b = true;
        if (action != IFileFilter.Action.Include || !file.isDirectory()) {
            final String name = file.getName();
            for (int length = array.length, i = 0; i < length; ++i) {
                if (this.matches(name, array[i])) {
                    return b;
                }
            }
            b = false;
        }
        return b;
    }
    
    private boolean matches(final String s, final String s2) {
        boolean b;
        if (s2.startsWith(".")) {
            b = s.endsWith(s2);
        }
        else {
            b = ExtensionFilter.compile(s2).matcher(s).find();
            if (b) {
                System.out.println("Matches: " + s + ", expression: " + s2);
            }
        }
        return b;
    }
    
    private void setHidden(final IFile file) throws IOException, InterruptedException {
        if (Utils.isWindows()) {
            if (file instanceof LocalFile) {
                TestUtils.exec("C:\\WINDOWS\\System32\\ATTRIB.EXE +H " + file.getAbsolutePath());
            }
            else {
                final SmbFile smbFile = new SmbFile(file.getAbsolutePath(), new NtlmPasswordAuthentication(this.domain, this.user, this.password));
                smbFile.setAttributes(0x2 | smbFile.getAttributes());
            }
        }
        else {
            assertTrue(String.valueOf(file.getAbsolutePath()) + " hidden", file.isHidden());
        }
    }
    
    private void testExcludeFileFilter(final IFile file, final CifsSync.Options options, final int n) throws IOException, InterruptedException {
        final ArrayList<IFile> list = new ArrayList<IFile>();
        final ArrayList<IFile> list2 = new ArrayList<IFile>();
        for (final IFile file2 : file.listFiles()) {
            if (file2.isDirectory()) {
                this.addFilterFiles(file2, list, list2);
            }
        }
        final HashSet<String> set = new HashSet<String>();
        final Iterator<IFile> iterator = list2.iterator();
        while (iterator.hasNext()) {
            set.add(this.getRelativePath(iterator.next(), file));
        }
        options.filters = new IFileFilter[] { new TestFileFilter(set, IFileFilter.Action.Exclude, new IFile[] { this.leftDir, this.rightDir }) };
        assertEquals(n + list.size() - list2.size(), this.sync(options).size());
    }
    
    private void testExcludeProgress(final IFile file, final CifsSync.Options.Direction direction) throws Exception {
        this.setUp();
        System.out.println("Parent dir: " + file + ", direction: " + direction);
        SyncTest.makeLeftFiles(file);
        final ArrayList<IFile> list = new ArrayList<IFile>();
        final ArrayList<IFile> list2 = new ArrayList<IFile>();
        for (final IFile file2 : file.listFiles()) {
            if (file2.isDirectory()) {
                this.addFilterFiles(file2, list, list2);
            }
        }
        final HashSet<String> set = new HashSet<String>();
        final Iterator<IFile> iterator = list2.iterator();
        while (iterator.hasNext()) {
            set.add(this.getRelativePath(iterator.next(), file));
        }
        final CifsSync.Options options = new CifsSync.Options(direction, true, CifsSync.Options.VerifyTimeZone.OneHour, null);
        options.filters = new IFileFilter[] { new TestFileFilter(set, IFileFilter.Action.Exclude, new IFile[] { this.leftDir, this.rightDir }) };
        final HashMap<String, Long> hashMap = new HashMap<String, Long>();
        new CifsSync(options, hashMap).sync(this.leftDir, this.rightDir, new TestUtils.TestProgress());
        final Iterator<String> iterator2 = set.iterator();
        final int size = set.size();
        final HashSet<String> set2 = new HashSet<String>();
        for (int j = 0; j < size; ++j) {
            if (j % 2 == 0) {
                set2.add(iterator2.next());
            }
        }
        options.filters = new IFileFilter[] { new TestFileFilter(set2, IFileFilter.Action.Exclude, new IFile[] { this.leftDir, this.rightDir }) };
        new CifsSync(options, hashMap).sync(this.leftDir, this.rightDir, new TestUtils.TestProgress());
    }
    
    private void testExtensionsFilter(final IFileFilter.Action action) throws IOException, InterruptedException {
        final String[] array = { "0.jp?", "1.*", "*.mp", "7.mp3" };
        final List<IFile> leftFiles = SyncTest.makeLeftFiles(this.leftDir);
        final int countMatching = this.countMatching(leftFiles, array, action);
        final CifsSync.Options options = new CifsSync.Options(CifsSync.Options.Direction.Both, true, CifsSync.Options.VerifyTimeZone.OneHour, new IFileFilter[] { new ExtensionFilter(new HashSet(Arrays.asList(array)), action) {
                public boolean accept(final IFile file) throws IOException {
                    final boolean accept = super.accept(file);
                    System.out.println("Accept " + file + " " + accept);
                    return accept;
                }
            } });
        int n;
        if (action == IFileFilter.Action.Exclude) {
            n = leftFiles.size() - countMatching;
        }
        else {
            n = countMatching;
        }
        assertEquals(n, this.sync(options).size());
    }
    
    private void testIncludeFileFilter(final IFile file, final CifsSync.Options options) throws IOException, InterruptedException {
        final ArrayList<IFile> list = new ArrayList<IFile>();
        final ArrayList<IFile> list2 = new ArrayList<IFile>();
        this.addFilterFiles(file, list, list2);
        final HashSet<String> set = new HashSet<String>();
        final Iterator<IFile> iterator = list2.iterator();
        while (iterator.hasNext()) {
            set.add(this.getRelativePath(iterator.next(), file));
        }
        options.filters = new IFileFilter[] { new TestFileFilter(set, IFileFilter.Action.Include, new IFile[] { this.leftDir, this.rightDir }) };
        final Collection<SyncItem> sync = this.sync(options);
        final Iterator<String> iterator2 = set.iterator();
        while (iterator2.hasNext()) {
            System.out.println("Include " + iterator2.next());
        }
        final Iterator<SyncItem> iterator3 = sync.iterator();
        while (iterator3.hasNext()) {
            System.out.println("Synced " + iterator3.next().absolutePath);
        }
        int size = list.size();
        if (options.direction == CifsSync.Options.Direction.moveToLocal || options.direction == CifsSync.Options.Direction.moveToRemote) {
            size *= 2;
        }
        assertEquals(size, sync.size());
    }
    
    public void testExcludeExtensions() throws Exception {
        this.testExtensionsFilter(IFileFilter.Action.Exclude);
    }
    
    public void testExcludeFilesCopy() throws Exception {
        int i = 0;
        for (Combination[] array = { new Combination(this.leftDir, CifsSync.Options.Direction.toRemote), new Combination(this.rightDir, CifsSync.Options.Direction.toLocal) }; i < array.length; ++i) {
            final Combination combination = array[i];
            this.testExcludeFileFilter(combination.dir, new CifsSync.Options(combination.direction, true, CifsSync.Options.VerifyTimeZone.OneHour, null), SyncTest.makeLeftFiles(combination.dir).size());
            this.setUp();
        }
    }
    
    public void testExcludeFilesMove() throws Exception {
        int i = 0;
        for (Combination[] array = { new Combination(this.leftDir, CifsSync.Options.Direction.moveToRemote), new Combination(this.rightDir, CifsSync.Options.Direction.moveToLocal) }; i < array.length; ++i) {
            final Combination combination = array[i];
            this.testExcludeFileFilter(combination.dir, new CifsSync.Options(combination.direction, true, CifsSync.Options.VerifyTimeZone.OneHour, null), this.countMovedAndCopied(combination.dir, SyncTest.makeLeftFiles(combination.dir)));
            this.setUp();
        }
    }
    
    public void testExcludeFilesSync() throws Exception {
        int i = 0;
        for (IFile[] array = { this.leftDir, this.rightDir }; i < array.length; ++i) {
            this.testExcludeFileFilter(array[i], new CifsSync.Options(CifsSync.Options.Direction.Both, true, CifsSync.Options.VerifyTimeZone.OneHour, null), SyncTest.makeFiles(this.leftDir, this.rightDir).size());
            this.setUp();
        }
    }
    
    public void testExcludeFilesWithDelete() throws IOException, InterruptedException {
        final Collection<IFile> files = SyncTest.makeFiles(this.leftDir, this.rightDir);
        final CifsSync.Options options = new CifsSync.Options(CifsSync.Options.Direction.moveToRemote, true, CifsSync.Options.VerifyTimeZone.OneHour, null);
        new CifsSync(options, new HashMap<String, Long>()).sync(this.leftDir, this.rightDir, new TestUtils.TestProgress());
        final HashSet<String> set = new HashSet<String>();
        final HashSet<String> set2 = new HashSet<String>();
        int n = 0;
        for (final IFile file : files) {
            final int n2 = n + 1;
            if (n % 3 == 0) {
                if (file instanceof LocalFile) {
                    set.add(this.getRelativePath(file, this.leftDir));
                }
                else {
                    set2.add(this.getRelativePath(file, this.rightDir));
                }
                if (file.exists()) {
                    file.delete();
                }
            }
            n = n2;
        }
        options.filters = new IFileFilter[] { new TestFileFilter(set, IFileFilter.Action.Exclude, new IFile[] { this.leftDir, this.rightDir }), new TestFileFilter(set2, IFileFilter.Action.Exclude, new IFile[] { this.leftDir, this.rightDir }) };
        assertEquals(0, new CifsSync(options, null).sync(this.leftDir, this.rightDir, new TestUtils.TestProgress()).size());
    }
    
    public void testExcludeProgress() throws Exception {
        for (final IFile file : new IFile[] { this.leftDir, this.rightDir }) {
            final CifsSync.Options.Direction[] values = CifsSync.Options.Direction.values();
            for (int length2 = values.length, j = 0; j < length2; ++j) {
                this.testExcludeProgress(file, values[j]);
            }
        }
    }
    
    public void testHidden() throws IOException, InterruptedException {
        final Collection<IFile> files = SyncTest.makeFiles(this.leftDir, this.rightDir);
        for (final IFile file : files) {
            if (file.isDirectory()) {
                this.addHiddenFiles(file);
            }
        }
        assertEquals(files.size(), this.sync(new CifsSync.Options(CifsSync.Options.Direction.Both, true, CifsSync.Options.VerifyTimeZone.OneHour, new IFileFilter[] { new IgnoreHiddenFilter() })).size());
    }
    
    public void testIncludeFilesCopy() throws Exception {
        int i = 0;
        for (Combination[] array = { new Combination(this.leftDir, CifsSync.Options.Direction.toRemote), new Combination(this.rightDir, CifsSync.Options.Direction.toLocal) }; i < array.length; ++i) {
            final Combination combination = array[i];
            SyncTest.makeLeftFiles(combination.dir);
            this.testIncludeFileFilter(combination.dir, new CifsSync.Options(combination.direction, true, CifsSync.Options.VerifyTimeZone.OneHour, null));
            this.setUp();
        }
    }
    
    public void testIncludeFilesMove() throws Exception {
        int i = 0;
        for (Combination[] array = { new Combination(this.leftDir, CifsSync.Options.Direction.moveToRemote), new Combination(this.rightDir, CifsSync.Options.Direction.moveToLocal) }; i < array.length; ++i) {
            final Combination combination = array[i];
            SyncTest.makeLeftFiles(combination.dir);
            this.testIncludeFileFilter(combination.dir, new CifsSync.Options(combination.direction, true, CifsSync.Options.VerifyTimeZone.OneHour, null));
            this.setUp();
        }
    }
    
    public void testIncludeFilesSync() throws Exception {
        int i = 0;
        for (IFile[] array = { this.leftDir, this.rightDir }; i < array.length; ++i) {
            final IFile file = array[i];
            SyncTest.makeFiles(this.leftDir, this.rightDir);
            this.testIncludeFileFilter(file, new CifsSync.Options(CifsSync.Options.Direction.Both, true, CifsSync.Options.VerifyTimeZone.OneHour, null));
            this.setUp();
        }
    }
    
    public void testReadProtected() throws IOException, InterruptedException {
        final Collection<IFile> files = SyncTest.makeFiles(this.leftDir, this.rightDir);
        for (final IFile file : this.leftDir.listFiles()) {
            if (file.isDirectory()) {
                this.addReadProtectedFiles(file);
            }
        }
        assertEquals(files.size(), this.sync(new CifsSync.Options(CifsSync.Options.Direction.Both, true, CifsSync.Options.VerifyTimeZone.OneHour, new IFileFilter[] { new IgnoreReadProtectedFilter() })).size());
    }
    
    public void testincludeExtensions() throws Exception {
        this.testExtensionsFilter(IFileFilter.Action.Include);
    }
    
    private class Combination
    {
        IFile dir;
        CifsSync.Options.Direction direction;
        
        Combination(final IFile dir, final CifsSync.Options.Direction direction) {
            super();
            this.dir = dir;
            this.direction = direction;
        }
    }
    
    private final class TestFileFilter extends FileFilter
    {
        public TestFileFilter(final Set<String> set, final IFileFilter.Action action, final IFile[] array) {
            super(set, action, array);
        }
        
        public boolean accept(final IFile file) {
            final boolean accept = super.accept(file);
            System.out.println("Accepting " + file + " " + accept);
            return accept;
        }
        
        protected String getFilePath(final IFile file) {
            String s = super.getFilePath(file);
            if (Utils.isWindows()) {
                s = SyncTest.replaceSeparator(s);
            }
            return s;
        }
    }
}
