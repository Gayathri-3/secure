.class public Lcom/bv/wifisync/SyncService;
.super Landroid/app/Service;
.source "SyncService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/SyncService$NotificationType;,
        Lcom/bv/wifisync/SyncService$Notify;,
        Lcom/bv/wifisync/SyncService$ServiceBinder;,
        Lcom/bv/wifisync/SyncService$SyncQueue;,
        Lcom/bv/wifisync/SyncService$SyncTask;,
        Lcom/bv/wifisync/SyncService$TaskComparator;,
        Lcom/bv/wifisync/SyncService$TimerThread;
    }
.end annotation


# static fields
.field private static final CANCEL_ACTION:Ljava/lang/String; = "com.bv.wifisync.cancel"

.field private static final TAG:Ljava/lang/String; = "SyncService"

.field private static hosts:Lcom/bv/wifisync/HostList;

.field private static lock:[Ljava/lang/Object;

.field private static volatile timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

.field private static volatile wakeLock:Landroid/os/PowerManager$WakeLock;


# instance fields
.field private cancelIntent:Landroid/content/Intent;

.field private lastAliveTime:J

.field private notificationManager:Landroid/app/NotificationManager;

.field private queue:Lcom/bv/wifisync/SyncService$SyncQueue;

.field private runCount:I

.field private runningNotification:Landroid/app/Notification;

.field private ui:Lcom/bv/wifisync/SyncService$Notify;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 66
    const-string v0, "jcifs.smb.client.soTimeout"

    const-string v1, "3000"

    invoke-static {v0, v1}, Ljcifs/Config;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 67
    const-string v0, "jcifs.smb.client.responseTimeout"

    const-string v1, "4000"

    invoke-static {v0, v1}, Ljcifs/Config;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 68
    const-string v0, "jcifs.smb.client.dfs.disabled"

    const-string v1, "true"

    invoke-static {v0, v1}, Ljcifs/Config;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 69
    const-string v0, "jcifs.netbios.retryCount"

    const-string v1, "1"

    invoke-static {v0, v1}, Ljcifs/Config;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    const/16 v0, 0xa

    invoke-static {v0}, Lcom/bv/sync/RemoteFile;->setRetryCount(I)V

    .line 127
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lcom/bv/wifisync/SyncService;->lock:[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bv/wifisync/SyncService;->lastAliveTime:J

    .line 47
    new-instance v0, Lcom/bv/wifisync/SyncService$SyncQueue;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/bv/wifisync/SyncService$SyncQueue;-><init>(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/SyncService$SyncQueue;)V

    iput-object v0, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    .line 36
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/SyncService;)Landroid/content/Intent;
    .locals 1
    .parameter

    .prologue
    .line 48
    iget-object v0, p0, Lcom/bv/wifisync/SyncService;->cancelIntent:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic access$1(Lcom/bv/wifisync/SyncService;Landroid/content/Intent;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 48
    iput-object p1, p0, Lcom/bv/wifisync/SyncService;->cancelIntent:Landroid/content/Intent;

    return-void
.end method

.method static synthetic access$10(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 396
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/SyncService;->updateUI(Lcom/bv/wifisync/Job;Z)V

    return-void
.end method

.method static synthetic access$11(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 195
    invoke-direct {p0, p1}, Lcom/bv/wifisync/SyncService;->showRunningNotification(Lcom/bv/wifisync/Job;)V

    return-void
.end method

.method static synthetic access$12(Lcom/bv/wifisync/SyncService;Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 465
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/bv/wifisync/SyncService;->updateNotification(Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$2()Lcom/bv/wifisync/SyncService$TimerThread;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    return-object v0
.end method

.method static synthetic access$3(Lcom/bv/wifisync/SyncService;)Landroid/app/Notification;
    .locals 1
    .parameter

    .prologue
    .line 41
    iget-object v0, p0, Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/SyncService;Landroid/app/Notification;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 41
    iput-object p1, p0, Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;

    return-void
.end method

.method static synthetic access$5(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;
    .locals 1
    .parameter

    .prologue
    .line 40
    iget-object v0, p0, Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;

    return-object v0
.end method

.method static synthetic access$6(Lcom/bv/wifisync/SyncService;J)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 44
    iput-wide p1, p0, Lcom/bv/wifisync/SyncService;->lastAliveTime:J

    return-void
.end method

.method static synthetic access$7(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/SyncService$Notify;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 42
    iput-object p1, p0, Lcom/bv/wifisync/SyncService;->ui:Lcom/bv/wifisync/SyncService$Notify;

    return-void
.end method

.method static synthetic access$8()Lcom/bv/wifisync/HostList;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/bv/wifisync/SyncService;->hosts:Lcom/bv/wifisync/HostList;

    return-object v0
.end method

.method static synthetic access$9(Lcom/bv/wifisync/SyncService;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 458
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/SyncService;->showError(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static acquireWakeLock(Landroid/content/Context;)V
    .locals 4
    .parameter "context"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Wakelock"
        }
    .end annotation

    .prologue
    .line 131
    sget-object v2, Lcom/bv/wifisync/SyncService;->lock:[Ljava/lang/Object;

    monitor-enter v2

    .line 132
    :try_start_0
    sget-object v1, Lcom/bv/wifisync/SyncService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v1, :cond_0

    .line 133
    const-string v1, "power"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 134
    .local v0, powerManager:Landroid/os/PowerManager;
    const/4 v1, 0x1

    const v3, 0x7f060001

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    sput-object v1, Lcom/bv/wifisync/SyncService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    .line 135
    sget-object v1, Lcom/bv/wifisync/SyncService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 131
    .end local v0           #powerManager:Landroid/os/PowerManager;
    :cond_0
    monitor-exit v2

    .line 138
    return-void

    .line 131
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private enableReceiver(Ljava/lang/Class;Z)V
    .locals 4
    .parameter
    .parameter "enable"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .local p1, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v3, 0x1

    .line 589
    invoke-virtual {p0}, Lcom/bv/wifisync/SyncService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 590
    .local v1, packageManager:Landroid/content/pm/PackageManager;
    if-eqz p2, :cond_0

    move v2, v3

    .line 591
    .local v2, state:I
    :goto_0
    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, p0, p1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 592
    .local v0, componentName:Landroid/content/ComponentName;
    invoke-virtual {v1, v0, v2, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 593
    return-void

    .line 590
    .end local v0           #componentName:Landroid/content/ComponentName;
    .end local v2           #state:I
    :cond_0
    const/4 v2, 0x2

    goto :goto_0
.end method

.method private isCancelRun(Landroid/content/Intent;)Z
    .locals 2
    .parameter "intent"

    .prologue
    .line 420
    if-eqz p1, :cond_0

    const-string v0, "com.bv.wifisync.cancel"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isClearAllNotifications(Landroid/content/Intent;)Z
    .locals 2
    .parameter "intent"

    .prologue
    const/4 v0, 0x0

    .line 424
    if-eqz p1, :cond_0

    const-string v1, "notification"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private isScheduled(Lcom/bv/wifisync/Job;)Z
    .locals 3
    .parameter "job"

    .prologue
    .line 604
    iget-object v2, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncService$SyncQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 605
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/wifisync/SyncService$SyncTask;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 610
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 606
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/SyncService$SyncTask;

    .line 607
    .local v1, next:Lcom/bv/wifisync/SyncService$SyncTask;
    iget-boolean v2, v1, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    if-eqz v2, :cond_0

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/SyncService$SyncTask;->access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 608
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private queueTask(Lcom/bv/wifisync/SyncService$SyncTask;)V
    .locals 5
    .parameter "task"

    .prologue
    .line 176
    iget-boolean v2, p1, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    if-nez v2, :cond_1

    invoke-virtual {p1}, Lcom/bv/wifisync/SyncService$SyncTask;->getScheduledTime()Ljava/util/Date;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 177
    iget-object v3, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    monitor-enter v3

    .line 178
    :try_start_0
    iget-object v2, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncService$SyncQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 179
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/wifisync/SyncService$SyncTask;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 184
    iget-object v2, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    invoke-virtual {v2, p1}, Lcom/bv/wifisync/SyncService$SyncQueue;->add(Lcom/bv/wifisync/SyncService$SyncTask;)Z

    .line 177
    monitor-exit v3

    .line 187
    .end local v0           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/wifisync/SyncService$SyncTask;>;"
    :cond_1
    return-void

    .line 180
    .restart local v0       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/wifisync/SyncService$SyncTask;>;"
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/SyncService$SyncTask;

    .line 181
    .local v1, next:Lcom/bv/wifisync/SyncService$SyncTask;
    iget-boolean v2, v1, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    if-nez v2, :cond_0

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/SyncService$SyncTask;->access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;

    move-result-object v2

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;
    invoke-static {p1}, Lcom/bv/wifisync/SyncService$SyncTask;->access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;

    move-result-object v4

    if-ne v2, v4, :cond_0

    .line 182
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 177
    .end local v0           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/wifisync/SyncService$SyncTask;>;"
    .end local v1           #next:Lcom/bv/wifisync/SyncService$SyncTask;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private queueTasks()V
    .locals 9

    .prologue
    .line 565
    const/4 v2, 0x0

    .line 566
    .local v2, enableWifiWakeup:Z
    const/4 v0, 0x0

    .line 567
    .local v0, enableBootWakup:Z
    const/4 v1, 0x0

    .line 568
    .local v1, enableChargingWakup:Z
    const-string v5, "SyncService"

    const-string v6, "Queue tasks"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    iget-object v6, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    monitor-enter v6

    .line 570
    :try_start_0
    iget-object v5, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    invoke-virtual {v5}, Lcom/bv/wifisync/SyncService$SyncQueue;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 571
    .local v3, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/wifisync/SyncService$SyncTask;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 574
    sget-object v5, Lcom/bv/wifisync/SyncService;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v5}, Lcom/bv/wifisync/HostList;->getJobs()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_2

    .line 569
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 582
    const-class v5, Lcom/bv/wifisync/Autostart;

    invoke-direct {p0, v5, v0}, Lcom/bv/wifisync/SyncService;->enableReceiver(Ljava/lang/Class;Z)V

    .line 583
    const-class v5, Lcom/bv/wifisync/WifiConnectReceiver;

    invoke-direct {p0, v5, v2}, Lcom/bv/wifisync/SyncService;->enableReceiver(Ljava/lang/Class;Z)V

    .line 584
    const-class v5, Lcom/bv/wifisync/ChargeConnectReceiver;

    invoke-direct {p0, v5, v1}, Lcom/bv/wifisync/SyncService;->enableReceiver(Ljava/lang/Class;Z)V

    .line 585
    invoke-direct {p0}, Lcom/bv/wifisync/SyncService;->startTimerThread()V

    .line 586
    return-void

    .line 572
    :cond_1
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bv/wifisync/SyncService$SyncTask;

    iget-boolean v5, v5, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    if-nez v5, :cond_0

    .line 573
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 569
    .end local v3           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/wifisync/SyncService$SyncTask;>;"
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 574
    .restart local v3       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/wifisync/SyncService$SyncTask;>;"
    :cond_2
    :try_start_2
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/wifisync/Job;

    .line 575
    .local v4, job:Lcom/bv/wifisync/Job;
    iget-boolean v7, v4, Lcom/bv/wifisync/Job;->running:Z

    if-nez v7, :cond_3

    invoke-virtual {v4}, Lcom/bv/wifisync/Job;->isScheduled()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {v4, p0}, Lcom/bv/wifisync/Job;->isConnected(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 576
    iget-object v7, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    new-instance v8, Lcom/bv/wifisync/SyncService$SyncTask;

    invoke-direct {v8, p0, v4}, Lcom/bv/wifisync/SyncService$SyncTask;-><init>(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;)V

    invoke-virtual {v7, v8}, Lcom/bv/wifisync/SyncService$SyncQueue;->add(Lcom/bv/wifisync/SyncService$SyncTask;)Z

    .line 577
    :cond_3
    invoke-virtual {v4}, Lcom/bv/wifisync/Job;->isRouterDependant()Z

    move-result v7

    or-int/2addr v2, v7

    .line 578
    invoke-virtual {v4}, Lcom/bv/wifisync/Job;->isScheduled()Z

    move-result v7

    or-int/2addr v0, v7

    .line 579
    invoke-virtual {v4}, Lcom/bv/wifisync/Job;->isChargingDependant()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v7

    or-int/2addr v1, v7

    goto :goto_1
.end method

.method private releaseWakeLock()V
    .locals 2

    .prologue
    .line 141
    sget-object v1, Lcom/bv/wifisync/SyncService;->lock:[Ljava/lang/Object;

    monitor-enter v1

    .line 142
    :try_start_0
    sget-object v0, Lcom/bv/wifisync/SyncService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    .line 143
    sget-object v0, Lcom/bv/wifisync/SyncService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 144
    const/4 v0, 0x0

    sput-object v0, Lcom/bv/wifisync/SyncService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    .line 141
    :cond_0
    monitor-exit v1

    .line 147
    return-void

    .line 141
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private runTasks()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    const-string v1, "SyncService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Running tasks "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    :goto_0
    iget-object v1, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    invoke-virtual {v1}, Lcom/bv/wifisync/SyncService$SyncQueue;->poll()Lcom/bv/wifisync/SyncService$SyncTask;

    move-result-object v0

    .local v0, task:Lcom/bv/wifisync/SyncService$SyncTask;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/bv/wifisync/SyncService$SyncTask;->isReady()Z

    move-result v1

    if-nez v1, :cond_2

    .line 157
    :cond_0
    if-eqz v0, :cond_1

    .line 158
    invoke-direct {p0, v0}, Lcom/bv/wifisync/SyncService;->scheduleAwake(Lcom/bv/wifisync/SyncService$SyncTask;)V

    .line 159
    :cond_1
    sget-object v1, Lcom/bv/wifisync/SyncService;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v1, p0}, Lcom/bv/wifisync/HostList;->saveIfChanged(Landroid/content/Context;)V

    .line 160
    return-void

    .line 153
    :cond_2
    const-string v1, "SyncService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Task is ready: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/bv/wifisync/SyncService$SyncTask;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", scheduled at: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/bv/wifisync/SyncService$SyncTask;->getScheduledTime()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    invoke-virtual {v0}, Lcom/bv/wifisync/SyncService$SyncTask;->run()V

    .line 155
    invoke-direct {p0, v0}, Lcom/bv/wifisync/SyncService;->queueTask(Lcom/bv/wifisync/SyncService$SyncTask;)V

    goto :goto_0
.end method

.method private scheduleAwake(Lcom/bv/wifisync/SyncService$SyncTask;)V
    .locals 8
    .parameter "task"

    .prologue
    const/4 v7, 0x0

    .line 163
    invoke-virtual {p1}, Lcom/bv/wifisync/SyncService$SyncTask;->getScheduledTime()Ljava/util/Date;

    move-result-object v1

    .line 164
    .local v1, nextTimeToRun:Ljava/util/Date;
    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/bv/wifisync/SyncService$SyncTask;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 165
    const-string v5, "alarm"

    invoke-virtual {p0, v5}, Lcom/bv/wifisync/SyncService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 166
    .local v0, alarmManager:Landroid/app/AlarmManager;
    new-instance v5, Landroid/content/Intent;

    const-class v6, Lcom/bv/wifisync/Autostart;

    invoke-direct {v5, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {p0, v7, v5, v7}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 167
    .local v2, pending:Landroid/app/PendingIntent;
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    .line 168
    .local v3, time:J
    invoke-virtual {v0, v7, v3, v4, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 169
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    cmp-long v5, v3, v5

    if-gtz v5, :cond_0

    .line 170
    const-string v5, "SyncService"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Assertion failed, wakeup time is less than current time, task "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/bv/wifisync/SyncService$SyncTask;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    :cond_0
    const-string v5, "SyncService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/bv/wifisync/SyncService$SyncTask;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " scheduling awake at: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    .end local v0           #alarmManager:Landroid/app/AlarmManager;
    .end local v2           #pending:Landroid/app/PendingIntent;
    .end local v3           #time:J
    :cond_1
    return-void
.end method

.method private scheduleDailyWakeup()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 505
    const-string v1, "alarm"

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/SyncService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 506
    .local v0, alarmManager:Landroid/app/AlarmManager;
    new-instance v7, Landroid/content/Intent;

    const-class v1, Lcom/bv/wifisync/SyncService;

    invoke-direct {v7, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 507
    .local v7, intent:Landroid/content/Intent;
    invoke-static {p0, v2, v7, v2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 508
    .local v6, pending:Landroid/app/PendingIntent;
    const/4 v1, 0x2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    sub-long/2addr v2, v4

    const-wide/32 v4, 0x2932e00

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setInexactRepeating(IJJLandroid/app/PendingIntent;)V

    .line 509
    return-void
.end method

.method private showError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "title"
    .parameter "details"

    .prologue
    .line 459
    new-instance v0, Landroid/app/Notification;

    const v1, 0x7f02002e

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v1, p1, v2, v3}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 460
    .local v0, notification:Landroid/app/Notification;
    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/bv/wifisync/SyncService;->updateNotification(Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;I)V

    .line 461
    iget-object v1, p0, Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;

    sget-object v2, Lcom/bv/wifisync/SyncService$NotificationType;->Error:Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncService$NotificationType;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 462
    return-void
.end method

.method private showRunningNotification(Lcom/bv/wifisync/Job;)V
    .locals 6
    .parameter "job"

    .prologue
    const v5, 0x7f06012a

    .line 196
    iget-object v2, p0, Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;

    if-nez v2, :cond_0

    .line 197
    new-instance v2, Landroid/app/Notification;

    invoke-direct {v2}, Landroid/app/Notification;-><init>()V

    iput-object v2, p0, Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;

    .line 198
    iget-object v2, p0, Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;

    const/high16 v3, 0x7f05

    iput v3, v2, Landroid/app/Notification;->icon:I

    .line 200
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0, v5}, Lcom/bv/wifisync/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 201
    iget-object v2, p0, Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, v2, Landroid/app/Notification;->when:J

    .line 202
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/bv/wifisync/Hosts;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 203
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "android.intent.action.MAIN"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 204
    const-string v2, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 205
    const/4 v2, 0x0

    .line 206
    const/high16 v3, 0x800

    .line 205
    invoke-static {p0, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 208
    .local v0, contentIntent:Landroid/app/PendingIntent;
    iget-object v2, p0, Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;

    invoke-virtual {p1}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v5}, Lcom/bv/wifisync/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, p0, v3, v4, v0}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 210
    iget-object v2, p0, Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;

    const/16 v3, 0x22

    iput v3, v2, Landroid/app/Notification;->flags:I

    .line 211
    sget-object v2, Lcom/bv/wifisync/SyncService$NotificationType;->Progress:Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncService$NotificationType;->ordinal()I

    move-result v2

    iget-object v3, p0, Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;

    invoke-virtual {p0, v2, v3}, Lcom/bv/wifisync/SyncService;->startForeground(ILandroid/app/Notification;)V

    .line 212
    return-void
.end method

.method static start(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 618
    invoke-static {p0}, Lcom/bv/wifisync/SyncService;->acquireWakeLock(Landroid/content/Context;)V

    .line 619
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/bv/wifisync/SyncService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 620
    return-void
.end method

.method private declared-synchronized startTimerThread()V
    .locals 4

    .prologue
    .line 443
    monitor-enter p0

    :try_start_0
    const-string v0, "SyncService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Timer thread is "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 444
    sget-object v0, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    if-nez v0, :cond_1

    .line 445
    const-string v0, "SyncService"

    const-string v1, "Starting timer thread"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    new-instance v0, Lcom/bv/wifisync/SyncService$TimerThread;

    iget-object v1, p0, Lcom/bv/wifisync/SyncService;->ui:Lcom/bv/wifisync/SyncService$Notify;

    invoke-direct {v0, p0, v1}, Lcom/bv/wifisync/SyncService$TimerThread;-><init>(Ljava/lang/Runnable;Lcom/bv/wifisync/SyncService$Notify;)V

    sput-object v0, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    .line 447
    sget-object v0, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    invoke-virtual {v0}, Lcom/bv/wifisync/SyncService$TimerThread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 455
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 448
    :cond_1
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/bv/wifisync/SyncService;->lastAliveTime:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x25c3f80

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 449
    const-string v0, "SyncService"

    const-string v1, "Timer thread is dead"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    sget-object v0, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    invoke-virtual {v0}, Lcom/bv/wifisync/SyncService$TimerThread;->interrupt()V

    .line 451
    const/4 v0, 0x0

    sput-object v0, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    .line 452
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bv/wifisync/SyncService;->lastAliveTime:J

    .line 453
    invoke-direct {p0}, Lcom/bv/wifisync/SyncService;->startTimerThread()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 443
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private updateNotification(Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 4
    .parameter "notification"
    .parameter "title"
    .parameter "details"
    .parameter "jobId"

    .prologue
    .line 466
    iput-object p2, p1, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 467
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p1, Landroid/app/Notification;->when:J

    .line 468
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/bv/wifisync/Hosts;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 469
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "android.intent.action.MAIN"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 470
    const-string v2, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 471
    const/high16 v2, 0x2400

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 472
    if-eqz p4, :cond_0

    .line 473
    const-string v2, "notification"

    invoke-virtual {v1, v2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 474
    :cond_0
    const/4 v2, 0x0

    .line 475
    const/high16 v3, 0x4800

    .line 474
    invoke-static {p0, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 477
    .local v0, contentIntent:Landroid/app/PendingIntent;
    invoke-virtual {p1, p0, p2, p3, v0}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 478
    const/16 v2, 0x18

    iput v2, p1, Landroid/app/Notification;->flags:I

    .line 479
    iget v2, p1, Landroid/app/Notification;->defaults:I

    or-int/lit8 v2, v2, 0x1

    iput v2, p1, Landroid/app/Notification;->defaults:I

    .line 480
    return-void
.end method

.method private updateUI(Lcom/bv/wifisync/Job;Z)V
    .locals 2
    .parameter "job"
    .parameter "beforeRun"

    .prologue
    .line 398
    monitor-enter p0

    .line 399
    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/SyncService;->ui:Lcom/bv/wifisync/SyncService$Notify;

    .line 398
    .local v0, notify:Lcom/bv/wifisync/SyncService$Notify;
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 401
    if-eqz v0, :cond_1

    .line 402
    invoke-interface {v0, p1, p2}, Lcom/bv/wifisync/SyncService$Notify;->update(Lcom/bv/wifisync/Job;Z)V

    .line 405
    :cond_0
    :goto_0
    return-void

    .line 398
    .end local v0           #notify:Lcom/bv/wifisync/SyncService$Notify;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 403
    .restart local v0       #notify:Lcom/bv/wifisync/SyncService$Notify;
    :cond_1
    if-eqz p2, :cond_0

    .line 404
    iget v1, p0, Lcom/bv/wifisync/SyncService;->runCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/bv/wifisync/SyncService;->runCount:I

    goto :goto_0
.end method


# virtual methods
.method public cancel(Lcom/bv/wifisync/Host;)V
    .locals 5
    .parameter "host"

    .prologue
    .line 623
    iget-object v4, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    monitor-enter v4

    .line 624
    :try_start_0
    iget-object v3, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    invoke-virtual {v3}, Lcom/bv/wifisync/SyncService$SyncQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 626
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/wifisync/SyncService$SyncTask;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 623
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 630
    invoke-virtual {p1}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    .line 633
    return-void

    .line 627
    :cond_2
    :try_start_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/SyncService$SyncTask;

    .local v2, next:Lcom/bv/wifisync/SyncService$SyncTask;
    iget-boolean v3, v2, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    if-eqz v3, :cond_0

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/SyncService$SyncTask;->access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;

    move-result-object v3

    iget-object v3, v3, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    if-ne p1, v3, :cond_0

    .line 628
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 623
    .end local v0           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/wifisync/SyncService$SyncTask;>;"
    .end local v2           #next:Lcom/bv/wifisync/SyncService$SyncTask;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 630
    .restart local v0       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/bv/wifisync/SyncService$SyncTask;>;"
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job;

    .line 631
    .local v1, job:Lcom/bv/wifisync/Job;
    iget-boolean v4, v1, Lcom/bv/wifisync/Job;->running:Z

    if-eqz v4, :cond_1

    .line 632
    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->cancel()V

    goto :goto_1
.end method

.method getHosts()Lcom/bv/wifisync/HostList;
    .locals 1

    .prologue
    .line 614
    sget-object v0, Lcom/bv/wifisync/SyncService;->hosts:Lcom/bv/wifisync/HostList;

    return-object v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 519
    new-instance v0, Lcom/bv/wifisync/SyncService$ServiceBinder;

    invoke-direct {v0, p0}, Lcom/bv/wifisync/SyncService$ServiceBinder;-><init>(Lcom/bv/wifisync/SyncService;)V

    return-object v0
.end method

.method public onCreate()V
    .locals 6

    .prologue
    .line 484
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 485
    const-string v2, "SyncService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Service created "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    invoke-virtual {p0}, Lcom/bv/wifisync/SyncService;->getApplication()Landroid/app/Application;

    move-result-object v2

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->setPostMortem(Landroid/content/Context;)V

    .line 487
    const-string v2, "notification"

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/SyncService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    iput-object v2, p0, Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;

    .line 489
    :try_start_0
    sget-object v2, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    if-nez v2, :cond_0

    .line 490
    invoke-static {p0}, Lcom/bv/wifisync/HostList;->load(Landroid/content/Context;)Lcom/bv/wifisync/HostList;

    move-result-object v2

    sput-object v2, Lcom/bv/wifisync/SyncService;->hosts:Lcom/bv/wifisync/HostList;

    .line 491
    iget-object v2, p0, Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;

    sget-object v3, Lcom/bv/wifisync/SyncService$NotificationType;->Progress:Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-virtual {v3}, Lcom/bv/wifisync/SyncService$NotificationType;->ordinal()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/app/NotificationManager;->cancel(I)V

    .line 492
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/SyncService;->stopForeground(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 499
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/bv/wifisync/SyncService;->scheduleDailyWakeup()V

    .line 500
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getNetworkTimeout(Landroid/content/Context;)I

    move-result v2

    div-int/lit8 v2, v2, 0x3

    invoke-static {v2}, Lcom/bv/sync/RemoteFile;->setRetryCount(I)V

    .line 501
    invoke-direct {p0}, Lcom/bv/wifisync/SyncService;->queueTasks()V

    .line 502
    return-void

    .line 494
    :catch_0
    move-exception v0

    .line 495
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    .line 496
    .local v1, message:Ljava/lang/String;
    const v2, 0x7f0600ae

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const v4, 0x7f0600a2

    invoke-virtual {p0, v4}, Lcom/bv/wifisync/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/bv/wifisync/SyncService;->showError(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    new-instance v2, Lcom/bv/wifisync/HostList;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/HostList;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/bv/wifisync/SyncService;->hosts:Lcom/bv/wifisync/HostList;

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 6

    .prologue
    .line 429
    const-string v1, "SyncService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Service terminated "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    :try_start_0
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 432
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v1

    const-string v2, "SyncService"

    const-string v3, "Run"

    const-string v4, "Scheduled"

    iget v5, p0, Lcom/bv/wifisync/SyncService;->runCount:I

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 433
    const/4 v1, 0x0

    iput v1, p0, Lcom/bv/wifisync/SyncService;->runCount:I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 438
    :cond_0
    :goto_0
    invoke-static {}, Lcom/bv/wifisync/Utils;->stopTracker()V

    .line 439
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 440
    return-void

    .line 435
    :catch_0
    move-exception v0

    .line 436
    .local v0, th:Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public onLowMemory()V
    .locals 2

    .prologue
    .line 101
    invoke-super {p0}, Landroid/app/Service;->onLowMemory()V

    .line 102
    const-string v0, "SyncService"

    const-string v1, "Low memory"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2
    .parameter "intent"
    .parameter "flags"
    .parameter "startId"

    .prologue
    .line 409
    const-string v0, "SyncService"

    const-string v1, "OnStart"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 410
    invoke-direct {p0, p1}, Lcom/bv/wifisync/SyncService;->isClearAllNotifications(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 411
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/bv/wifisync/Utils;->setLastNotification(Landroid/content/Context;Lcom/bv/wifisync/Utils$LastNotification;)V

    .line 415
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/bv/wifisync/SyncService;->queueTasks()V

    .line 416
    const/4 v0, 0x1

    return v0

    .line 412
    :cond_1
    invoke-direct {p0, p1}, Lcom/bv/wifisync/SyncService;->isCancelRun(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 413
    iput-object p1, p0, Lcom/bv/wifisync/SyncService;->cancelIntent:Landroid/content/Intent;

    goto :goto_0
.end method

.method public run()V
    .locals 6

    .prologue
    .line 108
    :try_start_0
    invoke-static {p0}, Lcom/bv/wifisync/SyncService;->acquireWakeLock(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/bv/wifisync/SyncService;->runTasks()V

    .line 112
    iget-object v1, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    invoke-virtual {v1}, Lcom/bv/wifisync/SyncService$SyncQueue;->isModified()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    .line 114
    :try_start_2
    monitor-enter p0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 115
    :try_start_3
    invoke-direct {p0}, Lcom/bv/wifisync/SyncService;->releaseWakeLock()V

    .line 116
    const-string v1, "SyncService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Exit timer thread "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/bv/wifisync/SyncService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/SyncService;->stopService(Landroid/content/Intent;)Z

    .line 118
    const-string v1, "SyncService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Stop service "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    const/4 v1, 0x0

    sput-object v1, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    .line 114
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 125
    :goto_0
    return-void

    .line 113
    :catchall_0
    move-exception v1

    .line 114
    :try_start_4
    monitor-enter p0
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    .line 115
    :try_start_5
    invoke-direct {p0}, Lcom/bv/wifisync/SyncService;->releaseWakeLock()V

    .line 116
    const-string v2, "SyncService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Exit timer thread "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/bv/wifisync/SyncService;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/SyncService;->stopService(Landroid/content/Intent;)Z

    .line 118
    const-string v2, "SyncService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Stop service "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    const/4 v2, 0x0

    sput-object v2, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    .line 114
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 121
    :try_start_6
    throw v1
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0

    .line 122
    :catch_0
    move-exception v0

    .line 123
    .local v0, th:Ljava/lang/Throwable;
    const v1, 0x7f0600ae

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/bv/wifisync/SyncService;->showError(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 114
    .end local v0           #th:Ljava/lang/Throwable;
    :catchall_1
    move-exception v1

    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v1
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_0

    :catchall_2
    move-exception v1

    :try_start_9
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :try_start_a
    throw v1
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_0
.end method

.method runNow(Lcom/bv/wifisync/Job;)V
    .locals 4
    .parameter "job"

    .prologue
    .line 596
    const-string v0, "SyncService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Run now: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/bv/wifisync/Job;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 597
    iget-object v1, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    monitor-enter v1

    .line 598
    :try_start_0
    iget-boolean v0, p1, Lcom/bv/wifisync/Job;->running:Z

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/bv/wifisync/SyncService;->isScheduled(Lcom/bv/wifisync/Job;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 599
    iget-object v0, p0, Lcom/bv/wifisync/SyncService;->queue:Lcom/bv/wifisync/SyncService$SyncQueue;

    new-instance v2, Lcom/bv/wifisync/SyncService$SyncTask;

    const/4 v3, 0x1

    invoke-direct {v2, p0, p1, v3}, Lcom/bv/wifisync/SyncService$SyncTask;-><init>(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V

    invoke-virtual {v0, v2}, Lcom/bv/wifisync/SyncService$SyncQueue;->add(Lcom/bv/wifisync/SyncService$SyncTask;)Z

    .line 597
    :cond_0
    monitor-exit v1

    .line 601
    return-void

    .line 597
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method declared-synchronized setUI(Lcom/bv/wifisync/SyncService$Notify;)V
    .locals 1
    .parameter "ui"

    .prologue
    .line 528
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/bv/wifisync/SyncService;->ui:Lcom/bv/wifisync/SyncService$Notify;

    .line 529
    sget-object v0, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    if-eqz v0, :cond_0

    .line 530
    sget-object v0, Lcom/bv/wifisync/SyncService;->timerThread:Lcom/bv/wifisync/SyncService$TimerThread;

    #setter for: Lcom/bv/wifisync/SyncService$TimerThread;->ui:Lcom/bv/wifisync/SyncService$Notify;
    invoke-static {v0, p1}, Lcom/bv/wifisync/SyncService$TimerThread;->access$1(Lcom/bv/wifisync/SyncService$TimerThread;Lcom/bv/wifisync/SyncService$Notify;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 531
    :cond_0
    monitor-exit p0

    return-void

    .line 528
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method update()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 523
    sget-object v0, Lcom/bv/wifisync/SyncService;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v0, p0}, Lcom/bv/wifisync/HostList;->save(Landroid/content/Context;)V

    .line 524
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/bv/wifisync/SyncService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/SyncService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 525
    return-void
.end method
