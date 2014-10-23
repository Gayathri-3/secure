.class Lcom/bv/sync/RemoteFile$10;
.super Ljava/lang/Object;
.source "RemoteFile.java"

# interfaces
.implements Lcom/bv/sync/RemoteFile$IORunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/RemoteFile;->listFiles()[Lcom/bv/sync/IFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bv/sync/RemoteFile$IORunnable",
        "<[",
        "Ljcifs/smb/SmbFile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/RemoteFile;


# direct methods
.method constructor <init>(Lcom/bv/sync/RemoteFile;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/RemoteFile$10;->this$0:Lcom/bv/sync/RemoteFile;

    .line 313
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile$10;->run()[Ljcifs/smb/SmbFile;

    move-result-object v0

    return-object v0
.end method

.method public run()[Ljcifs/smb/SmbFile;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 316
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-static {}, Lcom/bv/sync/RemoteFile;->access$0()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-lt v1, v2, :cond_0

    .line 325
    iget-object v2, p0, Lcom/bv/sync/RemoteFile$10;->this$0:Lcom/bv/sync/RemoteFile;

    #getter for: Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;
    invoke-static {v2}, Lcom/bv/sync/RemoteFile;->access$1(Lcom/bv/sync/RemoteFile;)Ljcifs/smb/SmbFile;

    move-result-object v2

    invoke-virtual {v2}, Ljcifs/smb/SmbFile;->listFiles()[Ljcifs/smb/SmbFile;

    move-result-object v2

    :goto_1
    return-object v2

    .line 318
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/bv/sync/RemoteFile$10;->this$0:Lcom/bv/sync/RemoteFile;

    #getter for: Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;
    invoke-static {v2}, Lcom/bv/sync/RemoteFile;->access$1(Lcom/bv/sync/RemoteFile;)Ljcifs/smb/SmbFile;

    move-result-object v2

    invoke-virtual {v2}, Ljcifs/smb/SmbFile;->listFiles()[Ljcifs/smb/SmbFile;
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_1

    .line 319
    :catch_0
    move-exception v0

    .line 320
    .local v0, e:Ljcifs/smb/SmbException;
    invoke-virtual {v0}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v2

    const v3, -0x3ffffff8

    if-eq v2, v3, :cond_1

    .line 321
    throw v0

    .line 322
    :cond_1
    sget v2, Lcom/bv/sync/RemoteFile;->totalRetryCount:I

    add-int/lit8 v2, v2, 0x1

    sput v2, Lcom/bv/sync/RemoteFile;->totalRetryCount:I

    .line 316
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
