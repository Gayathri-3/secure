.class Lcom/bv/sync/CifsSync$DeletionTracker;
.super Ljava/lang/Object;
.source "CifsSync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/CifsSync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeletionTracker"
.end annotation


# instance fields
.field private count:J

.field private final result:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/bv/sync/CifsSync;

.field private total:J


# direct methods
.method private constructor <init>(Lcom/bv/sync/CifsSync;)V
    .locals 1
    .parameter

    .prologue
    .line 164
    iput-object p1, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->result:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/sync/CifsSync;Lcom/bv/sync/CifsSync$DeletionTracker;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync$DeletionTracker;-><init>(Lcom/bv/sync/CifsSync;)V

    return-void
.end method

.method static synthetic access$0(Lcom/bv/sync/CifsSync$DeletionTracker;Lcom/bv/sync/IFile;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 203
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync$DeletionTracker;->add(Lcom/bv/sync/IFile;)V

    return-void
.end method

.method static synthetic access$2(Lcom/bv/sync/CifsSync$DeletionTracker;)Lcom/bv/sync/CifsSync;
    .locals 1
    .parameter

    .prologue
    .line 164
    iget-object v0, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    return-object v0
.end method

.method private add(Lcom/bv/sync/IFile;)V
    .locals 5
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    iget-object v3, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #calls: Lcom/bv/sync/CifsSync;->getRelativePath(Lcom/bv/sync/IFile;)Ljava/lang/String;
    invoke-static {v3, p1}, Lcom/bv/sync/CifsSync;->access$3(Lcom/bv/sync/CifsSync;Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v2

    .line 205
    .local v2, relativePath:Ljava/lang/String;
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v0

    .line 206
    .local v0, lastModified:J
    iget-object v3, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->result:Ljava/util/HashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    iget-object v3, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;
    invoke-static {v3}, Lcom/bv/sync/CifsSync;->access$4(Lcom/bv/sync/CifsSync;)Ljava/util/Map;

    move-result-object v3

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    iget-object v3, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->progress:Lcom/bv/sync/ProgressNotification;
    invoke-static {v3}, Lcom/bv/sync/CifsSync;->access$5(Lcom/bv/sync/CifsSync;)Lcom/bv/sync/ProgressNotification;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 209
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync$DeletionTracker;->updateProgress(Lcom/bv/sync/IFile;)V

    .line 210
    :cond_0
    return-void
.end method

.method private addDirectory(Lcom/bv/sync/IFile;)V
    .locals 2
    .parameter "dir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    new-instance v1, Lcom/bv/sync/CifsSync$DeletionTracker$1;

    invoke-direct {v1, p0}, Lcom/bv/sync/CifsSync$DeletionTracker$1;-><init>(Lcom/bv/sync/CifsSync$DeletionTracker;)V

    invoke-interface {p1, v1}, Lcom/bv/sync/IFile;->listFiles(Lcom/bv/sync/IFileFilter;)[Lcom/bv/sync/IFile;

    move-result-object v0

    .line 189
    .local v0, files:[Lcom/bv/sync/IFile;
    invoke-direct {p0, v0}, Lcom/bv/sync/CifsSync$DeletionTracker;->addFiles([Lcom/bv/sync/IFile;)V

    .line 190
    return-void
.end method

.method private addFiles([Lcom/bv/sync/IFile;)V
    .locals 3
    .parameter "files"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, p1

    if-lt v1, v2, :cond_0

    .line 201
    return-void

    .line 194
    :cond_0
    aget-object v0, p1, v1

    .line 195
    .local v0, child:Lcom/bv/sync/IFile;
    const/4 v2, 0x0

    aput-object v2, p1, v1

    .line 196
    iget-object v2, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #calls: Lcom/bv/sync/CifsSync;->isSyncable(Lcom/bv/sync/IFile;)Z
    invoke-static {v2, v0}, Lcom/bv/sync/CifsSync;->access$2(Lcom/bv/sync/CifsSync;Lcom/bv/sync/IFile;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 197
    invoke-direct {p0, v0}, Lcom/bv/sync/CifsSync$DeletionTracker;->add(Lcom/bv/sync/IFile;)V

    .line 198
    invoke-direct {p0, v0}, Lcom/bv/sync/CifsSync$DeletionTracker;->addDirectory(Lcom/bv/sync/IFile;)V

    .line 193
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private updateProgress(Lcom/bv/sync/IFile;)V
    .locals 5
    .parameter "file"

    .prologue
    .line 213
    iget-wide v1, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->count:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->count:J

    .line 214
    const/4 v0, 0x0

    .line 215
    .local v0, percent:I
    iget-wide v1, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->total:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 216
    iget-wide v1, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->count:J

    long-to-float v1, v1

    iget-wide v2, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->total:J

    long-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x42c8

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 217
    :cond_0
    iget-object v2, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    iget-object v1, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->progress:Lcom/bv/sync/ProgressNotification;
    invoke-static {v1}, Lcom/bv/sync/CifsSync;->access$5(Lcom/bv/sync/CifsSync;)Lcom/bv/sync/ProgressNotification;

    move-result-object v1

    sget-object v3, Lcom/bv/sync/ProgressNotification$ProgressAction;->TrackingDeletions:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-interface {v1, v3, v0, p1}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    :goto_0
    #setter for: Lcom/bv/sync/CifsSync;->canceled:Z
    invoke-static {v2, v1}, Lcom/bv/sync/CifsSync;->access$6(Lcom/bv/sync/CifsSync;Z)V

    .line 218
    iget-object v1, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->canceled:Z
    invoke-static {v1}, Lcom/bv/sync/CifsSync;->access$7(Lcom/bv/sync/CifsSync;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 219
    new-instance v1, Lcom/bv/sync/CifsSync$SyncCancellationException;

    iget-object v2, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/bv/sync/CifsSync;->access$8(Lcom/bv/sync/CifsSync;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/bv/sync/CifsSync$SyncCancellationException;-><init>(Ljava/util/List;)V

    throw v1

    .line 217
    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    .line 220
    :cond_2
    return-void
.end method


# virtual methods
.method track()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 170
    iget-object v4, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;
    invoke-static {v4}, Lcom/bv/sync/CifsSync;->access$0(Lcom/bv/sync/CifsSync;)Lcom/bv/sync/CifsSync$Options;

    move-result-object v4

    iget-object v4, v4, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v5, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v4, v5, :cond_1

    move v1, v2

    .line 171
    .local v1, scanRight:Z
    :goto_0
    if-eqz v1, :cond_2

    iget-object v3, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->roots:[Lcom/bv/sync/IFile;
    invoke-static {v3}, Lcom/bv/sync/CifsSync;->access$1(Lcom/bv/sync/CifsSync;)[Lcom/bv/sync/IFile;

    move-result-object v3

    aget-object v0, v3, v2

    .line 173
    .local v0, dir:Lcom/bv/sync/IFile;
    :goto_1
    iget-object v2, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;
    invoke-static {v2}, Lcom/bv/sync/CifsSync;->access$0(Lcom/bv/sync/CifsSync;)Lcom/bv/sync/CifsSync$Options;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v3, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;
    invoke-static {v2}, Lcom/bv/sync/CifsSync;->access$0(Lcom/bv/sync/CifsSync;)Lcom/bv/sync/CifsSync$Options;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v3, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v2, v3, :cond_0

    .line 174
    if-eqz v1, :cond_3

    iget-object v2, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    iget v2, v2, Lcom/bv/sync/CifsSync;->rightCount:I

    :goto_2
    int-to-long v2, v2

    iput-wide v2, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->total:J

    .line 175
    :cond_0
    invoke-direct {p0, v0}, Lcom/bv/sync/CifsSync$DeletionTracker;->addDirectory(Lcom/bv/sync/IFile;)V

    .line 176
    iget-object v2, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->result:Ljava/util/HashMap;

    return-object v2

    .end local v0           #dir:Lcom/bv/sync/IFile;
    .end local v1           #scanRight:Z
    :cond_1
    move v1, v3

    .line 170
    goto :goto_0

    .line 171
    .restart local v1       #scanRight:Z
    :cond_2
    iget-object v2, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    #getter for: Lcom/bv/sync/CifsSync;->roots:[Lcom/bv/sync/IFile;
    invoke-static {v2}, Lcom/bv/sync/CifsSync;->access$1(Lcom/bv/sync/CifsSync;)[Lcom/bv/sync/IFile;

    move-result-object v2

    aget-object v0, v2, v3

    goto :goto_1

    .line 174
    .restart local v0       #dir:Lcom/bv/sync/IFile;
    :cond_3
    iget-object v2, p0, Lcom/bv/sync/CifsSync$DeletionTracker;->this$0:Lcom/bv/sync/CifsSync;

    iget v2, v2, Lcom/bv/sync/CifsSync;->leftCount:I

    goto :goto_2
.end method
