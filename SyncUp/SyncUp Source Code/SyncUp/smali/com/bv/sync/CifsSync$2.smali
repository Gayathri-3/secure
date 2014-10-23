.class Lcom/bv/sync/CifsSync$2;
.super Ljava/lang/Object;
.source "CifsSync.java"

# interfaces
.implements Lcom/bv/sync/IFileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/CifsSync;->removeTempFiles(Lcom/bv/sync/IFile;)Ljava/util/TreeMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/CifsSync;

.field private final synthetic val$result:Ljava/util/TreeMap;


# direct methods
.method constructor <init>(Lcom/bv/sync/CifsSync;Ljava/util/TreeMap;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/CifsSync$2;->this$0:Lcom/bv/sync/CifsSync;

    iput-object p2, p0, Lcom/bv/sync/CifsSync$2;->val$result:Ljava/util/TreeMap;

    .line 383
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
    const/4 v1, 0x0

    .line 386
    iget-object v0, p0, Lcom/bv/sync/CifsSync$2;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->progress:Lcom/bv/sync/ProgressNotification;
    invoke-static {v0}, Lcom/bv/sync/CifsSync;->access$5(Lcom/bv/sync/CifsSync;)Lcom/bv/sync/ProgressNotification;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 387
    iget-object v2, p0, Lcom/bv/sync/CifsSync$2;->this$0:Lcom/bv/sync/CifsSync;

    iget-object v0, p0, Lcom/bv/sync/CifsSync$2;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->progress:Lcom/bv/sync/ProgressNotification;
    invoke-static {v0}, Lcom/bv/sync/CifsSync;->access$5(Lcom/bv/sync/CifsSync;)Lcom/bv/sync/ProgressNotification;

    move-result-object v0

    sget-object v3, Lcom/bv/sync/ProgressNotification$ProgressAction;->Listing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-interface {v0, v3, v1, p1}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    #setter for: Lcom/bv/sync/CifsSync;->canceled:Z
    invoke-static {v2, v0}, Lcom/bv/sync/CifsSync;->access$6(Lcom/bv/sync/CifsSync;Z)V

    .line 388
    :cond_0
    iget-object v0, p0, Lcom/bv/sync/CifsSync$2;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->canceled:Z
    invoke-static {v0}, Lcom/bv/sync/CifsSync;->access$7(Lcom/bv/sync/CifsSync;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 389
    new-instance v0, Lcom/bv/sync/CifsSync$SyncCancellationException;

    iget-object v1, p0, Lcom/bv/sync/CifsSync$2;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/bv/sync/CifsSync;->access$8(Lcom/bv/sync/CifsSync;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/bv/sync/CifsSync$SyncCancellationException;-><init>(Ljava/util/List;)V

    throw v0

    .line 387
    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    .line 390
    :cond_2
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v2, "_(!).(!)_tmp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 391
    iget-object v0, p0, Lcom/bv/sync/CifsSync$2;->this$0:Lcom/bv/sync/CifsSync;

    #calls: Lcom/bv/sync/CifsSync;->deleteTempFile(Lcom/bv/sync/IFile;)V
    invoke-static {v0, p1}, Lcom/bv/sync/CifsSync;->access$9(Lcom/bv/sync/CifsSync;Lcom/bv/sync/IFile;)V

    .line 394
    :goto_1
    return v1

    .line 393
    :cond_3
    iget-object v0, p0, Lcom/bv/sync/CifsSync$2;->val$result:Ljava/util/TreeMap;

    iget-object v2, p0, Lcom/bv/sync/CifsSync$2;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->fileComparator:Lcom/bv/sync/Utils$FileComparator;
    invoke-static {v2}, Lcom/bv/sync/CifsSync;->access$10(Lcom/bv/sync/CifsSync;)Lcom/bv/sync/Utils$FileComparator;

    move-result-object v2

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/bv/sync/Utils$FileComparator;->stripSeparator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method
