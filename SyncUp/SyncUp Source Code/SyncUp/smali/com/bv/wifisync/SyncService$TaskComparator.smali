.class Lcom/bv/wifisync/SyncService$TaskComparator;
.super Ljava/lang/Object;
.source "SyncService.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/SyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TaskComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/bv/wifisync/SyncService$SyncTask;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/SyncService;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/SyncService;)V
    .locals 0
    .parameter

    .prologue
    .line 533
    iput-object p1, p0, Lcom/bv/wifisync/SyncService$TaskComparator;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/SyncService$TaskComparator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 533
    invoke-direct {p0, p1}, Lcom/bv/wifisync/SyncService$TaskComparator;-><init>(Lcom/bv/wifisync/SyncService;)V

    return-void
.end method

.method private compareConnectedRouters(Lcom/bv/wifisync/SyncService$SyncTask;Lcom/bv/wifisync/SyncService$SyncTask;)I
    .locals 7
    .parameter "task0"
    .parameter "task1"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 557
    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;
    invoke-static {p1}, Lcom/bv/wifisync/SyncService$SyncTask;->access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;

    move-result-object v5

    iget-object v6, p0, Lcom/bv/wifisync/SyncService$TaskComparator;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v5, v6}, Lcom/bv/wifisync/Job;->isConnected(Landroid/content/Context;)Z

    move-result v0

    .line 558
    .local v0, connected0:Z
    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;
    invoke-static {p2}, Lcom/bv/wifisync/SyncService$SyncTask;->access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;

    move-result-object v5

    iget-object v6, p0, Lcom/bv/wifisync/SyncService$TaskComparator;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v5, v6}, Lcom/bv/wifisync/Job;->isConnected(Landroid/content/Context;)Z

    move-result v1

    .line 559
    .local v1, connected1:Z
    if-eqz v0, :cond_0

    if-nez v1, :cond_2

    :cond_0
    if-nez v0, :cond_1

    if-eqz v1, :cond_2

    :cond_1
    move v2, v3

    .line 560
    .local v2, equal:Z
    :goto_0
    if-eqz v2, :cond_3

    :goto_1
    return v3

    .end local v2           #equal:Z
    :cond_2
    move v2, v4

    .line 559
    goto :goto_0

    .line 560
    .restart local v2       #equal:Z
    :cond_3
    if-eqz v0, :cond_4

    const/4 v3, -0x1

    goto :goto_1

    :cond_4
    move v3, v4

    goto :goto_1
.end method


# virtual methods
.method public compare(Lcom/bv/wifisync/SyncService$SyncTask;Lcom/bv/wifisync/SyncService$SyncTask;)I
    .locals 7
    .parameter "task0"
    .parameter "task1"

    .prologue
    .line 536
    if-eq p1, p2, :cond_0

    iget-boolean v3, p1, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    if-eqz v3, :cond_2

    iget-boolean v3, p2, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    if-eqz v3, :cond_2

    .line 537
    :cond_0
    const/4 v2, 0x0

    .line 553
    :cond_1
    :goto_0
    return v2

    .line 540
    :cond_2
    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;
    invoke-static {p1}, Lcom/bv/wifisync/SyncService$SyncTask;->access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;

    move-result-object v3

    iget-object v4, p0, Lcom/bv/wifisync/SyncService$TaskComparator;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/Job;->getNextTimeToRun(Landroid/content/Context;)Ljava/util/Date;

    move-result-object v0

    .line 541
    .local v0, date0:Ljava/util/Date;
    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;
    invoke-static {p2}, Lcom/bv/wifisync/SyncService$SyncTask;->access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;

    move-result-object v3

    iget-object v4, p0, Lcom/bv/wifisync/SyncService$TaskComparator;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/Job;->getNextTimeToRun(Landroid/content/Context;)Ljava/util/Date;

    move-result-object v1

    .line 542
    .local v1, date1:Ljava/util/Date;
    if-nez v0, :cond_3

    if-nez v1, :cond_3

    .line 543
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/SyncService$TaskComparator;->compareConnectedRouters(Lcom/bv/wifisync/SyncService$SyncTask;Lcom/bv/wifisync/SyncService$SyncTask;)I

    move-result v2

    .local v2, result:I
    goto :goto_0

    .line 544
    .end local v2           #result:I
    :cond_3
    iget-boolean v3, p1, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    if-nez v3, :cond_4

    if-nez v0, :cond_5

    .line 545
    :cond_4
    const/4 v2, -0x1

    .restart local v2       #result:I
    goto :goto_0

    .line 546
    .end local v2           #result:I
    :cond_5
    iget-boolean v3, p2, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    if-nez v3, :cond_6

    if-nez v1, :cond_7

    .line 547
    :cond_6
    const/4 v2, 0x1

    .restart local v2       #result:I
    goto :goto_0

    .line 549
    .end local v2           #result:I
    :cond_7
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/SyncService$TaskComparator;->compareConnectedRouters(Lcom/bv/wifisync/SyncService$SyncTask;Lcom/bv/wifisync/SyncService$SyncTask;)I

    move-result v2

    .line 550
    .restart local v2       #result:I
    if-nez v2, :cond_1

    .line 551
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    sub-long/2addr v3, v5

    long-to-int v2, v3

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/wifisync/SyncService$SyncTask;

    check-cast p2, Lcom/bv/wifisync/SyncService$SyncTask;

    invoke-virtual {p0, p1, p2}, Lcom/bv/wifisync/SyncService$TaskComparator;->compare(Lcom/bv/wifisync/SyncService$SyncTask;Lcom/bv/wifisync/SyncService$SyncTask;)I

    move-result v0

    return v0
.end method
