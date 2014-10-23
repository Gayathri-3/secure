.class public Lcom/bv/sync/IgnoreReadProtectedFilter;
.super Ljava/lang/Object;
.source "IgnoreReadProtectedFilter.java"

# interfaces
.implements Lcom/bv/sync/IFileFilter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private canRead(Lcom/bv/sync/IFile;)Z
    .locals 4
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16
    invoke-interface {p1}, Lcom/bv/sync/IFile;->canRead()Z

    move-result v1

    .line 17
    .local v1, result:Z
    if-eqz v1, :cond_0

    instance-of v2, p1, Lcom/bv/sync/RemoteFile;

    if-eqz v2, :cond_0

    .line 19
    :try_start_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 20
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    .line 29
    .end local v1           #result:Z
    :cond_0
    :goto_0
    return v1

    .line 22
    .restart local v1       #result:Z
    :cond_1
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljcifs/smb/SmbAuthException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 23
    :catch_0
    move-exception v0

    .line 24
    .local v0, e:Ljcifs/smb/SmbAuthException;
    invoke-virtual {v0}, Ljcifs/smb/SmbAuthException;->getNtStatus()I

    move-result v2

    const v3, -0x3fffffde

    if-ne v2, v3, :cond_2

    .line 25
    const/4 v1, 0x0

    goto :goto_0

    .line 26
    :cond_2
    throw v0
.end method


# virtual methods
.method public accept(Lcom/bv/sync/IFile;)Z
    .locals 1
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/bv/sync/IgnoreReadProtectedFilter;->canRead(Lcom/bv/sync/IFile;)Z

    move-result v0

    return v0
.end method
