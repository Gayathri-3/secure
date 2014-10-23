.class Lcom/bv/wifisync/DirBrowser$FileManagementTask;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "DirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FileManagementTask"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Lcom/bv/wifisync/DirBrowser$FileInfo;",
        "Lcom/bv/wifisync/DirBrowser$ProgressInfo;",
        "[",
        "Lcom/bv/wifisync/DirBrowser$FileInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private filesCount:I

.field private lastUpdateTime:J

.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;

.field private title:Ljava/lang/CharSequence;

.field private final type:Lcom/bv/wifisync/DirBrowser$Type;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$Type;)V
    .locals 2
    .parameter
    .parameter "type"

    .prologue
    .line 509
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    .line 510
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FileManagement "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 511
    invoke-virtual {p1}, Lcom/bv/wifisync/DirBrowser;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->title:Ljava/lang/CharSequence;

    .line 512
    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->type:Lcom/bv/wifisync/DirBrowser$Type;

    .line 513
    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/DirBrowser$FileManagementTask;)J
    .locals 2
    .parameter

    .prologue
    .line 507
    iget-wide v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->lastUpdateTime:J

    return-wide v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/DirBrowser$FileManagementTask;[Ljava/lang/Object;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->publishProgress([Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$5(Lcom/bv/wifisync/DirBrowser$FileManagementTask;J)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 507
    iput-wide p1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->lastUpdateTime:J

    return-void
.end method

.method static synthetic access$6(Lcom/bv/wifisync/DirBrowser$FileManagementTask;)Lcom/bv/wifisync/DirBrowser;
    .locals 1
    .parameter

    .prologue
    .line 503
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    return-object v0
.end method

.method private varargs getFiles([Lcom/bv/wifisync/DirBrowser$FileInfo;)[Lcom/bv/sync/IFile;
    .locals 7
    .parameter "args"

    .prologue
    .line 586
    array-length v4, p1

    new-array v3, v4, [Lcom/bv/sync/IFile;

    .line 587
    .local v3, result:[Lcom/bv/sync/IFile;
    const/4 v1, 0x0

    .line 588
    .local v1, i:I
    array-length v5, p1

    const/4 v4, 0x0

    move v2, v1

    .end local v1           #i:I
    .local v2, i:I
    :goto_0
    if-lt v4, v5, :cond_0

    .line 590
    return-object v3

    .line 588
    :cond_0
    aget-object v0, p1, v4

    .line 589
    .local v0, fileInfo:Lcom/bv/wifisync/DirBrowser$FileInfo;
    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    iget-object v6, v0, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    aput-object v6, v3, v2

    .line 588
    add-int/lit8 v4, v4, 0x1

    move v2, v1

    .end local v1           #i:I
    .restart local v2       #i:I
    goto :goto_0
.end method

.method private restoreUIState()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 558
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/DirBrowser;->setProgressVisible(Z)V

    .line 559
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v0, v1, v2}, Lcom/bv/wifisync/DirBrowser;->setProgress(ILjava/lang/String;)V

    .line 560
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->title:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/DirBrowser;->setTitle(Ljava/lang/CharSequence;)V

    .line 561
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v0, v0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 562
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    #setter for: Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;
    invoke-static {v0, v2}, Lcom/bv/wifisync/DirBrowser;->access$5(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$FileManagementTask;)V

    .line 563
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->menu:Landroid/view/Menu;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser;->access$6(Lcom/bv/wifisync/DirBrowser;)Landroid/view/Menu;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 564
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->menu:Landroid/view/Menu;
    invoke-static {v1}, Lcom/bv/wifisync/DirBrowser;->access$6(Lcom/bv/wifisync/DirBrowser;)Landroid/view/Menu;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/DirBrowser;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 565
    :cond_0
    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic atBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    check-cast p1, [Lcom/bv/wifisync/DirBrowser$FileInfo;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->atBackground([Lcom/bv/wifisync/DirBrowser$FileInfo;)[Lcom/bv/wifisync/DirBrowser$FileInfo;

    move-result-object v0

    return-object v0
.end method

.method protected varargs atBackground([Lcom/bv/wifisync/DirBrowser$FileInfo;)[Lcom/bv/wifisync/DirBrowser$FileInfo;
    .locals 5
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 576
    move-object v0, p1

    .line 577
    .local v0, result:[Lcom/bv/wifisync/DirBrowser$FileInfo;
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->type:Lcom/bv/wifisync/DirBrowser$Type;

    sget-object v2, Lcom/bv/wifisync/DirBrowser$Type;->Delete:Lcom/bv/wifisync/DirBrowser$Type;

    if-ne v1, v2, :cond_1

    .line 578
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-direct {p0, p1}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->getFiles([Lcom/bv/wifisync/DirBrowser$FileInfo;)[Lcom/bv/sync/IFile;

    move-result-object v2

    new-instance v3, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;

    invoke-direct {v3, p0, v4}, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;-><init>(Lcom/bv/wifisync/DirBrowser$FileManagementTask;Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;)V

    invoke-static {v1, v2, v3}, Lcom/bv/wifisync/Clipboard;->delete(Landroid/content/Context;[Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)I

    move-result v1

    iput v1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->filesCount:I

    .line 582
    :cond_0
    :goto_0
    return-object v0

    .line 579
    :cond_1
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->type:Lcom/bv/wifisync/DirBrowser$Type;

    sget-object v2, Lcom/bv/wifisync/DirBrowser$Type;->Copy:Lcom/bv/wifisync/DirBrowser$Type;

    if-eq v1, v2, :cond_2

    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->type:Lcom/bv/wifisync/DirBrowser$Type;

    sget-object v2, Lcom/bv/wifisync/DirBrowser$Type;->Move:Lcom/bv/wifisync/DirBrowser$Type;

    if-ne v1, v2, :cond_0

    .line 580
    :cond_2
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;
    invoke-static {v2}, Lcom/bv/wifisync/DirBrowser;->access$3(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/sync/IFile;

    move-result-object v2

    new-instance v3, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;

    invoke-direct {v3, p0, v4}, Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;-><init>(Lcom/bv/wifisync/DirBrowser$FileManagementTask;Lcom/bv/wifisync/DirBrowser$FileManagementTask$FileProgressNotification;)V

    invoke-static {v1, v2, v3}, Lcom/bv/wifisync/Clipboard;->paste(Landroid/content/Context;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)I

    move-result v1

    iput v1, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->filesCount:I

    goto :goto_0
.end method

.method protected onCancelled()V
    .locals 1

    .prologue
    .line 569
    invoke-super {p0}, Lcom/bv/wifisync/Utils$ProgressTask;->onCancelled()V

    .line 570
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->restoreUIState()V

    .line 571
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v0, v0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->refresh()V

    .line 572
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, [Lcom/bv/wifisync/DirBrowser$FileInfo;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->onPostExecute([Lcom/bv/wifisync/DirBrowser$FileInfo;)V

    return-void
.end method

.method protected onPostExecute([Lcom/bv/wifisync/DirBrowser$FileInfo;)V
    .locals 9
    .parameter "result"

    .prologue
    const/4 v5, 0x0

    .line 539
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 540
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->error:Ljava/lang/Throwable;

    if-nez v4, :cond_1

    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->type:Lcom/bv/wifisync/DirBrowser$Type;

    sget-object v6, Lcom/bv/wifisync/DirBrowser$Type;->Delete:Lcom/bv/wifisync/DirBrowser$Type;

    if-ne v4, v6, :cond_1

    .line 541
    array-length v6, p1

    move v4, v5

    :goto_0
    if-lt v4, v6, :cond_0

    .line 546
    :goto_1
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->restoreUIState()V

    .line 547
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v4}, Lcom/bv/wifisync/DirBrowser;->isFinishing()Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v4}, Lcom/bv/wifisync/DirBrowser;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 548
    .local v0, context:Landroid/content/Context;
    :goto_2
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->error:Ljava/lang/Throwable;

    if-nez v4, :cond_3

    .line 549
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->type:Lcom/bv/wifisync/DirBrowser$Type;

    invoke-virtual {v6}, Lcom/bv/wifisync/DirBrowser$Type;->getSuccessMessage()I

    move-result v6

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    iget v8, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->filesCount:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v5

    invoke-virtual {v4, v6, v7}, Lcom/bv/wifisync/DirBrowser;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 555
    :goto_3
    return-void

    .line 541
    .end local v0           #context:Landroid/content/Context;
    :cond_0
    aget-object v1, p1, v4

    .line 542
    .local v1, fileInfo:Lcom/bv/wifisync/DirBrowser$FileInfo;
    iget-object v7, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v7, v7, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v7, v1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->remove(Ljava/lang/Object;)V

    .line 541
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 544
    .end local v1           #fileInfo:Lcom/bv/wifisync/DirBrowser$FileInfo;
    :cond_1
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v4, v4, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v4}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->refresh()V

    goto :goto_1

    .line 547
    :cond_2
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    goto :goto_2

    .line 551
    .restart local v0       #context:Landroid/content/Context;
    :cond_3
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    const v6, 0x7f0600aa

    invoke-virtual {v4, v6}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 552
    .local v3, title:Ljava/lang/String;
    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->error:Ljava/lang/Throwable;

    invoke-static {v0, v4, v5}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;Z)Ljava/lang/String;

    move-result-object v2

    .line 553
    .local v2, message:Ljava/lang/String;
    invoke-static {v0, v3, v2}, Lcom/bv/wifisync/Dialogs;->showErrorDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 534
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/DirBrowser;->setProgressVisible(Z)V

    .line 535
    return-void
.end method

.method protected varargs onProgressUpdate([Lcom/bv/wifisync/DirBrowser$ProgressInfo;)V
    .locals 6
    .parameter "values"

    .prologue
    .line 595
    const/4 v3, 0x0

    aget-object v2, p1, v3

    .line 596
    .local v2, progress:Lcom/bv/wifisync/DirBrowser$ProgressInfo;
    iget v3, v2, Lcom/bv/wifisync/DirBrowser$ProgressInfo;->percent:I

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    iget v4, v2, Lcom/bv/wifisync/DirBrowser$ProgressInfo;->percent:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "% "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 597
    .local v1, percent:Ljava/lang/String;
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, v2, Lcom/bv/wifisync/DirBrowser$ProgressInfo;->action:Lcom/bv/sync/ProgressNotification$ProgressAction;

    iget-object v5, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-static {v4, v5}, Lcom/bv/wifisync/Utils;->getActionString(Lcom/bv/sync/ProgressNotification$ProgressAction;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Lcom/bv/wifisync/DirBrowser$ProgressInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v4}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 598
    .local v0, message:Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget v4, v2, Lcom/bv/wifisync/DirBrowser$ProgressInfo;->percent:I

    invoke-virtual {v3, v4, v0}, Lcom/bv/wifisync/DirBrowser;->setProgress(ILjava/lang/String;)V

    .line 599
    return-void

    .line 596
    .end local v0           #message:Ljava/lang/String;
    .end local v1           #percent:Ljava/lang/String;
    :cond_0
    const-string v1, ""

    goto :goto_0
.end method

.method protected bridge varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, [Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->onProgressUpdate([Lcom/bv/wifisync/DirBrowser$ProgressInfo;)V

    return-void
.end method
