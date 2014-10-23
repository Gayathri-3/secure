.class public Lcom/bv/sync/DeleteTest;
.super Lcom/bv/sync/SyncTest;
.source "DeleteTest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/DeleteTest$TestSync;
    }
.end annotation


# instance fields
.field private final random:Ljava/util/Random;


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/bv/sync/SyncTest;-><init>()V

    .line 19
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/bv/sync/DeleteTest;->random:Ljava/util/Random;

    .line 41
    return-void
.end method

.method static synthetic access$0(Lcom/bv/sync/DeleteTest;Ljava/util/List;Lcom/bv/sync/IFile;)Z
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 199
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/DeleteTest;->contains(Ljava/util/List;Lcom/bv/sync/IFile;)Z

    move-result v0

    return v0
.end method

.method private contains(Ljava/util/List;Lcom/bv/sync/IFile;)Z
    .locals 4
    .parameter
    .parameter "file"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;",
            "Lcom/bv/sync/IFile;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 200
    .local p1, deleted:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    instance-of v2, p2, Lcom/bv/sync/RemoteFile;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    :goto_0
    invoke-virtual {p0, p2, v2}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v1

    .line 201
    .local v1, relativePath:Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 204
    const/4 v2, 0x0

    :goto_1
    return v2

    .line 200
    .end local v1           #relativePath:Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    goto :goto_0

    .line 201
    .restart local v1       #relativePath:Ljava/lang/String;
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/IFile;

    .line 202
    .local v0, candidate:Lcom/bv/sync/IFile;
    iget-object v3, p0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-virtual {p0, v0, v3}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 203
    const/4 v2, 0x1

    goto :goto_1
.end method

.method private deleteBoth(Z)V
    .locals 16
    .parameter "mirror"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 52
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-static {v12}, Lcom/bv/sync/DeleteTest;->makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v6

    .line 53
    .local v6, leftFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v12}, Lcom/bv/sync/DeleteTest;->makeRightFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v9

    .line 54
    .local v9, rightFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    new-instance v7, Lcom/bv/sync/CifsSync$Options;

    sget-object v12, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    const/4 v13, 0x1

    sget-object v14, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v15, 0x0

    invoke-direct {v7, v12, v13, v14, v15}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 55
    .local v7, options:Lcom/bv/sync/CifsSync$Options;
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 56
    .local v11, track:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    new-instance v12, Lcom/bv/sync/DeleteTest$TestSync;

    invoke-direct {v12, v7, v11}, Lcom/bv/sync/DeleteTest$TestSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    new-instance v15, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v15}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v12, v13, v14, v15}, Lcom/bv/sync/DeleteTest$TestSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    move-result-object v10

    .line 57
    .local v10, sync:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v12

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v13

    add-int/2addr v12, v13

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v13

    invoke-static {v12, v13}, Lcom/bv/sync/DeleteTest;->assertEquals(II)V

    .line 58
    sget-object v12, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    iput-object v12, v7, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    .line 59
    move/from16 v0, p1

    iput-boolean v0, v7, Lcom/bv/sync/CifsSync$Options;->mirror:Z

    .line 60
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/bv/sync/DeleteTest;->listFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/bv/sync/DeleteTest;->removeFiles(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    .line 61
    .local v5, leftDeleted:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/bv/sync/DeleteTest;->listFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/bv/sync/DeleteTest;->removeFiles(Ljava/util/List;)Ljava/util/List;

    move-result-object v8

    .line 62
    .local v8, rightDeleted:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    const-string v13, "added1.txt"

    const-string v14, "added1"

    invoke-static {v12, v13, v14}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v12

    invoke-interface {v6, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    const-string v13, "added2.txt"

    const-string v14, "added2"

    invoke-static {v12, v13, v14}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v12

    invoke-interface {v9, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    new-instance v2, Lcom/bv/sync/DeleteTest$TestSync;

    invoke-direct {v2, v7, v11}, Lcom/bv/sync/DeleteTest$TestSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    .line 65
    .local v2, cifs:Lcom/bv/sync/CifsSync;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    new-instance v14, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v14}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v2, v12, v13, v14}, Lcom/bv/sync/CifsSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    .line 66
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v12, v13}, Lcom/bv/sync/DeleteTest;->verifySynced(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 67
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 68
    .local v3, expected:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_0

    .line 70
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_1

    .line 72
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_2

    .line 74
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_3

    .line 77
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .local v1, actual:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/bv/sync/DeleteTest;->listFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_4

    .line 80
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v1}, Lcom/bv/sync/DeleteTest;->verifyEqualsString(Ljava/util/List;Ljava/util/List;)V

    .line 81
    return-void

    .line 68
    .end local v1           #actual:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/sync/IFile;

    .line 69
    .local v4, file:Lcom/bv/sync/IFile;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v13}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 70
    .end local v4           #file:Lcom/bv/sync/IFile;
    :cond_1
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/sync/IFile;

    .line 71
    .restart local v4       #file:Lcom/bv/sync/IFile;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v13}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 72
    .end local v4           #file:Lcom/bv/sync/IFile;
    :cond_2
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/sync/IFile;

    .line 73
    .restart local v4       #file:Lcom/bv/sync/IFile;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v13}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_2

    .line 74
    .end local v4           #file:Lcom/bv/sync/IFile;
    :cond_3
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/sync/IFile;

    .line 75
    .restart local v4       #file:Lcom/bv/sync/IFile;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v13}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_3

    .line 78
    .end local v4           #file:Lcom/bv/sync/IFile;
    .restart local v1       #actual:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/sync/IFile;

    .line 79
    .restart local v4       #file:Lcom/bv/sync/IFile;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v13}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v1, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4
