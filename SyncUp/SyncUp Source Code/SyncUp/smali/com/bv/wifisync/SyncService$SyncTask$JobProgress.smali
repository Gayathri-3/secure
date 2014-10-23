.class Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;
.super Ljava/lang/Object;
.source "SyncService.java"

# interfaces
.implements Lcom/bv/sync/ProgressNotification;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/SyncService$SyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "JobProgress"
.end annotation


# instance fields
.field private lastUpdateTime:J

.field final synthetic this$1:Lcom/bv/wifisync/SyncService$SyncTask;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/SyncService$SyncTask;)V
    .locals 0
    .parameter

    .prologue
    .line 243
    iput-object p1, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/SyncService$SyncTask;Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 243
    invoke-direct {p0, p1}, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;-><init>(Lcom/bv/wifisync/SyncService$SyncTask;)V

    return-void
.end method

.method private getUI()Lcom/bv/wifisync/SyncService$Notify;
    .locals 3

    .prologue
    .line 302
    iget-object v0, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v0}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v1

    monitor-enter v1

    .line 303
    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v0}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v2

    invoke-static {}, Lcom/bv/wifisync/SyncService;->access$2()Lcom/bv/wifisync/SyncService$TimerThread;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/bv/wifisync/SyncService;->access$2()Lcom/bv/wifisync/SyncService$TimerThread;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/SyncService$TimerThread;->ui:Lcom/bv/wifisync/SyncService$Notify;
    invoke-static {v0}, Lcom/bv/wifisync/SyncService$TimerThread;->access$0(Lcom/bv/wifisync/SyncService$TimerThread;)Lcom/bv/wifisync/SyncService$Notify;

    move-result-object v0

    :goto_0
    #setter for: Lcom/bv/wifisync/SyncService;->ui:Lcom/bv/wifisync/SyncService$Notify;
    invoke-static {v2, v0}, Lcom/bv/wifisync/SyncService;->access$7(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/SyncService$Notify;)V

    monitor-exit v1

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 302
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private updateNotification(Lcom/bv/sync/ProgressNotification$ProgressAction;I)V
    .locals 11
    .parameter "action"
    .parameter "percent"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 261
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 262
    .local v1, now:J
    iget-wide v7, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->lastUpdateTime:J

    sub-long v7, v1, v7

    const-wide/16 v9, 0x64

    cmp-long v4, v7, v9

    if-lez v4, :cond_1

    .line 263
    invoke-static {}, Lcom/bv/wifisync/SyncService;->access$2()Lcom/bv/wifisync/SyncService$TimerThread;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 264
    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v4

    invoke-static {p1, v4}, Lcom/bv/wifisync/Utils;->getActionString(Lcom/bv/sync/ProgressNotification$ProgressAction;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v7, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-nez p2, :cond_2

    const-string v4, ""

    :goto_0
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 265
    .local v3, text:Ljava/lang/String;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0xb

    if-ge v4, v7, :cond_4

    .line 266
    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v4

    #getter for: Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService;->access$3(Lcom/bv/wifisync/SyncService;)Landroid/app/Notification;

    move-result-object v7

    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v4

    #getter for: Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService;->access$3(Lcom/bv/wifisync/SyncService;)Landroid/app/Notification;

    move-result-object v4

    iget v4, v4, Landroid/app/Notification;->iconLevel:I

    if-nez v4, :cond_3

    move v4, v5

    :goto_1
    iput v4, v7, Landroid/app/Notification;->iconLevel:I

    .line 267
    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v4

    #getter for: Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService;->access$3(Lcom/bv/wifisync/SyncService;)Landroid/app/Notification;

    move-result-object v4

    iget-object v5, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v5}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v5

    iget-object v6, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;
    invoke-static {v6}, Lcom/bv/wifisync/SyncService$SyncTask;->access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;

    move-result-object v6

    invoke-virtual {v6}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v6

    .line 268
    iget-object v7, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v7}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v7

    #getter for: Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;
    invoke-static {v7}, Lcom/bv/wifisync/SyncService;->access$3(Lcom/bv/wifisync/SyncService;)Landroid/app/Notification;

    move-result-object v7

    iget-object v7, v7, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 267
    invoke-virtual {v4, v5, v6, v3, v7}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 294
    :goto_2
    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v4

    #getter for: Lcom/bv/wifisync/SyncService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService;->access$5(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;

    move-result-object v4

    sget-object v5, Lcom/bv/wifisync/SyncService$NotificationType;->Progress:Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-virtual {v5}, Lcom/bv/wifisync/SyncService$NotificationType;->ordinal()I

    move-result v5

    iget-object v6, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v6}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v6

    #getter for: Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;
    invoke-static {v6}, Lcom/bv/wifisync/SyncService;->access$3(Lcom/bv/wifisync/SyncService;)Landroid/app/Notification;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 296
    .end local v3           #text:Ljava/lang/String;
    :cond_0
    iput-wide v1, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->lastUpdateTime:J

    .line 298
    :cond_1
    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v4

    #setter for: Lcom/bv/wifisync/SyncService;->lastAliveTime:J
    invoke-static {v4, v1, v2}, Lcom/bv/wifisync/SyncService;->access$6(Lcom/bv/wifisync/SyncService;J)V

    .line 299
    return-void

    .line 264
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v8, " "

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, "%"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    .restart local v3       #text:Ljava/lang/String;
    :cond_3
    move v4, v6

    .line 266
    goto :goto_1

    .line 270
    :cond_4
    new-instance v4, Landroid/app/Notification$Builder;

    iget-object v7, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v7}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v7

    invoke-direct {v4, v7}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 271
    iget-object v7, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;
    invoke-static {v7}, Lcom/bv/wifisync/SyncService$SyncTask;->access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;

    move-result-object v7

    invoke-virtual {v7}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 272
    invoke-virtual {v4, v3}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 273
    iget-object v7, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v7}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v7

    #getter for: Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;
    invoke-static {v7}, Lcom/bv/wifisync/SyncService;->access$3(Lcom/bv/wifisync/SyncService;)Landroid/app/Notification;

    move-result-object v7

    iget-object v7, v7, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    invoke-virtual {v4, v7}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 274
    const/high16 v8, 0x7f05

    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v4

    #getter for: Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService;->access$3(Lcom/bv/wifisync/SyncService;)Landroid/app/Notification;

    move-result-object v4

    iget v4, v4, Landroid/app/Notification;->iconLevel:I

    if-nez v4, :cond_6

    move v4, v5

    :goto_3
    invoke-virtual {v7, v8, v4}, Landroid/app/Notification$Builder;->setSmallIcon(II)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 275
    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 276
    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 277
    iget-object v7, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v7}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v7

    #getter for: Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;
    invoke-static {v7}, Lcom/bv/wifisync/SyncService;->access$3(Lcom/bv/wifisync/SyncService;)Landroid/app/Notification;

    move-result-object v7

    iget-object v7, v7, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    invoke-virtual {v4, v7}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 278
    invoke-virtual {v4, v6}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 279
    iget-object v7, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v7}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v7

    #getter for: Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;
    invoke-static {v7}, Lcom/bv/wifisync/SyncService;->access$3(Lcom/bv/wifisync/SyncService;)Landroid/app/Notification;

    move-result-object v7

    iget-wide v7, v7, Landroid/app/Notification;->when:J

    invoke-virtual {v4, v7, v8}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 280
    .local v0, builder:Landroid/app/Notification$Builder;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0xe

    if-lt v4, v7, :cond_5

    .line 281
    const/16 v4, 0x64

    invoke-virtual {v0, v4, p2, v6}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 283
    :cond_5
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-ge v4, v6, :cond_7

    .line 284
    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v4

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v5

    #setter for: Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;
    invoke-static {v4, v5}, Lcom/bv/wifisync/SyncService;->access$4(Lcom/bv/wifisync/SyncService;Landroid/app/Notification;)V

    goto/16 :goto_2

    .end local v0           #builder:Landroid/app/Notification$Builder;
    :cond_6
    move v4, v6

    .line 274
    goto :goto_3

    .line 286
    .restart local v0       #builder:Landroid/app/Notification$Builder;
    :cond_7
    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setUsesChronometer(Z)Landroid/app/Notification$Builder;

    .line 291
    iget-object v4, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v4}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v4

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v5

    #setter for: Lcom/bv/wifisync/SyncService;->runningNotification:Landroid/app/Notification;
    invoke-static {v4, v5}, Lcom/bv/wifisync/SyncService;->access$4(Lcom/bv/wifisync/SyncService;Landroid/app/Notification;)V

    goto/16 :goto_2
