.class public Lcom/bv/sync/RemoteFileTest;
.super Ljunit/framework/TestCase;
.source "RemoteFileTest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/RemoteFileTest$IORunnable;,
        Lcom/bv/sync/RemoteFileTest$RetryException;,
        Lcom/bv/sync/RemoteFileTest$RetrySmbFile;,
        Lcom/bv/sync/RemoteFileTest$SocketClosedException;,
        Lcom/bv/sync/RemoteFileTest$TimeoutSmbException;,
        Lcom/bv/sync/RemoteFileTest$TransportSocketClosedException;,
        Lcom/bv/sync/RemoteFileTest$TransportTimeoutException;
    }
.end annotation


# static fields
.field static RETRY_COUNT:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/16 v0, 0xa

    sput v0, Lcom/bv/sync/RemoteFileTest;->RETRY_COUNT:I

    .line 21
    sget v0, Lcom/bv/sync/RemoteFileTest;->RETRY_COUNT:I

    invoke-static {v0}, Lcom/bv/sync/RemoteFile;->setRetryCount(I)V

    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljunit/framework/TestCase;-><init>()V

    return-void
.end method

.method private testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V
    .locals 2
    .parameter "runnable"

    .prologue
    const/4 v1, 0x0

    .line 194
    new-instance v0, Lcom/bv/sync/RemoteFileTest$TimeoutSmbException;

    invoke-direct {v0, p0, v1}, Lcom/bv/sync/RemoteFileTest$TimeoutSmbException;-><init>(Lcom/bv/sync/RemoteFileTest;Lcom/bv/sync/RemoteFileTest$TimeoutSmbException;)V

    invoke-direct {p0, p1, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;Ljcifs/smb/SmbException;)V

    .line 195
    new-instance v0, Lcom/bv/sync/RemoteFileTest$SocketClosedException;

    invoke-direct {v0, p0, v1}, Lcom/bv/sync/RemoteFileTest$SocketClosedException;-><init>(Lcom/bv/sync/RemoteFileTest;Lcom/bv/sync/RemoteFileTest$SocketClosedException;)V

    invoke-direct {p0, p1, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;Ljcifs/smb/SmbException;)V

    .line 196
    new-instance v0, Lcom/bv/sync/RemoteFileTest$TransportTimeoutException;

    invoke-direct {v0, p0, v1}, Lcom/bv/sync/RemoteFileTest$TransportTimeoutException;-><init>(Lcom/bv/sync/RemoteFileTest;Lcom/bv/sync/RemoteFileTest$TransportTimeoutException;)V

    invoke-direct {p0, p1, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;Ljcifs/smb/SmbException;)V

    .line 197
    new-instance v0, Lcom/bv/sync/RemoteFileTest$TransportSocketClosedException;

    invoke-direct {v0, p0, v1}, Lcom/bv/sync/RemoteFileTest$TransportSocketClosedException;-><init>(Lcom/bv/sync/RemoteFileTest;Lcom/bv/sync/RemoteFileTest$TransportSocketClosedException;)V

    invoke-direct {p0, p1, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;Ljcifs/smb/SmbException;)V

    .line 198
    return-void
.end method

