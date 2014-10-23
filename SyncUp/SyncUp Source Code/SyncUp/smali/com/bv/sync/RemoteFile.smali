.class public Lcom/bv/sync/RemoteFile;
.super Ljava/lang/Object;
.source "RemoteFile.java"

# interfaces
.implements Lcom/bv/sync/IFile;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/RemoteFile$IORunnable;,
        Lcom/bv/sync/RemoteFile$Retry;,
        Lcom/bv/sync/RemoteFile$RetryInputStream;,
        Lcom/bv/sync/RemoteFile$RetryOutputStream;
    }
.end annotation


# static fields
.field private static transient retryCount:I = 0x0

.field private static final serialVersionUID:J = -0x6c8f5aa0f209cdfcL

.field static transient totalRetryCount:I


# instance fields
.field private transient file:Ljcifs/smb/SmbFile;

.field private transient ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

.field private transient parent:Lcom/bv/sync/IFile;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "domain"
    .parameter "user"
    .parameter "password"
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    new-instance v0, Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v0, p1, p2, p3}, Ljcifs/smb/NtlmPasswordAuthentication;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0, p4}, Lcom/bv/sync/RemoteFile;-><init>(Ljcifs/smb/NtlmPasswordAuthentication;Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method private constructor <init>(Ljcifs/smb/NtlmPasswordAuthentication;Ljava/lang/String;)V
    .locals 1
    .parameter "ntlm"
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    .line 61
    new-instance v0, Ljcifs/smb/SmbFile;

    invoke-direct {v0, p2, p1}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V

    iput-object v0, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    .line 62
    new-instance v0, Lcom/bv/sync/RemoteFile$1;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$1;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    .line 69
    return-void
.end method

.method constructor <init>(Ljcifs/smb/SmbFile;Lcom/bv/sync/IFile;Ljcifs/smb/NtlmPasswordAuthentication;)V
    .locals 0
    .parameter "file"
    .parameter "parent"
    .parameter "ntlm"

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    .line 73
    iput-object p2, p0, Lcom/bv/sync/RemoteFile;->parent:Lcom/bv/sync/IFile;

    .line 74
    iput-object p3, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    .line 75
    return-void
.end method

.method static synthetic access$0()I
    .locals 1

    .prologue
    .line 28
    sget v0, Lcom/bv/sync/RemoteFile;->retryCount:I

    return v0
.end method

.method static synthetic access$1(Lcom/bv/sync/RemoteFile;)Ljcifs/smb/SmbFile;
    .locals 1
    .parameter

    .prologue
    .line 25
    iget-object v0, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    return-object v0
.end method

.method static synthetic access$2(Lcom/bv/sync/RemoteFile;)Ljcifs/smb/NtlmPasswordAuthentication;
    .locals 1
    .parameter

    .prologue
    .line 27
    iget-object v0, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    return-object v0
.end method

.method private isShare(Ljcifs/smb/SmbFile;)Z
    .locals 2
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 409
    invoke-virtual {p1}, Ljcifs/smb/SmbFile;->getType()I

    move-result v0

    .line 410
    .local v0, type:I
    and-int/lit8 v1, v0, 0x40

    if-nez v1, :cond_0

    .line 411
    and-int/lit8 v1, v0, 0x20

    if-nez v1, :cond_0

    .line 412
    and-int/lit8 v1, v0, 0x10

    if-nez v1, :cond_0

    .line 410
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 6
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 41
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 42
    .local v2, path:Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 43
    .local v0, domain:Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 44
    .local v3, user:Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 45
    .local v1, password:Ljava/lang/String;
    new-instance v4, Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v4, v0, v3, v1}, Ljcifs/smb/NtlmPasswordAuthentication;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v4, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    .line 46
    new-instance v4, Ljcifs/smb/SmbFile;

    iget-object v5, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v4, v2, v5}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V

    iput-object v4, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    .line 47
    return-void
.end method