.end method

.method private enumerate(Ljava/util/Map;Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 5
    .parameter
    .parameter "file"
    .parameter "parent"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;",
            "Lcom/bv/sync/IFile;",
            "Lcom/bv/sync/IFile;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    .local p1, result:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-virtual {p0, p2, p3}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v1

    .line 227
    .local v1, relativePath:Ljava/lang/String;
    invoke-interface {p2}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    invoke-interface {p2}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 229
    invoke-interface {p2}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_1

    .line 231
    :cond_0
    return-void

    .line 229
    :cond_1
    aget-object v0, v3, v2

    .line 230
    .local v0, child:Lcom/bv/sync/IFile;
    invoke-direct {p0, p1, v0, p3}, Lcom/bv/sync/DeleteTest;->enumerate(Ljava/util/Map;Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 229
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private failedSync(Ljava/util/Map;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;
    .locals 8
    .parameter
    .parameter "progress"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;",
            "Lcom/bv/sync/ProgressNotification;",
            ")",
            "Ljava/util/List",
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
    .local p1, snapshot:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    const/4 v3, 0x0

    .line 209
    :try_start_0
    new-instance v2, Lcom/bv/sync/CifsSync$Options;

    sget-object v4, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    const/4 v5, 0x1

    sget-object v6, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v7, 0x0

    invoke-direct {v2, v4, v5, v6, v7}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 210
    .local v2, options:Lcom/bv/sync/CifsSync$Options;
    new-instance v0, Lcom/bv/sync/CifsSync;

    invoke-direct {v0, v2, p1}, Lcom/bv/sync/CifsSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    .line 211
    .local v0, cifs:Lcom/bv/sync/CifsSync;
    iget-object v4, p0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v5, p0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-virtual {v0, v4, v5, p2}, Lcom/bv/sync/CifsSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;
    :try_end_0
    .catch Lcom/bv/sync/CifsSync$SyncCancellationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    .end local v0           #cifs:Lcom/bv/sync/CifsSync;
    .end local v2           #options:Lcom/bv/sync/CifsSync$Options;
    :goto_0
    return-object v3

    .line 212
    :catch_0
    move-exception v1

    .line 213
    .local v1, e:Lcom/bv/sync/CifsSync$SyncCancellationException;
    iget-object v3, v1, Lcom/bv/sync/CifsSync$SyncCancellationException;->syncResult:Ljava/util/List;

    goto :goto_0
.end method

.method private listFiles(Lcom/bv/sync/IFile;)Ljava/util/List;
    .locals 5
    .parameter "dir"
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
    .line 234
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 235
    .local v1, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_0

    .line 238
    return-object v1

    .line 235
    :cond_0
    aget-object v0, v3, v2

    .line 236
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-direct {p0, v1, v0}, Lcom/bv/sync/DeleteTest;->listFiles(Ljava/util/List;Lcom/bv/sync/IFile;)V

    .line 235
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private listFiles(Ljava/util/List;Lcom/bv/sync/IFile;)V
    .locals 4
    .parameter
    .parameter "file"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;",
            "Lcom/bv/sync/IFile;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    .local p1, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    invoke-interface {p2}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 243
    invoke-interface {p2}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v3, :cond_1

    .line 245
    :cond_0
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    return-void

    .line 243
    :cond_1
    aget-object v0, v2, v1

    .line 244
    .local v0, child:Lcom/bv/sync/IFile;
    invoke-direct {p0, p1, v0}, Lcom/bv/sync/DeleteTest;->listFiles(Ljava/util/List;Lcom/bv/sync/IFile;)V

    .line 243
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private removeFiles(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;)",
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
    .line 153
    .local p1, files:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .local v1, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/sync/IFile;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 157
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x3

    if-lt v2, v3, :cond_2

    const/4 v2, 0x1

    :goto_1
    invoke-static {v2}, Lcom/bv/sync/DeleteTest;->assertTrue(Z)V

    .line 158
    return-object v1

    .line 155
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/sync/IFile;

    invoke-interface {v2}, Lcom/bv/sync/IFile;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 156
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/sync/IFile;

    invoke-static {v2, v1}, Lcom/bv/sync/TestUtils;->remove(Lcom/bv/sync/IFile;Ljava/util/List;)V

    .line 154
    :cond_1
    iget-object v2, p0, Lcom/bv/sync/DeleteTest;->random:Ljava/util/Random;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_0

    .line 157
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private takeSnapshot(Lcom/bv/sync/IFile;)Ljava/util/Map;
    .locals 5
    .parameter "dir"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/IFile;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 220
    .local v1, result:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_0

    .line 222
    return-object v1

    .line 220
    :cond_0
    aget-object v0, v3, v2

    .line 221
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-direct {p0, v1, v0, p1}, Lcom/bv/sync/DeleteTest;->enumerate(Ljava/util/Map;Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 220
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private testDelete(ZZ)V
    .locals 16
    .parameter "left"
    .parameter "mirror"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 100
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-static {v12}, Lcom/bv/sync/DeleteTest;->makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v5

    .line 101
    .local v5, leftFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v12}, Lcom/bv/sync/DeleteTest;->makeRightFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v7

    .line 102
    .local v7, rightFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    new-instance v6, Lcom/bv/sync/CifsSync$Options;

    invoke-direct {v6}, Lcom/bv/sync/CifsSync$Options;-><init>()V

    .line 103
    .local v6, options:Lcom/bv/sync/CifsSync$Options;
    if-eqz p1, :cond_0

    sget-object v12, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    :goto_0
    iput-object v12, v6, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    .line 104
    move/from16 v0, p2

    iput-boolean v0, v6, Lcom/bv/sync/CifsSync$Options;->mirror:Z

    .line 105
    if-eqz p1, :cond_1

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    .line 106
    .local v8, source:Lcom/bv/sync/IFile;
    :goto_1
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 107
    .local v11, track:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    new-instance v12, Lcom/bv/sync/DeleteTest$TestSync;

    invoke-direct {v12, v6, v11}, Lcom/bv/sync/DeleteTest$TestSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    new-instance v15, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v15}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v12, v13, v14, v15}, Lcom/bv/sync/DeleteTest$TestSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    .line 108
    if-eqz p1, :cond_2

    move-object v12, v5

    :goto_2
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/bv/sync/DeleteTest;->removeFiles(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 109
    .local v2, deleted:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    new-instance v12, Lcom/bv/sync/DeleteTest$TestSync;

    invoke-direct {v12, v6, v11}, Lcom/bv/sync/DeleteTest$TestSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    new-instance v15, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v15}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v12, v13, v14, v15}, Lcom/bv/sync/DeleteTest$TestSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    .line 110
    if-eqz p1, :cond_3

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    .line 111
    .local v10, target:Lcom/bv/sync/IFile;
    :goto_3
    if-eqz p1, :cond_4

    move-object v9, v5

    .line 112
    .local v9, sourceFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    :goto_4
    invoke-interface {v9, v2}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 113
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/bv/sync/DeleteTest;->listFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v12}, Lcom/bv/sync/DeleteTest;->verifyEquals(Ljava/util/List;Ljava/util/List;)V

    .line 114
    if-eqz p2, :cond_5

    .line 115
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v12, v13}, Lcom/bv/sync/DeleteTest;->verifySynced(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 130
    .end local v7           #rightFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    :goto_5
    return-void

    .line 103
    .end local v2           #deleted:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    .end local v8           #source:Lcom/bv/sync/IFile;
    .end local v9           #sourceFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    .end local v10           #target:Lcom/bv/sync/IFile;
    .end local v11           #track:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    .restart local v7       #rightFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    :cond_0
    sget-object v12, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    goto :goto_0

    .line 105
    :cond_1
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    goto :goto_1

    .restart local v8       #source:Lcom/bv/sync/IFile;
    .restart local v11       #track:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    :cond_2
    move-object v12, v7

    .line 108
    goto :goto_2

    .line 110
    .restart local v2       #deleted:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    :cond_3
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    goto :goto_3

    .restart local v10       #target:Lcom/bv/sync/IFile;
    :cond_4
    move-object v9, v7

    .line 111
    goto :goto_4

    .line 117
    .restart local v9       #sourceFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    :cond_5
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 118
    .local v3, expected:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_6
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_6

    .line 120
    if-eqz p1, :cond_7

    .end local v7           #rightFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    :goto_7
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_8
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_8

    .line 122
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_9
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_9

    .line 125
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .local v1, actual:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/bv/sync/DeleteTest;->listFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_a
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_a

    .line 128
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v1}, Lcom/bv/sync/DeleteTest;->verifyEqualsString(Ljava/util/List;Ljava/util/List;)V

    goto :goto_5

    .line 118
    .end local v1           #actual:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v7       #rightFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    :cond_6
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/sync/IFile;

    .line 119
    .local v4, file:Lcom/bv/sync/IFile;
    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v8}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .end local v4           #file:Lcom/bv/sync/IFile;
    :cond_7
    move-object v7, v5

    .line 120
    goto :goto_7

    .end local v7           #rightFiles:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    :cond_8
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/sync/IFile;

    .line 121
    .restart local v4       #file:Lcom/bv/sync/IFile;
    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v10}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 122
    .end local v4           #file:Lcom/bv/sync/IFile;
    :cond_9
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/sync/IFile;

    .line 123
    .restart local v4       #file:Lcom/bv/sync/IFile;
    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v8}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_9

    .line 126
    .end local v4           #file:Lcom/bv/sync/IFile;
    .restart local v1       #actual:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_a
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/sync/IFile;

    .line 127
    .restart local v4       #file:Lcom/bv/sync/IFile;
    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v10}, Lcom/bv/sync/DeleteTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a
