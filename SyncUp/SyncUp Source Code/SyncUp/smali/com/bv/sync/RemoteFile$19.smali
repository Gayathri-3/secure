.class Lcom/bv/sync/RemoteFile$19;
.super Ljava/lang/Object;
.source "RemoteFile.java"

# interfaces
.implements Lcom/bv/sync/RemoteFile$IORunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/RemoteFile;->isHidden()Z
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
        "Ljava/lang/Boolean;",
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
    iput-object p1, p0, Lcom/bv/sync/RemoteFile$19;->this$0:Lcom/bv/sync/RemoteFile;

    .line 466
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Boolean;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 469
    iget-object v0, p0, Lcom/bv/sync/RemoteFile$19;->this$0:Lcom/bv/sync/RemoteFile;

    #getter for: Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;
    invoke-static {v0}, Lcom/bv/sync/RemoteFile;->access$1(Lcom/bv/sync/RemoteFile;)Ljcifs/smb/SmbFile;

    move-result-object v0

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->isHidden()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

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
    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile$19;->run()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