.method public static setRetryCount(I)V
    .locals 0
    .parameter "count"

    .prologue
    .line 52
    sput p0, Lcom/bv/sync/RemoteFile;->retryCount:I

    .line 53
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 33
    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 34
    iget-object v0, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-virtual {v0}, Ljcifs/smb/NtlmPasswordAuthentication;->getDomain()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 35
    iget-object v0, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-virtual {v0}, Ljcifs/smb/NtlmPasswordAuthentication;->getUsername()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 36
    iget-object v0, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-virtual {v0}, Ljcifs/smb/NtlmPasswordAuthentication;->getPassword()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 37
    return-void
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
    .line 400
    iget-object v0, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFile;->isShare(Ljcifs/smb/SmbFile;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/bv/sync/RemoteFile$14;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$14;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 405
    if-eqz v0, :cond_0

    .line 400
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;
    .locals 4
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    iget-object v2, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v2}, Ljcifs/smb/SmbFile;->getURL()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, parentPath:Ljava/lang/String;
    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 81
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 82
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 83
    new-instance v1, Ljcifs/smb/SmbFile;

    iget-object v2, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v1, p1, v2}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 84
    .local v1, smbFile:Ljcifs/smb/SmbFile;
    new-instance v2, Lcom/bv/sync/RemoteFile$2;

    invoke-direct {v2, p0, v1}, Lcom/bv/sync/RemoteFile$2;-><init>(Lcom/bv/sync/RemoteFile;Ljcifs/smb/SmbFile;)V

    invoke-static {v2}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    .line 92
    new-instance v2, Lcom/bv/sync/RemoteFile;

    iget-object v3, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v2, v1, p0, v3}, Lcom/bv/sync/RemoteFile;-><init>(Ljcifs/smb/SmbFile;Lcom/bv/sync/IFile;Ljcifs/smb/NtlmPasswordAuthentication;)V

    return-object v2
.end method

.method public delete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 445
    new-instance v0, Lcom/bv/sync/RemoteFile$17;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$17;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    .line 452
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .parameter "obj"

    .prologue
    const/4 v0, 0x0

    .line 490
    if-ne p1, p0, :cond_1

    .line 491
    const/4 v0, 0x1

    .line 496
    .end local p1
    :cond_0
    :goto_0
    return v0

    .line 492
    .restart local p1
    :cond_1
    if-eqz p1, :cond_0

    .line 494
    instance-of v1, p1, Lcom/bv/sync/RemoteFile;

    if-eqz v1, :cond_0

    .line 495
    check-cast p1, Lcom/bv/sync/RemoteFile;

    .end local p1
    iget-object v0, p1, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    iget-object v1, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v0, v1}, Ljcifs/smb/SmbFile;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public exists()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 390
    new-instance v0, Lcom/bv/sync/RemoteFile$13;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$13;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public getAbsolutePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

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
    .line 501
    new-instance v0, Lcom/bv/sync/RemoteFile$20;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$20;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

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
    .line 223
    new-instance v0, Lcom/bv/sync/RemoteFile$3;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$3;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/InputStream;

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
    .line 283
    new-instance v0, Lcom/bv/sync/RemoteFile$8;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$8;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 233
    new-instance v0, Lcom/bv/sync/RemoteFile$4;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$4;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/OutputStream;

    return-object v0
.end method

