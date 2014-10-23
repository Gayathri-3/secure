.class Lcom/bv/sync/FileManager$1;
.super Ljava/lang/Object;
.source "FileManager.java"

# interfaces
.implements Lcom/bv/sync/IFileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/FileManager;->copyFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/FileManager;

.field private final synthetic val$delete:Z

.field private final synthetic val$target:Lcom/bv/sync/IFile;


# direct methods
.method constructor <init>(Lcom/bv/sync/FileManager;Lcom/bv/sync/IFile;Z)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/FileManager$1;->this$0:Lcom/bv/sync/FileManager;

    iput-object p2, p0, Lcom/bv/sync/FileManager$1;->val$target:Lcom/bv/sync/IFile;

    iput-boolean p3, p0, Lcom/bv/sync/FileManager$1;->val$delete:Z

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/bv/sync/IFile;)Z
    .locals 4
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v1, p0, Lcom/bv/sync/FileManager$1;->this$0:Lcom/bv/sync/FileManager;

    #getter for: Lcom/bv/sync/FileManager;->canceled:Z
    invoke-static {v1}, Lcom/bv/sync/FileManager;->access$0(Lcom/bv/sync/FileManager;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 74
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v1

    .line 75
    :cond_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v0

    .line 76
    .local v0, isDirectory:Z
    if-nez v0, :cond_1

    .line 77
    iget-object v1, p0, Lcom/bv/sync/FileManager$1;->this$0:Lcom/bv/sync/FileManager;

    iget-object v2, p0, Lcom/bv/sync/FileManager$1;->val$target:Lcom/bv/sync/IFile;

    iget-boolean v3, p0, Lcom/bv/sync/FileManager$1;->val$delete:Z

    #calls: Lcom/bv/sync/FileManager;->copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V
    invoke-static {v1, p1, v2, v3}, Lcom/bv/sync/FileManager;->access$1(Lcom/bv/sync/FileManager;Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V

    .line 78
    :cond_1
    return v0
.end method
