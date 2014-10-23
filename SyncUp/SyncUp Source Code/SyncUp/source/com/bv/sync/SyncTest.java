package com.bv.sync;

import junit.framework.*;
import jcifs.*;
import java.security.*;
import java.util.*;
import java.io.*;

public class SyncTest extends TestCase
{
    private static final String DOMAIN_KEY = "domain";
    private static final String HOST = "host";
    private static final String LEFT_DIR = "leftDir";
    private static final String PASSWORD_KEY = "password";
    private static final String RIGHT_DIR = "rightDir";
    private static final String USER_KEY = "user";
    protected static int counter;
    private static final TestUtils.FileComparator fileComparator;
    protected final String domain;
    protected final String host;
    protected final IFile leftDir;
    protected final String password;
    protected Random random;
    protected final IFile rightDir;
    protected final String user;
    
    static {
        Config.setProperty("jcifs.smb.client.soTimeout", "3000");
        Config.setProperty("jcifs.smb.client.dfs.disabled", "true");
        Config.setProperty("jcifs.smb.client.responseTimeout", "4000");
        fileComparator = new TestUtils.FileComparator();
    }
    
    public SyncTest() throws IOException {
        super();
        this.random = new Random();
        final String param = this.getParam("leftDir");
        final String param2 = this.getParam("rightDir");
        this.domain = this.getParam("domain");
        this.user = this.getParam("user");
        this.password = this.getParam("password");
        this.host = this.getParam("host");
        this.leftDir = new LocalFile(new File(param));
        if (this.host != null) {
            this.rightDir = new RemoteFile(this.domain, this.user, this.password, "smb://" + this.host + "/" + param2);
        }
        else {
            this.rightDir = new LocalFile(new File(param2));
        }
        if (!this.leftDir.exists()) {
            this.leftDir.mkdir();
        }
        if (!this.rightDir.exists()) {
            this.rightDir.mkdir();
        }
    }
    
    private boolean canRead(final File file) throws IOException {
        return new LocalFile(file).canRead();
    }
    
    protected static IFile createDir(final IFile file, final String s) throws IOException {
        SyncTest.counter += 1;
        final IFile file2 = file.createFile(s);
        file2.mkdir();
        return file2;
    }
    
    protected static boolean equalDirs(final IFile[] array, final IFile[] array2) throws IOException {
        assertFalse(array == null || array2 == null);
        assertEquals(array.length, array2.length);
        Arrays.sort(array, SyncTest.fileComparator);
        Arrays.sort(array2, SyncTest.fileComparator);
        for (int i = 0; i < array.length; ++i) {
            if (!equals(array[i], array2[i])) {
                System.err.println("Files are different " + array[0]);
                return false;
            }
        }
        return true;
    }
    
    protected static boolean equals(final IFile file, final IFile file2) throws IOException {
        assertEquals(getName(file), getName(file2));
        assertEquals(file.length(), file2.length());
        System.out.println("Compare " + file.getAbsolutePath() + " and " + file2.getAbsolutePath());
        if (file.isFile()) {
            final boolean file3 = file2.isFile();
            boolean b = false;
            if (file3) {
                final long n = lcmp(Math.abs(file.getLastModified() / 1000L - file2.getLastModified() / 1000L), 2L);
                b = false;
                if (n <= 0) {
                    b = true;
                }
            }
            assertTrue(b);
        }
        else {
            final String absolutePath = file.getAbsolutePath();
            final boolean directory = file2.isDirectory();
            boolean b2 = false;
            if (directory) {
                final boolean equalDirs = equalDirs(file.listFiles(), file2.listFiles());
                b2 = false;
                if (equalDirs) {
                    b2 = true;
                }
            }
            assertTrue(absolutePath, b2);
        }
        return true;
    }
    
    private static String getName(final IFile file) throws IOException {
        String s = file.getName();
        if (file.isDirectory() && s.charAt(-1 + s.length()) == '/') {
            s = s.substring(0, -1 + s.length());
        }
        return s;
    }
    
    private String getParam(final String s) {
        final String property = System.getProperty(s);
        if (property == null) {
            throw new InvalidParameterException("parameter " + s + " not set, use -D" + s + "=value");
        }
        return property;
    }
    
    protected static Collection<IFile> makeFiles(final IFile file, final IFile file2) throws IOException {
        final List<IFile> leftFiles = makeLeftFiles(file);
        leftFiles.addAll((Collection<?>)makeRightFiles(file2));
        return leftFiles;
    }
    
