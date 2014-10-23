.class Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Lcom/bv/sync/ProgressNotification;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser$FileManagementTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FileProgressNotification"
.end annotation


# instance fields
.field progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;

.field final synthetic this$1:Lcom/bv/wifisync/DirBrowser$FileManagementTask;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/DirBrowser$FileManagementTask;)V
    .locals 3
    .parameter

    .prologue
    .line 515
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;->this$1:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 516
    new-instance v0, Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    #getter for: Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;
    invoke-static {p1}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->access$6(Lcom/bv/wifisync/DirBrowser$FileManagementTask;)Lcom/bv/wifisync/DirBrowser;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/DirBrowser$ProgressInfo;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$ProgressInfo;)V

    iput-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;->progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/DirBrowser$FileManagementTask;Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 515
    invoke-direct {p0, p1}, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;-><init>(Lcom/bv/wifisync/DirBrowser$FileManagementTask;)V

    return-void
.end method


# virtual methods
.method public update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z
    .locals 8
    .parameter "action"
    .parameter "percent"
    .parameter "file"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 520
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 521
    .local v0, now:J
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;->this$1:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    #getter for: Lcom/bv/wifisync/DirBrowser$FileManagementTask;->lastUpdateTime:J
    invoke-static {v4}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->access$3(Lcom/bv/wifisync/DirBrowser$FileManagementTask;)J

    move-result-wide v4

    sub-long v4, v0, v4

    const-wide/16 v6, 0x64

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 522
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;->progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    iput p2, v4, Lcom/bv/wifisync/DirBrowser$ProgressInfo;->percent:I

    .line 523
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;->progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    iput-object p1, v4, Lcom/bv/wifisync/DirBrowser$ProgressInfo;->action:Lcom/bv/sync/ProgressNotification$ProgressAction;

    .line 524
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;->progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    iput-object p3, v4, Lcom/bv/wifisync/DirBrowser$ProgressInfo;->file:Lcom/bv/sync/IFile;

    .line 525
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;->this$1:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    new-array v5, v3, [Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;->progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    aput-object v6, v5, v2

    #calls: Lcom/bv/wifisync/DirBrowser$FileManagementTask;->publishProgress([Ljava/lang/Object;)V
    invoke-static {v4, v5}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->access$4(Lcom/bv/wifisync/DirBrowser$FileManagementTask;[Ljava/lang/Object;)V

    .line 526
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;->this$1:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    #setter for: Lcom/bv/wifisync/DirBrowser$FileManagementTask;->lastUpdateTime:J
    invoke-static {v4, v0, v1}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->access$5(Lcom/bv/wifisync/DirBrowser$FileManagementTask;J)V

    .line 528
    :cond_0
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;->this$1:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    invoke-virtual {v4}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->isCancelled()Z

    move-result v4

    if-eqz v4, :cond_1

    :goto_0
    return v2

    :cond_1
    move v2, v3

    goto :goto_0
.end method
