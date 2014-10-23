.class Lcom/bv/sync/CifsSync$DeletionTracker$1;
.super Ljava/lang/Object;
.source "CifsSync.java"

# interfaces
.implements Lcom/bv/sync/IFileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/CifsSync$DeletionTracker;->addDirectory(Lcom/bv/sync/IFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/sync/CifsSync$DeletionTracker;


# direct methods
.method constructor <init>(Lcom/bv/sync/CifsSync$DeletionTracker;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/CifsSync$DeletionTracker$1;->this$1:Lcom/bv/sync/CifsSync$DeletionTracker;

    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/bv/sync/IFile;)Z
    .locals 2
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v0

    .line 184
    .local v0, isDirectory:Z
    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/bv/sync/CifsSync$DeletionTracker$1;->this$1:Lcom/bv/sync/CifsSync$DeletionTracker;

    #getter for: Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;
    invoke-static {v1}, Lcom/bv/sync/CifsSync$DeletionTracker;->access$2(Lcom/bv/sync/CifsSync$DeletionTracker;)Lcom/bv/sync/CifsSync;

    move-result-object v1

    #calls: Lcom/bv/sync/CifsSync;->isSyncable(Lcom/bv/sync/IFile;)Z
    invoke-static {v1, p1}, Lcom/bv/sync/CifsSync;->access$2(Lcom/bv/sync/CifsSync;Lcom/bv/sync/IFile;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 185
    iget-object v1, p0, Lcom/bv/sync/CifsSync$DeletionTracker$1;->this$1:Lcom/bv/sync/CifsSync$DeletionTracker;

    #calls: Lcom/bv/sync/CifsSync$DeletionTracker;->add(Lcom/bv/sync/IFile;)V
    invoke-static {v1, p1}, Lcom/bv/sync/CifsSync$DeletionTracker;->access$0(Lcom/bv/sync/CifsSync$DeletionTracker;Lcom/bv/sync/IFile;)V

    .line 186
    :cond_0
    return v0
.end method