.end method

.method private verifyEquals(Ljava/util/List;Ljava/util/List;)V
    .locals 6
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    .local p1, files1:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    .local p2, files2:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    const-string v3, "Size is different"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v3, v4, v5}, Lcom/bv/sync/DeleteTest;->assertEquals(Ljava/lang/String;II)V

    .line 142
    new-instance v3, Lcom/bv/sync/TestUtils$FileComparator;

    invoke-direct {v3}, Lcom/bv/sync/TestUtils$FileComparator;-><init>()V

    invoke-static {p1, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 143
    new-instance v3, Lcom/bv/sync/TestUtils$FileComparator;

    invoke-direct {v3}, Lcom/bv/sync/TestUtils$FileComparator;-><init>()V

    invoke-static {p2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 144
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-lt v2, v3, :cond_0

    .line 150
    return-void

    .line 145
    :cond_0
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/IFile;

    .line 146
    .local v0, file1:Lcom/bv/sync/IFile;
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/sync/IFile;

    .line 147
    .local v1, file2:Lcom/bv/sync/IFile;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Compare "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " and "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 148
    invoke-static {v0, v1}, Lcom/bv/sync/DeleteTest;->equals(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Z

    move-result v3

    invoke-static {v3}, Lcom/bv/sync/DeleteTest;->assertTrue(Z)V

    .line 144
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private verifyEqualsString(Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 133
    .local p1, files1:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .local p2, files2:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v1, v2}, Lcom/bv/sync/DeleteTest;->assertEquals(II)V

    .line 134
    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 135
    invoke-static {p2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 136
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 138
    return-void

    .line 137
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/bv/sync/DeleteTest;->assertEquals(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public testDeleteBoth()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 44
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/bv/sync/DeleteTest;->deleteBoth(Z)V

    .line 45
    return-void
.end method

.method public testDeleteBothMirror()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 48
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/bv/sync/DeleteTest;->deleteBoth(Z)V

    .line 49
    return-void
.end method

.method public testDeleteFail()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 162
    iget-object v8, p0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v9, p0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v8, v9}, Lcom/bv/sync/DeleteTest;->makeFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v4

    .line 163
    .local v4, numFiles:I
    new-instance v5, Lcom/bv/sync/CifsSync$Options;

    sget-object v8, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v9, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v10, 0x0

    invoke-direct {v5, v8, v11, v9, v10}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 164
    .local v5, options:Lcom/bv/sync/CifsSync$Options;
    invoke-virtual {p0, v5}, Lcom/bv/sync/DeleteTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v8

    invoke-static {v4, v8}, Lcom/bv/sync/DeleteTest;->assertEquals(II)V

    .line 166
    iget-object v8, p0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v8}, Lcom/bv/sync/DeleteTest;->takeSnapshot(Lcom/bv/sync/IFile;)Ljava/util/Map;

    move-result-object v7

    .line 167
    .local v7, snapshot:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    iget-object v8, p0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v8}, Lcom/bv/sync/DeleteTest;->listFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v3

    .line 168
    .local v3, files:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    invoke-direct {p0, v3}, Lcom/bv/sync/DeleteTest;->removeFiles(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 171
    .local v1, deleted:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    new-instance v8, Lcom/bv/sync/DeleteTest$1;

    invoke-direct {v8, p0}, Lcom/bv/sync/DeleteTest$1;-><init>(Lcom/bv/sync/DeleteTest;)V

    invoke-direct {p0, v7, v8}, Lcom/bv/sync/DeleteTest;->failedSync(Ljava/util/Map;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    move-result-object v6

    .line 177
    .local v6, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    const/4 v8, 0x0

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v8, v9}, Lcom/bv/sync/DeleteTest;->assertEquals(II)V

    .line 180
    new-instance v8, Lcom/bv/sync/DeleteTest$2;

    invoke-direct {v8, p0, v1}, Lcom/bv/sync/DeleteTest$2;-><init>(Lcom/bv/sync/DeleteTest;Ljava/util/List;)V

    invoke-direct {p0, v7, v8}, Lcom/bv/sync/DeleteTest;->failedSync(Ljava/util/Map;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    move-result-object v6

    .line 189
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v8

    invoke-static {v11, v8}, Lcom/bv/sync/DeleteTest;->assertEquals(II)V

    .line 191
    new-instance v0, Lcom/bv/sync/CifsSync;

    invoke-direct {v0, v5, v7}, Lcom/bv/sync/CifsSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    .line 192
    .local v0, cifs:Lcom/bv/sync/CifsSync;
    iget-object v8, p0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v9, p0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    new-instance v10, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v10}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v0, v8, v9, v10}, Lcom/bv/sync/CifsSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    move-result-object v6

    .line 193
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v8, v9}, Lcom/bv/sync/DeleteTest;->assertEquals(II)V

    .line 194
    iget-object v8, p0, Lcom/bv/sync/DeleteTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v9, p0, Lcom/bv/sync/DeleteTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v8, v9}, Lcom/bv/sync/DeleteTest;->verifySynced(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 195
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_0

    .line 197
    return-void

    .line 195
    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/sync/IFile;

    .line 196
    .local v2, file:Lcom/bv/sync/IFile;
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "File exists: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v2}, Lcom/bv/sync/IFile;->exists()Z

    move-result v10

    invoke-static {v9, v10}, Lcom/bv/sync/DeleteTest;->assertFalse(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method public testDeleteLeft()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 84
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/bv/sync/DeleteTest;->testDelete(ZZ)V

    .line 85
    return-void
.end method

.method public testDeleteLeftMirror()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 88
    invoke-direct {p0, v0, v0}, Lcom/bv/sync/DeleteTest;->testDelete(ZZ)V

    .line 89
    return-void
.end method

.method public testDeleteRight()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 92
    invoke-direct {p0, v0, v0}, Lcom/bv/sync/DeleteTest;->testDelete(ZZ)V

    .line 93
    return-void
.end method

.method public testDeleteRightMirror()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 96
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/bv/sync/DeleteTest;->testDelete(ZZ)V

    .line 97
    return-void
.end method
