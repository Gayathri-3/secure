package com.bv.sync;

import junit.framework.*;
import java.io.*;
import java.util.*;

public class ImageScannerTest extends TestCase
{
    private static final String VIRTUAL_TEST = "VirtualTest";
    private HashSet<String> paths;
    private final Random random;
    private IFile workingDir;
    
    public ImageScannerTest() {
        super();
        this.random = new Random();
    }
    
    private void createRandomFiles(final TestImageParser testImageParser, final FileInfo[] array) throws IOException {
        final HashMap<Object, Integer> hashMap = (HashMap<Object, Integer>)new HashMap<String, Integer>();
        for (int i = 0; i < array.length; ++i) {
            final String string = "path" + i + ".jpg";
            final int nextInt = this.random.nextInt(3);
            final String string2 = "address" + nextInt;
            Integer value = hashMap.get(string2);
            if (value == null) {
                value = nextInt;
                hashMap.put(string2, value);
            }
            final Calendar instance = Calendar.getInstance();
            instance.setTime(new Date(System.currentTimeMillis()));
            instance.set(2, this.random.nextInt(11));
            instance.set(1, 2000 + this.random.nextInt(2));
            instance.set(5, this.random.nextInt(30));
            final Date time = instance.getTime();
            array[i] = new FileInfo(string2, time);
            TestUtils.createFile(this.workingDir, string, new StringBuilder().append(i).toString());
            testImageParser.add(new File(new File(this.workingDir.getAbsolutePath()), string).getAbsolutePath(), time, string2, value, -value);
        }
    }
    
    private HashSet<String> enumFiles(final IFile file) throws IOException {
        final HashSet<Object> set = new HashSet<Object>();
        for (final IFile file2 : file.listFiles()) {
            if (file2.isDirectory()) {
                set.addAll(this.enumFiles(file2));
            }
            else {
                set.add(file2.getAbsolutePath());
            }
        }
        return (HashSet<String>)set;
    }
    
    private boolean equals(final IFile file, final IFile file2) throws IOException {
        if (file.isFile()) {
            assertEquals(file.getLastModified(), file2.getLastModified());
            assertEquals(file.length(), file2.length());
            assertTrue(this.paths.contains(file.getAbsolutePath()));
        }
        assertEquals(file.getName(), file2.getName());
        assertEquals(file.canRead(), file2.canRead());
        assertEquals(file.exists(), file2.exists());
        assertEquals(file.isDirectory(), file2.isDirectory());
        assertEquals(file.isFile(), file2.isFile());
        assertEquals(file.isHidden(), file2.isHidden());
        if (file.isDirectory()) {
            assertEquals(file.getAbsolutePath(), file2.getAbsolutePath());
            final IFile[] listFiles = file.listFiles();
            final IFile[] listFiles2 = file2.listFiles();
            assertEquals(listFiles.length, listFiles2.length);
            final TestUtils.FileComparator fileComparator = new TestUtils.FileComparator();
            Arrays.sort(listFiles, fileComparator);
            Arrays.sort(listFiles2, fileComparator);
            final int length = listFiles.length;
            int i = 0;
            int n = 0;
            while (i < length) {
                final IFile file3 = listFiles[i];
                final int n2 = n + 1;
                assertTrue(this.equals(file3, listFiles2[n]));
                ++i;
                n = n2;
            }
        }
        return true;
    }
    
    protected void setUp() throws Exception {
        this.workingDir = new LocalFile(new File("VirtualTest"));
        if (!this.workingDir.exists()) {
            this.workingDir.mkdir();
        }
        TestUtils.wipe(this.workingDir);
    }
    
    protected void tearDown() throws Exception {
        TestUtils.wipe(this.workingDir);
    }
    
    public void testFile() throws IOException {
        for (int i = 0; i < 10; ++i) {
            TestUtils.createFile(this.workingDir, new StringBuilder().append(i).toString(), new StringBuilder().append(i).toString());
        }
        final VirtualFile virtualFile = new VirtualFile(this.workingDir);
        this.paths = this.enumFiles(virtualFile);
        assertTrue(this.equals(virtualFile, this.workingDir));
    }
    
    public void testVideo() throws IOException {
        final Calendar instance = Calendar.getInstance();
        instance.set(2000, 10, 1);
        final IFile file = TestUtils.createFile(this.workingDir, "image.jpg", "image.jpg");
        final TestImageParser testImageParser = new TestImageParser((TestImageParser)null);
        testImageParser.add(file.getAbsolutePath(), instance.getTime(), null, 0.0, 0.0);
        file.setLastModified(instance.getTime().getTime());
        TestUtils.createFile(this.workingDir, "image.3gp", "image.3gp").setLastModified(instance.getTime().getTime());
        final ImageScanner imageScanner = new ImageScanner((ImageScanner.Parser)testImageParser);
        final ImageScanner.Options options = new ImageScanner.Options();
        options.groupByDay = true;
        options.groupByMonth = true;
        options.groupByYear = true;
        options.numericMonth = true;
        options.groupVideos = true;
        imageScanner.run(this.workingDir, options, null);
        final File file2 = new File(new File(new File(new File(this.workingDir.getAbsolutePath()), "2000"), "11"), "1");
        assertTrue(new File(file2, "image.jpg").exists());
        assertTrue(new File(file2, "image.3gp").exists());
    }
    
    public void testVirtualScanner() throws IOException {
        final TestImageParser testImageParser = new TestImageParser((TestImageParser)null);
        this.createRandomFiles(testImageParser, new FileInfo[100]);
        final ImageScanner imageScanner = new ImageScanner((ImageScanner.Parser)testImageParser);
        final ImageScanner.Options options = new ImageScanner.Options();
        options.groupByYear = true;
        options.groupByMonth = true;
        options.groupByDay = true;
        options.groupByAddress = true;
        options.groupVideos = true;
        final VirtualFile virtualFile = new VirtualFile(this.workingDir);
        this.paths = this.enumFiles(virtualFile);
        imageScanner.run(this.workingDir, options, new TestUtils.TestProgress());
        imageScanner.run(virtualFile, options, new TestUtils.TestProgress());
        assertTrue(this.equals(virtualFile, this.workingDir));
    }
    
    class FileInfo
    {
        final String address;
        final Date time;
        
        FileInfo(final String address, final Date time) {
            super();
            this.address = address;
            this.time = time;
        }
    }
    
    private class TestImageParser implements ImageScanner.Parser
    {
        private FileInfo fileInfo;
        private final HashMap<String, FileInfo> files;
        
        private TestImageParser() {
            super();
            this.files = new HashMap<String, FileInfo>();
        }
        
        void add(final String s, final Date date, final String s2, final double n, final double n2) {
            this.files.put(s, new FileInfo(s2, date));
        }
        
        public String getAddress() {
            return this.fileInfo.address;
        }
        
        public double getLatitude() {
            return 1.0;
        }
        
        public double getLongitude() {
            return 1.0;
        }
        
        public Date getTime() {
            return this.fileInfo.time;
        }
        
        public void parse(final String s) {
            this.fileInfo = this.files.get(s);
        }
    }
}
