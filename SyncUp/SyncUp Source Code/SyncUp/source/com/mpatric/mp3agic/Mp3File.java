package com.mpatric.mp3agic;

import java.util.*;
import java.io.*;

public class Mp3File extends FileWrapper
{
    private static final int DEFAULT_BUFFER_LENGTH = 65536;
    private static final int MINIMUM_BUFFER_LENGTH = 40;
    private static final int XING_MARKER_OFFSET_1 = 13;
    private static final int XING_MARKER_OFFSET_2 = 21;
    private static final int XING_MARKER_OFFSET_3 = 36;
    private double bitrate;
    private Map<Integer, MutableInteger> bitrates;
    protected int bufferLength;
    private String channelMode;
    private boolean copyright;
    private byte[] customTag;
    private String emphasis;
    private int endOffset;
    private int frameCount;
    private ID3v1 id3v1Tag;
    private ID3v2 id3v2Tag;
    private String layer;
    private String modeExtension;
    private boolean original;
    private int sampleRate;
    private boolean scanFile;
    private int startOffset;
    private String version;
    private int xingBitrate;
    private int xingOffset;
    
    protected Mp3File() {
        super();
        this.xingOffset = -1;
        this.startOffset = -1;
        this.endOffset = -1;
        this.frameCount = 0;
        this.bitrates = new HashMap<Integer, MutableInteger>();
        this.bitrate = 0.0;
    }
    
    public Mp3File(final String s) throws IOException, UnsupportedTagException, InvalidDataException {
        this(s, 65536, true);
    }
    
    public Mp3File(final String s, final int n) throws IOException, UnsupportedTagException, InvalidDataException {
        this(s, n, true);
    }
    
    public Mp3File(final String s, final int bufferLength, final boolean scanFile) throws IOException, UnsupportedTagException, InvalidDataException {
        super(s);
        this.xingOffset = -1;
        this.startOffset = -1;
        this.endOffset = -1;
        this.frameCount = 0;
        this.bitrates = new HashMap<Integer, MutableInteger>();
        this.bitrate = 0.0;
        if (bufferLength < 41) {
            throw new IllegalArgumentException("Buffer too small");
        }
        this.bufferLength = bufferLength;
        this.scanFile = scanFile;
        this.init();
    }
    
    public Mp3File(final String s, final boolean b) throws IOException, UnsupportedTagException, InvalidDataException {
        this(s, 65536, b);
    }
    
    private void addBitrate(final int n) {
        final Integer n2 = new Integer(n);
        final MutableInteger mutableInteger = this.bitrates.get(n2);
        if (mutableInteger != null) {
            mutableInteger.increment();
        }
        else {
            this.bitrates.put(n2, new MutableInteger(1));
        }
        this.bitrate = (this.bitrate * (-1 + this.frameCount) + n) / this.frameCount;
    }
    
    private void init() throws IOException, UnsupportedTagException, InvalidDataException {
        final RandomAccessFile randomAccessFile = new RandomAccessFile(this.filename, "r");
        try {
            this.initId3v1Tag(randomAccessFile);
            this.scanFile(randomAccessFile);
            if (this.startOffset < 0) {
                throw new InvalidDataException("No mpegs frames found");
            }
        }
        finally {
            randomAccessFile.close();
        }
        this.initId3v2Tag(randomAccessFile);
        if (this.scanFile) {
            this.initCustomTag(randomAccessFile);
        }
        randomAccessFile.close();
    }
    
    private void initCustomTag(final RandomAccessFile randomAccessFile) throws IOException {
        int n = (int)(this.getLength() - (1 + this.endOffset));
        if (this.hasId3v1Tag()) {
            n -= 128;
        }
        if (n <= 0) {
            this.customTag = null;
        }
        else {
            this.customTag = new byte[n];
            randomAccessFile.seek(1 + this.endOffset);
            if (randomAccessFile.read(this.customTag, 0, n) < n) {
                throw new IOException("Not enough bytes read");
            }
        }
    }
    
