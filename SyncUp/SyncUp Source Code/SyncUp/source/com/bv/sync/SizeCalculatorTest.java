package com.bv.sync;

import junit.framework.*;
import java.io.*;

public class SizeCalculatorTest extends TestCase
{
    private static final IFile testDir;
    
    static {
        testDir = new LocalFile("tmp");
    }
    
    private IFile[] makeDirs(final IFile file, final int n) throws IOException {
        final IFile[] array = new IFile[n];
        for (int i = 0; i < n; ++i) {
            (array[i] = file.createFile(new StringBuilder().append(i).toString())).mkdir();
        }
        return array;
    }
    
    private SizeCalculator runSizeCalculator() throws InterruptedException {
        final SizeCalculator sizeCalculator = new SizeCalculator(new IFile[] { SizeCalculatorTest.testDir });
        synchronized (sizeCalculator) {
            sizeCalculator.start();
            sizeCalculator.wait();
            return sizeCalculator;
        }
    }
    
    protected void setUp() throws Exception {
        super.setUp();
        if (SizeCalculatorTest.testDir.exists()) {
            TestUtils.wipe(SizeCalculatorTest.testDir);
        }
        else {
            SizeCalculatorTest.testDir.mkdir();
        }
    }
    
    protected void tearDown() throws Exception {
        TestUtils.wipe(SizeCalculatorTest.testDir);
        super.tearDown();
    }
    
    public void testDirsWithFiles() throws IOException, InterruptedException {
        TestUtils.createFile(SizeCalculatorTest.testDir, "first", "12");
        int length = "12".length();
        final IFile[] dirs = this.makeDirs(SizeCalculatorTest.testDir, 2);
        int n = 1 + dirs.length;
        for (final IFile file : dirs) {
            for (int j = 0; j < 2; ++j, ++n, length += "12".length()) {
                TestUtils.createFile(file, new StringBuilder().append(j).toString(), "12");
            }
        }
        final SizeCalculator runSizeCalculator = this.runSizeCalculator();
        assertEquals((long)(n + 1), runSizeCalculator.getCount());
        assertEquals((long)length, runSizeCalculator.getSize());
    }
    
    public void testEmptyDirs() throws IOException, InterruptedException {
        this.makeDirs(SizeCalculatorTest.testDir, 5);
        final SizeCalculator runSizeCalculator = this.runSizeCalculator();
        assertEquals(6L, runSizeCalculator.getCount());
        assertEquals(0L, runSizeCalculator.getSize());
    }
    
    public void testFiles() throws IOException, InterruptedException {
        for (int i = 0; i < 5; ++i) {
            TestUtils.createFile(SizeCalculatorTest.testDir, new StringBuilder().append(i).toString(), "12");
        }
        final SizeCalculator runSizeCalculator = this.runSizeCalculator();
        assertEquals(6L, runSizeCalculator.getCount());
        assertEquals((long)(5 * "12".length()), runSizeCalculator.getSize());
    }
    
    public void testNestedEmptyDirs() throws IOException, InterruptedException {
        final IFile[] dirs = this.makeDirs(SizeCalculatorTest.testDir, 5);
        for (int length = dirs.length, i = 0; i < length; ++i) {
            this.makeDirs(dirs[i], 5);
        }
        final SizeCalculator runSizeCalculator = this.runSizeCalculator();
        assertEquals(31L, runSizeCalculator.getCount());
        assertEquals(0L, runSizeCalculator.getSize());
    }
}