    protected static List<IFile> makeLeftFiles(final IFile file) throws IOException {
        assertEquals(0, file.listFiles().length);
        final LinkedList<IFile> list = new LinkedList<IFile>();
        for (int i = 0; i < 3; ++i) {
            final StringBuilder sb = new StringBuilder();
            final int counter = SyncTest.counter;
            SyncTest.counter = counter + 1;
            list.add(TestUtils.createFile(file, sb.append(counter).append(".jpg").toString(), new StringBuilder().append(SyncTest.counter).toString()));
        }
        final IFile dir = createDir(file, "dir");
        list.add(dir);
        list.add(createDir(dir, "dir"));
        final IFile dir2 = createDir(file, "dir1");
        final IFile dir3 = createDir(dir2, "dir2");
        list.add(dir2);
        list.add(dir3);
        final StringBuilder sb2 = new StringBuilder();
        final int counter2 = SyncTest.counter;
        SyncTest.counter = counter2 + 1;
        list.add(TestUtils.createFile(dir2, sb2.append(counter2).append(".mp3").toString(), new StringBuilder().append(SyncTest.counter).toString()));
        final StringBuilder sb3 = new StringBuilder();
        final int counter3 = SyncTest.counter;
        SyncTest.counter = counter3 + 1;
        list.add(TestUtils.createFile(dir3, sb3.append(counter3).append(".mp3").toString(), new StringBuilder().append(SyncTest.counter).toString()));
        return list;
    }
    
    protected static List<IFile> makeRightFiles(final IFile file) throws IOException {
        assertEquals(0, file.listFiles().length);
        final LinkedList<IFile> list = new LinkedList<IFile>();
        for (int i = 0; i < 3; ++i) {
            final StringBuilder sb = new StringBuilder();
            final int counter = SyncTest.counter;
            SyncTest.counter = counter + 1;
            list.add(TestUtils.createFile(file, sb.append(counter).append(".mp3").toString(), new StringBuilder().append(SyncTest.counter).toString()));
        }
        final IFile dir = createDir(file, "dir6");
        final IFile dir2 = createDir(dir, "dir5");
        list.add(dir2);
        list.add(dir);
        final StringBuilder sb2 = new StringBuilder();
        final int counter2 = SyncTest.counter;
        SyncTest.counter = counter2 + 1;
        list.add(TestUtils.createFile(dir, sb2.append(counter2).append(".jpg").toString(), new StringBuilder().append(SyncTest.counter).toString()));
        final StringBuilder sb3 = new StringBuilder();
        final int counter3 = SyncTest.counter;
        SyncTest.counter = counter3 + 1;
        list.add(TestUtils.createFile(dir, sb3.append(counter3).append(".jpg").toString(), new StringBuilder().append(SyncTest.counter).toString()));
        final StringBuilder sb4 = new StringBuilder();
        final int counter4 = SyncTest.counter;
        SyncTest.counter = counter4 + 1;
        list.add(TestUtils.createFile(dir2, sb4.append(counter4).append(".jpg").toString(), new StringBuilder().append(SyncTest.counter).toString()));
        return list;
    }
    
    protected static String replaceSeparator(final String s) {
        final StringBuilder sb = new StringBuilder(s);
        for (int i = 0; i < sb.length(); ++i) {
            if (sb.charAt(i) == '\\' || sb.charAt(i) == '/') {
                sb.setCharAt(i, '/');
            }
        }
        return sb.toString();
    }
    
    private void setReadableDir(final File file, final boolean b) throws IOException, InterruptedException {
        this.setReadable(file, b);
        for (final File file2 : file.listFiles()) {
            if (file2.isDirectory()) {
                this.setReadableDir(file2, b);
            }
            else {
                this.setReadable(file2, b);
            }
        }
    }
    
    protected static void verifySynced(final IFile file, final IFile file2) throws IOException {
        assertTrue("Dir contents are different", equalDirs(file.listFiles(), file2.listFiles()));
    }
    
    protected String getRelativePath(final IFile file, final IFile file2) {
        return CifsSync.getRelativePath(replaceSeparator(file.getAbsolutePath()), replaceSeparator(file2.getAbsolutePath()));
    }
    
    protected void setReadable(final File file, final boolean readable) throws IOException, InterruptedException {
        final String absolutePath = file.getAbsolutePath();
        new File(absolutePath).setReadable(readable);
        if (Utils.isWindows() && new File(absolutePath).exists()) {
            final StringBuilder append = new StringBuilder("Icacls.exe \"").append(absolutePath).append("\" /");
            String s;
            if (readable) {
                s = "grant";
            }
            else {
                s = "deny";
            }
            final String string = append.append(s).append(" ").append(this.user).append(":R").toString();
            System.out.println(string);
            TestUtils.exec(string);
        }
        assertTrue(absolutePath, this.canRead(file) == readable);
    }
    
    protected void setUp() throws Exception {
        System.out.println("\nRunning: " + super.getName());
        System.out.println("******************************************************");
        this.setReadableDir(new File(this.leftDir.getAbsolutePath()), true);
        if (this.leftDir.exists()) {
            TestUtils.wipe(this.leftDir);
        }
        if (this.rightDir.exists()) {
            TestUtils.wipe(this.rightDir);
        }
        SyncTest.counter = 0;
    }
    
    protected Collection<SyncItem> sync(final CifsSync.Options options) throws IOException, InterruptedException {
        final TestUtils.TestProgress testProgress = new TestUtils.TestProgress();
        final List<SyncItem> sync = new CifsSync(options, null).sync(this.leftDir, this.rightDir, testProgress);
        assertEquals(100, testProgress.percent);
        return sync;
    }
    
    public void testNothing() {
    }
}