    private void initId3v1Tag(final RandomAccessFile randomAccessFile) throws IOException {
        final byte[] array = new byte[128];
        final long n = this.getLength() - 128L;
        if (n < 0L) {
            throw new InvalidDataException("Length less than mp3 tag length at file: " + this.filename);
        }
        randomAccessFile.seek(n);
        if (randomAccessFile.read(array, 0, 128) < 128) {
            throw new IOException("Not enough bytes read");
        }
        try {
            this.id3v1Tag = new ID3v1Tag(array);
        }
        catch (NoSuchTagException ex) {
            this.id3v1Tag = null;
        }
    }
    
    private void initId3v2Tag(final RandomAccessFile randomAccessFile) throws IOException, UnsupportedTagException, InvalidDataException {
        if (this.xingOffset == 0 || this.startOffset == 0) {
            this.id3v2Tag = null;
        }
        else {
            int n;
            if (this.hasXingFrame()) {
                n = this.xingOffset;
            }
            else {
                n = this.startOffset;
            }
            final byte[] array = new byte[n];
            randomAccessFile.seek(0L);
            if (randomAccessFile.read(array, 0, n) < n) {
                throw new IOException("Not enough bytes read");
            }
            try {
                this.id3v2Tag = ID3v2TagFactory.createTag(array);
            }
            catch (NoSuchTagException ex) {
                this.id3v2Tag = null;
            }
        }
    }
    
    private boolean isXingFrame(final byte[] array, final int n) {
        boolean b = true;
        if (array.length < 3 + (n + 13) || (!"Xing".equals(BufferTools.byteBufferToString(array, n + 13, 4)) && !"Info".equals(BufferTools.byteBufferToString(array, n + 13, 4)) && (array.length < 3 + (n + 21) || (!"Xing".equals(BufferTools.byteBufferToString(array, n + 21, 4)) && !"Info".equals(BufferTools.byteBufferToString(array, n + 21, 4)) && (array.length < 3 + (n + 36) || (!"Xing".equals(BufferTools.byteBufferToString(array, n + 36, 4)) && !"Info".equals(BufferTools.byteBufferToString(array, n + 36, 4)))))))) {
            b = false;
        }
        return b;
    }
    
    private int maxEndOffset() {
        int n = (int)this.getLength();
        if (this.hasId3v1Tag()) {
            n -= 128;
        }
        return n;
    }
    
    private void sanityCheckFrame(final MpegFrame mpegFrame, final int n) throws InvalidDataException {
        if (this.sampleRate != mpegFrame.getSampleRate()) {
            throw new InvalidDataException("Inconsistent frame header");
        }
        if (!this.layer.equals(mpegFrame.getLayer())) {
            throw new InvalidDataException("Inconsistent frame header");
        }
        if (!this.version.equals(mpegFrame.getVersion())) {
            throw new InvalidDataException("Inconsistent frame header");
        }
        if (n + mpegFrame.getLengthInBytes() > this.getLength()) {
            throw new InvalidDataException("Frame would extend beyond end of file");
        }
    }
    
    private void saveMpegFrames(final RandomAccessFile randomAccessFile) throws IOException {
        int n = this.xingOffset;
        if (n < 0) {
            n = this.startOffset;
        }
        if (n >= 0 && this.endOffset >= n) {
            final RandomAccessFile randomAccessFile2 = new RandomAccessFile(this.filename, "r");
            final byte[] array = new byte[this.bufferLength];
            final long n2 = n;
            try {
                randomAccessFile2.seek(n2);
                while (true) {
                    final int read = randomAccessFile2.read(array, 0, this.bufferLength);
                    if (n + read > this.endOffset) {
                        break;
                    }
                    randomAccessFile.write(array, 0, read);
                    n += read;
                }
                randomAccessFile.write(array, 0, 1 + (this.endOffset - n));
            }
            finally {
                randomAccessFile2.close();
            }
        }
    }
    
    private int scanBlock(final byte[] array, final int n, final int n2, int i) throws InvalidDataException {
        while (i < n - 40) {
            final MpegFrame mpegFrame = new MpegFrame(array[i], array[i + 1], array[i + 2], array[i + 3]);
            this.sanityCheckFrame(mpegFrame, n2 + i);
            if (-1 + (n2 + i + mpegFrame.getLengthInBytes()) >= this.maxEndOffset()) {
                break;
            }
            this.endOffset = -1 + (n2 + i + mpegFrame.getLengthInBytes());
            this.frameCount += 1;
            this.addBitrate(mpegFrame.getBitrate());
            i += mpegFrame.getLengthInBytes();
        }
        return i;
    }
    
