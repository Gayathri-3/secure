.class Lcom/bv/sync/RemoteFile$RetryInputStream;
.super Ljcifs/smb/SmbFileInputStream;
.source "RemoteFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/RemoteFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RetryInputStream"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/RemoteFile;


# direct methods
.method constructor <init>(Lcom/bv/sync/RemoteFile;Ljcifs/smb/SmbFile;)V
    .locals 0
    .parameter
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;,
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 187
    iput-object p1, p0, Lcom/bv/sync/RemoteFile$RetryInputStream;->this$0:Lcom/bv/sync/RemoteFile;

    .line 188
    invoke-direct {p0, p2}, Ljcifs/smb/SmbFileInputStream;-><init>(Ljcifs/smb/SmbFile;)V

    .line 189
    return-void
.end method

.method static synthetic access$0(Lcom/bv/sync/RemoteFile$RetryInputStream;[B)I
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    invoke-direct {p0, p1}, Lcom/bv/sync/RemoteFile$RetryInputStream;->superRead([B)I

    move-result v0

    return v0
.end method

.method static synthetic access$1(Lcom/bv/sync/RemoteFile$RetryInputStream;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    invoke-direct {p0}, Lcom/bv/sync/RemoteFile$RetryInputStream;->superClose()V

    return-void
.end method

.method private superClose()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 206
    invoke-super {p0}, Ljcifs/smb/SmbFileInputStream;->close()V

    .line 207
    return-void
.end method

.method private superRead([B)I
    .locals 1
    .parameter "buffer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 192
    invoke-super {p0, p1}, Ljcifs/smb/SmbFileInputStream;->read([B)I

    move-result v0

    return v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    new-instance v0, Lcom/bv/sync/RemoteFile$RetryInputStream$2;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$RetryInputStream$2;-><init>(Lcom/bv/sync/RemoteFile$RetryInputStream;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    .line 218
    return-void
.end method

.method public read([B)I
    .locals 1
    .parameter "buffer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    new-instance v0, Lcom/bv/sync/RemoteFile$RetryInputStream$1;

    invoke-direct {v0, p0, p1}, Lcom/bv/sync/RemoteFile$RetryInputStream$1;-><init>(Lcom/bv/sync/RemoteFile$RetryInputStream;[B)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method