.method public declared-synchronized getParent()Lcom/bv/sync/IFile;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 304
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/bv/sync/RemoteFile;->parent:Lcom/bv/sync/IFile;

    if-nez v1, :cond_0

    .line 305
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    .line 306
    .local v0, parentPath:Ljava/lang/String;
    new-instance v1, Lcom/bv/sync/RemoteFile;

    new-instance v2, Ljcifs/smb/SmbFile;

    iget-object v3, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v2, v0, v3}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v1, v2, v3, v4}, Lcom/bv/sync/RemoteFile;-><init>(Ljcifs/smb/SmbFile;Lcom/bv/sync/IFile;Ljcifs/smb/NtlmPasswordAuthentication;)V

    iput-object v1, p0, Lcom/bv/sync/RemoteFile;->parent:Lcom/bv/sync/IFile;

    .line 308
    .end local v0           #parentPath:Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/bv/sync/RemoteFile;->parent:Lcom/bv/sync/IFile;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 304
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public isDirectory()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 248
    new-instance v0, Lcom/bv/sync/RemoteFile$5;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$5;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

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
    .line 456
    new-instance v0, Lcom/bv/sync/RemoteFile$18;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$18;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

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
    .line 466
    new-instance v0, Lcom/bv/sync/RemoteFile$19;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$19;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

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
    .line 476
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
    .line 422
    new-instance v0, Lcom/bv/sync/RemoteFile$15;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$15;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

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
    .line 313
    new-instance v3, Lcom/bv/sync/RemoteFile$10;

    invoke-direct {v3, p0}, Lcom/bv/sync/RemoteFile$10;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v3}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljcifs/smb/SmbFile;

    .line 328
    .local v0, files:[Ljcifs/smb/SmbFile;
    if-nez v0, :cond_0

    .line 329
    new-instance v3, Lcom/bv/sync/ErrorCodeException;

    const/4 v4, 0x2

    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/bv/sync/ErrorCodeException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 331
    :cond_0
    array-length v3, v0

    new-array v2, v3, [Lcom/bv/sync/RemoteFile;

    .line 332
    .local v2, result:[Lcom/bv/sync/RemoteFile;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v2

    if-lt v1, v3, :cond_1

    .line 334
    return-object v2

    .line 333
    :cond_1
    new-instance v3, Lcom/bv/sync/RemoteFile;

    aget-object v4, v0, v1

    iget-object v5, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v3, v4, p0, v5}, Lcom/bv/sync/RemoteFile;-><init>(Ljcifs/smb/SmbFile;Lcom/bv/sync/IFile;Ljcifs/smb/NtlmPasswordAuthentication;)V

    aput-object v3, v2, v1

    .line 332
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public listFiles(Lcom/bv/sync/IFileFilter;)[Lcom/bv/sync/IFile;
    .locals 9
    .parameter "filter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 341
    new-instance v5, Lcom/bv/sync/RemoteFile$11;

    invoke-direct {v5, p0, p1}, Lcom/bv/sync/RemoteFile$11;-><init>(Lcom/bv/sync/RemoteFile;Lcom/bv/sync/IFileFilter;)V

    .line 357
    .local v5, smbFilter:Ljcifs/smb/SmbFileFilter;
    :try_start_0
    new-instance v6, Lcom/bv/sync/RemoteFile$12;

    invoke-direct {v6, p0, v5}, Lcom/bv/sync/RemoteFile$12;-><init>(Lcom/bv/sync/RemoteFile;Ljcifs/smb/SmbFileFilter;)V

    invoke-static {v6}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljcifs/smb/SmbFile;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 379
    .local v2, files:[Ljcifs/smb/SmbFile;
    if-nez v2, :cond_1

    .line 380
    new-instance v6, Lcom/bv/sync/ErrorCodeException;

    const/4 v7, 0x2

    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lcom/bv/sync/ErrorCodeException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 373
    .end local v2           #files:[Ljcifs/smb/SmbFile;
    :catch_0
    move-exception v1

    .line 374
    .local v1, e:Ljava/lang/RuntimeException;
    invoke-virtual {v1}, Ljava/lang/RuntimeException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 375
    .local v0, cause:Ljava/lang/Throwable;
    if-eqz v0, :cond_0

    instance-of v6, v0, Ljava/io/IOException;

    if-eqz v6, :cond_0

    .line 376
    check-cast v0, Ljava/io/IOException;

    .end local v0           #cause:Ljava/lang/Throwable;
    throw v0

    .line 377
    .restart local v0       #cause:Ljava/lang/Throwable;
    :cond_0
    throw v1

    .line 382
    .end local v0           #cause:Ljava/lang/Throwable;
    .end local v1           #e:Ljava/lang/RuntimeException;
    .restart local v2       #files:[Ljcifs/smb/SmbFile;
    :cond_1
    array-length v6, v2

    new-array v4, v6, [Lcom/bv/sync/RemoteFile;

    .line 383
    .local v4, result:[Lcom/bv/sync/RemoteFile;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    array-length v6, v4

    if-lt v3, v6, :cond_2

    .line 385
    return-object v4

    .line 384
    :cond_2
    new-instance v6, Lcom/bv/sync/RemoteFile;

    aget-object v7, v2, v3

    iget-object v8, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v6, v7, p0, v8}, Lcom/bv/sync/RemoteFile;-><init>(Ljcifs/smb/SmbFile;Lcom/bv/sync/IFile;Ljcifs/smb/NtlmPasswordAuthentication;)V

    aput-object v6, v4, v3

    .line 383
    add-int/lit8 v3, v3, 0x1

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
    .line 258
    new-instance v1, Lcom/bv/sync/RemoteFile$6;

    invoke-direct {v1, p0}, Lcom/bv/sync/RemoteFile$6;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v1}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    .line 266
    iget-object v1, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v1}, Ljcifs/smb/SmbFile;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    .line 267
    .local v0, path:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-eq v1, v2, :cond_0

    .line 268
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 269
    :cond_0
    monitor-enter p0

    .line 270
    :try_start_0
    new-instance v1, Ljcifs/smb/SmbFile;

    iget-object v2, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v1, v0, v2}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V

    iput-object v1, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    .line 269
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 272
    new-instance v1, Lcom/bv/sync/RemoteFile$7;

    invoke-direct {v1, p0}, Lcom/bv/sync/RemoteFile$7;-><init>(Lcom/bv/sync/RemoteFile;)V

    invoke-static {v1}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    .line 279
    return-void

    .line 269
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public openFile(Ljava/lang/String;)Lcom/bv/sync/IFile;
    .locals 5
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 481
    iget-object v2, p0, Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v2}, Ljcifs/smb/SmbFile;->getServer()Ljava/lang/String;

    move-result-object v0

    .line 482
    .local v0, host:Ljava/lang/String;
    new-instance v1, Lcom/bv/sync/RemoteFile;

    iget-object v2, p0, Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "smb://"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/bv/sync/RemoteFile;-><init>(Ljcifs/smb/NtlmPasswordAuthentication;Ljava/lang/String;)V

    .line 483
    .local v1, result:Lcom/bv/sync/RemoteFile;
    invoke-virtual {v1}, Lcom/bv/sync/RemoteFile;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 484
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-direct {v2, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 485
    :cond_0
    return-object v1
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
    .line 432
    instance-of v0, p1, Lcom/bv/sync/RemoteFile;

    if-nez v0, :cond_0

    .line 433
    new-instance v0, Ljava/io/InvalidClassException;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Can not rename to non SMBFile"

    invoke-direct {v0, v1, v2}, Ljava/io/InvalidClassException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 434
    :cond_0
    new-instance v0, Lcom/bv/sync/RemoteFile$16;

    invoke-direct {v0, p0, p1}, Lcom/bv/sync/RemoteFile$16;-><init>(Lcom/bv/sync/RemoteFile;Lcom/bv/sync/IFile;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    .line 441
    return-void
.end method

.method public setLastModified(J)V
    .locals 1
    .parameter "time"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 293
    new-instance v0, Lcom/bv/sync/RemoteFile$9;

    invoke-direct {v0, p0, p1, p2}, Lcom/bv/sync/RemoteFile$9;-><init>(Lcom/bv/sync/RemoteFile;J)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    .line 300
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 417
    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