    private int scanBlockForStart(final byte[] array, final int n, final int n2, int i) {
        while (i < n - 40) {
            if (array[i] == -1 && (0xE0 & array[i + 1]) == 0xE0) {
                try {
                    final MpegFrame mpegFrame = new MpegFrame(array[i], array[i + 1], array[i + 2], array[i + 3]);
                    if (this.xingOffset < 0 && this.isXingFrame(array, i)) {
                        this.xingOffset = n2 + i;
                        this.xingBitrate = mpegFrame.getBitrate();
                        i += mpegFrame.getLengthInBytes();
                        continue;
                    }
                    this.startOffset = n2 + i;
                    this.channelMode = mpegFrame.getChannelMode();
                    this.emphasis = mpegFrame.getEmphasis();
                    this.layer = mpegFrame.getLayer();
                    this.modeExtension = mpegFrame.getModeExtension();
                    this.sampleRate = mpegFrame.getSampleRate();
                    this.version = mpegFrame.getVersion();
                    this.copyright = mpegFrame.isCopyright();
                    this.original = mpegFrame.isOriginal();
                    this.frameCount += 1;
                    this.addBitrate(mpegFrame.getBitrate());
                    return i + mpegFrame.getLengthInBytes();
                }
                catch (InvalidDataException ex) {
                    ++i;
                    continue;
                }
            }
            ++i;
        }
        return i;
    }
    
    private void scanFile(final RandomAccessFile randomAccessFile) throws IOException, InvalidDataException {
        final byte[] array = new byte[this.bufferLength];
        int preScanFile = this.preScanFile(randomAccessFile);
        randomAccessFile.seek(preScanFile);
        int i = 0;
        int startOffset = preScanFile;
        while (i == 0) {
            final int read = randomAccessFile.read(array, 0, this.bufferLength);
            if (read < this.bufferLength) {
                i = 1;
            }
            if (read >= 40) {
                try {
                    final int startOffset2 = this.startOffset;
                    int scanBlockForStart = 0;
                    if (startOffset2 < 0) {
                        scanBlockForStart = this.scanBlockForStart(array, read, preScanFile, 0);
                        if (this.startOffset >= 0 && !this.scanFile) {
                            break;
                        }
                        startOffset = this.startOffset;
                    }
                    preScanFile += this.scanBlock(array, read, preScanFile, scanBlockForStart);
                    randomAccessFile.seek(preScanFile);
                }
                catch (InvalidDataException ex) {
                    if (this.frameCount >= 2) {
                        break;
                    }
                    this.startOffset = -1;
                    this.xingOffset = -1;
                    this.frameCount = 0;
                    this.bitrates.clear();
                    preScanFile = startOffset + 1;
                    if (preScanFile == 0) {
                        throw new InvalidDataException("Valid start of mpeg frames not found", ex);
                    }
                    randomAccessFile.seek(preScanFile);
                    i = 0;
                }
            }
        }
    }
    
    public int getBitrate() {
        return (int)(0.5 + this.bitrate);
    }
    
    public Map<Integer, MutableInteger> getBitrates() {
        return this.bitrates;
    }
    
    public String getChannelMode() {
        return this.channelMode;
    }
    
    public byte[] getCustomTag() {
        return this.customTag;
    }
    
    public String getEmphasis() {
        return this.emphasis;
    }
    
    public int getEndOffset() {
        return this.endOffset;
    }
    
    public int getFrameCount() {
        return this.frameCount;
    }
    
    public ID3v1 getId3v1Tag() {
        return this.id3v1Tag;
    }
    
    public ID3v2 getId3v2Tag() {
        return this.id3v2Tag;
    }
    
    public String getLayer() {
        return this.layer;
    }
    
    public long getLengthInMilliseconds() {
        return (long)(0.5 + 8 * (this.endOffset - this.startOffset) / this.bitrate);
    }
    
    public long getLengthInSeconds() {
        return (500L + this.getLengthInMilliseconds()) / 1000L;
    }
    
    public String getModeExtension() {
        return this.modeExtension;
    }
    