.end method


# virtual methods
.method public update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z
    .locals 3
    .parameter "action"
    .parameter "percent"
    .parameter "file"

    .prologue
    .line 248
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Listing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    if-eq p1, v1, :cond_0

    .line 249
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->updateNotification(Lcom/bv/sync/ProgressNotification$ProgressAction;I)V

    .line 250
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v1}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v1

    #getter for: Lcom/bv/wifisync/SyncService;->cancelIntent:Landroid/content/Intent;
    invoke-static {v1}, Lcom/bv/wifisync/SyncService;->access$0(Lcom/bv/wifisync/SyncService;)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 251
    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->this$0:Lcom/bv/wifisync/SyncService;
    invoke-static {v1}, Lcom/bv/wifisync/SyncService$SyncTask;->access$1(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/SyncService;

    move-result-object v1

    const/4 v2, 0x0

    #setter for: Lcom/bv/wifisync/SyncService;->cancelIntent:Landroid/content/Intent;
    invoke-static {v1, v2}, Lcom/bv/wifisync/SyncService;->access$1(Lcom/bv/wifisync/SyncService;Landroid/content/Intent;)V

    .line 252
    const/4 v1, 0x0

    .line 255
    :goto_0
    return v1

    .line 254
    :cond_1
    invoke-direct {p0}, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->getUI()Lcom/bv/wifisync/SyncService$Notify;

    move-result-object v0

    .line 255
    .local v0, notify:Lcom/bv/wifisync/SyncService$Notify;
    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;->this$1:Lcom/bv/wifisync/SyncService$SyncTask;

    #getter for: Lcom/bv/wifisync/SyncService$SyncTask;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/SyncService$SyncTask;->access$0(Lcom/bv/wifisync/SyncService$SyncTask;)Lcom/bv/wifisync/Job;

    move-result-object v1

    invoke-interface {v0, v1, p1, p2, p3}, Lcom/bv/wifisync/SyncService$Notify;->onProgress(Lcom/bv/wifisync/Job;Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    move-result v1

    goto :goto_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method
