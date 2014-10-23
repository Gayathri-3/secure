.class public Lcom/bv/sync/FilterTest;
.super Lcom/bv/sync/SyncTest;
.source "FilterTest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/FilterTest$Combination;,
        Lcom/bv/sync/FilterTest$TestFileFilter;
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
    .line 29
    invoke-direct {p0}, Lcom/bv/sync/SyncTest;-><init>()V

    .line 30
    return-void
.end method

.method private addFilterFiles(Lcom/bv/sync/IFile;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 4
    .parameter "dir"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/IFile;",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 231
    .local p2, files:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    .local p3, filter:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    const-string v2, "FilterFile"

    const-string v3, "FilterFile"

    invoke-static {p1, v2, v3}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 232
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-interface {p2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 233
    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 234
    const-string v2, "FilterDir"

    invoke-static {p1, v2}, Lcom/bv/sync/FilterTest;->createDir(Lcom/bv/sync/IFile;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 235
    .local v1, newDir:Lcom/bv/sync/IFile;
    invoke-interface {p2, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 236
    const-string v2, "FilterFile"

    const-string v3, "FilterFile"

    invoke-static {v1, v2, v3}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 237
    invoke-interface {p2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 238
    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 239
    return-void
.end method

.method private addHiddenFiles(Lcom/bv/sync/IFile;)V
    .locals 4
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 334
    const-string v2, ".HiddenFile"

    const-string v3, "HiddenFile"

    invoke-static {p1, v2, v3}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 335
    .local v1, newFile:Lcom/bv/sync/IFile;
    invoke-direct {p0, v1}, Lcom/bv/sync/FilterTest;->setHidden(Lcom/bv/sync/IFile;)V

    .line 336
    const-string v2, ".HiddenDir"

    invoke-static {p1, v2}, Lcom/bv/sync/FilterTest;->createDir(Lcom/bv/sync/IFile;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 337
    .local v0, dir:Lcom/bv/sync/IFile;
    invoke-direct {p0, v0}, Lcom/bv/sync/FilterTest;->setHidden(Lcom/bv/sync/IFile;)V

    .line 338
    const-string v2, ".HiddenDir"

    const-string v3, ".HiddenDir"

    invoke-static {v0, v2, v3}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 339
    invoke-direct {p0, v1}, Lcom/bv/sync/FilterTest;->setHidden(Lcom/bv/sync/IFile;)V

    .line 340
    return-void
.end method

.method private addReadProtectedFiles(Lcom/bv/sync/IFile;)Ljava/util/Collection;
    .locals 6
    .parameter "parent"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 358
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 359
    .local v2, result:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/sync/IFile;>;"
    const-string v3, "ReadProtected"

    const-string v4, "ReadProtected"

    invoke-static {p1, v3, v4}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 360
    .local v1, newFile:Lcom/bv/sync/IFile;
    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 361
    new-instance v3, Ljava/io/File;

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3, v5}, Lcom/bv/sync/FilterTest;->setReadable(Ljava/io/File;Z)V

    .line 362
    const-string v3, "ReadProtectedDir"

    invoke-static {p1, v3}, Lcom/bv/sync/FilterTest;->createDir(Lcom/bv/sync/IFile;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 363
    .local v0, dir:Lcom/bv/sync/IFile;
    new-instance v3, Ljava/io/File;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3, v5}, Lcom/bv/sync/FilterTest;->setReadable(Ljava/io/File;Z)V

    .line 364
    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 365
    const-string v3, "ReadProtected"

    const-string v4, "ReadProtected"

    invoke-static {v0, v3, v4}, Lcom/bv/sync/TestUtils;->createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 366
    new-instance v3, Ljava/io/File;

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3, v5}, Lcom/bv/sync/FilterTest;->setReadable(Ljava/io/File;Z)V

    .line 367
    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 368
    return-object v2
.end method

.method private countMatching(Ljava/util/Collection;[Ljava/lang/String;Lcom/bv/sync/IFileFilter$Action;)I
    .locals 4
    .parameter
    .parameter "expressions"
    .parameter "action"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;[",
            "Ljava/lang/String;",
            "Lcom/bv/sync/IFileFilter$Action;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    .local p1, files:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    const/4 v1, 0x0

    .line 194
    .local v1, result:I
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 197
    if-eqz v1, :cond_2

    const/4 v2, 0x1

    :goto_1
    invoke-static {v2}, Lcom/bv/sync/FilterTest;->assertTrue(Z)V

    .line 198
    return v1

    .line 194
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/IFile;

    .line 195
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-direct {p0, v0, p2, p3}, Lcom/bv/sync/FilterTest;->matches(Lcom/bv/sync/IFile;[Ljava/lang/String;Lcom/bv/sync/IFileFilter$Action;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 196
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 197
    .end local v0           #file:Lcom/bv/sync/IFile;
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private countMovedAndCopied(Lcom/bv/sync/IFile;Ljava/util/Collection;)I
    .locals 6
    .parameter "dir"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/IFile;",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    .local p2, createdFiles:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v2

    mul-int/lit8 v0, v2, 0x2

    .line 224
    .local v0, count:I
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_0

    .line 227
    return v0

    .line 224
    :cond_0
    aget-object v1, v3, v2

    .line 225
    .local v1, file:Lcom/bv/sync/IFile;
    invoke-interface {v1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 226
    add-int/lit8 v0, v0, -0x1

    .line 224
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private matches(Lcom/bv/sync/IFile;[Ljava/lang/String;Lcom/bv/sync/IFileFilter$Action;)Z
    .locals 7
    .parameter "file"
    .parameter "expressions"
    .parameter "action"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 202
    sget-object v4, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    if-ne p3, v4, :cond_1

    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 208
    :cond_0
    :goto_0
    return v2

    .line 204
    :cond_1
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v1

    .line 205
    .local v1, name:Ljava/lang/String;
    array-length v5, p2

    move v4, v3

    :goto_1
    if-lt v4, v5, :cond_2

    move v2, v3

    .line 208
    goto :goto_0

    .line 205
    :cond_2
    aget-object v0, p2, v4

    .line 206
    .local v0, expression:Ljava/lang/String;
    invoke-direct {p0, v1, v0}, Lcom/bv/sync/FilterTest;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 205
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method private matches(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .parameter "name"
    .parameter "expression"

    .prologue
    .line 212
    const-string v3, "."

    invoke-virtual {p2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 213
    invoke-virtual {p1, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    .line 219
    :cond_0
    :goto_0
    return v2

    .line 214
    :cond_1
    invoke-static {p2}, Lcom/bv/sync/ExtensionFilter;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 215
    .local v0, compile:Ljava/util/regex/Pattern;
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 216
    .local v1, matcher:Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    .line 217
    .local v2, result:Z
    if-eqz v2, :cond_0

    .line 218
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Matches: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", expression: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private setHidden(Lcom/bv/sync/IFile;)V
    .locals 7
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 343
    invoke-static {}, Lcom/bv/sync/Utils;->isWindows()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 344
    instance-of v3, p1, Lcom/bv/sync/LocalFile;

    if-eqz v3, :cond_0

    .line 345
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 346
    .local v1, path:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "C:\\WINDOWS\\System32\\ATTRIB.EXE +H "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 347
    .local v0, command:Ljava/lang/String;
    invoke-static {v0}, Lcom/bv/sync/TestUtils;->exec(Ljava/lang/String;)V

    .line 355
    .end local v0           #command:Ljava/lang/String;
    .end local v1           #path:Ljava/lang/String;
    :goto_0
    return-void

    .line 349
    :cond_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 350
    .restart local v1       #path:Ljava/lang/String;
    new-instance v2, Ljcifs/smb/SmbFile;

    new-instance v3, Ljcifs/smb/NtlmPasswordAuthentication;

    iget-object v4, p0, Lcom/bv/sync/FilterTest;->domain:Ljava/lang/String;

    iget-object v5, p0, Lcom/bv/sync/FilterTest;->user:Ljava/lang/String;

    iget-object v6, p0, Lcom/bv/sync/FilterTest;->password:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v6}, Ljcifs/smb/NtlmPasswordAuthentication;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v2, v1, v3}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 351
    .local v2, smbFile:Ljcifs/smb/SmbFile;
    invoke-virtual {v2}, Ljcifs/smb/SmbFile;->getAttributes()I

    move-result v3

    or-int/lit8 v3, v3, 0x2

    invoke-virtual {v2, v3}, Ljcifs/smb/SmbFile;->setAttributes(I)V

    goto :goto_0

    .line 354
    .end local v1           #path:Ljava/lang/String;
    .end local v2           #smbFile:Ljcifs/smb/SmbFile;
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " hidden"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1}, Lcom/bv/sync/IFile;->isHidden()Z

    move-result v4

    invoke-static {v3, v4}, Lcom/bv/sync/FilterTest;->assertTrue(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method private testExcludeFileFilter(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options;I)V
    .locals 11
    .parameter "parentDir"
    .parameter "options"
    .parameter "expectedSyncCount"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v6, 0x0

    .line 263
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 264
    .local v2, files:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/sync/IFile;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 265
    .local v0, exclude:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/sync/IFile;>;"
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v7

    array-length v8, v7

    move v5, v6

    :goto_0
    if-lt v5, v8, :cond_0

    .line 268
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 269
    .local v4, paths:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_2

    .line 272
    new-array v3, v10, [Lcom/bv/sync/IFileFilter;

    new-instance v5, Lcom/bv/sync/FilterTest$TestFileFilter;

    sget-object v7, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    const/4 v8, 0x2

    new-array v8, v8, [Lcom/bv/sync/IFile;

    iget-object v9, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    aput-object v9, v8, v6

    iget-object v9, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    aput-object v9, v8, v10

    invoke-direct {v5, p0, v4, v7, v8}, Lcom/bv/sync/FilterTest$TestFileFilter;-><init>(Lcom/bv/sync/FilterTest;Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V

    aput-object v5, v3, v6

    .line 273
    .local v3, filter:[Lcom/bv/sync/IFileFilter;
    iput-object v3, p2, Lcom/bv/sync/CifsSync$Options;->filters:[Lcom/bv/sync/IFileFilter;

    .line 275
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/2addr v5, p3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {p0, p2}, Lcom/bv/sync/FilterTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->size()I

    move-result v6

    invoke-static {v5, v6}, Lcom/bv/sync/FilterTest;->assertEquals(II)V

    .line 276
    return-void

    .line 265
    .end local v3           #filter:[Lcom/bv/sync/IFileFilter;
    .end local v4           #paths:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_0
    aget-object v1, v7, v5

    .line 266
    .local v1, file:Lcom/bv/sync/IFile;
    invoke-interface {v1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 267
    invoke-direct {p0, v1, v2, v0}, Lcom/bv/sync/FilterTest;->addFilterFiles(Lcom/bv/sync/IFile;Ljava/util/Collection;Ljava/util/Collection;)V

    .line 265
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 269
    .end local v1           #file:Lcom/bv/sync/IFile;
    .restart local v4       #paths:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/sync/IFile;

    .line 270
    .restart local v1       #file:Lcom/bv/sync/IFile;
    invoke-virtual {p0, v1, p1}, Lcom/bv/sync/FilterTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private testExcludeProgress(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V
    .locals 18
    .parameter "parentDir"
    .parameter "direction"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 285
    invoke-virtual/range {p0 .. p0}, Lcom/bv/sync/FilterTest;->setUp()V

    .line 286
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Parent dir: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", direction: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 287
    invoke-static/range {p1 .. p1}, Lcom/bv/sync/FilterTest;->makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    .line 289
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 290
    .local v4, files:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/sync/IFile;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 291
    .local v2, exclude:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/sync/IFile;>;"
    invoke-interface/range {p1 .. p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v12

    array-length v13, v12

    const/4 v11, 0x0

    :goto_0
    if-lt v11, v13, :cond_0

    .line 295
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 296
    .local v8, paths:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_2

    .line 299
    new-instance v7, Lcom/bv/sync/CifsSync$Options;

    const/4 v11, 0x1

    sget-object v12, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-direct {v7, v0, v11, v12, v13}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 300
    .local v7, options:Lcom/bv/sync/CifsSync$Options;
    const/4 v11, 0x1

    new-array v11, v11, [Lcom/bv/sync/IFileFilter;

    const/4 v12, 0x0

    new-instance v13, Lcom/bv/sync/FilterTest$TestFileFilter;

    sget-object v14, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    const/4 v15, 0x2

    new-array v15, v15, [Lcom/bv/sync/IFile;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v17, v0

    aput-object v17, v15, v16

    const/16 v16, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v17, v0

    aput-object v17, v15, v16

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v8, v14, v15}, Lcom/bv/sync/FilterTest$TestFileFilter;-><init>(Lcom/bv/sync/FilterTest;Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V

    aput-object v13, v11, v12

    iput-object v11, v7, Lcom/bv/sync/CifsSync$Options;->filters:[Lcom/bv/sync/IFileFilter;

    .line 301
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 302
    .local v10, track:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    new-instance v11, Lcom/bv/sync/CifsSync;

    invoke-direct {v11, v7, v10}, Lcom/bv/sync/CifsSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    new-instance v14, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v14}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v11, v12, v13, v14}, Lcom/bv/sync/CifsSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    .line 303
    invoke-virtual {v8}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 304
    .local v6, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-virtual {v8}, Ljava/util/HashSet;->size()I

    move-result v9

    .line 305
    .local v9, size:I
    new-instance v8, Ljava/util/HashSet;

    .end local v8           #paths:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 306
    .restart local v8       #paths:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v5, 0x0

    .local v5, i:I
    :goto_2
    if-lt v5, v9, :cond_3

    .line 309
    const/4 v11, 0x1

    new-array v11, v11, [Lcom/bv/sync/IFileFilter;

    const/4 v12, 0x0

    new-instance v13, Lcom/bv/sync/FilterTest$TestFileFilter;

    sget-object v14, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    const/4 v15, 0x2

    new-array v15, v15, [Lcom/bv/sync/IFile;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v17, v0

    aput-object v17, v15, v16

    const/16 v16, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v17, v0

    aput-object v17, v15, v16

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v8, v14, v15}, Lcom/bv/sync/FilterTest$TestFileFilter;-><init>(Lcom/bv/sync/FilterTest;Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V

    aput-object v13, v11, v12

    iput-object v11, v7, Lcom/bv/sync/CifsSync$Options;->filters:[Lcom/bv/sync/IFileFilter;

    .line 310
    new-instance v11, Lcom/bv/sync/CifsSync;

    invoke-direct {v11, v7, v10}, Lcom/bv/sync/CifsSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    new-instance v14, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v14}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v11, v12, v13, v14}, Lcom/bv/sync/CifsSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    .line 311
    return-void

    .line 291
    .end local v5           #i:I
    .end local v6           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v7           #options:Lcom/bv/sync/CifsSync$Options;
    .end local v8           #paths:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v9           #size:I
    .end local v10           #track:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    :cond_0
    aget-object v3, v12, v11

    .line 292
    .local v3, file:Lcom/bv/sync/IFile;
    invoke-interface {v3}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v14

    if-eqz v14, :cond_1

    .line 293
    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4, v2}, Lcom/bv/sync/FilterTest;->addFilterFiles(Lcom/bv/sync/IFile;Ljava/util/Collection;Ljava/util/Collection;)V

    .line 291
    :cond_1
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_0

    .line 296
    .end local v3           #file:Lcom/bv/sync/IFile;
    .restart local v8       #paths:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_2
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bv/sync/IFile;

    .line 297
    .restart local v3       #file:Lcom/bv/sync/IFile;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v3, v1}, Lcom/bv/sync/FilterTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 307
    .end local v3           #file:Lcom/bv/sync/IFile;
    .restart local v5       #i:I
    .restart local v6       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v7       #options:Lcom/bv/sync/CifsSync$Options;
    .restart local v9       #size:I
    .restart local v10       #track:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    :cond_3
    rem-int/lit8 v11, v5, 0x2

    if-nez v11, :cond_4

    .line 308
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v8, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 306
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2
.end method

.method private testExtensionsFilter(Lcom/bv/sync/IFileFilter$Action;)V
    .locals 11
    .parameter "action"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 174
    const/4 v7, 0x4

    new-array v2, v7, [Ljava/lang/String;

    const-string v7, "0.jp?"

    aput-object v7, v2, v10

    const-string v7, "1.*"

    aput-object v7, v2, v9

    const/4 v7, 0x2

    const-string v8, "*.mp"

    aput-object v8, v2, v7

    const/4 v7, 0x3

    const-string v8, "7.mp3"

    aput-object v8, v2, v7

    .line 176
    .local v2, expressions:[Ljava/lang/String;
    iget-object v7, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-static {v7}, Lcom/bv/sync/FilterTest;->makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v4

    .line 177
    .local v4, files:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    invoke-direct {p0, v4, v2, p1}, Lcom/bv/sync/FilterTest;->countMatching(Ljava/util/Collection;[Ljava/lang/String;Lcom/bv/sync/IFileFilter$Action;)I

    move-result v0

    .line 178
    .local v0, count:I
    new-instance v3, Ljava/util/HashSet;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 179
    .local v3, extensions:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    new-array v5, v9, [Lcom/bv/sync/IFileFilter;

    new-instance v7, Lcom/bv/sync/FilterTest$1;

    invoke-direct {v7, p0, v3, p1}, Lcom/bv/sync/FilterTest$1;-><init>(Lcom/bv/sync/FilterTest;Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;)V

    aput-object v7, v5, v10

    .line 187
    .local v5, filters:[Lcom/bv/sync/IFileFilter;
    new-instance v6, Lcom/bv/sync/CifsSync$Options;

    sget-object v7, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v8, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    invoke-direct {v6, v7, v9, v8, v5}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 188
    .local v6, options:Lcom/bv/sync/CifsSync$Options;
    sget-object v7, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    if-ne p1, v7, :cond_0

    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v7

    sub-int v1, v7, v0

    .line 189
    .local v1, expected:I
    :goto_0
    invoke-virtual {p0, v6}, Lcom/bv/sync/FilterTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->size()I

    move-result v7

    invoke-static {v1, v7}, Lcom/bv/sync/FilterTest;->assertEquals(II)V

    .line 190
    return-void

    .end local v1           #expected:I
    :cond_0
    move v1, v0

    .line 188
    goto :goto_0
.end method

.method private testIncludeFileFilter(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options;)V
    .locals 17
    .parameter "parentDir"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 78
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .local v4, files:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/sync/IFile;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v6, include:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/sync/IFile;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v6}, Lcom/bv/sync/FilterTest;->addFilterFiles(Lcom/bv/sync/IFile;Ljava/util/Collection;Ljava/util/Collection;)V

    .line 82
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 83
    .local v9, paths:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_2

    .line 86
    const/4 v11, 0x1

    new-array v5, v11, [Lcom/bv/sync/IFileFilter;

    const/4 v11, 0x0

    new-instance v12, Lcom/bv/sync/FilterTest$TestFileFilter;

    sget-object v13, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    const/4 v14, 0x2

    new-array v14, v14, [Lcom/bv/sync/IFile;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v9, v13, v14}, Lcom/bv/sync/FilterTest$TestFileFilter;-><init>(Lcom/bv/sync/FilterTest;Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V

    aput-object v12, v5, v11

    .line 87
    .local v5, filter:[Lcom/bv/sync/IFileFilter;
    move-object/from16 v0, p2

    iput-object v5, v0, Lcom/bv/sync/CifsSync$Options;->filters:[Lcom/bv/sync/IFileFilter;

    .line 88
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/bv/sync/FilterTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v10

    .line 89
    .local v10, syncItems:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/SyncItem;>;"
    invoke-virtual {v9}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_3

    .line 91
    invoke-interface {v10}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_4

    .line 93
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 95
    .local v2, expected:I
    move-object/from16 v0, p2

    iget-object v11, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v12, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v11, v12, :cond_0

    move-object/from16 v0, p2

    iget-object v11, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v12, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v11, v12, :cond_1

    .line 96
    :cond_0
    mul-int/lit8 v2, v2, 0x2

    .line 98
    :cond_1
    invoke-interface {v10}, Ljava/util/Collection;->size()I

    move-result v11

    invoke-static {v2, v11}, Lcom/bv/sync/FilterTest;->assertEquals(II)V

    .line 99
    return-void

    .line 83
    .end local v2           #expected:I
    .end local v5           #filter:[Lcom/bv/sync/IFileFilter;
    .end local v10           #syncItems:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/SyncItem;>;"
    :cond_2
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bv/sync/IFile;

    .line 84
    .local v3, file:Lcom/bv/sync/IFile;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v3, v1}, Lcom/bv/sync/FilterTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 89
    .end local v3           #file:Lcom/bv/sync/IFile;
    .restart local v5       #filter:[Lcom/bv/sync/IFileFilter;
    .restart local v10       #syncItems:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/SyncItem;>;"
    :cond_3
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 90
    .local v8, path:Ljava/lang/String;
    sget-object v12, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Include "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1

    .line 91
    .end local v8           #path:Ljava/lang/String;
    :cond_4
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/bv/sync/SyncItem;

    .line 92
    .local v7, item:Lcom/bv/sync/SyncItem;
    sget-object v12, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Synced "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v14, v7, Lcom/bv/sync/SyncItem;->absolutePath:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2
.end method


# virtual methods
.method public testExcludeExtensions()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 166
    sget-object v0, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    invoke-direct {p0, v0}, Lcom/bv/sync/FilterTest;->testExtensionsFilter(Lcom/bv/sync/IFileFilter$Action;)V

    .line 167
    return-void
.end method

.method public testExcludeFilesCopy()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v4, 0x0

    .line 113
    const/4 v5, 0x2

    new-array v1, v5, [Lcom/bv/sync/FilterTest$Combination;

    new-instance v5, Lcom/bv/sync/FilterTest$Combination;

    iget-object v6, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    sget-object v7, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-direct {v5, p0, v6, v7}, Lcom/bv/sync/FilterTest$Combination;-><init>(Lcom/bv/sync/FilterTest;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V

    aput-object v5, v1, v4

    .line 114
    new-instance v5, Lcom/bv/sync/FilterTest$Combination;

    iget-object v6, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    sget-object v7, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-direct {v5, p0, v6, v7}, Lcom/bv/sync/FilterTest$Combination;-><init>(Lcom/bv/sync/FilterTest;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V

    aput-object v5, v1, v9

    .line 117
    .local v1, combinations:[Lcom/bv/sync/FilterTest$Combination;
    array-length v5, v1

    :goto_0
    if-lt v4, v5, :cond_0

    .line 123
    return-void

    .line 117
    :cond_0
    aget-object v0, v1, v4

    .line 118
    .local v0, combination:Lcom/bv/sync/FilterTest$Combination;
    iget-object v6, v0, Lcom/bv/sync/FilterTest$Combination;->dir:Lcom/bv/sync/IFile;

    invoke-static {v6}, Lcom/bv/sync/FilterTest;->makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v2

    .line 119
    .local v2, files:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    new-instance v3, Lcom/bv/sync/CifsSync$Options;

    iget-object v6, v0, Lcom/bv/sync/FilterTest$Combination;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v7, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v8, 0x0

    invoke-direct {v3, v6, v9, v7, v8}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 120
    .local v3, options:Lcom/bv/sync/CifsSync$Options;
    iget-object v6, v0, Lcom/bv/sync/FilterTest$Combination;->dir:Lcom/bv/sync/IFile;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v7

    invoke-direct {p0, v6, v3, v7}, Lcom/bv/sync/FilterTest;->testExcludeFileFilter(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options;I)V

    .line 121
    invoke-virtual {p0}, Lcom/bv/sync/FilterTest;->setUp()V

    .line 117
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public testExcludeFilesMove()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v5, 0x0

    .line 126
    const/4 v6, 0x2

    new-array v1, v6, [Lcom/bv/sync/FilterTest$Combination;

    new-instance v6, Lcom/bv/sync/FilterTest$Combination;

    iget-object v7, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    sget-object v8, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-direct {v6, p0, v7, v8}, Lcom/bv/sync/FilterTest$Combination;-><init>(Lcom/bv/sync/FilterTest;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V

    aput-object v6, v1, v5

    .line 127
    new-instance v6, Lcom/bv/sync/FilterTest$Combination;

    iget-object v7, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    sget-object v8, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-direct {v6, p0, v7, v8}, Lcom/bv/sync/FilterTest$Combination;-><init>(Lcom/bv/sync/FilterTest;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V

    aput-object v6, v1, v10

    .line 129
    .local v1, combinations:[Lcom/bv/sync/FilterTest$Combination;
    array-length v6, v1

    :goto_0
    if-lt v5, v6, :cond_0

    .line 136
    return-void

    .line 129
    :cond_0
    aget-object v0, v1, v5

    .line 130
    .local v0, combination:Lcom/bv/sync/FilterTest$Combination;
    iget-object v7, v0, Lcom/bv/sync/FilterTest$Combination;->dir:Lcom/bv/sync/IFile;

    invoke-static {v7}, Lcom/bv/sync/FilterTest;->makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    move-result-object v3

    .line 131
    .local v3, files:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    iget-object v7, v0, Lcom/bv/sync/FilterTest$Combination;->dir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v7, v3}, Lcom/bv/sync/FilterTest;->countMovedAndCopied(Lcom/bv/sync/IFile;Ljava/util/Collection;)I

    move-result v2

    .line 132
    .local v2, count:I
    new-instance v4, Lcom/bv/sync/CifsSync$Options;

    iget-object v7, v0, Lcom/bv/sync/FilterTest$Combination;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v8, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v9, 0x0

    invoke-direct {v4, v7, v10, v8, v9}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 133
    .local v4, options:Lcom/bv/sync/CifsSync$Options;
    iget-object v7, v0, Lcom/bv/sync/FilterTest$Combination;->dir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v7, v4, v2}, Lcom/bv/sync/FilterTest;->testExcludeFileFilter(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options;I)V

    .line 134
    invoke-virtual {p0}, Lcom/bv/sync/FilterTest;->setUp()V

    .line 129
    add-int/lit8 v5, v5, 0x1

    goto :goto_0
.end method

.method public testExcludeFilesSync()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v4, 0x0

    .line 102
    const/4 v5, 0x2

    new-array v1, v5, [Lcom/bv/sync/IFile;

    iget-object v5, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    aput-object v5, v1, v4

    iget-object v5, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    aput-object v5, v1, v9

    .line 103
    .local v1, dirs:[Lcom/bv/sync/IFile;
    array-length v5, v1

    :goto_0
    if-lt v4, v5, :cond_0

    .line 109
    return-void

    .line 103
    :cond_0
    aget-object v0, v1, v4

    .line 104
    .local v0, dir:Lcom/bv/sync/IFile;
    iget-object v6, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v7, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v6, v7}, Lcom/bv/sync/FilterTest;->makeFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/util/Collection;

    move-result-object v2

    .line 105
    .local v2, files:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    new-instance v3, Lcom/bv/sync/CifsSync$Options;

    sget-object v6, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v7, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v8, 0x0

    invoke-direct {v3, v6, v9, v7, v8}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 106
    .local v3, options:Lcom/bv/sync/CifsSync$Options;
    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v6

    invoke-direct {p0, v0, v3, v6}, Lcom/bv/sync/FilterTest;->testExcludeFileFilter(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options;I)V

    .line 107
    invoke-virtual {p0}, Lcom/bv/sync/FilterTest;->setUp()V

    .line 103
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public testExcludeFilesWithDelete()V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 139
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v11, v12}, Lcom/bv/sync/FilterTest;->makeFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/util/Collection;

    move-result-object v2

    .line 140
    .local v2, files:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    new-instance v7, Lcom/bv/sync/CifsSync$Options;

    sget-object v11, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    const/4 v12, 0x1

    sget-object v13, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v14, 0x0

    invoke-direct {v7, v11, v12, v13, v14}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 141
    .local v7, options:Lcom/bv/sync/CifsSync$Options;
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 142
    .local v10, track:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    new-instance v11, Lcom/bv/sync/CifsSync;

    invoke-direct {v11, v7, v10}, Lcom/bv/sync/CifsSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    new-instance v14, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v14}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-virtual {v11, v12, v13, v14}, Lcom/bv/sync/CifsSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    .line 143
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 144
    .local v6, leftPaths:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 146
    .local v9, rightPaths:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 147
    .local v4, i:I
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_0

    .line 157
    const/4 v11, 0x2

    new-array v3, v11, [Lcom/bv/sync/IFileFilter;

    const/4 v11, 0x0

    new-instance v12, Lcom/bv/sync/FilterTest$TestFileFilter;

    sget-object v13, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    const/4 v14, 0x2

    new-array v14, v14, [Lcom/bv/sync/IFile;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v6, v13, v14}, Lcom/bv/sync/FilterTest$TestFileFilter;-><init>(Lcom/bv/sync/FilterTest;Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V

    aput-object v12, v3, v11

    const/4 v11, 0x1

    .line 158
    new-instance v12, Lcom/bv/sync/FilterTest$TestFileFilter;

    sget-object v13, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    const/4 v14, 0x2

    new-array v14, v14, [Lcom/bv/sync/IFile;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v9, v13, v14}, Lcom/bv/sync/FilterTest$TestFileFilter;-><init>(Lcom/bv/sync/FilterTest;Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V

    aput-object v12, v3, v11

    .line 160
    .local v3, filter:[Lcom/bv/sync/IFileFilter;
    iput-object v3, v7, Lcom/bv/sync/CifsSync$Options;->filters:[Lcom/bv/sync/IFileFilter;

    .line 161
    new-instance v8, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v8}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    .line 162
    .local v8, progress:Lcom/bv/sync/TestUtils$TestProgress;
    const/4 v11, 0x0

    new-instance v12, Lcom/bv/sync/CifsSync;

    const/4 v13, 0x0

    invoke-direct {v12, v7, v13}, Lcom/bv/sync/CifsSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-virtual {v12, v13, v14, v8}, Lcom/bv/sync/CifsSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    invoke-static {v11, v12}, Lcom/bv/sync/FilterTest;->assertEquals(II)V

    .line 163
    return-void

    .line 147
    .end local v3           #filter:[Lcom/bv/sync/IFileFilter;
    .end local v8           #progress:Lcom/bv/sync/TestUtils$TestProgress;
    :cond_0
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/sync/IFile;

    .line 148
    .local v1, file:Lcom/bv/sync/IFile;
    add-int/lit8 v5, v4, 0x1

    .end local v4           #i:I
    .local v5, i:I
    rem-int/lit8 v12, v4, 0x3

    if-nez v12, :cond_1

    .line 149
    instance-of v12, v1, Lcom/bv/sync/LocalFile;

    if-eqz v12, :cond_2

    .line 150
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v12}, Lcom/bv/sync/FilterTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 153
    :goto_1
    invoke-interface {v1}, Lcom/bv/sync/IFile;->exists()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 154
    invoke-interface {v1}, Lcom/bv/sync/IFile;->delete()V

    :cond_1
    move v4, v5

    .end local v5           #i:I
    .restart local v4       #i:I
    goto/16 :goto_0

    .line 152
    .end local v4           #i:I
    .restart local v5       #i:I
    :cond_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v12}, Lcom/bv/sync/FilterTest;->getRelativePath(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public testExcludeProgress()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 279
    const/4 v2, 0x2

    new-array v5, v2, [Lcom/bv/sync/IFile;

    iget-object v2, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    aput-object v2, v5, v3

    const/4 v2, 0x1

    iget-object v4, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    aput-object v4, v5, v2

    array-length v6, v5

    move v4, v3

    :goto_0
    if-lt v4, v6, :cond_0

    .line 282
    return-void

    .line 279
    :cond_0
    aget-object v1, v5, v4

    .line 280
    .local v1, parentDir:Lcom/bv/sync/IFile;
    invoke-static {}, Lcom/bv/sync/CifsSync$Options$Direction;->values()[Lcom/bv/sync/CifsSync$Options$Direction;

    move-result-object v7

    array-length v8, v7

    move v2, v3

    :goto_1
    if-lt v2, v8, :cond_1

    .line 279
    add-int/lit8 v2, v4, 0x1

    move v4, v2

    goto :goto_0

    .line 280
    :cond_1
    aget-object v0, v7, v2

    .line 281
    .local v0, direction:Lcom/bv/sync/CifsSync$Options$Direction;
    invoke-direct {p0, v1, v0}, Lcom/bv/sync/FilterTest;->testExcludeProgress(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V

    .line 280
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public testHidden()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 314
    iget-object v4, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v5, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v4, v5}, Lcom/bv/sync/FilterTest;->makeFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/util/Collection;

    move-result-object v1

    .line 315
    .local v1, files:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 318
    new-array v2, v6, [Lcom/bv/sync/IFileFilter;

    const/4 v4, 0x0

    new-instance v5, Lcom/bv/sync/IgnoreHiddenFilter;

    invoke-direct {v5}, Lcom/bv/sync/IgnoreHiddenFilter;-><init>()V

    aput-object v5, v2, v4

    .line 319
    .local v2, filter:[Lcom/bv/sync/IFileFilter;
    new-instance v3, Lcom/bv/sync/CifsSync$Options;

    sget-object v4, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v5, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    invoke-direct {v3, v4, v6, v5, v2}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 320
    .local v3, options:Lcom/bv/sync/CifsSync$Options;
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-virtual {p0, v3}, Lcom/bv/sync/FilterTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v5

    invoke-static {v4, v5}, Lcom/bv/sync/FilterTest;->assertEquals(II)V

    .line 321
    return-void

    .line 315
    .end local v2           #filter:[Lcom/bv/sync/IFileFilter;
    .end local v3           #options:Lcom/bv/sync/CifsSync$Options;
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/IFile;

    .line 316
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 317
    invoke-direct {p0, v0}, Lcom/bv/sync/FilterTest;->addHiddenFiles(Lcom/bv/sync/IFile;)V

    goto :goto_0
.end method

.method public testIncludeFilesCopy()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v3, 0x0

    .line 53
    const/4 v4, 0x2

    new-array v1, v4, [Lcom/bv/sync/FilterTest$Combination;

    new-instance v4, Lcom/bv/sync/FilterTest$Combination;

    iget-object v5, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    sget-object v6, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-direct {v4, p0, v5, v6}, Lcom/bv/sync/FilterTest$Combination;-><init>(Lcom/bv/sync/FilterTest;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V

    aput-object v4, v1, v3

    .line 54
    new-instance v4, Lcom/bv/sync/FilterTest$Combination;

    iget-object v5, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    sget-object v6, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-direct {v4, p0, v5, v6}, Lcom/bv/sync/FilterTest$Combination;-><init>(Lcom/bv/sync/FilterTest;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V

    aput-object v4, v1, v8

    .line 57
    .local v1, combinations:[Lcom/bv/sync/FilterTest$Combination;
    array-length v4, v1

    :goto_0
    if-lt v3, v4, :cond_0

    .line 63
    return-void

    .line 57
    :cond_0
    aget-object v0, v1, v3

    .line 58
    .local v0, combination:Lcom/bv/sync/FilterTest$Combination;
    iget-object v5, v0, Lcom/bv/sync/FilterTest$Combination;->dir:Lcom/bv/sync/IFile;

    invoke-static {v5}, Lcom/bv/sync/FilterTest;->makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    .line 59
    new-instance v2, Lcom/bv/sync/CifsSync$Options;

    iget-object v5, v0, Lcom/bv/sync/FilterTest$Combination;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v6, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v7, 0x0

    invoke-direct {v2, v5, v8, v6, v7}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 60
    .local v2, options:Lcom/bv/sync/CifsSync$Options;
    iget-object v5, v0, Lcom/bv/sync/FilterTest$Combination;->dir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v5, v2}, Lcom/bv/sync/FilterTest;->testIncludeFileFilter(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options;)V

    .line 61
    invoke-virtual {p0}, Lcom/bv/sync/FilterTest;->setUp()V

    .line 57
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public testIncludeFilesMove()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v3, 0x0

    .line 66
    const/4 v4, 0x2

    new-array v1, v4, [Lcom/bv/sync/FilterTest$Combination;

    new-instance v4, Lcom/bv/sync/FilterTest$Combination;

    iget-object v5, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    sget-object v6, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-direct {v4, p0, v5, v6}, Lcom/bv/sync/FilterTest$Combination;-><init>(Lcom/bv/sync/FilterTest;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V

    aput-object v4, v1, v3

    .line 67
    new-instance v4, Lcom/bv/sync/FilterTest$Combination;

    iget-object v5, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    sget-object v6, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-direct {v4, p0, v5, v6}, Lcom/bv/sync/FilterTest$Combination;-><init>(Lcom/bv/sync/FilterTest;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V

    aput-object v4, v1, v8

    .line 69
    .local v1, combinations:[Lcom/bv/sync/FilterTest$Combination;
    array-length v4, v1

    :goto_0
    if-lt v3, v4, :cond_0

    .line 75
    return-void

    .line 69
    :cond_0
    aget-object v0, v1, v3

    .line 70
    .local v0, combination:Lcom/bv/sync/FilterTest$Combination;
    iget-object v5, v0, Lcom/bv/sync/FilterTest$Combination;->dir:Lcom/bv/sync/IFile;

    invoke-static {v5}, Lcom/bv/sync/FilterTest;->makeLeftFiles(Lcom/bv/sync/IFile;)Ljava/util/List;

    .line 71
    new-instance v2, Lcom/bv/sync/CifsSync$Options;

    iget-object v5, v0, Lcom/bv/sync/FilterTest$Combination;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v6, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v7, 0x0

    invoke-direct {v2, v5, v8, v6, v7}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 72
    .local v2, options:Lcom/bv/sync/CifsSync$Options;
    iget-object v5, v0, Lcom/bv/sync/FilterTest$Combination;->dir:Lcom/bv/sync/IFile;

    invoke-direct {p0, v5, v2}, Lcom/bv/sync/FilterTest;->testIncludeFileFilter(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options;)V

    .line 73
    invoke-virtual {p0}, Lcom/bv/sync/FilterTest;->setUp()V

    .line 69
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public testIncludeFilesSync()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v3, 0x0

    .line 43
    const/4 v4, 0x2

    new-array v1, v4, [Lcom/bv/sync/IFile;

    iget-object v4, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    aput-object v4, v1, v3

    iget-object v4, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    aput-object v4, v1, v8

    .line 44
    .local v1, dirs:[Lcom/bv/sync/IFile;
    array-length v4, v1

    :goto_0
    if-lt v3, v4, :cond_0

    .line 50
    return-void

    .line 44
    :cond_0
    aget-object v0, v1, v3

    .line 45
    .local v0, dir:Lcom/bv/sync/IFile;
    iget-object v5, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v6, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v5, v6}, Lcom/bv/sync/FilterTest;->makeFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/util/Collection;

    .line 46
    new-instance v2, Lcom/bv/sync/CifsSync$Options;

    sget-object v5, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v6, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v7, 0x0

    invoke-direct {v2, v5, v8, v6, v7}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 47
    .local v2, options:Lcom/bv/sync/CifsSync$Options;
    invoke-direct {p0, v0, v2}, Lcom/bv/sync/FilterTest;->testIncludeFileFilter(Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options;)V

    .line 48
    invoke-virtual {p0}, Lcom/bv/sync/FilterTest;->setUp()V

    .line 44
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public testReadProtected()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v5, 0x0

    .line 324
    iget-object v4, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    iget-object v6, p0, Lcom/bv/sync/FilterTest;->rightDir:Lcom/bv/sync/IFile;

    invoke-static {v4, v6}, Lcom/bv/sync/FilterTest;->makeFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Ljava/util/Collection;

    move-result-object v1

    .line 325
    .local v1, files:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/IFile;>;"
    iget-object v4, p0, Lcom/bv/sync/FilterTest;->leftDir:Lcom/bv/sync/IFile;

    invoke-interface {v4}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v6

    array-length v7, v6

    move v4, v5

    :goto_0
    if-lt v4, v7, :cond_0

    .line 328
    new-array v2, v9, [Lcom/bv/sync/IFileFilter;

    new-instance v4, Lcom/bv/sync/IgnoreReadProtectedFilter;

    invoke-direct {v4}, Lcom/bv/sync/IgnoreReadProtectedFilter;-><init>()V

    aput-object v4, v2, v5

    .line 329
    .local v2, filter:[Lcom/bv/sync/IFileFilter;
    new-instance v3, Lcom/bv/sync/CifsSync$Options;

    sget-object v4, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v5, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    invoke-direct {v3, v4, v9, v5, v2}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 330
    .local v3, options:Lcom/bv/sync/CifsSync$Options;
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-virtual {p0, v3}, Lcom/bv/sync/FilterTest;->sync(Lcom/bv/sync/CifsSync$Options;)Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v5

    invoke-static {v4, v5}, Lcom/bv/sync/FilterTest;->assertEquals(II)V

    .line 331
    return-void

    .line 325
    .end local v2           #filter:[Lcom/bv/sync/IFileFilter;
    .end local v3           #options:Lcom/bv/sync/CifsSync$Options;
    :cond_0
    aget-object v0, v6, v4

    .line 326
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 327
    invoke-direct {p0, v0}, Lcom/bv/sync/FilterTest;->addReadProtectedFiles(Lcom/bv/sync/IFile;)Ljava/util/Collection;

    .line 325
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public testincludeExtensions()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 170
    sget-object v0, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    invoke-direct {p0, v0}, Lcom/bv/sync/FilterTest;->testExtensionsFilter(Lcom/bv/sync/IFileFilter$Action;)V

    .line 171
    return-void
.end method
