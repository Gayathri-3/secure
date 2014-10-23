.class Lcom/bv/wifisync/SyncService$SyncTask;
.super Ljava/lang/Object;
.source "SyncService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/SyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SyncTask"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;
    }
.end annotation


# instance fields
.field private final job:Lcom/bv/wifisync/Job;

.field final runNow:Z

.field final synthetic this$0:Lcom/bv/wifisync/SyncService;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;)V
    .locals 1
    .parameter
    .parameter "job"

    .prologue
    .line 219
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/bv/wifisync/SyncService$SyncTask;-><init>(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V

    .line 220
    return-void
.end method

.method constructor <init>(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V
    .locals 0
    .parameter
    .parameter "job"
    .parameter "runNow"

    .prologue
    .line 238
    iput-object p1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    iput-object p2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    .line 240
    iput-boolean p3, p0, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    .line 241
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;
    .locals 1
    .parameter

    .prologue
    .line 215
    iget-object v0, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    return-object v0
.end method

.method static synthetic access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;
    .locals 1
    .parameter

    .prologue
    .line 214
    iget-object v0, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    return-object v0
.end method

.method private clearNotification(Lcom/bv/wifisync/Job;)V
    .locals 4
    .parameter "job"

    .prologue
    const/4 v3, 0x0

    .line 379
    invoke-static {}, Lcom/bv/wifisync/SyncService;->access$8()Lcom/bv/wifisync/HostList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/HostList;->hasFailedJobs()Z

    move-result v1

    if-nez v1, :cond_1

    .line 380
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    #getter for: Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/bv/wifisync/SyncService;->access$5(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;

    move-result-object v1

    sget-object v2, Lcom/bv/wifisync/SyncService$NotificationType;->JobError:Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncService$NotificationType;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/app/NotificationManager;->cancel(I)V

    .line 381
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-static {v1, v3}, Lcom/bv/wifisync/Utils;->setLastNotification(Landroid/content/Context;Lcom/bv/wifisync/Utils$LastNotification;)V

    .line 393
    :cond_0
    :goto_0
    return-void

    .line 383
    :cond_1
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->getLastNotification(Landroid/content/Context;)Lcom/bv/wifisync/Utils$LastNotification;

    move-result-object v0

    .line 384
    .local v0, lastNotification:Lcom/bv/wifisync/Utils$LastNotification;
    if-eqz v0, :cond_0

    .line 385
    iget v1, v0, Lcom/bv/wifisync/Utils$LastNotification;->jobId:I

    iget v2, p1, Lcom/bv/wifisync/Job;->id:I

    if-ne v1, v2, :cond_2

    .line 386
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    #getter for: Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/bv/wifisync/SyncService;->access$5(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;

    move-result-object v1

    sget-object v2, Lcom/bv/wifisync/SyncService$NotificationType;->JobError:Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncService$NotificationType;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/app/NotificationManager;->cancel(I)V

    .line 387
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-static {v1, v3}, Lcom/bv/wifisync/Utils;->setLastNotification(Landroid/content/Context;Lcom/bv/wifisync/Utils$LastNotification;)V

    goto :goto_0

    .line 388
    :cond_2
    iget v1, v0, Lcom/bv/wifisync/Utils$LastNotification;->jobId:I

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-static {v1}, Lcom/bv/wifisync/Config;->getShowErrorNotification(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 389
    iget-object v1, v0, Lcom/bv/wifisync/Utils$LastNotification;->title:Ljava/lang/String;

    iget-object v2, v0, Lcom/bv/wifisync/Utils$LastNotification;->details:Ljava/lang/String;

    iget v3, v0, Lcom/bv/wifisync/Utils$LastNotification;->jobId:I

    invoke-direct {p0, v1, v2, v3}, Lcom/bv/wifisync/SyncService$SyncTask;->showJobError(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private internalRun()V
    .locals 8

    .prologue
    const v7, 0x7f0600a3

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 316
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    #calls: Lcom/bv/wifisync/SyncService;->showRunningNotification(Lcom/bv/wifisync/Job;)V
    invoke-static {v1, v2}, Lcom/bv/wifisync/SyncService;->access$11(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;)V

    .line 317
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    iget-boolean v3, p0, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    invoke-virtual {v1, v2, v3}, Lcom/bv/wifisync/Job;->initRun(Landroid/content/Context;Z)V

    .line 318
    invoke-static {}, Lcom/bv/wifisync/SyncService;->access$8()Lcom/bv/wifisync/HostList;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/HostList;->save(Landroid/content/Context;)V

    .line 319
    const/16 v1, 0xa

    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    .line 320
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    const/4 v3, 0x1

    #calls: Lcom/bv/wifisync/SyncService;->updateUI(Lcom/bv/wifisync/Job;Z)V
    invoke-static {v1, v2, v3}, Lcom/bv/wifisync/SyncService;->access$10(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V

    .line 321
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    new-instance v3, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;-><init>(Lcom/bv/wifisync/SyncService$SyncTask;Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;)V

    iget-boolean v4, p0, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    invoke-virtual {v1, v2, v3, v4}, Lcom/bv/wifisync/Job;->run(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;Z)V

    .line 322
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    invoke-direct {p0, v1}, Lcom/bv/wifisync/SyncService$SyncTask;->clearNotification(Lcom/bv/wifisync/Job;)V

    .line 323
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/bv/wifisync/SyncService$SyncTask;->vibrate(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .line 330
    :try_start_1
    invoke-static {}, Lcom/bv/wifisync/SyncService;->access$8()Lcom/bv/wifisync/HostList;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/HostList;->save(Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5

    .line 334
    :goto_0
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v1, v5}, Lcom/bv/wifisync/SyncService;->stopForeground(Z)V

    .line 335
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    #getter for: Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/bv/wifisync/SyncService;->access$5(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;

    move-result-object v1

    sget-object v2, Lcom/bv/wifisync/SyncService$NotificationType;->Progress:Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncService$NotificationType;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/app/NotificationManager;->cancel(I)V

    .line 336
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    #calls: Lcom/bv/wifisync/SyncService;->updateUI(Lcom/bv/wifisync/Job;Z)V
    invoke-static {v1, v2, v6}, Lcom/bv/wifisync/SyncService;->access$10(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V

    .line 338
    :goto_1
    return-void

    .line 324
    :catch_0
    move-exception v1

    .line 330
    :try_start_2
    invoke-static {}, Lcom/bv/wifisync/SyncService;->access$8()Lcom/bv/wifisync/HostList;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/HostList;->save(Landroid/content/Context;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 334
    :goto_2
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v1, v5}, Lcom/bv/wifisync/SyncService;->stopForeground(Z)V

    .line 335
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    #getter for: Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/bv/wifisync/SyncService;->access$5(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;

    move-result-object v1

    sget-object v2, Lcom/bv/wifisync/SyncService$NotificationType;->Progress:Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncService$NotificationType;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/app/NotificationManager;->cancel(I)V

    .line 336
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    #calls: Lcom/bv/wifisync/SyncService;->updateUI(Lcom/bv/wifisync/Job;Z)V
    invoke-static {v1, v2, v6}, Lcom/bv/wifisync/SyncService;->access$10(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V

    goto :goto_1

    .line 331
    :catch_1
    move-exception v0

    .line 332
    .local v0, e:Ljava/io/IOException;
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v2, v7}, Lcom/bv/wifisync/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-static {v3, v0}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/bv/wifisync/SyncService;->showError(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v1, v2, v3}, Lcom/bv/wifisync/SyncService;->access$9(Lcom/bv/wifisync/SyncService;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 325
    .end local v0           #e:Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 326
    .local v0, e:Ljava/lang/Throwable;
    :try_start_3
    invoke-direct {p0, v0}, Lcom/bv/wifisync/SyncService$SyncTask;->showJobError(Ljava/lang/Throwable;)V

    .line 327
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/bv/wifisync/SyncService$SyncTask;->vibrate(Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 330
    :try_start_4
    invoke-static {}, Lcom/bv/wifisync/SyncService;->access$8()Lcom/bv/wifisync/HostList;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/HostList;->save(Landroid/content/Context;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 334
    .end local v0           #e:Ljava/lang/Throwable;
    :goto_3
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v1, v5}, Lcom/bv/wifisync/SyncService;->stopForeground(Z)V

    .line 335
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    #getter for: Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/bv/wifisync/SyncService;->access$5(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;

    move-result-object v1

    sget-object v2, Lcom/bv/wifisync/SyncService$NotificationType;->Progress:Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncService$NotificationType;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/app/NotificationManager;->cancel(I)V

    .line 336
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    #calls: Lcom/bv/wifisync/SyncService;->updateUI(Lcom/bv/wifisync/Job;Z)V
    invoke-static {v1, v2, v6}, Lcom/bv/wifisync/SyncService;->access$10(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V

    goto :goto_1

    .line 331
    .restart local v0       #e:Ljava/lang/Throwable;
    :catch_3
    move-exception v0

    .line 332
    .local v0, e:Ljava/io/IOException;
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v2, v7}, Lcom/bv/wifisync/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-static {v3, v0}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/bv/wifisync/SyncService;->showError(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v1, v2, v3}, Lcom/bv/wifisync/SyncService;->access$9(Lcom/bv/wifisync/SyncService;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 328
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v1

    .line 330
    :try_start_5
    invoke-static {}, Lcom/bv/wifisync/SyncService;->access$8()Lcom/bv/wifisync/HostList;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/HostList;->save(Landroid/content/Context;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 334
    :goto_4
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v2, v5}, Lcom/bv/wifisync/SyncService;->stopForeground(Z)V

    .line 335
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    #getter for: Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v2}, Lcom/bv/wifisync/SyncService;->access$5(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;

    move-result-object v2

    sget-object v3, Lcom/bv/wifisync/SyncService$NotificationType;->Progress:Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-virtual {v3}, Lcom/bv/wifisync/SyncService$NotificationType;->ordinal()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/app/NotificationManager;->cancel(I)V

    .line 336
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    iget-object v3, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    #calls: Lcom/bv/wifisync/SyncService;->updateUI(Lcom/bv/wifisync/Job;Z)V
    invoke-static {v2, v3, v6}, Lcom/bv/wifisync/SyncService;->access$10(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V

    .line 337
    throw v1

    .line 331
    :catch_4
    move-exception v0

    .line 332
    .restart local v0       #e:Ljava/io/IOException;
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    iget-object v3, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v3, v7}, Lcom/bv/wifisync/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-static {v4, v0}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/bv/wifisync/SyncService;->showError(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v2, v3, v4}, Lcom/bv/wifisync/SyncService;->access$9(Lcom/bv/wifisync/SyncService;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 331
    .end local v0           #e:Ljava/io/IOException;
    :catch_5
    move-exception v0

    .line 332
    .restart local v0       #e:Ljava/io/IOException;
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v2, v7}, Lcom/bv/wifisync/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-static {v3, v0}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/bv/wifisync/SyncService;->showError(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v1, v2, v3}, Lcom/bv/wifisync/SyncService;->access$9(Lcom/bv/wifisync/SyncService;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private showJobError(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 5
    .parameter "title"
    .parameter "details"
    .parameter "jobId"

    .prologue
    .line 350
    new-instance v1, Landroid/app/Notification;

    const v2, 0x7f02002e

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-direct {v1, v2, p1, v3, v4}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 351
    .local v1, notification:Landroid/app/Notification;
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    #calls: Lcom/bv/wifisync/SyncService;->updateNotification(Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;I)V
    invoke-static {v2, v1, p1, p2, p3}, Lcom/bv/wifisync/SyncService;->access$12(Lcom/bv/wifisync/SyncService;Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;I)V

    .line 352
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    const-class v3, Lcom/bv/wifisync/SyncService;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 353
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "notification"

    invoke-virtual {v0, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 354
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    const/4 v3, 0x0

    .line 355
    const/high16 v4, 0x4800

    .line 354
    invoke-static {v2, v3, v0, v4}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    iput-object v2, v1, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 356
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    #getter for: Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v2}, Lcom/bv/wifisync/SyncService;->access$5(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;

    move-result-object v2

    sget-object v3, Lcom/bv/wifisync/SyncService$NotificationType;->JobError:Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-virtual {v3}, Lcom/bv/wifisync/SyncService$NotificationType;->ordinal()I

    move-result v3

    invoke-virtual {v2, v3, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 357
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    new-instance v3, Lcom/bv/wifisync/Utils$LastNotification;

    invoke-direct {v3, p1, p2, p3}, Lcom/bv/wifisync/Utils$LastNotification;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-static {v2, v3}, Lcom/bv/wifisync/Utils;->setLastNotification(Landroid/content/Context;Lcom/bv/wifisync/Utils$LastNotification;)V

    .line 358
    return-void
.end method

.method private showJobError(Ljava/lang/Throwable;)V
    .locals 7
    .parameter "e"

    .prologue
    .line 341
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-static {v2, p1}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    .line 342
    .local v0, errorMessage:Ljava/lang/String;
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-static {v2}, Lcom/bv/wifisync/Config;->getShowErrorNotification(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 343
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    const v3, 0x7f06011c

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v6}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/SyncService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 344
    .local v1, title:Ljava/lang/String;
    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    iget v2, v2, Lcom/bv/wifisync/Job;->id:I

    invoke-direct {p0, v1, v0, v2}, Lcom/bv/wifisync/SyncService$SyncTask;->showJobError(Ljava/lang/String;Ljava/lang/String;I)V

    .line 346
    .end local v1           #title:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private vibrate(Z)V
    .locals 12
    .parameter "success"

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const-wide/16 v6, 0x64

    .line 361
    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-static {v4}, Lcom/bv/wifisync/Config;->getVibrate(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 362
    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    const-string v5, "vibrator"

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/SyncService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Vibrator;

    .line 363
    .local v3, vibrator:Landroid/os/Vibrator;
    const/4 v4, 0x5

    new-array v0, v4, [J

    .line 364
    aput-wide v6, v0, v8

    aput-wide v6, v0, v9

    const-wide/16 v4, 0x190

    aput-wide v4, v0, v10

    const-wide/16 v4, 0xc8

    aput-wide v4, v0, v11

    .line 372
    .local v0, failedPattern:[J
    const/4 v4, 0x6

    new-array v2, v4, [J

    aput-wide v6, v2, v8

    aput-wide v6, v2, v9

    aput-wide v6, v2, v10

    aput-wide v6, v2, v11

    const/4 v4, 0x5

    aput-wide v6, v2, v4

    .line 373
    .local v2, successPattern:[J
    if-eqz p1, :cond_1

    move-object v1, v2

    .line 374
    .local v1, pattern:[J
    :goto_0
    const/4 v4, -0x1

    invoke-virtual {v3, v1, v4}, Landroid/os/Vibrator;->vibrate([JI)V

    .line 376
    .end local v0           #failedPattern:[J
    .end local v1           #pattern:[J
    .end local v2           #successPattern:[J
    .end local v3           #vibrator:Landroid/os/Vibrator;
    :cond_0
    return-void

    .restart local v0       #failedPattern:[J
    .restart local v2       #successPattern:[J
    .restart local v3       #vibrator:Landroid/os/Vibrator;
    :cond_1
    move-object v1, v0

    .line 373
    goto :goto_0
.end method


# virtual methods
.method getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 227
    iget-object v0, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getScheduledTime()Ljava/util/Date;
    .locals 2

    .prologue
    .line 231
    iget-object v0, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Job;->getNextTimeToRun(Landroid/content/Context;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method isConnected()Z
    .locals 2

    .prologue
    .line 223
    iget-object v0, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Job;->isConnected(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method isReady()Z
    .locals 2

    .prologue
    .line 235
    iget-boolean v0, p0, Lcom/bv/wifisync/SyncService$SyncTask;->runNow:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Job;->isReady(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public declared-synchronized run()V
    .locals 1

    .prologue
    .line 310
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->removed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 311
    invoke-direct {p0}, Lcom/bv/wifisync/SyncService$SyncTask;->internalRun()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 312
    :cond_0
    monitor-exit p0

    return-void

    .line 310
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
