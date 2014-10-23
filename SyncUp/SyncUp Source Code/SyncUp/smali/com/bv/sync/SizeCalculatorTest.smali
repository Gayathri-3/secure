.class public Lcom/bv/sync/SizeCalculatorTest;
.super Ljunit/framework/TestCase;
.source "SizeCalculatorTest.java"


# static fields
.field private static final testDir:Lcom/bv/sync/IFile;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 8
    new-instance v0, Lcom/bv/sync/LocalFile;

    const-string v1, "tmp"

    invoke-direct {v0, v1}, Lcom/bv/sync/LocalFile;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/bv/sync/SizeCalculatorTest;->testDir:Lcom/bv/sync/IFile;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljunit/framework/TestCase;-><init>()V

    return-void
.end method

.method private makeDirs(Lcom/bv/sync/IFile;I)[Lcom/bv/sync/IFile;
    .locals 3
    .parameter "dir"
    .parameter "fileCount"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    new-array v1, p2, [Lcom/bv/sync/IFile;

    .line 78
    .local v1, result:[Lcom/bv/sync/IFile;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-lt v0, p2, :cond_0

    .line 82
    return-object v1

    .line 79
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v2

    aput-object v2, v1, v0

    .line 80
    aget-object v2, v1, v0

    invoke-interface {v2}, Lcom/bv/sync/IFile;->mkdir()V

    .line 78
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private runSizeCalculator()Lcom/bv/sync/SizeCalculator;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 86
    new-instance v0, Lcom/bv/sync/SizeCalculator;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/bv/sync/IFile;

    const/4 v2, 0x0

    sget-object v3, Lcom/bv/sync/SizeCalculatorTest;->testDir:Lcom/bv/sync/IFile;

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lcom/bv/sync/SizeCalculator;-><init>([Lcom/bv/sync/IFile;)V

    .line 87
    .local v0, sizeCalculator:Lcom/bv/sync/SizeCalculator;
    monitor-enter v0

    .line 88
    :try_start_0
    invoke-virtual {v0}, Lcom/bv/sync/SizeCalculator;->start()V

    .line 89
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V

    .line 87
    monitor-exit v0

    .line 91
    return-object v0

    .line 87
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method protected setUp()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 12
    invoke-super {p0}, Ljunit/framework/TestCase;->setUp()V

    .line 13
    sget-object v0, Lcom/bv/sync/SizeCalculatorTest;->testDir:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 14
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/bv/sync/IFile;

    const/4 v1, 0x0

    sget-object v2, Lcom/bv/sync/SizeCalculatorTest;->testDir:Lcom/bv/sync/IFile;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/bv/sync/TestUtils;->wipe([Lcom/bv/sync/IFile;)V

    .line 17
    :goto_0
    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/bv/sync/SizeCalculatorTest;->testDir:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->mkdir()V

    goto :goto_0
.end method

.method protected tearDown()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 23
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/bv/sync/IFile;

    const/4 v1, 0x0

    .line 21
    sget-object v2, Lcom/bv/sync/SizeCalculatorTest;->testDir:Lcom/bv/sync/IFile;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/bv/sync/TestUtils;->wipe([Lcom/bv/sync/IFile;)V

    .line 22
    invoke-super {p0}, Ljunit/framework/TestCase;->tearDown()V

    return-void
.end method

.method public testDirsWithFiles()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x2

    .line 57
    const/4 v4, 0x2

    .line 58
    .local v4, fileCount:I
    const-string v0, "12"

    .line 59
    .local v0, content:Ljava/lang/String;
    const/4 v1, 0x0

    .line 60
    .local v1, count:I
    const/4 v6, 0x0

    .line 62
    .local v6, size:I
    sget-object v8, Lcom/bv/sync/SizeCalculatorTest;->testDir:Lcom/bv/sync/IFile;

    const-string v9, "first"

    const-string v10, "12"

    invoke-static {v8, v9, v10}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    .line 63
    add-int/lit8 v1, v1, 0x1

    .line 64
    const-string v8, "12"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v6

    .line 65
    sget-object v8, Lcom/bv/sync/SizeCalculatorTest;->testDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v8, v12}, Lcom/bv/sync/SizeCalculatorTest;->makeDirs(Lcom/bv/sync/IFile;I)[Lcom/bv/sync/IFile;

    move-result-object v3

    .line 66
    .local v3, dirs:[Lcom/bv/sync/IFile;
    array-length v8, v3

    add-int/lit8 v1, v8, 0x1

    .line 67
    array-length v9, v3

    const/4 v8, 0x0

    :goto_0
    if-lt v8, v9, :cond_0

    .line 71
    invoke-direct {p0}, Lcom/bv/sync/SizeCalculatorTest;->runSizeCalculator()Lcom/bv/sync/SizeCalculator;

    move-result-object v7

    .line 72
    .local v7, sizeCalculator:Lcom/bv/sync/SizeCalculator;
    add-int/lit8 v8, v1, 0x1

    int-to-long v8, v8

    invoke-virtual {v7}, Lcom/bv/sync/SizeCalculator;->getCount()J

    move-result-wide v10

    invoke-static {v8, v9, v10, v11}, Lcom/bv/sync/SizeCalculatorTest;->assertEquals(JJ)V

    .line 73
    int-to-long v8, v6

    invoke-virtual {v7}, Lcom/bv/sync/SizeCalculator;->getSize()J

    move-result-wide v10

    invoke-static {v8, v9, v10, v11}, Lcom/bv/sync/SizeCalculatorTest;->assertEquals(JJ)V

    .line 74
    return-void

    .line 67
    .end local v7           #sizeCalculator:Lcom/bv/sync/SizeCalculator;
    :cond_0
    aget-object v2, v3, v8

    .line 68
    .local v2, dir:Lcom/bv/sync/IFile;
    const/4 v5, 0x0

    .local v5, i:I
    :goto_1
    if-lt v5, v12, :cond_1

    .line 67
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 69
    :cond_1
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "12"

    invoke-static {v2, v10, v11}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    .line 68
    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v1, v1, 0x1

    const-string v10, "12"

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    add-int/2addr v6, v10

    goto :goto_1
.end method

.method public testEmptyDirs()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 37
    const/4 v0, 0x5

    .line 38
    .local v0, fileCount:I
    sget-object v2, Lcom/bv/sync/SizeCalculatorTest;->testDir:Lcom/bv/sync/IFile;

    const/4 v3, 0x5

    invoke-direct {p0, v2, v3}, Lcom/bv/sync/SizeCalculatorTest;->makeDirs(Lcom/bv/sync/IFile;I)[Lcom/bv/sync/IFile;

    .line 40
    invoke-direct {p0}, Lcom/bv/sync/SizeCalculatorTest;->runSizeCalculator()Lcom/bv/sync/SizeCalculator;

    move-result-object v1

    .line 41
    .local v1, sizeCalculator:Lcom/bv/sync/SizeCalculator;
    const-wide/16 v2, 0x6

    invoke-virtual {v1}, Lcom/bv/sync/SizeCalculator;->getCount()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lcom/bv/sync/SizeCalculatorTest;->assertEquals(JJ)V

    .line 42
    const-wide/16 v2, 0x0

    invoke-virtual {v1}, Lcom/bv/sync/SizeCalculator;->getSize()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lcom/bv/sync/SizeCalculatorTest;->assertEquals(JJ)V

    .line 43
    return-void
.end method

.method public testFiles()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 26
    const-string v0, "12"

    .line 27
    .local v0, fileContent:Ljava/lang/String;
    const/4 v1, 0x5

    .line 28
    .local v1, fileCount:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    const/4 v4, 0x5

    if-lt v2, v4, :cond_0

    .line 31
    invoke-direct {p0}, Lcom/bv/sync/SizeCalculatorTest;->runSizeCalculator()Lcom/bv/sync/SizeCalculator;

    move-result-object v3

    .line 32
    .local v3, sizeCalculator:Lcom/bv/sync/SizeCalculator;
    const-wide/16 v4, 0x6

    invoke-virtual {v3}, Lcom/bv/sync/SizeCalculator;->getCount()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Lcom/bv/sync/SizeCalculatorTest;->assertEquals(JJ)V

    .line 33
    const-string v4, "12"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    mul-int/lit8 v4, v4, 0x5

    int-to-long v4, v4

    invoke-virtual {v3}, Lcom/bv/sync/SizeCalculator;->getSize()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Lcom/bv/sync/SizeCalculatorTest;->assertEquals(JJ)V

    .line 34
    return-void

    .line 29
    .end local v3           #sizeCalculator:Lcom/bv/sync/SizeCalculator;
    :cond_0
    sget-object v4, Lcom/bv/sync/SizeCalculatorTest;->testDir:Lcom/bv/sync/IFile;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "12"

    invoke-static {v4, v5, v6}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    .line 28
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public testNestedEmptyDirs()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x5

    .line 46
    const/4 v2, 0x5

    .line 47
    .local v2, fileCount:I
    sget-object v4, Lcom/bv/sync/SizeCalculatorTest;->testDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v4, v6}, Lcom/bv/sync/SizeCalculatorTest;->makeDirs(Lcom/bv/sync/IFile;I)[Lcom/bv/sync/IFile;

    move-result-object v1

    .line 48
    .local v1, dirs:[Lcom/bv/sync/IFile;
    array-length v5, v1

    const/4 v4, 0x0

    :goto_0
    if-lt v4, v5, :cond_0

    .line 51
    invoke-direct {p0}, Lcom/bv/sync/SizeCalculatorTest;->runSizeCalculator()Lcom/bv/sync/SizeCalculator;

    move-result-object v3

    .line 52
    .local v3, sizeCalculator:Lcom/bv/sync/SizeCalculator;
    const-wide/16 v4, 0x1f

    invoke-virtual {v3}, Lcom/bv/sync/SizeCalculator;->getCount()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Lcom/bv/sync/SizeCalculatorTest;->assertEquals(JJ)V

    .line 53
    const-wide/16 v4, 0x0

    invoke-virtual {v3}, Lcom/bv/sync/SizeCalculator;->getSize()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Lcom/bv/sync/SizeCalculatorTest;->assertEquals(JJ)V

    .line 54
    return-void

    .line 48
    .end local v3           #sizeCalculator:Lcom/bv/sync/SizeCalculator;
    :cond_0
    aget-object v0, v1, v4

    .line 49
    .local v0, dir:Lcom/bv/sync/IFile;
    invoke-direct {p0, v0, v6}, Lcom/bv/sync/SizeCalculatorTest;->makeDirs(Lcom/bv/sync/IFile;I)[Lcom/bv/sync/IFile;

    .line 48
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method
