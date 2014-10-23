package com.bv.sync;

import java.io.*;
import java.util.*;

public class BasicSyncTest extends SyncTest
{
    private void copyBytes(final IFile file, final IFile file2) throws IOException {
        final byte[] array = new byte[4096];
        final OutputStream outputStream = file2.getOutputStream();
        try {
            final InputStream inputStream = file.getInputStream();
            try {
                while (true) {
                    final int read = inputStream.read(array);
                    if (read == -1) {
                        break;
                    }
                    outputStream.write(array, 0, read);
                }
                inputStream.close();
                outputStream.close();
                file2.setLastModified(1000L * (file.getLastModified() / 1000L));
            }
            finally {
                inputStream.close();
            }
        }
        finally {
            outputStream.close();
        }
    }
    
    private void copyFiles(final IFile[] array, final IFile file) throws IOException {
        for (final IFile file2 : array) {
            final IFile file3 = file.createFile(file2.getName());
            if (file2.isDirectory()) {
                file3.mkdir();
                this.copyFiles(file2.listFiles(), file3);
            }
            else {
                this.copyBytes(file2, file3);
            }
        }
    }
    
    private void setRandomLastModified(final IFile file) throws IOException, InterruptedException {
        final long lastModified = file.getLastModified();
        final int n = -this.random.nextInt(2) * (1000 * (60 * (60 * this.random.nextInt(2))) + 1000 * this.random.nextInt(3));
        final long lastModified2 = lastModified + n;
        if (n != 0) {
            System.err.println("Setting last modified diff: " + file.getAbsolutePath() + " " + n / 1000 + " " + lastModified2);
            file.setLastModified(lastModified2);
        }
    }
    
    private void testOneDirection(final IFile file, final IFile file2, final CifsSync.Options.Direction direction) throws IOException, InterruptedException {
        final int size = SyncTest.makeLeftFiles(file).size();
        final CifsSync.Options options = new CifsSync.Options(direction, true, CifsSync.Options.VerifyTimeZone.OneHour, null);
        assertEquals(size, this.sync(options).size());
        assertEquals(0, this.sync(options).size());
        SyncTest.verifySynced(file, file2);
        final StringBuilder sb = new StringBuilder();
        final int counter = BasicSyncTest.counter;
        BasicSyncTest.counter = counter + 1;
        final String string = sb.append(counter).toString();
        final StringBuilder sb2 = new StringBuilder();
        final int counter2 = BasicSyncTest.counter;
        BasicSyncTest.counter = counter2 + 1;
        TestUtils.createFile(file2, string, sb2.append(counter2).toString());
        assertEquals(0, this.sync(options).size());
        this.testTargetModified(file2, options);
    }
    
    private void testTargetModified(final IFile file, final CifsSync.Options options) throws IOException, InterruptedException {
        final IFile[] listFiles = file.listFiles();
        int n = 0;
        for (final IFile file2 : listFiles) {
            if (file2.isFile()) {
                file2.setLastModified(3000L + file2.getLastModified());
                ++n;
            }
        }
        assertTrue(n > 0);
        assertEquals(0, this.sync(options).size());
    }
    
    public void testBothSync() throws IOException, InterruptedException {
        final int size = SyncTest.makeFiles(this.leftDir, this.rightDir).size();
        final CifsSync.Options options = new CifsSync.Options(CifsSync.Options.Direction.Both, true, CifsSync.Options.VerifyTimeZone.OneHour, null);
        assertEquals(size, this.sync(options).size());
        SyncTest.verifySynced(this.leftDir, this.rightDir);
        assertEquals(0, this.sync(options).size());
        SyncTest.verifySynced(this.leftDir, this.rightDir);
    }
    
