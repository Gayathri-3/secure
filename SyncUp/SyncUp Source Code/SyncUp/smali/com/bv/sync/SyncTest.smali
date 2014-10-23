.class public Lcom/bv/sync/SyncTest;
.super Ljunit/framework/TestCase;
.source "SyncTest.java"


# static fields
.field private static final DOMAIN_KEY:Ljava/lang/String; = "domain"

.field private static final HOST:Ljava/lang/String; = "host"

.field private static final LEFT_DIR:Ljava/lang/String; = "leftDir"

.field private static final PASSWORD_KEY:Ljava/lang/String; = "password"

.field private static final RIGHT_DIR:Ljava/lang/String; = "rightDir"

.field private static final USER_KEY:Ljava/lang/String; = "user"

.field protected static counter:I

.field private static final fileComparator:Lcom/bv/sync/TestUtils$FileComparator;


# instance fields
.field protected final domain:Ljava/lang/String;

.field protected final host:Ljava/lang/String;

.field protected final leftDir:Lcom/bv/sync/IFile;

.field protected final password:Ljava/lang/String;

.field protected random:Ljava/util/Random;

.field protected final rightDir:Lcom/bv/sync/IFile;

.field protected final user:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 34
    const-string v0, "jcifs.smb.client.soTimeout"

    const-string v1, "3000"

    invoke-static {v0, v1}, Ljcifs/Config;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 35
    const-string v0, "jcifs.smb.client.dfs.disabled"

    const-string v1, "true"

    invoke-static {v0, v1}, Ljcifs/Config;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 36
    const-string v0, "jcifs.smb.client.responseTimeout"

    const-string v1, "4000"

    invoke-static {v0, v1}, Ljcifs/Config;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 195
    new-instance v0, Lcom/bv/sync/TestUtils$FileComparator;

    invoke-direct {v0}, Lcom/bv/sync/TestUtils$FileComparator;-><init>()V

    sput-object v0, Lcom/bv/sync/SyncTest;->fileComparator:Lcom/bv/sync/TestUtils$FileComparator;

    return-void
.end method

.method public constructor <init>()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-direct {p0}, Ljunit/framework/TestCase;-><init>()V

    .line 31
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    iput-object v2, p0, Lcom/bv/sync/SyncTest;->random:Ljava/util/Random;

    .line 40
    const-string v2, "leftDir"

    invoke-direct {p0, v2}, Lcom/bv/sync/SyncTest;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, leftDirPath:Ljava/lang/String;
    const-string v2, "rightDir"

    invoke-direct {p0, v2}, Lcom/bv/sync/SyncTest;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 42
    .local v1, rightDirPath:Ljava/lang/String;
    const-string v2, "domain"

    invoke-direct {p0, v2}, Lcom/bv/sync/SyncTest;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/bv/sync/SyncTest;->domain:Ljava/lang/String;

    .line 43
    const-string v2, "user"

    invoke-direct {p0, v2}, Lcom/bv/sync/SyncTest;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/bv/sync/SyncTest;->user:Ljava/lang/String;

    .line 44
    const-string v2, "password"

    invoke-direct {p0, v2}, Lcom/bv/sync/SyncTest;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/bv/sync/SyncTest;->password:Ljava/lang/String;

    .line 45
    const-string v2, "host"

    invoke-direct {p0, v2}, Lcom/bv/sync/SyncTest;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/bv/sync/SyncTest;->host:Ljava/lang/String;

    .line 46
    new-instance v2, Lcom/bv/sync/LocalFile;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lcom/bv/sync/LocalFile;-><init>(Ljava/io/File;)V

    iput-object v2, p0, Lcom/bv/sync/SyncTest;->leftDir:Lcom/bv/sync/IFile;

    .line 47
    iget-object v2, p0, Lcom/bv/sync/SyncTest;->host:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 48
    new-instance v2, Lcom/bv/sync/RemoteFile;

    iget-object v3, p0, Lcom/bv/sync/SyncTest;->domain:Ljava/lang/String;

    iget-object v4, p0, Lcom/bv/sync/SyncTest;->user:Ljava/lang/String;

    iget-object v5, p0, Lcom/bv/sync/SyncTest;->password:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "smb://"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/bv/sync/SyncTest;->host:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/bv/sync/RemoteFile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/bv/sync/SyncTest;->rightDir:Lcom/bv/sync/IFile;

    .line 52
    :goto_0
    iget-object v2, p0, Lcom/bv/sync/SyncTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-interface {v2}, Lcom/bv/sync/IFile;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 53
    iget-object v2, p0, Lcom/bv/sync/SyncTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-interface {v2}, Lcom/bv/sync/IFile;->mkdir()V

    .line 54
    :cond_0
    iget-object v2, p0, Lcom/bv/sync/SyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-interface {v2}, Lcom/bv/sync/IFile;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 55
    iget-object v2, p0, Lcom/bv/sync/SyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-interface {v2}, Lcom/bv/sync/IFile;->mkdir()V

    .line 56
    :cond_1
    return-void

    .line 50
    :cond_2
    new-instance v2, Lcom/bv/sync/LocalFile;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lcom/bv/sync/LocalFile;-><init>(Ljava/io/File;)V

    iput-object v2, p0, Lcom/bv/sync/SyncTest;->rightDir:Lcom/bv/sync/IFile;

    goto :goto_0
