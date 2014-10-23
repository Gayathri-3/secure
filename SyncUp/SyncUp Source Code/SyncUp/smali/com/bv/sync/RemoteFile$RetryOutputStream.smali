.class Lcom/bv/sync/RemoteFile$RetryOutputStream;
.super Ljcifs/smb/SmbFileOutputStream;
.source "RemoteFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/RemoteFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RetryOutputStream"
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
    .line 151
    iput-object p1, p0, Lcom/bv/sync/RemoteFile$RetryOutputStream;->this$0:Lcom/bv/sync/RemoteFile;

    .line 152
    invoke-direct {p0, p2}, Ljcifs/smb/SmbFileOutputStream;-><init>(Ljcifs/smb/SmbFile;)V

    .line 153
    return-void
.end method

.method static synthetic access$0(Lcom/bv/sync/RemoteFile$RetryOutputStream;[BII)V
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
    .line 155
    invoke-direct {p0, p1, p2, p3}, Lcom/bv/sync/RemoteFile$RetryOutputStream;->superWrite([BII)V

    return-void
.end method

.method static synthetic access$1(Lcom/bv/sync/RemoteFile$RetryOutputStream;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    invoke-direct {p0}, Lcom/bv/sync/RemoteFile$RetryOutputStream;->superClose()V

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
    .line 171
    invoke-super {p0}, Ljcifs/smb/SmbFileOutputStream;->close()V

    .line 172
    return-void
.end method

.method private superWrite([BII)V
    .locals 0
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    invoke-super {p0, p1, p2, p3}, Ljcifs/smb/SmbFileOutputStream;->write([BII)V

    .line 157
    return-void
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
    .line 176
    new-instance v0, Lcom/bv/sync/RemoteFile$RetryOutputStream$2;

    invoke-direct {v0, p0}, Lcom/bv/sync/RemoteFile$RetryOutputStream$2;-><init>(Lcom/bv/sync/RemoteFile$RetryOutputStream;)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    .line 183
    return-void
.end method

.method public write([BII)V
    .locals 1
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    new-instance v0, Lcom/bv/sync/RemoteFile$RetryOutputStream$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/bv/sync/RemoteFile$RetryOutputStream$1;-><init>(Lcom/bv/sync/RemoteFile$RetryOutputStream;[BII)V

    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;

    .line 168
    return-void
.end method
