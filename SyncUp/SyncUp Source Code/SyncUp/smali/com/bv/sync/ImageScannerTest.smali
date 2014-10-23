.class public Lcom/bv/sync/ImageScannerTest;
.super Ljunit/framework/TestCase;
.source "ImageScannerTest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/ImageScannerTest$FileInfo;,
        Lcom/bv/sync/ImageScannerTest$TestImageParser;
    }
.end annotation


# static fields
.field private static final VIRTUAL_TEST:Ljava/lang/String; = "VirtualTest"


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

.field private final random:Ljava/util/Random;

.field private workingDir:Lcom/bv/sync/IFile;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljunit/framework/TestCase;-><init>()V

    .line 120
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/bv/sync/ImageScannerTest;->random:Ljava/util/Random;

    .line 17
    return-void
.end method

.method private createRandomFiles(Lcom/bv/sync/ImageScannerTest$TestImageParser;[Lcom/bv/sync/ImageScannerTest$FileInfo;)V
    .locals 18
    .parameter "imageParser"
    .parameter "files"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    const-string v10, "path"

    .line 152
    .local v10, PATH:Ljava/lang/String;
    const-string v9, "address"

    .line 154
    .local v9, ADDRESS:Ljava/lang/String;
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 156
    .local v11, cache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v14, 0x0

    .local v14, i:I
    :goto_0
    move-object/from16 v0, p2

    array-length v1, v0

    if-lt v14, v1, :cond_0

    .line 176
    return-void

    .line 157
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "path"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".jpg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 158
    .local v17, path:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/bv/sync/ImageScannerTest;->random:Ljava/util/Random;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v16

    .line 159
    .local v16, nextInt:I
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "address"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 160
    .local v4, address:Ljava/lang/String;
    invoke-virtual {v11, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Integer;

    .line 161
    .local v15, index:Ljava/lang/Integer;
    if-nez v15, :cond_1

    .line 162
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    .line 163
    invoke-virtual {v11, v4, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    :cond_1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v12

    .line 166
    .local v12, calendar:Ljava/util/Calendar;
    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-direct {v1, v5, v6}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v12, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 167
    const/4 v1, 0x2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bv/sync/ImageScannerTest;->random:Ljava/util/Random;

    const/16 v5, 0xb

    invoke-virtual {v2, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    invoke-virtual {v12, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 168
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bv/sync/ImageScannerTest;->random:Ljava/util/Random;

    const/4 v5, 0x2

    invoke-virtual {v2, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    add-int/lit16 v2, v2, 0x7d0

    invoke-virtual {v12, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 169
    const/4 v1, 0x5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bv/sync/ImageScannerTest;->random:Ljava/util/Random;

    const/16 v5, 0x1e

    invoke-virtual {v2, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    invoke-virtual {v12, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 170
    invoke-virtual {v12}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    .line 171
    .local v3, time:Ljava/util/Date;
    new-instance v1, Lcom/bv/sync/ImageScannerTest$FileInfo;

    move-object/from16 v0, p0

    invoke-direct {v1, v0, v4, v3}, Lcom/bv/sync/ImageScannerTest$FileInfo;-><init>(Lcom/bv/sync/ImageScannerTest;Ljava/lang/String;Ljava/util/Date;)V

    aput-object v1, p2, v14

    .line 172
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-static {v1, v0, v2}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    .line 173
    new-instance v13, Ljava/io/File;

    new-instance v1, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-interface {v2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-direct {v13, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 174
    .local v13, file:Ljava/io/File;
    invoke-virtual {v13}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-double v5, v1

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v1

    neg-int v1, v1

    int-to-double v7, v1

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Lcom/bv/sync/ImageScannerTest$TestImageParser;->add(Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;DD)V

    .line 156
    add-int/lit8 v14, v14, 0x1

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
    .line 141
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 142
    .local v1, result:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_0

    .line 147
    return-object v1

    .line 142
    :cond_0
    aget-object v0, v3, v2

    .line 143
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 144
    invoke-direct {p0, v0}, Lcom/bv/sync/ImageScannerTest;->enumFiles(Lcom/bv/sync/IFile;)Ljava/util/HashSet;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 142
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 146
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
    .line 179
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 180
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v8

    invoke-static {v6, v7, v8, v9}, Lcom/bv/sync/ImageScannerTest;->assertEquals(JJ)V

    .line 181
    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v8

    invoke-static {v6, v7, v8, v9}, Lcom/bv/sync/ImageScannerTest;->assertEquals(JJ)V

    .line 182
    iget-object v6, p0, Lcom/bv/sync/ImageScannerTest;->paths:Ljava/util/HashSet;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    invoke-static {v6}, Lcom/bv/sync/ImageScannerTest;->assertTrue(Z)V

    .line 184
    :cond_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/bv/sync/ImageScannerTest;->assertEquals(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    invoke-interface {p1}, Lcom/bv/sync/IFile;->canRead()Z

    move-result v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->canRead()Z

    move-result v7

    invoke-static {v6, v7}, Lcom/bv/sync/ImageScannerTest;->assertEquals(ZZ)V

    .line 186
    invoke-interface {p1}, Lcom/bv/sync/IFile;->exists()Z

    move-result v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->exists()Z

    move-result v7

    invoke-static {v6, v7}, Lcom/bv/sync/ImageScannerTest;->assertEquals(ZZ)V

    .line 187
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v7

    invoke-static {v6, v7}, Lcom/bv/sync/ImageScannerTest;->assertEquals(ZZ)V

    .line 188
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v7

    invoke-static {v6, v7}, Lcom/bv/sync/ImageScannerTest;->assertEquals(ZZ)V

    .line 189
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isHidden()Z

    move-result v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->isHidden()Z

    move-result v7

    invoke-static {v6, v7}, Lcom/bv/sync/ImageScannerTest;->assertEquals(ZZ)V

    .line 191
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 192
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/bv/sync/ImageScannerTest;->assertEquals(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v4

    .line 194
    .local v4, listFiles1:[Lcom/bv/sync/IFile;
    invoke-interface {p2}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v5

    .line 195
    .local v5, listFiles2:[Lcom/bv/sync/IFile;
    array-length v6, v4

    array-length v7, v5

    invoke-static {v6, v7}, Lcom/bv/sync/ImageScannerTest;->assertEquals(II)V

    .line 196
    new-instance v0, Lcom/bv/sync/TestUtils$FileComparator;

    invoke-direct {v0}, Lcom/bv/sync/TestUtils$FileComparator;-><init>()V

    .line 197
    .local v0, comparator:Lcom/bv/sync/TestUtils$FileComparator;
    invoke-static {v4, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 198
    invoke-static {v5, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 199
    const/4 v2, 0x0

    .line 200
    .local v2, i:I
    array-length v7, v4

    const/4 v6, 0x0

    move v3, v2

    .end local v2           #i:I
    .local v3, i:I
    :goto_0
    if-lt v6, v7, :cond_2

    .line 203
    .end local v0           #comparator:Lcom/bv/sync/TestUtils$FileComparator;
    .end local v3           #i:I
    .end local v4           #listFiles1:[Lcom/bv/sync/IFile;
    .end local v5           #listFiles2:[Lcom/bv/sync/IFile;
    :cond_1
    const/4 v6, 0x1

    return v6

    .line 200
    .restart local v0       #comparator:Lcom/bv/sync/TestUtils$FileComparator;
    .restart local v3       #i:I
    .restart local v4       #listFiles1:[Lcom/bv/sync/IFile;
    .restart local v5       #listFiles2:[Lcom/bv/sync/IFile;
    :cond_2
    aget-object v1, v4, v6

    .line 201
    .local v1, file:Lcom/bv/sync/IFile;
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    aget-object v8, v5, v3

    invoke-direct {p0, v1, v8}, Lcom/bv/sync/ImageScannerTest;->equals(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Z

    move-result v8

    invoke-static {v8}, Lcom/bv/sync/ImageScannerTest;->assertTrue(Z)V

    .line 200
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
    .line 24
    new-instance v0, Lcom/bv/sync/LocalFile;

    new-instance v1, Ljava/io/File;

    const-string v2, "VirtualTest"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/bv/sync/LocalFile;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    .line 25
    iget-object v0, p0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 26
    iget-object v0, p0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->mkdir()V

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/bv/sync/IFile;

    const/4 v1, 0x0

    .line 27
    iget-object v2, p0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/bv/sync/TestUtils;->wipe([Lcom/bv/sync/IFile;)V

    .line 28
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

    .line 32
    iget-object v2, p0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/bv/sync/TestUtils;->wipe([Lcom/bv/sync/IFile;)V

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
    .line 36
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/16 v2, 0xa

    if-lt v0, v2, :cond_0

    .line 38
    new-instance v1, Lcom/bv/sync/VirtualFile;

    iget-object v2, p0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-direct {v1, v2}, Lcom/bv/sync/VirtualFile;-><init>(Lcom/bv/sync/IFile;)V

    .line 39
    .local v1, root:Lcom/bv/sync/VirtualFile;
    invoke-direct {p0, v1}, Lcom/bv/sync/ImageScannerTest;->enumFiles(Lcom/bv/sync/IFile;)Ljava/util/HashSet;

    move-result-object v2

    iput-object v2, p0, Lcom/bv/sync/ImageScannerTest;->paths:Ljava/util/HashSet;

    .line 40
    iget-object v2, p0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v1, v2}, Lcom/bv/sync/ImageScannerTest;->equals(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Z

    move-result v2

    invoke-static {v2}, Lcom/bv/sync/ImageScannerTest;->assertTrue(Z)V

    .line 41
    return-void

    .line 37
    .end local v1           #root:Lcom/bv/sync/VirtualFile;
    :cond_0
    iget-object v2, p0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

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

    .line 36
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public testVideo()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    const-string v12, "image.jpg"

    .line 45
    .local v12, imageName:Ljava/lang/String;
    const-string v18, "image.3gp"

    .line 46
    .local v18, videoName:Ljava/lang/String;
    const/16 v19, 0x7d0

    .line 47
    .local v19, year:I
    const/16 v13, 0xa

    .line 48
    .local v13, month:I
    const/4 v10, 0x1

    .line 50
    .local v10, day:I
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v9

    .line 51
    .local v9, calendar:Ljava/util/Calendar;
    const/16 v2, 0x7d0

    const/16 v3, 0xa

    const/4 v4, 0x1

    invoke-virtual {v9, v2, v3, v4}, Ljava/util/Calendar;->set(III)V

    .line 53
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    const-string v3, "image.jpg"

    const-string v4, "image.jpg"

    invoke-static {v2, v3, v4}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v11

    .line 54
    .local v11, file:Lcom/bv/sync/IFile;
    new-instance v1, Lcom/bv/sync/ImageScannerTest$TestImageParser;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v1, v0, v2}, Lcom/bv/sync/ImageScannerTest$TestImageParser;-><init>(Lcom/bv/sync/ImageScannerTest;Lcom/bv/sync/ImageScannerTest$TestImageParser;)V

    .line 55
    .local v1, imageParser:Lcom/bv/sync/ImageScannerTest$TestImageParser;
    invoke-interface {v11}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    invoke-virtual/range {v1 .. v8}, Lcom/bv/sync/ImageScannerTest$TestImageParser;->add(Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;DD)V

    .line 56
    invoke-virtual {v9}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-interface {v11, v2, v3}, Lcom/bv/sync/IFile;->setLastModified(J)V

    .line 58
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    const-string v3, "image.3gp"

    const-string v4, "image.3gp"

    invoke-static {v2, v3, v4}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v11

    .line 59
    invoke-virtual {v9}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-interface {v11, v2, v3}, Lcom/bv/sync/IFile;->setLastModified(J)V

    .line 61
    new-instance v17, Lcom/bv/sync/ImageScanner;

    move-object/from16 v0, v17

    invoke-direct {v0, v1}, Lcom/bv/sync/ImageScanner;-><init>(Lcom/bv/sync/ImageScanner$Parser;)V

    .line 62
    .local v17, scanner:Lcom/bv/sync/ImageScanner;
    new-instance v14, Lcom/bv/sync/ImageScanner$Options;

    invoke-direct {v14}, Lcom/bv/sync/ImageScanner$Options;-><init>()V

    .line 63
    .local v14, options:Lcom/bv/sync/ImageScanner$Options;
    const/4 v2, 0x1

    iput-boolean v2, v14, Lcom/bv/sync/ImageScanner$Options;->groupByDay:Z

    iput-boolean v2, v14, Lcom/bv/sync/ImageScanner$Options;->groupByMonth:Z

    iput-boolean v2, v14, Lcom/bv/sync/ImageScanner$Options;->groupByYear:Z

    .line 64
    const/4 v2, 0x1

    iput-boolean v2, v14, Lcom/bv/sync/ImageScanner$Options;->numericMonth:Z

    .line 65
    const/4 v2, 0x1

    iput-boolean v2, v14, Lcom/bv/sync/ImageScanner$Options;->groupVideos:Z

    .line 66
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    const/4 v3, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v14, v3}, Lcom/bv/sync/ImageScanner;->run(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;Lcom/bv/sync/ProgressNotification;)V

    .line 68
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-interface {v2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v15, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 69
    .local v15, path:Ljava/io/File;
    new-instance v16, Ljava/io/File;

    const-string v2, "2000"

    move-object/from16 v0, v16

    invoke-direct {v0, v15, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 70
    .end local v15           #path:Ljava/io/File;
    .local v16, path:Ljava/io/File;
    new-instance v15, Ljava/io/File;

    const-string v2, "11"

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 71
    .end local v16           #path:Ljava/io/File;
    .restart local v15       #path:Ljava/io/File;
    new-instance v16, Ljava/io/File;

    const-string v2, "1"

    move-object/from16 v0, v16

    invoke-direct {v0, v15, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 72
    .end local v15           #path:Ljava/io/File;
    .restart local v16       #path:Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v3, "image.jpg"

    move-object/from16 v0, v16

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    invoke-static {v2}, Lcom/bv/sync/ImageScannerTest;->assertTrue(Z)V

    .line 73
    new-instance v2, Ljava/io/File;

    const-string v3, "image.3gp"

    move-object/from16 v0, v16

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    invoke-static {v2}, Lcom/bv/sync/ImageScannerTest;->assertTrue(Z)V

    .line 74
    return-void
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

    .line 123
    new-instance v2, Lcom/bv/sync/ImageScannerTest$TestImageParser;

    const/4 v5, 0x0

    invoke-direct {v2, p0, v5}, Lcom/bv/sync/ImageScannerTest$TestImageParser;-><init>(Lcom/bv/sync/ImageScannerTest;Lcom/bv/sync/ImageScannerTest$TestImageParser;)V

    .line 124
    .local v2, imageParser:Lcom/bv/sync/ImageScannerTest$TestImageParser;
    const/16 v5, 0x64

    new-array v1, v5, [Lcom/bv/sync/ImageScannerTest$FileInfo;

    .line 125
    .local v1, files:[Lcom/bv/sync/ImageScannerTest$FileInfo;
    invoke-direct {p0, v2, v1}, Lcom/bv/sync/ImageScannerTest;->createRandomFiles(Lcom/bv/sync/ImageScannerTest$TestImageParser;[Lcom/bv/sync/ImageScannerTest$FileInfo;)V

    .line 126
    new-instance v4, Lcom/bv/sync/ImageScanner;

    invoke-direct {v4, v2}, Lcom/bv/sync/ImageScanner;-><init>(Lcom/bv/sync/ImageScanner$Parser;)V

    .line 127
    .local v4, scanner:Lcom/bv/sync/ImageScanner;
    new-instance v3, Lcom/bv/sync/ImageScanner$Options;

    invoke-direct {v3}, Lcom/bv/sync/ImageScanner$Options;-><init>()V

    .line 128
    .local v3, options:Lcom/bv/sync/ImageScanner$Options;
    iput-boolean v6, v3, Lcom/bv/sync/ImageScanner$Options;->groupByYear:Z

    .line 129
    iput-boolean v6, v3, Lcom/bv/sync/ImageScanner$Options;->groupByMonth:Z

    .line 130
    iput-boolean v6, v3, Lcom/bv/sync/ImageScanner$Options;->groupByDay:Z

    .line 131
    iput-boolean v6, v3, Lcom/bv/sync/ImageScanner$Options;->groupByAddress:Z

    .line 132
    iput-boolean v6, v3, Lcom/bv/sync/ImageScanner$Options;->groupVideos:Z

    .line 133
    new-instance v0, Lcom/bv/sync/VirtualFile;

    iget-object v5, p0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-direct {v0, v5}, Lcom/bv/sync/VirtualFile;-><init>(Lcom/bv/sync/IFile;)V

    .line 134
    .local v0, file:Lcom/bv/sync/VirtualFile;
    invoke-direct {p0, v0}, Lcom/bv/sync/ImageScannerTest;->enumFiles(Lcom/bv/sync/IFile;)Ljava/util/HashSet;

    move-result-object v5

    iput-object v5, p0, Lcom/bv/sync/ImageScannerTest;->paths:Ljava/util/HashSet;

    .line 135
    iget-object v5, p0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    new-instance v6, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v6}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v4, v5, v3, v6}, Lcom/bv/sync/ImageScanner;->run(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;Lcom/bv/sync/ProgressNotification;)V

    .line 136
    new-instance v5, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v5}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v4, v0, v3, v5}, Lcom/bv/sync/ImageScanner;->run(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;Lcom/bv/sync/ProgressNotification;)V

    .line 137
    iget-object v5, p0, Lcom/bv/sync/ImageScannerTest;->workingDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v0, v5}, Lcom/bv/sync/ImageScannerTest;->equals(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Z

    move-result v5

    invoke-static {v5}, Lcom/bv/sync/ImageScannerTest;->assertTrue(Z)V

    .line 138
    return-void
.end method
