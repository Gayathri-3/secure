.class Lcom/bv/sync/FileManager$2;
.super Ljava/lang/Object;
.source "FileManager.java"

# interfaces
.implements Lcom/bv/sync/IFileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/FileManager;->deleteDir(Lcom/bv/sync/IFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/FileManager;


# direct methods
.method constructor <init>(Lcom/bv/sync/FileManager;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/FileManager$2;->this$0:Lcom/bv/sync/FileManager;

    .line 234
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/bv/sync/IFile;)Z
    .locals 3
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 237
    iget-object v1, p0, Lcom/bv/sync/FileManager$2;->this$0:Lcom/bv/sync/FileManager;

    #getter for: Lcom/bv/sync/FileManager;->canceled:Z
    invoke-static {v1}, Lcom/bv/sync/FileManager;->access$0(Lcom/bv/sync/FileManager;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 238
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v1

    .line 239
    :cond_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v0

    .line 240
    .local v0, isDirectory:Z
    if-nez v0, :cond_1

    .line 241
    iget-object v1, p0, Lcom/bv/sync/FileManager$2;->this$0:Lcom/bv/sync/FileManager;

    const/4 v2, 0x0

    #calls: Lcom/bv/sync/FileManager;->delete(Lcom/bv/sync/IFile;Z)V
    invoke-static {v1, p1, v2}, Lcom/bv/sync/FileManager;->access$2(Lcom/bv/sync/FileManager;Lcom/bv/sync/IFile;Z)V

    .line 242
    :cond_1
    return v0
.end method
