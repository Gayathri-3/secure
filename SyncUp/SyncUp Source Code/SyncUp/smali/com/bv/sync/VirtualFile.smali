.class public Lcom/bv/sync/VirtualFile;
.super Ljava/lang/Object;
.source "VirtualFile.java"

# interfaces
.implements Lcom/bv/sync/IFile;


# static fields
.field private static final serialVersionUID:J = -0x4b6d67d5a596bbf7L


# instance fields
.field private canRead:Z

.field private exists:Z

.field private files:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;"
        }
    .end annotation
.end field

.field private isDirectory:Z

.field private isFile:Z

.field private isHidden:Z

.field private lastModified:J

.field private length:J

.field private name:Ljava/lang/String;

.field private transient parent:Lcom/bv/sync/VirtualFile;

.field private path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/bv/sync/IFile;)V
    .locals 6
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    .line 29
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/bv/sync/VirtualFile;->path:Ljava/lang/String;

    .line 30
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v1

    iput-boolean v1, p0, Lcom/bv/sync/VirtualFile;->isDirectory:Z

    .line 31
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/bv/sync/VirtualFile;->isFile:Z

    .line 32
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isHidden()Z

    move-result v1

    iput-boolean v1, p0, Lcom/bv/sync/VirtualFile;->isHidden:Z

    .line 33
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/bv/sync/VirtualFile;->lastModified:J

    .line 34
    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/bv/sync/VirtualFile;->length:J

    .line 35
    invoke-interface {p1}, Lcom/bv/sync/IFile;->canRead()Z

    move-result v1

    iput-boolean v1, p0, Lcom/bv/sync/VirtualFile;->canRead:Z

    .line 36
    invoke-interface {p1}, Lcom/bv/sync/IFile;->exists()Z

    move-result v1

    iput-boolean v1, p0, Lcom/bv/sync/VirtualFile;->exists:Z

    .line 37
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    .line 38
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 39
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v1

    array-length v3, v1

    :goto_1
    if-lt v2, v3, :cond_2

    .line 41
    :cond_0
    return-void

    .line 31
    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    .line 39
    :cond_2
    aget-object v0, v1, v2

    .line 40
    .local v0, child:Lcom/bv/sync/IFile;
    iget-object v4, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    new-instance v5, Lcom/bv/sync/VirtualFile;

    invoke-direct {v5, v0, p0}, Lcom/bv/sync/VirtualFile;-><init>(Lcom/bv/sync/IFile;Lcom/bv/sync/VirtualFile;)V

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 39
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private constructor <init>(Lcom/bv/sync/IFile;Lcom/bv/sync/VirtualFile;)V
    .locals 0
    .parameter "file"
    .parameter "parent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/bv/sync/VirtualFile;-><init>(Lcom/bv/sync/IFile;)V

    .line 45
    iput-object p2, p0, Lcom/bv/sync/VirtualFile;->parent:Lcom/bv/sync/VirtualFile;

    .line 46
    return-void
.end method

.method private constructor <init>(Lcom/bv/sync/VirtualFile;)V
    .locals 1
    .parameter "parent"

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    .line 49
    iput-object p1, p0, Lcom/bv/sync/VirtualFile;->parent:Lcom/bv/sync/VirtualFile;

    .line 50
    return-void
.end method

.method private add(Lcom/bv/sync/VirtualFile;)V
    .locals 1
    .parameter "virtualFile"

    .prologue
    .line 122
    iget-object v0, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 123
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 125
    return-void
.end method

.method private remove(Lcom/bv/sync/VirtualFile;)V
    .locals 3
    .parameter "file"

    .prologue
    .line 128
    iget-object v2, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    monitor-enter v2

    .line 129
    :try_start_0
    iget-object v1, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 130
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/sync/IFile;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 128
    monitor-exit v2

    .line 134
    return-void

    .line 131
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_0

    .line 132
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 128
    .end local v0           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/sync/IFile;>;"
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
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
    .line 138
    iget-boolean v0, p0, Lcom/bv/sync/VirtualFile;->canRead:Z

    return v0
.end method

.method public createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;
    .locals 6
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 54
    iget-boolean v2, p0, Lcom/bv/sync/VirtualFile;->isDirectory:Z

    if-nez v2, :cond_0

    .line 55
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Not a directory"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 56
    :cond_0
    iget-object v2, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    if-eqz v2, :cond_2

    .line 57
    iget-object v3, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    monitor-enter v3

    .line 58
    :try_start_0
    iget-object v2, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    .line 57
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    :cond_2
    new-instance v1, Lcom/bv/sync/VirtualFile;

    invoke-direct {v1, p0}, Lcom/bv/sync/VirtualFile;-><init>(Lcom/bv/sync/VirtualFile;)V

    .line 64
    .local v1, result:Lcom/bv/sync/VirtualFile;
    iput-boolean v5, v1, Lcom/bv/sync/VirtualFile;->canRead:Z

    .line 65
    iput-boolean v5, v1, Lcom/bv/sync/VirtualFile;->isHidden:Z

    .line 66
    iput-boolean v5, v1, Lcom/bv/sync/VirtualFile;->isDirectory:Z

    .line 67
    iput-boolean v5, v1, Lcom/bv/sync/VirtualFile;->isFile:Z

    .line 68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/bv/sync/VirtualFile;->lastModified:J

    .line 69
    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/bv/sync/VirtualFile;->path:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/bv/sync/VirtualFile;->path:Ljava/lang/String;

    .line 70
    iget-object v2, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-object v0, v1

    .line 71
    .end local v1           #result:Lcom/bv/sync/VirtualFile;
    :goto_0
    return-object v0

    .line 58
    :cond_3
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/IFile;

    .line 59
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 60
    monitor-exit v3

    goto :goto_0

    .line 57
    .end local v0           #file:Lcom/bv/sync/IFile;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public delete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    iget-object v0, p0, Lcom/bv/sync/VirtualFile;->parent:Lcom/bv/sync/VirtualFile;

    invoke-direct {v0, p0}, Lcom/bv/sync/VirtualFile;->remove(Lcom/bv/sync/VirtualFile;)V

    .line 77
    return-void
