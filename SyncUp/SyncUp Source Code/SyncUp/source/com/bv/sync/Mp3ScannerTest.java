package com.bv.sync;

import junit.framework.*;
import java.io.*;
import java.util.*;

public class Mp3ScannerTest extends TestCase
{
    private static final String VIRTUAL_TEST = "VirtualTest";
    private static final Random random;
    private HashSet<String> paths;
    private IFile workingDir;
    
    static {
        random = new Random();
    }
    
    private void createRandomFiles(final TestParser testParser, final FileInfo[] array) throws IOException {
        for (int i = 0; i < array.length; ++i) {
            final String string = "path" + i + ".mp3";
            final String string2 = "artist" + Mp3ScannerTest.random.nextInt(15);
            final String string3 = "album" + Mp3ScannerTest.random.nextInt(5);
            final String string4 = "title" + Mp3ScannerTest.random.nextInt(20);
            array[i] = new FileInfo(string2, string3, string4);
            TestUtils.createFile(this.workingDir, string, new StringBuilder().append(i).toString());
            testParser.add(new File(new File(this.workingDir.getAbsolutePath()), string).getAbsolutePath(), string2, string3, string4);
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
        if (this.workingDir.exists()) {
            this.workingDir.delete();
        }
    }
    
    public void testFile() throws IOException {
        for (int i = 0; i < 10; ++i) {
            TestUtils.createFile(this.workingDir, new StringBuilder().append(i).toString(), new StringBuilder().append(i).toString());
        }
        final VirtualFile virtualFile = new VirtualFile(this.workingDir);
        this.paths = this.enumFiles(virtualFile);
        assertTrue(this.equals(virtualFile, this.workingDir));
    }
    
    public void testVirtualScanner() throws IOException {
        final TestParser testParser = new TestParser((TestParser)null);
        this.createRandomFiles(testParser, new FileInfo[100]);
        final Mp3Scanner mp3Scanner = new Mp3Scanner((Mp3Scanner.Parser)testParser);
        final Mp3Scanner.Options options = new Mp3Scanner.Options();
        options.groupByArtist = true;
        options.groupByAlbum = true;
        options.renameSongs = false;
        final VirtualFile virtualFile = new VirtualFile(this.workingDir);
        this.paths = this.enumFiles(virtualFile);
        mp3Scanner.run(this.workingDir, options, new TestUtils.TestProgress());
        mp3Scanner.run(virtualFile, options, new TestUtils.TestProgress());
        assertTrue(this.equals(virtualFile, this.workingDir));
    }
    
    private static class FileInfo
    {
        final String album;
        final String artist;
        final String title;
        
        FileInfo(final String artist, final String album, final String title) {
            super();
            this.artist = artist;
            this.album = album;
            this.title = title;
        }
    }
    
    private class TestParser implements Mp3Scanner.Parser
    {
        private FileInfo fileInfo;
        private final HashMap<String, FileInfo> files;
        
        static /* synthetic */ int[] $SWITCH_TABLE$com$bv$sync$Mp3Scanner$FieldType() {
            int[] $switch_TABLE$com$bv$sync$Mp3Scanner$FieldType = TestParser.$SWITCH_TABLE$com$bv$sync$Mp3Scanner$FieldType;
            if ($switch_TABLE$com$bv$sync$Mp3Scanner$FieldType == null) {
                $switch_TABLE$com$bv$sync$Mp3Scanner$FieldType = new int[Mp3Scanner.FieldType.values().length];
                while (true) {
                    try {
                        $switch_TABLE$com$bv$sync$Mp3Scanner$FieldType[Mp3Scanner.FieldType.Album.ordinal()] = 2;
                        try {
                            $switch_TABLE$com$bv$sync$Mp3Scanner$FieldType[Mp3Scanner.FieldType.Artist.ordinal()] = 1;
                            try {
                                $switch_TABLE$com$bv$sync$Mp3Scanner$FieldType[Mp3Scanner.FieldType.Title.ordinal()] = 3;
                                TestParser.$SWITCH_TABLE$com$bv$sync$Mp3Scanner$FieldType = $switch_TABLE$com$bv$sync$Mp3Scanner$FieldType;
                            }
                            catch (NoSuchFieldError noSuchFieldError) {}
                        }
                        catch (NoSuchFieldError noSuchFieldError2) {}
                    }
                    catch (NoSuchFieldError noSuchFieldError3) {
                        continue;
                    }
                    break;
                }
            }
            return $switch_TABLE$com$bv$sync$Mp3Scanner$FieldType;
        }
        
        private TestParser() {
            super();
            this.files = new HashMap<String, FileInfo>();
        }
        
        void add(final String s, final String s2, final String s3, final String s4) {
            this.files.put(s, new FileInfo(s2, s3, s4));
        }
        
        public String getField(final Mp3Scanner.FieldType fieldType) {
            String s = null;
            switch ($SWITCH_TABLE$com$bv$sync$Mp3Scanner$FieldType()[fieldType.ordinal()]) {
                default: {
                    s = null;
                    break;
                }
                case 1: {
                    s = this.fileInfo.artist;
                    break;
                }
                case 2: {
                    s = this.fileInfo.album;
                    break;
                }
                case 3: {
                    s = this.fileInfo.title;
                    break;
                }
            }
            return s;
        }
        
        public void parse(final String s) throws IOException {
            this.fileInfo = this.files.get(s);
        }
    }
}
