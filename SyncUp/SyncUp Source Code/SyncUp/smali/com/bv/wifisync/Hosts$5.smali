.class Lcom/bv/wifisync/Hosts$5;
.super Ljava/lang/Object;
.source "Hosts.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Hosts;->update(Lcom/bv/wifisync/Job;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Hosts;

.field private final synthetic val$before:Z

.field private final synthetic val$job:Lcom/bv/wifisync/Job;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Hosts;ZLcom/bv/wifisync/Job;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    iput-boolean p2, p0, Lcom/bv/wifisync/Hosts$5;->val$before:Z

    iput-object p3, p0, Lcom/bv/wifisync/Hosts$5;->val$job:Lcom/bv/wifisync/Job;

    .line 806
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 810
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/bv/wifisync/Hosts;->setProgress(ILjava/lang/String;)V

    .line 811
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    iget-boolean v2, p0, Lcom/bv/wifisync/Hosts$5;->val$before:Z

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Hosts;->setProgressVisible(Z)V

    .line 812
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    const v2, 0x7f0600f0

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Hosts;->setTitle(I)V

    .line 813
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;
    invoke-static {v1}, Lcom/bv/wifisync/Hosts;->access$14(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$ItemsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->notifyDataSetChanged()V

    .line 814
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    #calls: Lcom/bv/wifisync/Hosts;->setHelpText()V
    invoke-static {v1}, Lcom/bv/wifisync/Hosts;->access$21(Lcom/bv/wifisync/Hosts;)V

    .line 815
    iget-boolean v1, p0, Lcom/bv/wifisync/Hosts$5;->val$before:Z

    if-nez v1, :cond_1

    .line 816
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    const-string v3, "Runs"

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->val$job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;

    if-nez v1, :cond_2

    const-string v1, "Job run success"

    :goto_0
    invoke-virtual {v2, v3, v1}, Lcom/bv/wifisync/Hosts;->dispatchEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 817
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->val$job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    if-eqz v1, :cond_0

    .line 818
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v2, p0, Lcom/bv/wifisync/Hosts$5;->val$job:Lcom/bv/wifisync/Job;

    iget-object v2, v2, Lcom/bv/wifisync/Job;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-object v2, v2, Lcom/bv/sync/CifsSync$SyncStats;->timeZoneConflicts:[I

    #calls: Lcom/bv/wifisync/Hosts;->dispatchTimeZoneErrors([I)V
    invoke-static {v1, v2}, Lcom/bv/wifisync/Hosts;->access$22(Lcom/bv/wifisync/Hosts;[I)V

    .line 819
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->val$job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;

    if-eqz v1, :cond_3

    .line 820
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v2, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v3, p0, Lcom/bv/wifisync/Hosts$5;->val$job:Lcom/bv/wifisync/Job;

    iget-object v3, v3, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/String;)V

    .line 827
    :cond_1
    :goto_1
    return-void

    .line 816
    :cond_2
    const-string v1, "Job run fail"

    goto :goto_0

    .line 822
    :cond_3
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v2, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    const v3, 0x7f060129

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/bv/wifisync/Hosts$5;->val$job:Lcom/bv/wifisync/Job;

    invoke-virtual {v6}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/Hosts;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 824
    :catch_0
    move-exception v0

    .line 825
    .local v0, e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$5;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