    public void testFreeSpace() throws IOException, InterruptedException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: getfield        com/bv/sync/BasicSyncTest.leftDir:Lcom/bv/sync/IFile;
        //     4: ldc             "big"
        //     6: invokeinterface com/bv/sync/IFile.createFile:(Ljava/lang/String;)Lcom/bv/sync/IFile;
        //    11: astore_1       
        //    12: ldc             61440
        //    14: newarray        B
        //    16: astore_2       
        //    17: aload_1        
        //    18: invokeinterface com/bv/sync/IFile.getOutputStream:()Ljava/io/OutputStream;
        //    23: astore_3       
        //    24: aload_3        
        //    25: aload_2        
        //    26: invokevirtual   java/io/OutputStream.write:([B)V
        //    29: aload_3        
        //    30: invokevirtual   java/io/OutputStream.close:()V
        //    33: new             Lcom/bv/sync/CifsSync$Options;
        //    36: dup            
        //    37: invokespecial   com/bv/sync/CifsSync$Options.<init>:()V
        //    40: astore          5
        //    42: aload           5
        //    44: lconst_1       
        //    45: aload_1        
        //    46: invokeinterface com/bv/sync/IFile.getFreeSpace:()J
        //    51: aload_1        
        //    52: invokeinterface com/bv/sync/IFile.length:()J
        //    57: ladd           
        //    58: ladd           
        //    59: putfield        com/bv/sync/CifsSync$Options.minFreeSpace:J
        //    62: aload_0        
        //    63: aload           5
        //    65: invokevirtual   com/bv/sync/BasicSyncTest.sync:(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;
        //    68: pop            
        //    69: ldc             "Should stop here"
        //    71: iconst_0       
        //    72: invokestatic    com/bv/sync/BasicSyncTest.assertTrue:(Ljava/lang/String;Z)V
        //    75: return         
        //    76: astore          4
        //    78: aload_3        
        //    79: invokevirtual   java/io/OutputStream.close:()V
        //    82: aload           4
        //    84: athrow         
        //    85: astore          6
        //    87: goto            75
        //    Exceptions:
        //  throws java.io.IOException
        //  throws java.lang.InterruptedException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                
        //  -----  -----  -----  -----  ------------------------------------
        //  24     29     76     85     Any
        //  62     75     85     90     Lcom/bv/sync/CifsSync$SyncException;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0075:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2607)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:100)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:668)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:567)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:493)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:460)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:105)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:55)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:271)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:203)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:103)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
    
    public void testNoOverwrite() throws IOException, InterruptedException {
        SyncTest.makeLeftFiles(this.leftDir);
        this.copyFiles(this.leftDir.listFiles(), this.rightDir);
        SyncTest.verifySynced(this.leftDir, this.rightDir);
        assertEquals(0, this.sync(new CifsSync.Options(CifsSync.Options.Direction.Both, false, CifsSync.Options.VerifyTimeZone.OneHour, null)).size());
        SyncTest.verifySynced(this.leftDir, this.rightDir);
    }
    
    public void testOneSecondDiff() throws IOException, InterruptedException {
        TestUtils.createFile(this.leftDir, "test1.txt", "test").setLastModified(1325824982000L);
        TestUtils.createFile(this.rightDir, "test1.txt", "test").setLastModified(1325824983000L);
        TestUtils.createFile(this.leftDir, "test2.txt", "test").setLastModified(1325824983000L);
        TestUtils.createFile(this.rightDir, "test2.txt", "test").setLastModified(1325824982000L);
        for (final CifsSync.Options.Direction direction : new CifsSync.Options.Direction[] { CifsSync.Options.Direction.Both, CifsSync.Options.Direction.toLocal, CifsSync.Options.Direction.toRemote }) {
            System.out.println("Direction: " + direction);
            assertEquals(0, this.sync(new CifsSync.Options(direction, true, CifsSync.Options.VerifyTimeZone.OneHour, null)).size());
            SyncTest.verifySynced(this.leftDir, this.rightDir);
        }
    }
    
    public void testTimeZones() throws IOException, InterruptedException {
        final Collection<IFile> files = SyncTest.makeFiles(this.leftDir, this.rightDir);
        final int size = files.size();
        final CifsSync.Options options = new CifsSync.Options(CifsSync.Options.Direction.Both, true, CifsSync.Options.VerifyTimeZone.OneHour, null);
        assertEquals(size, this.sync(options).size());
        SyncTest.verifySynced(this.leftDir, this.rightDir);
        for (final IFile randomLastModified : files) {
            if (randomLastModified.isFile()) {
                this.setRandomLastModified(randomLastModified);
            }
        }
        assertEquals(0, this.sync(options).size());
    }
    
    public void testToLeftSync() throws IOException, InterruptedException {
        this.testOneDirection(this.rightDir, this.leftDir, CifsSync.Options.Direction.toLocal);
    }
    
    public void testToRightSync() throws IOException, InterruptedException {
        this.testOneDirection(this.leftDir, this.rightDir, CifsSync.Options.Direction.toRemote);
    }
}