.end method

.method private canRead(Ljava/io/File;)Z
    .locals 1
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    new-instance v0, Lcom/bv/sync/LocalFile;

    invoke-direct {v0, p1}, Lcom/bv/sync/LocalFile;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Lcom/bv/sync/LocalFile;->canRead()Z

    move-result v0

    return v0
.end method

.method protected static createDir(Lcom/bv/sync/IFile;Ljava/lang/String;)Lcom/bv/sync/IFile;
    .locals 2
    .parameter "dir"
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    sget v1, Lcom/bv/sync/SyncTest;->counter:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lcom/bv/sync/SyncTest;->counter:I

    .line 165
    invoke-interface {p0, p1}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 166
    .local v0, result:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->mkdir()V

    .line 167
    return-object v0
.end method

.method protected static equalDirs([Lcom/bv/sync/IFile;[Lcom/bv/sync/IFile;)Z
    .locals 5
    .parameter "files1"
    .parameter "files2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 198
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    move v1, v2

    :goto_0
    invoke-static {v1}, Lcom/bv/sync/SyncTest;->assertFalse(Z)V

    .line 199
    array-length v1, p0

    array-length v4, p1

    invoke-static {v1, v4}, Lcom/bv/sync/SyncTest;->assertEquals(II)V

    .line 200
    sget-object v1, Lcom/bv/sync/SyncTest;->fileComparator:Lcom/bv/sync/TestUtils$FileComparator;

    invoke-static {p0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 201
    sget-object v1, Lcom/bv/sync/SyncTest;->fileComparator:Lcom/bv/sync/TestUtils$FileComparator;

    invoke-static {p1, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 202
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v1, p0

    if-lt v0, v1, :cond_1

    move v2, v3

    .line 207
    :goto_2
    return v2

    .end local v0           #i:I
    :cond_0
    move v1, v3

    .line 198
    goto :goto_0

    .line 203
    .restart local v0       #i:I
    :cond_1
    aget-object v1, p0, v0

    aget-object v4, p1, v0

    invoke-static {v1, v4}, Lcom/bv/sync/SyncTest;->equals(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 204
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Files are different "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 202
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method protected static equals(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Z
    .locals 10
    .parameter "file1"
    .parameter "file2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x3e8

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 176
    invoke-static {p0}, Lcom/bv/sync/SyncTest;->getName(Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v0

    .line 177
    .local v0, name1:Ljava/lang/String;
    invoke-static {p1}, Lcom/bv/sync/SyncTest;->getName(Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v1

    .line 178
    .local v1, name2:Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/bv/sync/SyncTest;->assertEquals(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    invoke-interface {p0}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v4

    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Lcom/bv/sync/SyncTest;->assertEquals(JJ)V

    .line 180
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Compare "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " and "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 181
    invoke-interface {p0}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 182
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {p0}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v4

    div-long/2addr v4, v8

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v6

    div-long/2addr v6, v8

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    const-wide/16 v6, 0x2

    cmp-long v4, v4, v6

    if-gtz v4, :cond_0

    move v2, v3

    :cond_0
    invoke-static {v2}, Lcom/bv/sync/SyncTest;->assertTrue(Z)V

    .line 185
    :goto_0
    return v3

    .line 184
    :cond_1
    invoke-interface {p0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {p0}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v5

    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/bv/sync/SyncTest;->equalDirs([Lcom/bv/sync/IFile;[Lcom/bv/sync/IFile;)Z

    move-result v5

    if-eqz v5, :cond_2

    move v2, v3

    :cond_2
    invoke-static {v4, v2}, Lcom/bv/sync/SyncTest;->assertTrue(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method private static getName(Lcom/bv/sync/IFile;)Ljava/lang/String;
    .locals 3
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    invoke-interface {p0}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, result:Ljava/lang/String;
    invoke-interface {p0}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_0

    .line 191
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 192
    :cond_0
    return-object v0
.end method

.method private getParam(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "param"

    .prologue
    .line 59
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, result:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 61
    new-instance v1, Ljava/security/InvalidParameterException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "parameter "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not set, use -D"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "=value"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 62
    :cond_0
    return-object v0
.end method

.method protected static makeFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/util/Collection;
    .locals 2
    .parameter "leftDir"
    .parameter "rightDir"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/IFile;",
            "Lcom/bv/sync/IFile;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-static {p0}, Lcom/bv/sync/SyncTest;->makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v0

    .line 127
    .local v0, result:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    invoke-static {p1}, Lcom/bv/sync/SyncTest;->makeRightFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 128
    return-object v0
.end method

.method protected static makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;
    .locals 8
    .parameter "parentDir"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/IFile;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    const/4 v5, 0x0

    invoke-interface {p0}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v6

    array-length v6, v6

    invoke-static {v5, v6}, Lcom/bv/sync/SyncTest;->assertEquals(II)V

    .line 133
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 134
    .local v4, result:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/sync/IFile;>;"
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    const/4 v5, 0x3

    if-lt v3, v5, :cond_0

    .line 136
    const-string v5, "dir"

    invoke-static {p0, v5}, Lcom/bv/sync/SyncTest;->createDir(Lcom/bv/sync/IFile;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 137
    .local v0, child:Lcom/bv/sync/IFile;
    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 138
    const-string v5, "dir"

    invoke-static {v0, v5}, Lcom/bv/sync/SyncTest;->createDir(Lcom/bv/sync/IFile;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 139
    const-string v5, "dir1"

    invoke-static {p0, v5}, Lcom/bv/sync/SyncTest;->createDir(Lcom/bv/sync/IFile;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 140
    .local v1, dir1:Lcom/bv/sync/IFile;
    const-string v5, "dir2"

    invoke-static {v1, v5}, Lcom/bv/sync/SyncTest;->createDir(Lcom/bv/sync/IFile;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v2

    .line 141
    .local v2, dir2:Lcom/bv/sync/IFile;
    invoke-virtual {v4, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 142
    invoke-virtual {v4, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 143
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/bv/sync/SyncTest;->counter:I

    add-int/lit8 v7, v6, 0x1

    sput v7, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".mp3"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget v7, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v5, v6}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 144
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/bv/sync/SyncTest;->counter:I

    add-int/lit8 v7, v6, 0x1

    sput v7, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".mp3"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget v7, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v5, v6}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 145
    return-object v4

    .line 135
    .end local v0           #child:Lcom/bv/sync/IFile;
    .end local v1           #dir1:Lcom/bv/sync/IFile;
    .end local v2           #dir2:Lcom/bv/sync/IFile;
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/bv/sync/SyncTest;->counter:I

    add-int/lit8 v7, v6, 0x1

    sput v7, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".jpg"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget v7, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v5, v6}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 134
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0
.end method

.method protected static makeRightFiles(Lcom/bv/sync/IFile;)Ljava/util/List;
    .locals 7
    .parameter "parentDir"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/IFile;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    const/4 v4, 0x0

    invoke-interface {p0}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v5

    array-length v5, v5

    invoke-static {v4, v5}, Lcom/bv/sync/SyncTest;->assertEquals(II)V

    .line 150
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 151
    .local v3, result:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/sync/IFile;>;"
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    const/4 v4, 0x3

    if-lt v2, v4, :cond_0

    .line 153
    const-string v4, "dir6"

    invoke-static {p0, v4}, Lcom/bv/sync/SyncTest;->createDir(Lcom/bv/sync/IFile;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 154
    .local v1, dir6:Lcom/bv/sync/IFile;
    const-string v4, "dir5"

    invoke-static {v1, v4}, Lcom/bv/sync/SyncTest;->createDir(Lcom/bv/sync/IFile;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 155
    .local v0, dir5:Lcom/bv/sync/IFile;
    invoke-virtual {v3, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 156
    invoke-virtual {v3, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 157
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/bv/sync/SyncTest;->counter:I

    add-int/lit8 v6, v5, 0x1

    sput v6, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".jpg"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v4, v5}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 158
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/bv/sync/SyncTest;->counter:I

    add-int/lit8 v6, v5, 0x1

    sput v6, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".jpg"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v4, v5}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 159
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/bv/sync/SyncTest;->counter:I

    add-int/lit8 v6, v5, 0x1

    sput v6, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".jpg"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v4, v5}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 160
    return-object v3

    .line 152
    .end local v0           #dir5:Lcom/bv/sync/IFile;
    .end local v1           #dir6:Lcom/bv/sync/IFile;
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/bv/sync/SyncTest;->counter:I

    add-int/lit8 v6, v5, 0x1

    sput v6, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".mp3"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/bv/sync/SyncTest;->counter:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v4, v5}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 151
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0
.end method

.method protected static replaceSeparator(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "result"

    .prologue
    const/16 v4, 0x2f

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .local v0, builder:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 115
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 113
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    const/16 v3, 0x5c

    if-eq v2, v3, :cond_1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    if-ne v2, v4, :cond_2

    .line 114
    :cond_1
    invoke-virtual {v0, v1, v4}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 112
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private setReadableDir(Ljava/io/File;Z)V
    .locals 5
    .parameter "dir"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 80
    invoke-virtual {p0, p1, p2}, Lcom/bv/sync/SyncTest;->setReadable(Ljava/io/File;Z)V

    .line 81
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v3, :cond_0

    .line 87
    return-void

    .line 81
    :cond_0
    aget-object v0, v2, v1

    .line 82
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 83
    invoke-direct {p0, v0, p2}, Lcom/bv/sync/SyncTest;->setReadableDir(Ljava/io/File;Z)V

    .line 81
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 85
    :cond_1
    invoke-virtual {p0, v0, p2}, Lcom/bv/sync/SyncTest;->setReadable(Ljava/io/File;Z)V

    goto :goto_1
.end method

.method protected static verifySynced(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 3
    .parameter "leftDir"
    .parameter "rightDir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    const-string v0, "Dir contents are different"

    .line 172
    invoke-interface {p0}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v1

    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/bv/sync/SyncTest;->equalDirs([Lcom/bv/sync/IFile;[Lcom/bv/sync/IFile;)Z

    move-result v1

    .line 171
    invoke-static {v0, v1}, Lcom/bv/sync/SyncTest;->assertTrue(Ljava/lang/String;Z)V

    .line 173
    return-void
.end method


# virtual methods
.method protected getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;
    .locals 3
    .parameter "file"
    .parameter "parent"

    .prologue
    .line 105
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/bv/sync/SyncTest;->replaceSeparator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, path:Ljava/lang/String;
    invoke-interface {p2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/bv/sync/SyncTest;->replaceSeparator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, parentPath:Ljava/lang/String;
    invoke-static {v1, v0}, Lcom/bv/sync/CifsSync;->getRelativePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method protected setReadable(Ljava/io/File;Z)V
    .locals 4
    .parameter "file"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, absolutePath:Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/io/File;->setReadable(Z)Z

    .line 92
    invoke-static {}, Lcom/bv/sync/Utils;->isWindows()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Icacls.exe \""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" /"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz p2, :cond_1

    const-string v2, "grant"

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/sync/SyncTest;->user:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":R"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 94
    .local v1, command:Ljava/lang/String;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 95
    invoke-static {v1}, Lcom/bv/sync/TestUtils;->exec(Ljava/lang/String;)V

    .line 97
    .end local v1           #command:Ljava/lang/String;
    :cond_0
    invoke-direct {p0, p1}, Lcom/bv/sync/SyncTest;->canRead(Ljava/io/File;)Z

    move-result v2

    if-ne v2, p2, :cond_2

    const/4 v2, 0x1

    :goto_1
    invoke-static {v0, v2}, Lcom/bv/sync/SyncTest;->assertTrue(Ljava/lang/String;Z)V

    .line 98
    return-void

    .line 93
    :cond_1
    const-string v2, "deny"

    goto :goto_0

    .line 97
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method protected setUp()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 67
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nRunning: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-super {p0}, Ljunit/framework/TestCase;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 68
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "******************************************************"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 69
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/bv/sync/SyncTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, v4}, Lcom/bv/sync/SyncTest;->setReadableDir(Ljava/io/File;Z)V

    .line 70
    iget-object v0, p0, Lcom/bv/sync/SyncTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    new-array v0, v4, [Lcom/bv/sync/IFile;

    .line 71
    iget-object v1, p0, Lcom/bv/sync/SyncTest;->leftDir:Lcom/bv/sync/IFile;

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/bv/sync/TestUtils;->wipe([Lcom/bv/sync/IFile;)V

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/bv/sync/SyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    new-array v0, v4, [Lcom/bv/sync/IFile;

    .line 74
    iget-object v1, p0, Lcom/bv/sync/SyncTest;->rightDir:Lcom/bv/sync/IFile;

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/bv/sync/TestUtils;->wipe([Lcom/bv/sync/IFile;)V

    .line 76
    :cond_1
    sput v3, Lcom/bv/sync/SyncTest;->counter:I

    .line 77
    return-void
.end method

.method protected sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;
    .locals 5
    .parameter "options"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/CifsSync$Options;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v0, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v0}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    .line 120
    .local v0, progress:Lcom/bv/sync/TestUtils$TestProgress;
    new-instance v2, Lcom/bv/sync/CifsSync;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, Lcom/bv/sync/CifsSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    iget-object v3, p0, Lcom/bv/sync/SyncTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v4, p0, Lcom/bv/sync/SyncTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-virtual {v2, v3, v4, v0}, Lcom/bv/sync/CifsSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    move-result-object v1

    .line 121
    .local v1, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    const/16 v2, 0x64

    iget v3, v0, Lcom/bv/sync/TestUtils$TestProgress;->percent:I

    invoke-static {v2, v3}, Lcom/bv/sync/SyncTest;->assertEquals(II)V

    .line 122
    return-object v1
.end method

.method public testNothing()V
    .locals 0

    .prologue
    .line 210
    return-void
.end method
