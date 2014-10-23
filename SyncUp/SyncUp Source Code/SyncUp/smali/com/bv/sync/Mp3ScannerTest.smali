.class public Lcom/bv/sync/Mp3ScannerTest;
.super Ljunit/framework/TestCase;
.source "Mp3ScannerTest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/Mp3ScannerTest$FileInfo;,
        Lcom/bv/sync/Mp3ScannerTest$TestParser;
    }
.end annotation


# static fields
.field private static final VIRTUAL_TEST:Ljava/lang/String; = "VirtualTest"

.field private static final random:Ljava/util/Random;


# instance fields
.field private paths:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private workingDir:Lcom/bv/sync/IFile;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 81
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/bv/sync/Mp3ScannerTest;->random:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljunit/framework/TestCase;-><init>()V

    return-void
.end method

.method private createRandomFiles(Lcom/bv/sync/Mp3ScannerTest$TestParser;[Lcom/bv/sync/Mp3ScannerTest$FileInfo;)V
    .locals 13
    .parameter "parser"
    .parameter "files"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    const-string v2, "path"

    .line 111
    .local v2, PATH:Ljava/lang/String;
    const-string v1, "artist"

    .line 112
    .local v1, ARTIST:Ljava/lang/String;
    const-string v0, "album"

    .line 113
    .local v0, ALBUM:Ljava/lang/String;
    const-string v3, "title"

    .line 115
    .local v3, TITLE:Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    array-length v10, p2

    if-lt v7, v10, :cond_0

    .line 126
    return-void

    .line 116
    :cond_0
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "path"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ".mp3"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 117
    .local v8, path:Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "artist"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v11, Lcom/bv/sync/Mp3ScannerTest;->random:Ljava/util/Random;

    const/16 v12, 0xf

    invoke-virtual {v11, v12}, Ljava/util/Random;->nextInt(I)I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 118
    .local v5, artist:Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "album"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v11, Lcom/bv/sync/Mp3ScannerTest;->random:Ljava/util/Random;

    const/4 v12, 0x5

    invoke-virtual {v11, v12}, Ljava/util/Random;->nextInt(I)I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 119
    .local v4, album:Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "title"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v11, Lcom/bv/sync/Mp3ScannerTest;->random:Ljava/util/Random;

    const/16 v12, 0x14

    invoke-virtual {v11, v12}, Ljava/util/Random;->nextInt(I)I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 121
    .local v9, title:Ljava/lang/String;
    new-instance v10, Lcom/bv/sync/Mp3ScannerTest$FileInfo;

    invoke-direct {v10, v5, v4, v9}, Lcom/bv/sync/Mp3ScannerTest$FileInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    aput-object v10, p2, v7

    .line 122
    iget-object v10, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v8, v11}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    .line 123
    new-instance v6, Ljava/io/File;

    new-instance v10, Ljava/io/File;

    iget-object v11, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-interface {v11}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v10, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 124
    .local v6, file:Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p1, v10, v5, v4, v9}, Lcom/bv/sync/Mp3ScannerTest$TestParser;->add(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0
.end method

.method private enumFiles(Lcom/bv/sync/IFile;)Ljava/util/HashSet;
    .locals 6
    .parameter "dir"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/IFile;",
            ")",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 101
    .local v1, result:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_0

    .line 106
    return-object v1

    .line 101
    :cond_0
    aget-object v0, v3, v2

    .line 102
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 103
    invoke-direct {p0, v0}, Lcom/bv/sync/Mp3ScannerTest;->enumFiles(Lcom/bv/sync/IFile;)Ljava/util/HashSet;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 101
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 105
    :cond_1
    invoke-interface {v0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private equals(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Z
    .locals 10
    .parameter "first"
    .parameter "second"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 131
    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v8

    invoke-static {v6, v7, v8, v9}, Lcom/bv/sync/Mp3ScannerTest;->assertEquals(JJ)V

    .line 132
    iget-object v6, p0, Lcom/bv/sync/Mp3ScannerTest;->paths:Ljava/util/HashSet;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    invoke-static {v6}, Lcom/bv/sync/Mp3ScannerTest;->assertTrue(Z)V

    .line 134
    :cond_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/bv/sync/Mp3ScannerTest;->assertEquals(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    invoke-interface {p1}, Lcom/bv/sync/IFile;->canRead()Z

    move-result v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->canRead()Z

    move-result v7

    invoke-static {v6, v7}, Lcom/bv/sync/Mp3ScannerTest;->assertEquals(ZZ)V

    .line 136
    invoke-interface {p1}, Lcom/bv/sync/IFile;->exists()Z

    move-result v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->exists()Z

    move-result v7

    invoke-static {v6, v7}, Lcom/bv/sync/Mp3ScannerTest;->assertEquals(ZZ)V

    .line 137
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v7

    invoke-static {v6, v7}, Lcom/bv/sync/Mp3ScannerTest;->assertEquals(ZZ)V

    .line 138
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v7

    invoke-static {v6, v7}, Lcom/bv/sync/Mp3ScannerTest;->assertEquals(ZZ)V

    .line 139
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isHidden()Z

    move-result v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->isHidden()Z

    move-result v7

    invoke-static {v6, v7}, Lcom/bv/sync/Mp3ScannerTest;->assertEquals(ZZ)V

    .line 141
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 142
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/bv/sync/Mp3ScannerTest;->assertEquals(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v4

    .line 144
    .local v4, listFiles1:[Lcom/bv/sync/IFile;
    invoke-interface {p2}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v5

    .line 145
    .local v5, listFiles2:[Lcom/bv/sync/IFile;
    array-length v6, v4

    array-length v7, v5

    invoke-static {v6, v7}, Lcom/bv/sync/Mp3ScannerTest;->assertEquals(II)V

    .line 146
    new-instance v0, Lcom/bv/sync/TestUtils$FileComparator;

    invoke-direct {v0}, Lcom/bv/sync/TestUtils$FileComparator;-><init>()V

    .line 147
    .local v0, comparator:Lcom/bv/sync/TestUtils$FileComparator;
    invoke-static {v4, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 148
    invoke-static {v5, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 149
    const/4 v2, 0x0

    .line 150
    .local v2, i:I
    array-length v7, v4

    const/4 v6, 0x0

    move v3, v2

    .end local v2           #i:I
    .local v3, i:I
    :goto_0
    if-lt v6, v7, :cond_2

    .line 153
    .end local v0           #comparator:Lcom/bv/sync/TestUtils$FileComparator;
    .end local v3           #i:I
    .end local v4           #listFiles1:[Lcom/bv/sync/IFile;
    .end local v5           #listFiles2:[Lcom/bv/sync/IFile;
    :cond_1
    const/4 v6, 0x1

    return v6

    .line 150
    .restart local v0       #comparator:Lcom/bv/sync/TestUtils$FileComparator;
    .restart local v3       #i:I
    .restart local v4       #listFiles1:[Lcom/bv/sync/IFile;
    .restart local v5       #listFiles2:[Lcom/bv/sync/IFile;
    :cond_2
    aget-object v1, v4, v6

    .line 151
    .local v1, file:Lcom/bv/sync/IFile;
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    aget-object v8, v5, v3

    invoke-direct {p0, v1, v8}, Lcom/bv/sync/Mp3ScannerTest;->equals(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Z

    move-result v8

    invoke-static {v8}, Lcom/bv/sync/Mp3ScannerTest;->assertTrue(Z)V

    .line 150
    add-int/lit8 v6, v6, 0x1

    move v3, v2

    .end local v2           #i:I
    .restart local v3       #i:I
    goto :goto_0
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
    .line 22
    new-instance v0, Lcom/bv/sync/LocalFile;

    new-instance v1, Ljava/io/File;

    const-string v2, "VirtualTest"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/bv/sync/LocalFile;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    .line 23
    iget-object v0, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 24
    iget-object v0, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->mkdir()V

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/bv/sync/IFile;

    const/4 v1, 0x0

    .line 25
    iget-object v2, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/bv/sync/TestUtils;->wipe([Lcom/bv/sync/IFile;)V

    .line 26
    return-void
.end method

.method protected tearDown()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 33
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/bv/sync/IFile;

    const/4 v1, 0x0

    .line 30
    iget-object v2, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/bv/sync/TestUtils;->wipe([Lcom/bv/sync/IFile;)V

    .line 31
    iget-object v0, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->delete()V

    :cond_0
    return-void
.end method

.method public testFile()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/16 v2, 0xa

    if-lt v0, v2, :cond_0

    .line 40
    new-instance v1, Lcom/bv/sync/VirtualFile;

    iget-object v2, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-direct {v1, v2}, Lcom/bv/sync/VirtualFile;-><init>(Lcom/bv/sync/IFile;)V

    .line 41
    .local v1, root:Lcom/bv/sync/VirtualFile;
    invoke-direct {p0, v1}, Lcom/bv/sync/Mp3ScannerTest;->enumFiles(Lcom/bv/sync/IFile;)Ljava/util/HashSet;

    move-result-object v2

    iput-object v2, p0, Lcom/bv/sync/Mp3ScannerTest;->paths:Ljava/util/HashSet;

    .line 42
    iget-object v2, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v1, v2}, Lcom/bv/sync/Mp3ScannerTest;->equals(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Z

    move-result v2

    invoke-static {v2}, Lcom/bv/sync/Mp3ScannerTest;->assertTrue(Z)V

    .line 43
    return-void

    .line 39
    .end local v1           #root:Lcom/bv/sync/VirtualFile;
    :cond_0
    iget-object v2, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    .line 38
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public testVirtualScanner()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 84
    new-instance v3, Lcom/bv/sync/Mp3ScannerTest$TestParser;

    const/4 v5, 0x0

    invoke-direct {v3, p0, v5}, Lcom/bv/sync/Mp3ScannerTest$TestParser;-><init>(Lcom/bv/sync/Mp3ScannerTest;Lcom/bv/sync/Mp3ScannerTest$TestParser;)V

    .line 85
    .local v3, parser:Lcom/bv/sync/Mp3ScannerTest$TestParser;
    const/16 v5, 0x64

    new-array v1, v5, [Lcom/bv/sync/Mp3ScannerTest$FileInfo;

    .line 86
    .local v1, files:[Lcom/bv/sync/Mp3ScannerTest$FileInfo;
    invoke-direct {p0, v3, v1}, Lcom/bv/sync/Mp3ScannerTest;->createRandomFiles(Lcom/bv/sync/Mp3ScannerTest$TestParser;[Lcom/bv/sync/Mp3ScannerTest$FileInfo;)V

    .line 87
    new-instance v4, Lcom/bv/sync/Mp3Scanner;

    invoke-direct {v4, v3}, Lcom/bv/sync/Mp3Scanner;-><init>(Lcom/bv/sync/Mp3Scanner$Parser;)V

    .line 88
    .local v4, scanner:Lcom/bv/sync/Mp3Scanner;
    new-instance v2, Lcom/bv/sync/Mp3Scanner$Options;

    invoke-direct {v2}, Lcom/bv/sync/Mp3Scanner$Options;-><init>()V

    .line 89
    .local v2, options:Lcom/bv/sync/Mp3Scanner$Options;
    iput-boolean v6, v2, Lcom/bv/sync/Mp3Scanner$Options;->groupByArtist:Z

    .line 90
    iput-boolean v6, v2, Lcom/bv/sync/Mp3Scanner$Options;->groupByAlbum:Z

    .line 91
    const/4 v5, 0x0

    iput-boolean v5, v2, Lcom/bv/sync/Mp3Scanner$Options;->renameSongs:Z

    .line 92
    new-instance v0, Lcom/bv/sync/VirtualFile;

    iget-object v5, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-direct {v0, v5}, Lcom/bv/sync/VirtualFile;-><init>(Lcom/bv/sync/IFile;)V

    .line 93
    .local v0, file:Lcom/bv/sync/VirtualFile;
    invoke-direct {p0, v0}, Lcom/bv/sync/Mp3ScannerTest;->enumFiles(Lcom/bv/sync/IFile;)Ljava/util/HashSet;

    move-result-object v5

    iput-object v5, p0, Lcom/bv/sync/Mp3ScannerTest;->paths:Ljava/util/HashSet;

    .line 94
    iget-object v5, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    new-instance v6, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v6}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v4, v5, v2, v6}, Lcom/bv/sync/Mp3Scanner;->run(Lcom/bv/sync/IFile;Lcom/bv/sync/Mp3Scanner$Options;Lcom/bv/sync/ProgressNotification;)V

    .line 95
    new-instance v5, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v5}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v4, v0, v2, v5}, Lcom/bv/sync/Mp3Scanner;->run(Lcom/bv/sync/IFile;Lcom/bv/sync/Mp3Scanner$Options;Lcom/bv/sync/ProgressNotification;)V

    .line 96
    iget-object v5, p0, Lcom/bv/sync/Mp3ScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v0, v5}, Lcom/bv/sync/Mp3ScannerTest;->equals(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Z

    move-result v5

    invoke-static {v5}, Lcom/bv/sync/Mp3ScannerTest;->assertTrue(Z)V

    .line 97
    return-void
.end method
