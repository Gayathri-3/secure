.class Lcom/bv/sync/RemoteFile$4;
.super Ljava/lang/Object;
.source "RemoteFile.java"

# interfaces
.implements Lcom/bv/sync/RemoteFile$IORunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/RemoteFile;->getOutputStream()Ljava/io/OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bv/sync/RemoteFile$IORunnable",
        "<",
        "Ljava/io/OutputStream;",
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
    iput-object p1, p0, Lcom/bv/sync/RemoteFile$4;->this$0:Lcom/bv/sync/RemoteFile;

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/io/OutputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    new-instance v0, Lcom/bv/sync/RemoteFile$RetryOutputStream;

    iget-object v1, p0, Lcom/bv/sync/RemoteFile$4;->this$0:Lcom/bv/sync/RemoteFile;

    iget-object v2, p0, Lcom/bv/sync/RemoteFile$4;->this$0:Lcom/bv/sync/RemoteFile;

    #getter for: Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;
    invoke-static {v2}, Lcom/bv/sync/RemoteFile;->access$1(Lcom/bv/sync/RemoteFile;)Ljcifs/smb/SmbFile;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/RemoteFile$RetryOutputStream;-><init>(Lcom/bv/sync/RemoteFile;Ljcifs/smb/SmbFile;)V

    return-object v0
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile$4;->run()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method
