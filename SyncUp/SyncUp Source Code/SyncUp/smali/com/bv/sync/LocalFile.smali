.class public Lcom/bv/sync/LocalFile;
.super Ljava/lang/Object;
.source "LocalFile.java"

# interfaces
.implements Lcom/bv/sync/IFile;


# static fields
.field private static final serialVersionUID:J = 0x2fbe15ee00a92ad7L


# instance fields
.field protected final file:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 0
    .parameter "file"

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "path"

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    .line 22
    return-void
.end method

.method private isReadable()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v2, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "(Access is denied)"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 126
    const/4 v1, 0x0

    goto :goto_0

    .line 127
    :cond_0
    throw v0
.end method


# virtual methods
.method public canRead()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    invoke-static {}, Lcom/bv/sync/Utils;->isWindows()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 113
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 114
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 118
    :goto_0
    return v0

    .line 114
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 115
    :cond_1
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 116
    invoke-direct {p0}, Lcom/bv/sync/LocalFile;->isReadable()Z

    move-result v0

    goto :goto_0

    .line 118
    :cond_2
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v0

    goto :goto_0
.end method

.method public createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;
    .locals 2
    .parameter "name"

    .prologue
    .line 30
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/bv/sync/LocalFile;->getNewFile(Ljava/io/File;)Lcom/bv/sync/LocalFile;

    move-result-object v0

    return-object v0
.end method

.method public delete()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 153
    new-instance v0, Lcom/bv/sync/ErrorCodeException;

    const/4 v1, 0x5

    invoke-virtual {p0}, Lcom/bv/sync/LocalFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/ErrorCodeException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 154
    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .parameter "obj"

    .prologue
    const/4 v0, 0x0

    .line 181
    if-ne p1, p0, :cond_1

    .line 182
    const/4 v0, 0x1

    .line 187
    .end local p1
    :cond_0
    :goto_0
    return v0

    .line 183
    .restart local p1
    :cond_1
    if-eqz p1, :cond_0

    .line 185
    instance-of v1, p1, Lcom/bv/sync/LocalFile;

    if-eqz v1, :cond_0

    .line 186
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    check-cast p1, Lcom/bv/sync/LocalFile;

    .end local p1
    iget-object v1, p1, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public exists()Z
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public getAbsolutePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFreeSpace()J
    .locals 2

    .prologue
    .line 192
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getFreeSpace()J

    move-result-wide v0

    return-wide v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 40
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public getLastModified()J
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getNewFile(Ljava/io/File;)Lcom/bv/sync/LocalFile;
    .locals 1
    .parameter "file"

    .prologue
    .line 25
    new-instance v0, Lcom/bv/sync/LocalFile;

    invoke-direct {v0, p1}, Lcom/bv/sync/LocalFile;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 50
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public getParent()Lcom/bv/sync/IFile;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bv/sync/LocalFile;->getNewFile(Ljava/io/File;)Lcom/bv/sync/LocalFile;

    move-result-object v0

    return-object v0
.end method

.method public isDirectory()Z
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    return v0
.end method

.method public isFile()Z
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    return v0
.end method

.method public isHidden()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isHidden()Z

    move-result v0

    return v0
.end method

.method public isSymlink()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public length()J
    .locals 2

    .prologue
    .line 139
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public listFiles()[Lcom/bv/sync/IFile;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    iget-object v3, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 78
    .local v0, files:[Ljava/io/File;
    if-nez v0, :cond_0

    .line 79
    new-instance v3, Lcom/bv/sync/ErrorCodeException;

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/bv/sync/ErrorCodeException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 80
    :cond_0
    array-length v3, v0

    new-array v2, v3, [Lcom/bv/sync/LocalFile;

    .line 81
    .local v2, result:[Lcom/bv/sync/LocalFile;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v2

    if-lt v1, v3, :cond_1

    .line 83
    return-object v2

    .line 82
    :cond_1
    aget-object v3, v0, v1

    invoke-virtual {p0, v3}, Lcom/bv/sync/LocalFile;->getNewFile(Ljava/io/File;)Lcom/bv/sync/LocalFile;

    move-result-object v3

    aput-object v3, v2, v1

    .line 81
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public listFiles(Lcom/bv/sync/IFileFilter;)[Lcom/bv/sync/IFile;
    .locals 7
    .parameter "filter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    iget-object v4, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, names:[Ljava/lang/String;
    if-nez v2, :cond_0

    .line 90
    new-instance v4, Lcom/bv/sync/ErrorCodeException;

    const/4 v5, 0x2

    iget-object v6, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/bv/sync/ErrorCodeException;-><init>(ILjava/lang/String;)V

    throw v4

    .line 91
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .local v3, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v4, v2

    if-lt v0, v4, :cond_1

    .line 98
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Lcom/bv/sync/IFile;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/bv/sync/IFile;

    return-object v4

    .line 93
    :cond_1
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    aget-object v6, v2, v0

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p0, v4}, Lcom/bv/sync/LocalFile;->getNewFile(Ljava/io/File;)Lcom/bv/sync/LocalFile;

    move-result-object v1

    .line 94
    .local v1, localFile:Lcom/bv/sync/LocalFile;
    const/4 v4, 0x0

    aput-object v4, v2, v0

    .line 95
    if-eqz p1, :cond_2

    invoke-interface {p1, v1}, Lcom/bv/sync/IFileFilter;->accept(Lcom/bv/sync/IFile;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 96
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public mkdir()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Lcom/bv/sync/ErrorCodeException;

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/ErrorCodeException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 105
    :cond_0
    return-void
.end method

.method public openFile(Ljava/lang/String;)Lcom/bv/sync/IFile;
    .locals 2
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 173
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/bv/sync/LocalFile;->getNewFile(Ljava/io/File;)Lcom/bv/sync/LocalFile;

    move-result-object v0

    .line 174
    .local v0, result:Lcom/bv/sync/LocalFile;
    invoke-virtual {v0}, Lcom/bv/sync/LocalFile;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 175
    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-direct {v1, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 176
    :cond_0
    return-object v0
.end method

.method public renameTo(Lcom/bv/sync/IFile;)V
    .locals 4
    .parameter "newFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    instance-of v0, p1, Lcom/bv/sync/LocalFile;

    if-nez v0, :cond_0

    .line 145
    new-instance v0, Ljava/io/InvalidClassException;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Invalid class"

    invoke-direct {v0, v1, v2}, Ljava/io/InvalidClassException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 146
    :cond_0
    iget-object v1, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    move-object v0, p1

    check-cast v0, Lcom/bv/sync/LocalFile;

    iget-object v0, v0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 147
    new-instance v0, Lcom/bv/sync/ErrorCodeException;

    const/4 v1, 0x4

    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/ErrorCodeException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 148
    :cond_1
    return-void
.end method

.method public setLastModified(J)V
    .locals 3
    .parameter "time"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lcom/bv/sync/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0, p1, p2}, Ljava/io/File;->setLastModified(J)Z

    move-result v0

    if-nez v0, :cond_0

    .line 66
    new-instance v0, Lcom/bv/sync/ErrorCodeException;

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/bv/sync/LocalFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/ErrorCodeException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 67
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/bv/sync/LocalFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
