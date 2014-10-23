.class public Lcom/bv/sync/FileManager;
.super Ljava/lang/Object;
.source "FileManager.java"


# instance fields
.field private canceled:Z

.field private currentSize:J

.field private progress:Lcom/bv/sync/ProgressNotification;

.field private sizeCalculator:Lcom/bv/sync/SizeCalculator;

.field private syncResult:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p1, syncResult:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/bv/sync/FileManager;->syncResult:Ljava/util/List;

    .line 26
    return-void
.end method

.method static synthetic access$0(Lcom/bv/sync/FileManager;)Z
    .locals 1
    .parameter

    .prologue
    .line 22
    iget-boolean v0, p0, Lcom/bv/sync/FileManager;->canceled:Z

    return v0
.end method

.method static synthetic access$1(Lcom/bv/sync/FileManager;Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/bv/sync/FileManager;->copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V

    return-void
.end method

.method static synthetic access$2(Lcom/bv/sync/FileManager;Lcom/bv/sync/IFile;Z)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/FileManager;->delete(Lcom/bv/sync/IFile;Z)V

    return-void
.end method

.method private copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V
    .locals 1
    .parameter "file"
    .parameter "destination"
    .parameter "delete"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/bv/sync/FileManager;->canceled:Z

    if-eqz v0, :cond_0

    .line 44
    new-instance v0, Ljava/util/concurrent/CancellationException;

    invoke-direct {v0}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v0

    .line 45
    :cond_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 46
    invoke-direct {p0, p1, p2, p3}, Lcom/bv/sync/FileManager;->copyDir(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)Lcom/bv/sync/IFile;

    .line 49
    :goto_0
    return-void

    .line 48
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/bv/sync/FileManager;->copyFile(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)Lcom/bv/sync/IFile;

    goto :goto_0
.end method

.method public static copy([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;Ljava/util/List;)V
    .locals 2
    .parameter "files"
    .parameter "destination"
    .parameter "progress"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/bv/sync/IFile;",
            "Lcom/bv/sync/IFile;",
            "Lcom/bv/sync/ProgressNotification;",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 251
    .local p3, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    new-instance v0, Lcom/bv/sync/FileManager;

    invoke-direct {v0, p3}, Lcom/bv/sync/FileManager;-><init>(Ljava/util/List;)V

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, v1, p2}, Lcom/bv/sync/FileManager;->copy([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;ZLcom/bv/sync/ProgressNotification;)V

    .line 252
    return-void
.end method

.method private copyBytes(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V
    .locals 8
    .parameter "source"
    .parameter "destination"
    .parameter "delete"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    const v5, 0xf000

    new-array v0, v5, [B

    .line 157
    .local v0, buffer:[B
    const/4 v1, 0x0

    .line 158
    .local v1, finished:Z
    invoke-interface {p2}, Lcom/bv/sync/IFile;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    .line 160
    .local v3, out:Ljava/io/OutputStream;
    :try_start_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v2

    .line 163
    .local v2, in:Ljava/io/InputStream;
    :goto_0
    :try_start_1
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    .local v4, size:I
    const/4 v5, -0x1

    if-ne v4, v5, :cond_1

    .line 168
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 170
    const/4 v1, 0x1

    .line 172
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 173
    if-nez v1, :cond_0

    .line 174
    invoke-interface {p2}, Lcom/bv/sync/IFile;->delete()V

    .line 176
    :cond_0
    return-void

    .line 164
    :cond_1
    const/4 v5, 0x0

    :try_start_3
    invoke-virtual {v3, v0, v5, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 165
    if-eqz p3, :cond_3

    sget-object v5, Lcom/bv/sync/ProgressNotification$ProgressAction;->Moving:Lcom/bv/sync/ProgressNotification$ProgressAction;

    :goto_1
    int-to-long v6, v4

    invoke-direct {p0, v5, v6, v7, p1}, Lcom/bv/sync/FileManager;->updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;JLcom/bv/sync/IFile;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 167
    .end local v4           #size:I
    :catchall_0
    move-exception v5

    .line 168
    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 169
    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 171
    .end local v2           #in:Ljava/io/InputStream;
    :catchall_1
    move-exception v5

    .line 172
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 173
    if-nez v1, :cond_2

    .line 174
    invoke-interface {p2}, Lcom/bv/sync/IFile;->delete()V

    .line 175
    :cond_2
    throw v5

    .line 165
    .restart local v2       #in:Ljava/io/InputStream;
    .restart local v4       #size:I
    :cond_3
    :try_start_5
    sget-object v5, Lcom/bv/sync/ProgressNotification$ProgressAction;->Copying:Lcom/bv/sync/ProgressNotification$ProgressAction;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1
.end method

.method private copyDir(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)Lcom/bv/sync/IFile;
    .locals 4
    .parameter "file"
    .parameter "parent"
    .parameter "delete"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    const/4 v0, 0x0

    .line 53
    .local v0, result:Lcom/bv/sync/IFile;
    if-eqz p3, :cond_0

    .line 54
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/FileManager;->tryMove(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 55
    :cond_0
    if-nez v0, :cond_3

    .line 56
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 57
    invoke-interface {v0}, Lcom/bv/sync/IFile;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 58
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Creating dir: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 59
    invoke-interface {v0}, Lcom/bv/sync/IFile;->mkdir()V

    .line 61
    :cond_1
    invoke-direct {p0, p1, v0, p3}, Lcom/bv/sync/FileManager;->copyFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V

    .line 62
    if-eqz p3, :cond_2

    .line 63
    invoke-interface {p1}, Lcom/bv/sync/IFile;->delete()V

    .line 64
    :cond_2
    invoke-direct {p0, p1, p2, v0}, Lcom/bv/sync/FileManager;->updateSyncResult(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 66
    :cond_3
    return-object v0
.end method

.method private copyFile(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)Lcom/bv/sync/IFile;
    .locals 7
    .parameter "file"
    .parameter "destination"
    .parameter "delete"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    const/4 v1, 0x0

    .line 120
    .local v1, result:Lcom/bv/sync/IFile;
    if-eqz p3, :cond_0

    .line 121
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/FileManager;->tryMove(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 122
    :cond_0
    if-nez v1, :cond_4

    .line 123
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "_(!).(!)_tmp"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v3}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v2

    .line 125
    .local v2, tmpFile:Lcom/bv/sync/IFile;
    :try_start_0
    invoke-direct {p0, p1, v2, p3}, Lcom/bv/sync/FileManager;->copyBytes(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    :goto_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v3}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v1

    .line 134
    invoke-interface {v1}, Lcom/bv/sync/IFile;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 135
    invoke-interface {v1}, Lcom/bv/sync/IFile;->delete()V

    .line 136
    :cond_1
    invoke-interface {v2, v1}, Lcom/bv/sync/IFile;->renameTo(Lcom/bv/sync/IFile;)V

    .line 138
    :try_start_1
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-ltz v3, :cond_2

    .line 139
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v3

    invoke-interface {v1, v3, v4}, Lcom/bv/sync/IFile;->setLastModified(J)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 142
    :cond_2
    :goto_1
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Creating file:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", setting modified: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 143
    if-eqz p3, :cond_3

    .line 144
    invoke-interface {p1}, Lcom/bv/sync/IFile;->delete()V

    .line 145
    :cond_3
    invoke-direct {p0, p1, p2, v1}, Lcom/bv/sync/FileManager;->updateSyncResult(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 147
    .end local v2           #tmpFile:Lcom/bv/sync/IFile;
    :cond_4
    return-object v1

    .line 126
    .restart local v2       #tmpFile:Lcom/bv/sync/IFile;
    :catch_0
    move-exception v0

    .line 127
    .local v0, e:Ljcifs/smb/SmbException;
    invoke-virtual {v0}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v3

    const v4, -0x3ffffff8

    if-eq v3, v4, :cond_5

    .line 128
    throw v0

    .line 129
    :cond_5
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v4, "Retrying copy file on invalid handle"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 130
    invoke-direct {p0, p1, v2, p3}, Lcom/bv/sync/FileManager;->copyBytes(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V

    goto :goto_0

    .line 140
    .end local v0           #e:Ljcifs/smb/SmbException;
    :catch_1
    move-exception v3

    goto :goto_1
.end method

.method private copyFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V
    .locals 3
    .parameter "source"
    .parameter "target"
    .parameter "delete"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    new-instance v2, Lcom/bv/sync/FileManager$1;

    invoke-direct {v2, p0, p2, p3}, Lcom/bv/sync/FileManager$1;-><init>(Lcom/bv/sync/FileManager;Lcom/bv/sync/IFile;Z)V

    invoke-interface {p1, v2}, Lcom/bv/sync/IFile;->listFiles(Lcom/bv/sync/IFileFilter;)[Lcom/bv/sync/IFile;

    move-result-object v0

    .line 81
    .local v0, files:[Lcom/bv/sync/IFile;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-lt v1, v2, :cond_0

    .line 83
    return-void

    .line 82
    :cond_0
    aget-object v2, v0, v1

    invoke-direct {p0, v2, p2, p3}, Lcom/bv/sync/FileManager;->copyDir(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)Lcom/bv/sync/IFile;

    .line 81
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private delete(Lcom/bv/sync/IFile;Z)V
    .locals 8
    .parameter "file"
    .parameter "isDirectory"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 225
    .local v1, absolutePath:Ljava/lang/String;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Removing: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 226
    new-instance v0, Lcom/bv/sync/SyncItem;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    sget-object v4, Lcom/bv/sync/SyncItem$Type;->Deleted:Lcom/bv/sync/SyncItem$Type;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v5

    move v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/bv/sync/SyncItem;-><init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JZ)V

    .line 227
    .local v0, syncItem:Lcom/bv/sync/SyncItem;
    invoke-interface {p1}, Lcom/bv/sync/IFile;->delete()V

    .line 228
    sget-object v2, Lcom/bv/sync/ProgressNotification$ProgressAction;->Deleting:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-direct {p0, v2, p1}, Lcom/bv/sync/FileManager;->updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;Lcom/bv/sync/IFile;)V

    .line 229
    iget-object v2, p0, Lcom/bv/sync/FileManager;->syncResult:Ljava/util/List;

    if-eqz v2, :cond_0

    .line 230
    iget-object v2, p0, Lcom/bv/sync/FileManager;->syncResult:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    :cond_0
    return-void
.end method

.method public static delete([Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;Ljava/util/List;)V
    .locals 1
    .parameter "files"
    .parameter "progress"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/bv/sync/IFile;",
            "Lcom/bv/sync/ProgressNotification;",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    .local p2, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    new-instance v0, Lcom/bv/sync/FileManager;

    invoke-direct {v0, p2}, Lcom/bv/sync/FileManager;-><init>(Ljava/util/List;)V

    invoke-virtual {v0, p0, p1}, Lcom/bv/sync/FileManager;->delete([Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)V

    .line 260
    return-void
.end method

.method private deleteDir(Lcom/bv/sync/IFile;)V
    .locals 3
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 234
    new-instance v2, Lcom/bv/sync/FileManager$2;

    invoke-direct {v2, p0}, Lcom/bv/sync/FileManager$2;-><init>(Lcom/bv/sync/FileManager;)V

    invoke-interface {p1, v2}, Lcom/bv/sync/IFile;->listFiles(Lcom/bv/sync/IFileFilter;)[Lcom/bv/sync/IFile;

    move-result-object v0

    .line 245
    .local v0, files:[Lcom/bv/sync/IFile;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-lt v1, v2, :cond_0

    .line 247
    const/4 v2, 0x1

    invoke-direct {p0, p1, v2}, Lcom/bv/sync/FileManager;->delete(Lcom/bv/sync/IFile;Z)V

    .line 248
    return-void

    .line 246
    :cond_0
    aget-object v2, v0, v1

    invoke-direct {p0, v2}, Lcom/bv/sync/FileManager;->deleteDir(Lcom/bv/sync/IFile;)V

    .line 245
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private enumerateMovedFiles(Lcom/bv/sync/IFile;Ljava/util/List;Lcom/bv/sync/SyncItem$Type;)V
    .locals 15
    .parameter "target"
    .parameter
    .parameter "type"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/IFile;",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;",
            "Lcom/bv/sync/SyncItem$Type;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    .local p2, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    invoke-interface/range {p1 .. p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v11

    .line 106
    .local v11, isDirectory:Z
    if-eqz v11, :cond_0

    .line 107
    invoke-interface/range {p1 .. p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v13

    array-length v14, v13

    const/4 v2, 0x0

    move v12, v2

    :goto_0
    if-lt v12, v14, :cond_1

    .line 115
    :cond_0
    new-instance v2, Lcom/bv/sync/SyncItem;

    invoke-interface/range {p1 .. p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-interface/range {p1 .. p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v4

    invoke-interface/range {p1 .. p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v7

    move-object/from16 v6, p3

    move v9, v11

    invoke-direct/range {v2 .. v9}, Lcom/bv/sync/SyncItem;-><init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JZ)V

    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    return-void

    .line 107
    :cond_1
    aget-object v10, v13, v12

    .line 108
    .local v10, child:Lcom/bv/sync/IFile;
    invoke-interface {v10}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 109
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-direct {p0, v10, v0, v1}, Lcom/bv/sync/FileManager;->enumerateMovedFiles(Lcom/bv/sync/IFile;Ljava/util/List;Lcom/bv/sync/SyncItem$Type;)V

    .line 107
    :goto_1
    add-int/lit8 v2, v12, 0x1

    move v12, v2

    goto :goto_0

    .line 111
    :cond_2
    new-instance v2, Lcom/bv/sync/SyncItem;

    invoke-interface {v10}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v10}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v4

    invoke-interface {v10}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v7

    const/4 v9, 0x0

    move-object/from16 v6, p3

    invoke-direct/range {v2 .. v9}, Lcom/bv/sync/SyncItem;-><init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JZ)V

    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public static move([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;Ljava/util/List;)V
    .locals 2
    .parameter "files"
    .parameter "destination"
    .parameter "progress"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/bv/sync/IFile;",
            "Lcom/bv/sync/IFile;",
            "Lcom/bv/sync/ProgressNotification;",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    .local p3, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    new-instance v0, Lcom/bv/sync/FileManager;

    invoke-direct {v0, p3}, Lcom/bv/sync/FileManager;-><init>(Ljava/util/List;)V

    const/4 v1, 0x1

    invoke-virtual {v0, p0, p1, v1, p2}, Lcom/bv/sync/FileManager;->copy([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;ZLcom/bv/sync/ProgressNotification;)V

    .line 256
    return-void
.end method

.method private tryMove(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Lcom/bv/sync/IFile;
    .locals 6
    .parameter "file"
    .parameter "parent"

    .prologue
    .line 86
    instance-of v5, p1, Lcom/bv/sync/LocalFile;

    if-eqz v5, :cond_0

    instance-of v5, p2, Lcom/bv/sync/LocalFile;

    if-nez v5, :cond_2

    .line 87
    :cond_0
    instance-of v5, p1, Lcom/bv/sync/RemoteFile;

    if-eqz v5, :cond_1

    instance-of v5, p2, Lcom/bv/sync/RemoteFile;

    if-nez v5, :cond_2

    .line 86
    :cond_1
    const/4 v1, 0x0

    .line 88
    .local v1, isMovable:Z
    :goto_0
    if-eqz v1, :cond_4

    .line 90
    :try_start_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2, v5}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v3

    .line 91
    .local v3, result:Lcom/bv/sync/IFile;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .local v2, moveSource:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    instance-of v5, p2, Lcom/bv/sync/LocalFile;

    if-eqz v5, :cond_3

    sget-object v4, Lcom/bv/sync/SyncItem$Type;->LocalFile:Lcom/bv/sync/SyncItem$Type;

    .line 93
    .local v4, type:Lcom/bv/sync/SyncItem$Type;
    :goto_1
    invoke-direct {p0, p1, v2, v4}, Lcom/bv/sync/FileManager;->enumerateMovedFiles(Lcom/bv/sync/IFile;Ljava/util/List;Lcom/bv/sync/SyncItem$Type;)V

    .line 94
    invoke-interface {p1, v3}, Lcom/bv/sync/IFile;->renameTo(Lcom/bv/sync/IFile;)V

    .line 95
    iget-object v5, p0, Lcom/bv/sync/FileManager;->syncResult:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 101
    .end local v2           #moveSource:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    .end local v3           #result:Lcom/bv/sync/IFile;
    .end local v4           #type:Lcom/bv/sync/SyncItem$Type;
    :goto_2
    return-object v3

    .line 86
    .end local v1           #isMovable:Z
    :cond_2
    const/4 v1, 0x1

    goto :goto_0

    .line 92
    .restart local v1       #isMovable:Z
    .restart local v2       #moveSource:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    .restart local v3       #result:Lcom/bv/sync/IFile;
    :cond_3
    sget-object v4, Lcom/bv/sync/SyncItem$Type;->RemoteFile:Lcom/bv/sync/SyncItem$Type;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 97
    .end local v2           #moveSource:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    .end local v3           #result:Lcom/bv/sync/IFile;
    :catch_0
    move-exception v0

    .line 98
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 101
    .end local v0           #e:Ljava/io/IOException;
    :cond_4
    const/4 v3, 0x0

    goto :goto_2
.end method

.method private updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;JLcom/bv/sync/IFile;)V
    .locals 5
    .parameter "action"
    .parameter "size"
    .parameter "file"

    .prologue
    .line 179
    iget-wide v1, p0, Lcom/bv/sync/FileManager;->currentSize:J

    add-long/2addr v1, p2

    iput-wide v1, p0, Lcom/bv/sync/FileManager;->currentSize:J

    .line 180
    iget-object v1, p0, Lcom/bv/sync/FileManager;->progress:Lcom/bv/sync/ProgressNotification;

    if-eqz v1, :cond_2

    .line 181
    const/4 v0, 0x0

    .line 182
    .local v0, percent:I
    iget-object v1, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v1}, Lcom/bv/sync/SizeCalculator;->getSize()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 183
    iget-wide v1, p0, Lcom/bv/sync/FileManager;->currentSize:J

    long-to-float v1, v1

    iget-object v2, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v2}, Lcom/bv/sync/SizeCalculator;->getSize()J

    move-result-wide v2

    long-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x42c8

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 184
    :cond_0
    iget-object v1, p0, Lcom/bv/sync/FileManager;->progress:Lcom/bv/sync/ProgressNotification;

    invoke-interface {v1, p1, v0, p4}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/bv/sync/FileManager;->canceled:Z

    .line 185
    iget-boolean v1, p0, Lcom/bv/sync/FileManager;->canceled:Z

    if-eqz v1, :cond_2

    .line 186
    iget-object v1, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v1}, Lcom/bv/sync/SizeCalculator;->cancel()V

    .line 187
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v1

    .line 184
    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    .line 190
    .end local v0           #percent:I
    :cond_2
    return-void
.end method

.method private updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;Lcom/bv/sync/IFile;)V
    .locals 5
    .parameter "action"
    .parameter "file"

    .prologue
    .line 193
    iget-wide v1, p0, Lcom/bv/sync/FileManager;->currentSize:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/bv/sync/FileManager;->currentSize:J

    .line 194
    iget-object v1, p0, Lcom/bv/sync/FileManager;->progress:Lcom/bv/sync/ProgressNotification;

    if-eqz v1, :cond_2

    .line 195
    const/4 v0, 0x0

    .line 196
    .local v0, percent:I
    iget-object v1, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v1}, Lcom/bv/sync/SizeCalculator;->getCount()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 197
    iget-wide v1, p0, Lcom/bv/sync/FileManager;->currentSize:J

    long-to-float v1, v1

    iget-object v2, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v2}, Lcom/bv/sync/SizeCalculator;->getCount()J

    move-result-wide v2

    long-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x42c8

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 198
    :cond_0
    iget-object v1, p0, Lcom/bv/sync/FileManager;->progress:Lcom/bv/sync/ProgressNotification;

    invoke-interface {v1, p1, v0, p2}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/bv/sync/FileManager;->canceled:Z

    .line 199
    iget-boolean v1, p0, Lcom/bv/sync/FileManager;->canceled:Z

    if-eqz v1, :cond_2

    .line 200
    iget-object v1, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v1}, Lcom/bv/sync/SizeCalculator;->cancel()V

    .line 201
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v1

    .line 198
    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    .line 204
    .end local v0           #percent:I
    :cond_2
    return-void
.end method

.method private updateSyncResult(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 9
    .parameter "file"
    .parameter "destination"
    .parameter "result"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Lcom/bv/sync/FileManager;->syncResult:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 152
    iget-object v8, p0, Lcom/bv/sync/FileManager;->syncResult:Ljava/util/List;

    new-instance v0, Lcom/bv/sync/SyncItem;

    invoke-interface {p3}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p3}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    instance-of v4, p2, Lcom/bv/sync/LocalFile;

    if-eqz v4, :cond_1

    sget-object v4, Lcom/bv/sync/SyncItem$Type;->LocalFile:Lcom/bv/sync/SyncItem$Type;

    :goto_0
    invoke-interface {p3}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v5

    invoke-interface {p3}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v7

    invoke-direct/range {v0 .. v7}, Lcom/bv/sync/SyncItem;-><init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JZ)V

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    :cond_0
    return-void

    .line 152
    :cond_1
    sget-object v4, Lcom/bv/sync/SyncItem$Type;->RemoteFile:Lcom/bv/sync/SyncItem$Type;

    goto :goto_0
.end method


# virtual methods
.method copy([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;ZLcom/bv/sync/ProgressNotification;)V
    .locals 5
    .parameter "files"
    .parameter "destination"
    .parameter "delete"
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    iput-object p4, p0, Lcom/bv/sync/FileManager;->progress:Lcom/bv/sync/ProgressNotification;

    .line 30
    new-instance v1, Lcom/bv/sync/SizeCalculator;

    invoke-direct {v1, p1}, Lcom/bv/sync/SizeCalculator;-><init>([Lcom/bv/sync/IFile;)V

    iput-object v1, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    .line 31
    iget-object v1, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v1}, Lcom/bv/sync/SizeCalculator;->start()V

    .line 34
    :try_start_0
    array-length v2, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_0

    .line 38
    iget-object v1, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v1}, Lcom/bv/sync/SizeCalculator;->cancel()V

    .line 40
    return-void

    .line 34
    :cond_0
    :try_start_1
    aget-object v0, p1, v1

    .line 35
    .local v0, file:Lcom/bv/sync/IFile;
    new-instance v3, Ljava/io/File;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 36
    invoke-direct {p0, v0, p2, p3}, Lcom/bv/sync/FileManager;->copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 37
    .end local v0           #file:Lcom/bv/sync/IFile;
    :catchall_0
    move-exception v1

    .line 38
    iget-object v2, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v2}, Lcom/bv/sync/SizeCalculator;->cancel()V

    .line 39
    throw v1
.end method

.method delete([Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)V
    .locals 4
    .parameter "files"
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 207
    iput-object p2, p0, Lcom/bv/sync/FileManager;->progress:Lcom/bv/sync/ProgressNotification;

    .line 208
    new-instance v2, Lcom/bv/sync/SizeCalculator;

    invoke-direct {v2, p1}, Lcom/bv/sync/SizeCalculator;-><init>([Lcom/bv/sync/IFile;)V

    iput-object v2, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    .line 209
    iget-object v2, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v2}, Lcom/bv/sync/SizeCalculator;->start()V

    .line 212
    :try_start_0
    array-length v2, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    if-lt v1, v2, :cond_0

    .line 219
    iget-object v1, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v1}, Lcom/bv/sync/SizeCalculator;->cancel()V

    .line 221
    return-void

    .line 212
    :cond_0
    :try_start_1
    aget-object v0, p1, v1

    .line 213
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 214
    invoke-direct {p0, v0}, Lcom/bv/sync/FileManager;->deleteDir(Lcom/bv/sync/IFile;)V

    .line 212
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 216
    :cond_1
    const/4 v3, 0x0

    invoke-direct {p0, v0, v3}, Lcom/bv/sync/FileManager;->delete(Lcom/bv/sync/IFile;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 218
    .end local v0           #file:Lcom/bv/sync/IFile;
    :catchall_0
    move-exception v1

    .line 219
    iget-object v2, p0, Lcom/bv/sync/FileManager;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v2}, Lcom/bv/sync/SizeCalculator;->cancel()V

    .line 220
    throw v1
.end method
