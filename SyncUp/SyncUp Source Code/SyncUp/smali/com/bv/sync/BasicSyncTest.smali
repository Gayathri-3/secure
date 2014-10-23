.class public Lcom/bv/sync/BasicSyncTest;
.super Lcom/bv/sync/SyncTest;
.source "BasicSyncTest.java"


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/bv/sync/SyncTest;-><init>()V

    .line 17
    return-void
.end method

.method private copyBytes(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 8
    .parameter "file"
    .parameter "newFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x3e8

    .line 119
    const/16 v4, 0x1000

    new-array v0, v4, [B

    .line 120
    .local v0, buffer:[B
    invoke-interface {p2}, Lcom/bv/sync/IFile;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    .line 122
    .local v2, out:Ljava/io/OutputStream;
    :try_start_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v1

    .line 125
    .local v1, in:Ljava/io/InputStream;
    :goto_0
    :try_start_1
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    .local v3, size:I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 128
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 131
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 133
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v4

    div-long/2addr v4, v6

    mul-long/2addr v4, v6

    invoke-interface {p2, v4, v5}, Lcom/bv/sync/IFile;->setLastModified(J)V

    .line 134
    return-void

    .line 126
    :cond_0
    const/4 v4, 0x0

    :try_start_3
    invoke-virtual {v2, v0, v4, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 127
    .end local v3           #size:I
    :catchall_0
    move-exception v4

    .line 128
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 129
    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 130
    .end local v1           #in:Ljava/io/InputStream;
    :catchall_1
    move-exception v4

    .line 131
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 132
    throw v4
.end method

.method private copyFiles([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 5
    .parameter "files"
    .parameter "dir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    array-length v3, p1

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v3, :cond_0

    .line 116
    return-void

    .line 107
    :cond_0
    aget-object v0, p1, v2

    .line 108
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v4}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 109
    .local v1, newFile:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 110
    invoke-interface {v1}, Lcom/bv/sync/IFile;->mkdir()V

    .line 111
    invoke-interface {v0}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v4

    invoke-direct {p0, v4, v1}, Lcom/bv/sync/BasicSyncTest;->copyFiles([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 107
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 113
    :cond_1
    invoke-direct {p0, v0, v1}, Lcom/bv/sync/BasicSyncTest;->copyBytes(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    goto :goto_1
.end method

.method private setRandomLastModified(Lcom/bv/sync/IFile;)V
    .locals 9
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    .line 137
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    .line 138
    .local v2, lastModified:J
    iget-object v6, p0, Lcom/bv/sync/BasicSyncTest;->random:Ljava/util/Random;

    invoke-virtual {v6, v7}, Ljava/util/Random;->nextInt(I)I

    move-result v6

    neg-int v4, v6

    .line 139
    .local v4, sign:I
    iget-object v6, p0, Lcom/bv/sync/BasicSyncTest;->random:Ljava/util/Random;

    invoke-virtual {v6, v7}, Ljava/util/Random;->nextInt(I)I

    move-result v6

    mul-int/lit8 v6, v6, 0x3c

    mul-int/lit8 v6, v6, 0x3c

    mul-int/lit16 v5, v6, 0x3e8

    .line 140
    .local v5, timeZone:I
    iget-object v6, p0, Lcom/bv/sync/BasicSyncTest;->random:Ljava/util/Random;

    const/4 v7, 0x3

    invoke-virtual {v6, v7}, Ljava/util/Random;->nextInt(I)I

    move-result v6

    mul-int/lit16 v1, v6, 0x3e8

    .line 141
    .local v1, dosOffset:I
    add-int v6, v5, v1

    mul-int v0, v4, v6

    .line 142
    .local v0, diff:I
    int-to-long v6, v0

    add-long/2addr v2, v6

    .line 143
    if-eqz v0, :cond_0

    .line 144
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Setting last modified diff: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    div-int/lit16 v8, v0, 0x3e8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 145
    invoke-interface {p1, v2, v3}, Lcom/bv/sync/IFile;->setLastModified(J)V

    .line 147
    :cond_0
    return-void
.end method

.method private testOneDirection(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V
    .locals 8
    .parameter "source"
    .parameter "target"
    .parameter "direction"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 61
    invoke-static {p1}, Lcom/bv/sync/BasicSyncTest;->makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v2

    .line 62
    .local v2, sourceFiles:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v0

    .line 63
    .local v0, numFiles:I
    new-instance v1, Lcom/bv/sync/CifsSync$Options;

    const/4 v3, 0x1

    sget-object v4, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v5, 0x0

    invoke-direct {v1, p3, v3, v4, v5}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 64
    .local v1, options:Lcom/bv/sync/CifsSync$Options;
    invoke-virtual {p0, v1}, Lcom/bv/sync/BasicSyncTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-static {v0, v3}, Lcom/bv/sync/BasicSyncTest;->assertEquals(II)V

    .line 65
    invoke-virtual {p0, v1}, Lcom/bv/sync/BasicSyncTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-static {v7, v3}, Lcom/bv/sync/BasicSyncTest;->assertEquals(II)V

    .line 66
    invoke-static {p1, p2}, Lcom/bv/sync/BasicSyncTest;->verifySynced(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 67
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget v4, Lcom/bv/sync/BasicSyncTest;->counter:I

    add-int/lit8 v5, v4, 0x1

    sput v5, Lcom/bv/sync/BasicSyncTest;->counter:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/bv/sync/BasicSyncTest;->counter:I

    add-int/lit8 v6, v5, 0x1

    sput v6, Lcom/bv/sync/BasicSyncTest;->counter:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p2, v3, v4}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    .line 68
    invoke-virtual {p0, v1}, Lcom/bv/sync/BasicSyncTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-static {v7, v3}, Lcom/bv/sync/BasicSyncTest;->assertEquals(II)V

    .line 69
    invoke-direct {p0, p2, v1}, Lcom/bv/sync/BasicSyncTest;->testTargetModified(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options;)V

    .line 70
    return-void
.end method

.method private testTargetModified(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options;)V
    .locals 10
    .parameter "target"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 73
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v2

    .line 74
    .local v2, files:[Lcom/bv/sync/IFile;
    const/4 v0, 0x0

    .line 75
    .local v0, count:I
    array-length v5, v2

    move v3, v4

    :goto_0
    if-lt v3, v5, :cond_0

    .line 81
    if-lez v0, :cond_2

    const/4 v3, 0x1

    :goto_1
    invoke-static {v3}, Lcom/bv/sync/BasicSyncTest;->assertTrue(Z)V

    .line 82
    invoke-virtual {p0, p2}, Lcom/bv/sync/BasicSyncTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-static {v4, v3}, Lcom/bv/sync/BasicSyncTest;->assertEquals(II)V

    .line 83
    return-void

    .line 75
    :cond_0
    aget-object v1, v2, v3

    .line 76
    .local v1, file:Lcom/bv/sync/IFile;
    invoke-interface {v1}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 77
    invoke-interface {v1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v6

    const-wide/16 v8, 0xbb8

    add-long/2addr v6, v8

    invoke-interface {v1, v6, v7}, Lcom/bv/sync/IFile;->setLastModified(J)V

    .line 78
    add-int/lit8 v0, v0, 0x1

    .line 75
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .end local v1           #file:Lcom/bv/sync/IFile;
    :cond_2
    move v3, v4

    .line 81
    goto :goto_1
.end method


# virtual methods
.method public testBothSync()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 20
    iget-object v2, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v3, p0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v2, v3}, Lcom/bv/sync/BasicSyncTest;->makeFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v0

    .line 21
    .local v0, numFiles:I
    new-instance v1, Lcom/bv/sync/CifsSync$Options;

    sget-object v2, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    const/4 v3, 0x1

    sget-object v4, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v5, 0x0

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 22
    .local v1, options:Lcom/bv/sync/CifsSync$Options;
    invoke-virtual {p0, v1}, Lcom/bv/sync/BasicSyncTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    invoke-static {v0, v2}, Lcom/bv/sync/BasicSyncTest;->assertEquals(II)V

    .line 23
    iget-object v2, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v3, p0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v2, v3}, Lcom/bv/sync/BasicSyncTest;->verifySynced(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 24
    const/4 v2, 0x0

    invoke-virtual {p0, v1}, Lcom/bv/sync/BasicSyncTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-static {v2, v3}, Lcom/bv/sync/BasicSyncTest;->assertEquals(II)V

    .line 25
    iget-object v2, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v3, p0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v2, v3}, Lcom/bv/sync/BasicSyncTest;->verifySynced(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 26
    return-void
.end method

.method public testFreeSpace()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 150
    iget-object v4, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    const-string v5, "big"

    invoke-interface {v4, v5}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 151
    .local v1, file:Lcom/bv/sync/IFile;
    const v4, 0xf000

    new-array v0, v4, [B

    .line 152
    .local v0, buf:[B
    invoke-interface {v1}, Lcom/bv/sync/IFile;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    .line 154
    .local v3, outputStream:Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {v3, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 158
    new-instance v2, Lcom/bv/sync/CifsSync$Options;

    invoke-direct {v2}, Lcom/bv/sync/CifsSync$Options;-><init>()V

    .line 159
    .local v2, options:Lcom/bv/sync/CifsSync$Options;
    invoke-interface {v1}, Lcom/bv/sync/IFile;->getFreeSpace()J

    move-result-wide v4

    invoke-interface {v1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v6

    add-long/2addr v4, v6

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, v2, Lcom/bv/sync/CifsSync$Options;->minFreeSpace:J

    .line 161
    :try_start_1
    invoke-virtual {p0, v2}, Lcom/bv/sync/BasicSyncTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    .line 162
    const-string v4, "Should stop here"

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/bv/sync/BasicSyncTest;->assertTrue(Ljava/lang/String;Z)V
    :try_end_1
    .catch Lcom/bv/sync/CifsSync$SyncException; {:try_start_1 .. :try_end_1} :catch_0

    .line 166
    :goto_0
    return-void

    .line 155
    .end local v2           #options:Lcom/bv/sync/CifsSync$Options;
    :catchall_0
    move-exception v4

    .line 156
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 157
    throw v4

    .line 163
    .restart local v2       #options:Lcom/bv/sync/CifsSync$Options;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public testNoOverwrite()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 86
    iget-object v1, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-static {v1}, Lcom/bv/sync/BasicSyncTest;->makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    .line 87
    iget-object v1, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-interface {v1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v1, v2}, Lcom/bv/sync/BasicSyncTest;->copyFiles([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 88
    iget-object v1, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v2, p0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v1, v2}, Lcom/bv/sync/BasicSyncTest;->verifySynced(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 89
    new-instance v0, Lcom/bv/sync/CifsSync$Options;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v2, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 90
    .local v0, options:Lcom/bv/sync/CifsSync$Options;
    invoke-virtual {p0, v0}, Lcom/bv/sync/BasicSyncTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-static {v4, v1}, Lcom/bv/sync/BasicSyncTest;->assertEquals(II)V

    .line 91
    iget-object v1, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v2, p0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v1, v2}, Lcom/bv/sync/BasicSyncTest;->verifySynced(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 92
    return-void
.end method

.method public testOneSecondDiff()V
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 29
    const-string v15, "test1.txt"

    .line 30
    .local v15, name1:Ljava/lang/String;
    const-string v16, "test2.txt"

    .line 31
    .local v16, name2:Ljava/lang/String;
    const-string v4, "test"

    .line 32
    .local v4, content:Ljava/lang/String;
    const-wide v11, 0x134b153bbf0L

    .line 33
    .local v11, lessTime:J
    const-wide v13, 0x134b153bfd8L

    .line 34
    .local v13, moreTime:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-static {v0, v15, v4}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v7

    .line 35
    .local v7, file1:Lcom/bv/sync/IFile;
    invoke-interface {v7, v11, v12}, Lcom/bv/sync/IFile;->setLastModified(J)V

    .line 36
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-static {v0, v15, v4}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v8

    .line 37
    .local v8, file2:Lcom/bv/sync/IFile;
    invoke-interface {v8, v13, v14}, Lcom/bv/sync/IFile;->setLastModified(J)V

    .line 38
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-static {v0, v1, v4}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v9

    .line 39
    .local v9, file3:Lcom/bv/sync/IFile;
    invoke-interface {v9, v13, v14}, Lcom/bv/sync/IFile;->setLastModified(J)V

    .line 40
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-static {v0, v1, v4}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v10

    .line 41
    .local v10, file4:Lcom/bv/sync/IFile;
    invoke-interface {v10, v11, v12}, Lcom/bv/sync/IFile;->setLastModified(J)V

    .line 43
    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v6, v0, [Lcom/bv/sync/CifsSync$Options$Direction;

    const/16 v18, 0x0

    sget-object v19, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    aput-object v19, v6, v18

    const/16 v18, 0x1

    sget-object v19, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    aput-object v19, v6, v18

    const/16 v18, 0x2

    sget-object v19, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    aput-object v19, v6, v18

    .line 44
    .local v6, directions:[Lcom/bv/sync/CifsSync$Options$Direction;
    array-length v0, v6

    move/from16 v19, v0

    const/16 v18, 0x0

    :goto_0
    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_0

    .line 50
    return-void

    .line 44
    :cond_0
    aget-object v5, v6, v18

    .line 45
    .local v5, direction:Lcom/bv/sync/CifsSync$Options$Direction;
    sget-object v20, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "Direction: "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 46
    new-instance v17, Lcom/bv/sync/CifsSync$Options;

    const/16 v20, 0x1

    sget-object v21, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/16 v22, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v0, v5, v1, v2, v3}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 47
    .local v17, options:Lcom/bv/sync/CifsSync$Options;
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/bv/sync/BasicSyncTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Collection;->size()I

    move-result v21

    invoke-static/range {v20 .. v21}, Lcom/bv/sync/BasicSyncTest;->assertEquals(II)V

    .line 48
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v21, v0

    invoke-static/range {v20 .. v21}, Lcom/bv/sync/BasicSyncTest;->verifySynced(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 44
    add-int/lit8 v18, v18, 0x1

    goto :goto_0
.end method

.method public testTimeZones()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 95
    iget-object v4, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v5, p0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v4, v5}, Lcom/bv/sync/BasicSyncTest;->makeFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/util/Collection;

    move-result-object v1

    .line 96
    .local v1, files:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v2

    .line 97
    .local v2, numFiles:I
    new-instance v3, Lcom/bv/sync/CifsSync$Options;

    sget-object v4, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    const/4 v5, 0x1

    sget-object v6, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v7, 0x0

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 98
    .local v3, options:Lcom/bv/sync/CifsSync$Options;
    invoke-virtual {p0, v3}, Lcom/bv/sync/BasicSyncTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-static {v2, v4}, Lcom/bv/sync/BasicSyncTest;->assertEquals(II)V

    .line 99
    iget-object v4, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v5, p0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v4, v5}, Lcom/bv/sync/BasicSyncTest;->verifySynced(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 100
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 103
    const/4 v4, 0x0

    invoke-virtual {p0, v3}, Lcom/bv/sync/BasicSyncTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v5

    invoke-static {v4, v5}, Lcom/bv/sync/BasicSyncTest;->assertEquals(II)V

    .line 104
    return-void

    .line 100
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/IFile;

    .line 101
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 102
    invoke-direct {p0, v0}, Lcom/bv/sync/BasicSyncTest;->setRandomLastModified(Lcom/bv/sync/IFile;)V

    goto :goto_0
.end method

.method public testToLeftSync()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    iget-object v1, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    sget-object v2, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-direct {p0, v0, v1, v2}, Lcom/bv/sync/BasicSyncTest;->testOneDirection(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V

    .line 58
    return-void
.end method

.method public testToRightSync()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lcom/bv/sync/BasicSyncTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v1, p0, Lcom/bv/sync/BasicSyncTest;->rightDir:Lcom/bv/sync/IFile;

    sget-object v2, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-direct {p0, v0, v1, v2}, Lcom/bv/sync/BasicSyncTest;->testOneDirection(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V

    .line 54
    return-void
.end method
