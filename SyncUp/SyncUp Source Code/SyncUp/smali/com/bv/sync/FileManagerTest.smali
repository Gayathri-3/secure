.class public Lcom/bv/sync/FileManagerTest;
.super Lcom/bv/sync/SyncTest;
.source "FileManagerTest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/FileManagerTest$Action;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/bv/sync/SyncTest;-><init>()V

    .line 10
    return-void
.end method

.method private createFiles(Lcom/bv/sync/IFile;)[Lcom/bv/sync/IFile;
    .locals 10
    .parameter "source"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 94
    const/4 v1, 0x1

    .line 95
    .local v1, fileCount:I
    new-array v3, v9, [Lcom/bv/sync/IFile;

    .line 96
    .local v3, result:[Lcom/bv/sync/IFile;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v4, v3

    if-lt v2, v4, :cond_0

    .line 98
    array-length v5, v3

    const/4 v4, 0x0

    :goto_1
    if-lt v4, v5, :cond_1

    .line 101
    return-object v3

    .line 97
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v4}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-interface {v4}, Lcom/bv/sync/IFile;->mkdir()V

    .line 96
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 98
    :cond_1
    aget-object v0, v3, v4

    .line 99
    .local v0, dir:Lcom/bv/sync/IFile;
    const/4 v2, 0x0

    :goto_2
    if-lt v2, v9, :cond_2

    .line 98
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 100
    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "test"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v6, v7}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    .line 99
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method private getFilesCount([Lcom/bv/sync/IFile;)I
    .locals 5
    .parameter "files"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    const/4 v1, 0x0

    .line 106
    .local v1, result:I
    array-length v3, p1

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v3, :cond_0

    .line 111
    return v1

    .line 106
    :cond_0
    aget-object v0, p1, v2

    .line 107
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 108
    invoke-interface {v0}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/bv/sync/FileManagerTest;->getFilesCount([Lcom/bv/sync/IFile;)I

    move-result v4

    add-int/2addr v1, v4

    .line 109
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 106
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private testCopy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 1
    .parameter "source"
    .parameter "target"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    new-instance v0, Lcom/bv/sync/FileManagerTest$1;

    invoke-direct {v0, p0}, Lcom/bv/sync/FileManagerTest$1;-><init>(Lcom/bv/sync/FileManagerTest;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/bv/sync/FileManagerTest;->testCutCopy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/FileManagerTest$Action;)V

    .line 48
    return-void
.end method

.method private testCut(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 1
    .parameter "source"
    .parameter "target"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    new-instance v0, Lcom/bv/sync/FileManagerTest$2;

    invoke-direct {v0, p0}, Lcom/bv/sync/FileManagerTest$2;-><init>(Lcom/bv/sync/FileManagerTest;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/bv/sync/FileManagerTest;->testCutCopy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/FileManagerTest$Action;)V

    .line 73
    return-void
.end method

.method private testCutCopy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/FileManagerTest$Action;)V
    .locals 8
    .parameter "source"
    .parameter "target"
    .parameter "action"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/bv/sync/FileManagerTest;->createFiles(Lcom/bv/sync/IFile;)[Lcom/bv/sync/IFile;

    move-result-object v2

    .line 81
    .local v2, files:[Lcom/bv/sync/IFile;
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 82
    .local v4, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    const-string v6, "destination"

    invoke-interface {p2, v6}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 83
    .local v1, destination:Lcom/bv/sync/IFile;
    invoke-interface {v1}, Lcom/bv/sync/IFile;->mkdir()V

    .line 84
    const/4 v6, 0x0

    aget-object v6, v2, v6

    invoke-interface {v6}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v5

    .line 85
    .local v5, sameNameDir:Lcom/bv/sync/IFile;
    invoke-interface {v5}, Lcom/bv/sync/IFile;->mkdir()V

    .line 86
    invoke-direct {p0, v2}, Lcom/bv/sync/FileManagerTest;->getFilesCount([Lcom/bv/sync/IFile;)I

    move-result v0

    .line 87
    .local v0, count:I
    invoke-interface {p3, v2, v1, v4}, Lcom/bv/sync/FileManagerTest$Action;->execute([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Ljava/util/List;)V

    .line 88
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 90
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v0, v6}, Lcom/bv/sync/FileManagerTest;->assertEquals(II)V

    .line 91
    return-void

    .line 88
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bv/sync/SyncItem;

    .line 89
    .local v3, item:Lcom/bv/sync/SyncItem;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v7, v3}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private testDelete(Lcom/bv/sync/IFile;)V
    .locals 8
    .parameter "source"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/bv/sync/FileManagerTest;->createFiles(Lcom/bv/sync/IFile;)[Lcom/bv/sync/IFile;

    move-result-object v2

    .line 20
    .local v2, files:[Lcom/bv/sync/IFile;
    invoke-direct {p0, v2}, Lcom/bv/sync/FileManagerTest;->getFilesCount([Lcom/bv/sync/IFile;)I

    move-result v0

    .line 22
    .local v0, count:I
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 23
    .local v3, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    new-instance v4, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v4}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-static {v2, v4, v3}, Lcom/bv/sync/FileManager;->delete([Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;Ljava/util/List;)V

    .line 24
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v0, v4}, Lcom/bv/sync/FileManagerTest;->assertEquals(II)V

    .line 25
    instance-of v4, p1, Lcom/bv/sync/RemoteFile;

    if-eqz v4, :cond_0

    .line 26
    const-wide/16 v4, 0x1388

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 27
    :cond_0
    array-length v5, v2

    const/4 v4, 0x0

    :goto_0
    if-lt v4, v5, :cond_1

    .line 29
    return-void

    .line 27
    :cond_1
    aget-object v1, v2, v4

    .line 28
    .local v1, file:Lcom/bv/sync/IFile;
    invoke-interface {v1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1}, Lcom/bv/sync/IFile;->exists()Z

    move-result v7

    invoke-static {v6, v7}, Lcom/bv/sync/FileManagerTest;->assertFalse(Ljava/lang/String;Z)V

    .line 27
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method


# virtual methods
.method public testCopy()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    iget-object v0, p0, Lcom/bv/sync/FileManagerTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v1, p0, Lcom/bv/sync/FileManagerTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v0, v1}, Lcom/bv/sync/FileManagerTest;->testCopy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 33
    invoke-virtual {p0}, Lcom/bv/sync/FileManagerTest;->setUp()V

    .line 34
    iget-object v0, p0, Lcom/bv/sync/FileManagerTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v1, p0, Lcom/bv/sync/FileManagerTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v0, v1}, Lcom/bv/sync/FileManagerTest;->testCopy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 35
    invoke-virtual {p0}, Lcom/bv/sync/FileManagerTest;->setUp()V

    .line 36
    iget-object v0, p0, Lcom/bv/sync/FileManagerTest;->rightDir:Lcom/bv/sync/IFile;

    iget-object v1, p0, Lcom/bv/sync/FileManagerTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v0, v1}, Lcom/bv/sync/FileManagerTest;->testCopy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 37
    return-void
.end method

.method public testCut()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lcom/bv/sync/FileManagerTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v1, p0, Lcom/bv/sync/FileManagerTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v0, v1}, Lcom/bv/sync/FileManagerTest;->testCut(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 52
    invoke-virtual {p0}, Lcom/bv/sync/FileManagerTest;->setUp()V

    .line 53
    iget-object v0, p0, Lcom/bv/sync/FileManagerTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v1, p0, Lcom/bv/sync/FileManagerTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v0, v1}, Lcom/bv/sync/FileManagerTest;->testCut(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 54
    invoke-virtual {p0}, Lcom/bv/sync/FileManagerTest;->setUp()V

    .line 55
    iget-object v0, p0, Lcom/bv/sync/FileManagerTest;->rightDir:Lcom/bv/sync/IFile;

    iget-object v1, p0, Lcom/bv/sync/FileManagerTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v0, v1}, Lcom/bv/sync/FileManagerTest;->testCut(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 56
    return-void
.end method

.method public testDelete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 13
    iget-object v0, p0, Lcom/bv/sync/FileManagerTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v0}, Lcom/bv/sync/FileManagerTest;->testDelete(Lcom/bv/sync/IFile;)V

    .line 14
    invoke-virtual {p0}, Lcom/bv/sync/FileManagerTest;->setUp()V

    .line 15
    iget-object v0, p0, Lcom/bv/sync/FileManagerTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v0}, Lcom/bv/sync/FileManagerTest;->testDelete(Lcom/bv/sync/IFile;)V

    .line 16
    return-void
.end method