.method private testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;Ljcifs/smb/SmbException;)V
    .locals 6
    .parameter "runnable"
    .parameter "exception"

    .prologue
    const/4 v4, 0x0

    .line 201
    const/4 v2, 0x0

    .line 203
    .local v2, smbFile:Lcom/bv/sync/RemoteFileTest$RetrySmbFile;
    :try_start_0
    new-instance v3, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;

    invoke-direct {v3, p0, p2}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;-><init>(Lcom/bv/sync/RemoteFileTest;Ljcifs/smb/SmbException;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2           #smbFile:Lcom/bv/sync/RemoteFileTest$RetrySmbFile;
    .local v3, smbFile:Lcom/bv/sync/RemoteFileTest$RetrySmbFile;
    move-object v2, v3

    .line 207
    .end local v3           #smbFile:Lcom/bv/sync/RemoteFileTest$RetrySmbFile;
    .restart local v2       #smbFile:Lcom/bv/sync/RemoteFileTest$RetrySmbFile;
    :goto_0
    new-instance v1, Lcom/bv/sync/RemoteFile;

    invoke-direct {v1, v2, v4, v4}, Lcom/bv/sync/RemoteFile;-><init>(Ljcifs/smb/SmbFile;Lcom/bv/sync/IFile;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 209
    .local v1, remoteFile:Lcom/bv/sync/RemoteFile;
    :try_start_1
    invoke-virtual {p1, v1}, Lcom/bv/sync/RemoteFileTest$IORunnable;->run(Lcom/bv/sync/RemoteFile;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 212
    :goto_1
    sget v4, Lcom/bv/sync/RemoteFileTest;->RETRY_COUNT:I

    iget v5, v2, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->retryCount:I

    invoke-static {v4, v5}, Lcom/bv/sync/RemoteFileTest;->assertEquals(II)V

    .line 213
    return-void

    .line 204
    .end local v1           #remoteFile:Lcom/bv/sync/RemoteFile;
    :catch_0
    move-exception v0

    .line 205
    .local v0, e1:Ljava/net/MalformedURLException;
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_0

    .line 210
    .end local v0           #e1:Ljava/net/MalformedURLException;
    .restart local v1       #remoteFile:Lcom/bv/sync/RemoteFile;
    :catch_1
    move-exception v4

    goto :goto_1
.end method


# virtual methods
.method public testCanRead()V
    .locals 1

    .prologue
    .line 225
    new-instance v0, Lcom/bv/sync/RemoteFileTest$2;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$2;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 231
    return-void
.end method

.method public testDelete()V
    .locals 1

    .prologue
    .line 234
    new-instance v0, Lcom/bv/sync/RemoteFileTest$3;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$3;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 240
    return-void
.end method

.method public testExists()V
    .locals 1

    .prologue
    .line 216
    new-instance v0, Lcom/bv/sync/RemoteFileTest$1;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$1;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 222
    return-void
.end method

.method public testGetLastModified()V
    .locals 1

    .prologue
    .line 243
    new-instance v0, Lcom/bv/sync/RemoteFileTest$4;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$4;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 249
    return-void
.end method

.method public testGetOutputStream()V
    .locals 1

    .prologue
    .line 252
    new-instance v0, Lcom/bv/sync/RemoteFileTest$5;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$5;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 258
    return-void
.end method

.method public testIsDirectory()V
    .locals 1

    .prologue
    .line 261
    new-instance v0, Lcom/bv/sync/RemoteFileTest$6;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$6;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 267
    return-void
.end method

.method public testIsHidden()V
    .locals 1

    .prologue
    .line 270
    new-instance v0, Lcom/bv/sync/RemoteFileTest$7;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$7;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 276
    return-void
.end method

.method public testLength()V
    .locals 1

    .prologue
    .line 279
    new-instance v0, Lcom/bv/sync/RemoteFileTest$8;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$8;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 285
    return-void
.end method

.method public testListFiles()V
    .locals 1

    .prologue
    .line 288
    new-instance v0, Lcom/bv/sync/RemoteFileTest$9;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$9;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 294
    return-void
.end method

.method public testMkDir()V
    .locals 1

    .prologue
    .line 297
    new-instance v0, Lcom/bv/sync/RemoteFileTest$10;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$10;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 303
    return-void
.end method

.method public testRenameTo()V
    .locals 1

    .prologue
    .line 306
    new-instance v0, Lcom/bv/sync/RemoteFileTest$11;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$11;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 312
    return-void
.end method

.method public testSetlastModified()V
    .locals 1

    .prologue
    .line 315
    new-instance v0, Lcom/bv/sync/RemoteFileTest$12;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFileTest$12;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    invoke-direct {p0, v0}, Lcom/bv/sync/RemoteFileTest;->testRetry(Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    .line 321
    return-void
.end method