.end method

.method public exists()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    iget-boolean v0, p0, Lcom/bv/sync/VirtualFile;->exists:Z

    return v0
.end method

.method public getAbsolutePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/bv/sync/VirtualFile;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getFreeSpace()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 213
    const-wide v0, 0x7fffffffffffffffL

    return-wide v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLastModified()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    iget-wide v0, p0, Lcom/bv/sync/VirtualFile;->lastModified:J

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/bv/sync/VirtualFile;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 87
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/bv/sync/VirtualFile;->path:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 88
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/sync/VirtualFile;->name:Ljava/lang/String;

    goto :goto_0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    const/4 v0, 0x0

    return-object v0
.end method

.method public getParent()Lcom/bv/sync/IFile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    iget-object v0, p0, Lcom/bv/sync/VirtualFile;->parent:Lcom/bv/sync/VirtualFile;

    return-object v0
.end method

.method public isDirectory()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    iget-boolean v0, p0, Lcom/bv/sync/VirtualFile;->isDirectory:Z

    return v0
.end method

.method public isFile()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    iget-boolean v0, p0, Lcom/bv/sync/VirtualFile;->isFile:Z

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
    .line 173
    iget-boolean v0, p0, Lcom/bv/sync/VirtualFile;->isHidden:Z

    return v0
.end method

.method public isSymlink()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    const/4 v0, 0x0

    return v0
.end method

.method public length()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    iget-wide v0, p0, Lcom/bv/sync/VirtualFile;->length:J

    return-wide v0
.end method

.method public listFiles()[Lcom/bv/sync/IFile;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    iget-object v0, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    iget-object v1, p0, Lcom/bv/sync/VirtualFile;->files:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Lcom/bv/sync/IFile;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/bv/sync/IFile;

    return-object v0
.end method

.method public listFiles(Lcom/bv/sync/IFileFilter;)[Lcom/bv/sync/IFile;
    .locals 6
    .parameter "filter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    invoke-virtual {p0}, Lcom/bv/sync/VirtualFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v1

    .line 199
    .local v1, list:[Lcom/bv/sync/IFile;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 200
    .local v2, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    array-length v4, v1

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v4, :cond_0

    .line 203
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lcom/bv/sync/IFile;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/bv/sync/IFile;

    return-object v3

    .line 200
    :cond_0
    aget-object v0, v1, v3

    .line 201
    .local v0, file:Lcom/bv/sync/IFile;
    if-eqz p1, :cond_1

    invoke-interface {p1, v0}, Lcom/bv/sync/IFileFilter;->accept(Lcom/bv/sync/IFile;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 202
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public mkdir()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 103
    iput-boolean v0, p0, Lcom/bv/sync/VirtualFile;->isDirectory:Z

    .line 104
    iput-boolean v0, p0, Lcom/bv/sync/VirtualFile;->exists:Z

    .line 105
    iput-boolean v0, p0, Lcom/bv/sync/VirtualFile;->canRead:Z

    .line 106
    iget-object v0, p0, Lcom/bv/sync/VirtualFile;->parent:Lcom/bv/sync/VirtualFile;

    invoke-direct {v0, p0}, Lcom/bv/sync/VirtualFile;->add(Lcom/bv/sync/VirtualFile;)V

    .line 107
    return-void
.end method

.method public openFile(Ljava/lang/String;)Lcom/bv/sync/IFile;
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 208
    const/4 v0, 0x0

    return-object v0
.end method

.method public renameTo(Lcom/bv/sync/IFile;)V
    .locals 3
    .parameter "newFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    iget-object v2, p0, Lcom/bv/sync/VirtualFile;->parent:Lcom/bv/sync/VirtualFile;

    invoke-direct {v2, p0}, Lcom/bv/sync/VirtualFile;->remove(Lcom/bv/sync/VirtualFile;)V

    move-object v1, p1

    .line 113
    check-cast v1, Lcom/bv/sync/VirtualFile;

    .line 114
    .local v1, virtualFile:Lcom/bv/sync/VirtualFile;
    iget-object v2, v1, Lcom/bv/sync/VirtualFile;->parent:Lcom/bv/sync/VirtualFile;

    invoke-direct {v2, v1}, Lcom/bv/sync/VirtualFile;->remove(Lcom/bv/sync/VirtualFile;)V

    .line 115
    iget-object v2, v1, Lcom/bv/sync/VirtualFile;->parent:Lcom/bv/sync/VirtualFile;

    invoke-direct {v2, p0}, Lcom/bv/sync/VirtualFile;->add(Lcom/bv/sync/VirtualFile;)V

    .line 116
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, newName:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/bv/sync/VirtualFile;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 118
    iput-object v0, p0, Lcom/bv/sync/VirtualFile;->name:Ljava/lang/String;

    .line 119
    :cond_0
    return-void
.end method

.method public setLastModified(J)V
    .locals 0
    .parameter "time"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    iput-wide p1, p0, Lcom/bv/sync/VirtualFile;->lastModified:J

    .line 184
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 188
    invoke-virtual {p0}, Lcom/bv/sync/VirtualFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