    public int getSampleRate() {
        return this.sampleRate;
    }
    
    public int getStartOffset() {
        return this.startOffset;
    }
    
    public String getVersion() {
        return this.version;
    }
    
    public int getXingBitrate() {
        return this.xingBitrate;
    }
    
    public int getXingOffset() {
        return this.xingOffset;
    }
    
    public boolean hasCustomTag() {
        return this.customTag != null;
    }
    
    public boolean hasId3v1Tag() {
        return this.id3v1Tag != null;
    }
    
    public boolean hasId3v2Tag() {
        return this.id3v2Tag != null;
    }
    
    public boolean hasXingFrame() {
        return this.xingOffset >= 0;
    }
    
    public boolean isCopyright() {
        return this.copyright;
    }
    
    public boolean isOriginal() {
        return this.original;
    }
    
    public boolean isVbr() {
        int n = 1;
        if (this.bitrates.size() <= n) {
            n = 0;
        }
        return n != 0;
    }
    
    protected int preScanFile(final RandomAccessFile p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: bipush          10
        //     2: newarray        B
        //     4: astore_2       
        //     5: aload_1        
        //     6: lconst_0       
        //     7: invokevirtual   java/io/RandomAccessFile.seek:(J)V
        //    10: aload_1        
        //    11: aload_2        
        //    12: iconst_0       
        //    13: bipush          10
        //    15: invokevirtual   java/io/RandomAccessFile.read:([BII)I
        //    18: istore          5
        //    20: iconst_0       
        //    21: istore          4
        //    23: iload           5
        //    25: bipush          10
        //    27: if_icmpne       62
        //    30: aload_2        
        //    31: invokestatic    com/mpatric/mp3agic/ID3v2TagFactory.sanityCheckTag:([B)V
        //    34: aload_2        
        //    35: bipush          6
        //    37: baload         
        //    38: aload_2        
        //    39: bipush          7
        //    41: baload         
        //    42: aload_2        
        //    43: bipush          8
        //    45: baload         
        //    46: aload_2        
        //    47: bipush          9
        //    49: baload         
        //    50: invokestatic    com/mpatric/mp3agic/BufferTools.unpackSynchsafeInteger:(BBBB)I
        //    53: istore          8
        //    55: iload           8
        //    57: bipush          10
        //    59: iadd           
        //    60: istore          4
        //    62: iload           4
        //    64: ireturn        
        //    65: astore_3       
        //    66: iconst_0       
        //    67: istore          4
        //    69: goto            62
        //    72: astore          7
        //    74: iconst_0       
        //    75: istore          4
        //    77: goto            62
        //    80: astore          6
        //    82: iconst_0       
        //    83: istore          4
        //    85: goto            62
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                         
        //  -----  -----  -----  -----  ---------------------------------------------
        //  5      20     65     72     Ljava/io/IOException;
        //  30     55     80     88     Lcom/mpatric/mp3agic/NoSuchTagException;
        //  30     55     72     80     Lcom/mpatric/mp3agic/UnsupportedTagException;
        //  30     55     65     72     Ljava/io/IOException;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0062:
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
    
    public void save(final String s) throws IOException, NotSupportedException {
        if (this.filename.compareToIgnoreCase(s) == 0) {
            throw new IllegalArgumentException("Save filename same as source filename");
        }
        final RandomAccessFile randomAccessFile = new RandomAccessFile(s, "rw");
        try {
            if (this.hasId3v2Tag()) {
                randomAccessFile.write(this.id3v2Tag.toBytes());
            }
            this.saveMpegFrames(randomAccessFile);
            if (this.hasCustomTag()) {
                randomAccessFile.write(this.customTag);
            }
            if (this.hasId3v1Tag()) {
                randomAccessFile.write(this.id3v1Tag.toBytes());
            }
        }
        finally {
            randomAccessFile.close();
        }
    }
    
    public void setCustomTag(final byte[] customTag) {
        this.customTag = customTag;
    }
    
    public void setId3v1Tag(final ID3v1 id3v1Tag) {
        this.id3v1Tag = id3v1Tag;
    }
    
    public void setId3v2Tag(final ID3v2 id3v2Tag) {
        this.id3v2Tag = id3v2Tag;
    }
}
