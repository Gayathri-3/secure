.class Lcom/bv/wifisync/Job;
.super Ljava/lang/Object;
.source "Job.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/Job$Filter;,
        Lcom/bv/wifisync/Job$HistoryItem;,
        Lcom/bv/wifisync/Job$NeverFinishedException;,
        Lcom/bv/wifisync/Job$Plugin;,
        Lcom/bv/wifisync/Job$ScheduleType;,
        Lcom/bv/wifisync/Job$SyncType;
    }
.end annotation


# static fields
.field private static final STATE_FILE:Ljava/lang/String; = "state.dat"

.field private static final TAG:Ljava/lang/String; = "Job"

.field private static final WIFI_MODE_FULL_HIGH_PERF:I = 0x3

.field private static final serialVersionUID:J = -0x42641ba18e7e6ca6L


# instance fields
.field private transient canceled:Z

.field direction:Lcom/bv/sync/CifsSync$Options$Direction;

.field filter:Lcom/bv/wifisync/Job$Filter;

.field private history:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/Job$HistoryItem;",
            ">;"
        }
    .end annotation
.end field

.field transient host:Lcom/bv/wifisync/Host;

.field id:I

.field private interval:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field lastResult:Ljava/lang/Throwable;

.field lastRun:J

.field mirror:Ljava/lang/Boolean;

.field private name:Ljava/lang/String;

.field overwrite:Z

.field private pcDir:Ljava/lang/String;

.field private phoneDir:Ljava/lang/String;

.field plugin:Lcom/bv/wifisync/Job$Plugin;

.field transient running:Z

.field schedule:Lcom/bv/wifisync/SyncSchedule;

.field private scheduleRouters:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private scheduleType:Lcom/bv/wifisync/Job$ScheduleType;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field skipMediaScan:Z

.field private stateFilePath:Ljava/lang/String;

.field transient syncStats:Lcom/bv/sync/CifsSync$SyncStats;

.field trackDeletions:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    sget-object v0, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    iput-object v0, p0, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    .line 69
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/wifisync/Job;->overwrite:Z

    .line 71
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/wifisync/Job;->mirror:Ljava/lang/Boolean;

    .line 183
    invoke-direct {p0}, Lcom/bv/wifisync/Job;->initSchedule()V

    .line 184
    return-void
.end method

.method private addHistory(Landroid/content/Context;Lcom/bv/wifisync/Job$HistoryItem;)V
    .locals 4
    .parameter "context"
    .parameter "item"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 514
    iget-object v1, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    if-nez v1, :cond_0

    .line 515
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    .line 516
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    monitor-enter v2

    .line 517
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, size:I
    if-lez v0, :cond_1

    invoke-static {}, Lcom/bv/wifisync/Config;->getMaxHistoryLines()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 519
    :cond_1
    iget-object v1, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 516
    monitor-exit v2

    .line 521
    return-void

    .line 518
    :cond_2
    iget-object v1, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job$HistoryItem;

    invoke-virtual {v1, p1}, Lcom/bv/wifisync/Job$HistoryItem;->remove(Landroid/content/Context;)V

    goto :goto_0

    .line 516
    .end local v0           #size:I
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private addHistoryResult(Lcom/bv/wifisync/Job$HistoryItem;Landroid/content/Context;Ljava/util/Collection;)V
    .locals 7
    .parameter "historyItem"
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/wifisync/Job$HistoryItem;",
            "Landroid/content/Context;",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p3, result:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/SyncItem;>;"
    const/4 v4, 0x1

    .line 437
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 438
    .local v1, localFiles:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/wifisync/SyncFile;>;"
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 439
    .local v2, remoteFiles:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/wifisync/SyncFile;>;"
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 441
    .local v0, deletedFiles:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/wifisync/SyncFile;>;"
    invoke-direct {p0, p3, v1, v2, v0}, Lcom/bv/wifisync/Job;->splitFiles(Ljava/util/Collection;Ljava/util/LinkedList;Ljava/util/LinkedList;Ljava/util/LinkedList;)V

    .line 442
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v3

    iput v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->localFileCount:I

    .line 443
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v3

    iput v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->remoteFilesCount:I

    .line 444
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v3

    iput v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->deletedFilesCount:I

    .line 446
    iget v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->localFileCount:I

    if-nez v3, :cond_0

    iget v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->remoteFilesCount:I

    if-nez v3, :cond_0

    iget v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->deletedFilesCount:I

    if-eqz v3, :cond_3

    .line 447
    :cond_0
    invoke-direct {p0, p2}, Lcom/bv/wifisync/Job;->getNewHistoryItemPath(Landroid/content/Context;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->workDir:Ljava/lang/String;

    .line 448
    iget v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->localFileCount:I

    if-eqz v3, :cond_1

    .line 449
    invoke-virtual {p1}, Lcom/bv/wifisync/Job$HistoryItem;->getLocalFilesPath()Ljava/io/File;

    move-result-object v3

    invoke-static {v3, v1, v4}, Lcom/bv/wifisync/Utils;->writeObjectToFile(Ljava/io/File;Ljava/io/Serializable;Z)V

    .line 450
    :cond_1
    iget v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->remoteFilesCount:I

    if-eqz v3, :cond_2

    .line 451
    invoke-virtual {p1}, Lcom/bv/wifisync/Job$HistoryItem;->getRemoteFilesPath()Ljava/io/File;

    move-result-object v3

    invoke-static {v3, v2, v4}, Lcom/bv/wifisync/Utils;->writeObjectToFile(Ljava/io/File;Ljava/io/Serializable;Z)V

    .line 452
    :cond_2
    iget v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->deletedFilesCount:I

    if-eqz v3, :cond_3

    .line 453
    invoke-virtual {p1}, Lcom/bv/wifisync/Job$HistoryItem;->getDeletedFilesPath()Ljava/io/File;

    move-result-object v3

    invoke-static {v3, v0, v4}, Lcom/bv/wifisync/Utils;->writeObjectToFile(Ljava/io/File;Ljava/io/Serializable;Z)V

    .line 455
    :cond_3
    iget-object v3, p0, Lcom/bv/wifisync/Job;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v3, v3, Lcom/bv/sync/CifsSync$SyncStats;->reconnects:J

    iput-wide v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->reconnects:J

    .line 456
    iget-object v3, p0, Lcom/bv/wifisync/Job;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v3, v3, Lcom/bv/sync/CifsSync$SyncStats;->writeBytes:J

    iput-wide v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->transferBytes:J

    .line 457
    iget-object v3, p0, Lcom/bv/wifisync/Job;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v3, v3, Lcom/bv/sync/CifsSync$SyncStats;->readTime:J

    iget-object v5, p0, Lcom/bv/wifisync/Job;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v5, v5, Lcom/bv/sync/CifsSync$SyncStats;->writeTime:J

    add-long/2addr v3, v5

    iput-wide v3, p1, Lcom/bv/wifisync/Job$HistoryItem;->transferTime:J

    .line 458
    return-void
.end method

.method private checkWakeup(Landroid/content/Context;Ljava/util/Date;)Ljava/util/Date;
    .locals 11
    .parameter "context"
    .parameter "nextTimeToRun"

    .prologue
    .line 697
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    iget-object v9, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget v9, v9, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    mul-int/lit16 v9, v9, 0x3e8

    int-to-long v9, v9

    sub-long v5, v7, v9

    .line 698
    .local v5, wakeupStart:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 699
    .local v3, now:J
    cmp-long v7, v5, v3

    if-lez v7, :cond_1

    .line 700
    new-instance p2, Ljava/util/Date;

    .end local p2
    invoke-direct {p2, v5, v6}, Ljava/util/Date;-><init>(J)V

    .line 713
    .restart local p2
    :cond_0
    :goto_0
    const-string v7, "Job"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, " reschedule for wakeup "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 714
    return-object p2

    .line 701
    :cond_1
    iget-object v7, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v7}, Lcom/bv/wifisync/Host;->getLastWakeUp()J

    move-result-wide v7

    cmp-long v7, v7, v5

    if-gez v7, :cond_2

    iget-object v7, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v7}, Lcom/bv/wifisync/Host;->isUp()Z

    move-result v7

    if-nez v7, :cond_2

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Job;->isConnected(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 703
    :try_start_0
    iget-object v7, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v7, p1}, Lcom/bv/wifisync/Host;->wakeup(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 707
    :goto_1
    new-instance p2, Ljava/util/Date;

    .end local p2
    iget-object v7, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget v7, v7, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    mul-int/lit16 v7, v7, 0x3e8

    int-to-long v7, v7

    add-long/2addr v7, v3

    invoke-direct {p2, v7, v8}, Ljava/util/Date;-><init>(J)V

    .line 708
    .restart local p2
    goto :goto_0

    .line 704
    :catch_0
    move-exception v0

    .line 705
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 709
    .end local v0           #e:Ljava/lang/Exception;
    :cond_2
    iget-object v7, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v7}, Lcom/bv/wifisync/Host;->getLastWakeUp()J

    move-result-wide v7

    iget-object v9, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget v9, v9, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    mul-int/lit16 v9, v9, 0x3e8

    int-to-long v9, v9

    add-long v1, v7, v9

    .line 710
    .local v1, newTime:J
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    cmp-long v7, v7, v1

    if-gez v7, :cond_0

    .line 711
    new-instance p2, Ljava/util/Date;

    .end local p2
    invoke-direct {p2, v1, v2}, Ljava/util/Date;-><init>(J)V

    .restart local p2
    goto :goto_0
.end method

.method private deletionTrackIsValid()Z
    .locals 2

    .prologue
    .line 430
    iget-boolean v0, p0, Lcom/bv/wifisync/Job;->trackDeletions:Z

    if-eqz v0, :cond_2

    .line 431
    iget-object v0, p0, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v0, v1, :cond_1

    .line 432
    iget-object v0, p0, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/Job;->mirror:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 433
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/bv/wifisync/Job;->mirror:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2

    .line 430
    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private doSync(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;
    .locals 13
    .parameter "context"
    .parameter "progress"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bv/sync/ProgressNotification;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 282
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Job;->getLocalFolder(Landroid/content/Context;)Lcom/bv/sync/LocalFile;

    move-result-object v3

    .line 283
    .local v3, localFile:Lcom/bv/sync/LocalFile;
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->readDeletionTrack(Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v1

    .line 284
    .local v1, deletionTrack:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->lockWifi(Landroid/content/Context;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v8

    .line 286
    .local v8, wifiLock:Landroid/net/wifi/WifiManager$WifiLock;
    :try_start_0
    sget-object v9, Lcom/bv/sync/ProgressNotification$ProgressAction;->Connecting:Lcom/bv/sync/ProgressNotification$ProgressAction;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-interface {p2, v9, v10, v11}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    .line 287
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Job;->getRemoteFolder(Landroid/content/Context;)Lcom/bv/sync/RemoteFile;

    move-result-object v5

    .line 288
    .local v5, remoteFile:Lcom/bv/sync/RemoteFile;
    invoke-static {p1}, Lcom/bv/wifisync/Config;->getIgnoreTimeZones(Landroid/content/Context;)Z

    move-result v9

    if-eqz v9, :cond_1

    sget-object v7, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->All:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    .line 289
    .local v7, verifyTimeZone:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;
    :goto_0
    invoke-direct {p0, v3, v5}, Lcom/bv/wifisync/Job;->getFileFilter(Lcom/bv/sync/LocalFile;Lcom/bv/sync/RemoteFile;)[Lcom/bv/sync/IFileFilter;

    move-result-object v2

    .line 290
    .local v2, fileFilter:[Lcom/bv/sync/IFileFilter;
    new-instance v4, Lcom/bv/sync/CifsSync$Options;

    iget-object v9, p0, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    iget-boolean v10, p0, Lcom/bv/wifisync/Job;->overwrite:Z

    invoke-direct {v4, v9, v10, v7, v2}, Lcom/bv/sync/CifsSync$Options;-><init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V

    .line 291
    .local v4, options:Lcom/bv/sync/CifsSync$Options;
    invoke-static {p1}, Lcom/bv/wifisync/Config;->getIgnoreSymLinks(Landroid/content/Context;)Z

    move-result v9

    iput-boolean v9, v4, Lcom/bv/sync/CifsSync$Options;->ignoreSymLinks:Z

    .line 292
    iget-object v9, p0, Lcom/bv/wifisync/Job;->mirror:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    iput-boolean v9, v4, Lcom/bv/sync/CifsSync$Options;->mirror:Z

    .line 293
    invoke-static {p1}, Lcom/bv/wifisync/Config;->getMinFreeSpace(Landroid/content/Context;)J

    move-result-wide v9

    iput-wide v9, v4, Lcom/bv/sync/CifsSync$Options;->minFreeSpace:J

    .line 294
    new-instance v0, Lcom/bv/sync/CifsSync;

    invoke-direct {v0, v4, v1}, Lcom/bv/sync/CifsSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 296
    .local v0, cifsSync:Lcom/bv/sync/CifsSync;
    :try_start_1
    invoke-virtual {v0, v3, v5, p2}, Lcom/bv/sync/CifsSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v6

    .line 299
    .local v6, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    :try_start_2
    invoke-virtual {v0}, Lcom/bv/sync/CifsSync;->getStats()Lcom/bv/sync/CifsSync$SyncStats;

    move-result-object v9

    iput-object v9, p0, Lcom/bv/wifisync/Job;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    .line 300
    sget-object v9, Lcom/bv/sync/ProgressNotification$ProgressAction;->Saving:Lcom/bv/sync/ProgressNotification$ProgressAction;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-interface {p2, v9, v10, v11}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    .line 301
    iget-boolean v9, p0, Lcom/bv/wifisync/Job;->trackDeletions:Z

    if-eqz v9, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->removed()Z

    move-result v9

    if-nez v9, :cond_0

    .line 302
    invoke-direct {p0, p1, v1}, Lcom/bv/wifisync/Job;->writeDeletionTrack(Landroid/content/Context;Ljava/util/HashMap;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 305
    :cond_0
    invoke-virtual {v8}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    .line 297
    return-object v6

    .line 288
    .end local v0           #cifsSync:Lcom/bv/sync/CifsSync;
    .end local v2           #fileFilter:[Lcom/bv/sync/IFileFilter;
    .end local v4           #options:Lcom/bv/sync/CifsSync$Options;
    .end local v6           #result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    .end local v7           #verifyTimeZone:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;
    :cond_1
    :try_start_3
    sget-object v7, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    goto :goto_0

    .line 298
    .restart local v0       #cifsSync:Lcom/bv/sync/CifsSync;
    .restart local v2       #fileFilter:[Lcom/bv/sync/IFileFilter;
    .restart local v4       #options:Lcom/bv/sync/CifsSync$Options;
    .restart local v7       #verifyTimeZone:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;
    :catchall_0
    move-exception v9

    .line 299
    invoke-virtual {v0}, Lcom/bv/sync/CifsSync;->getStats()Lcom/bv/sync/CifsSync$SyncStats;

    move-result-object v10

    iput-object v10, p0, Lcom/bv/wifisync/Job;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    .line 300
    sget-object v10, Lcom/bv/sync/ProgressNotification$ProgressAction;->Saving:Lcom/bv/sync/ProgressNotification$ProgressAction;

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-interface {p2, v10, v11, v12}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    .line 301
    iget-boolean v10, p0, Lcom/bv/wifisync/Job;->trackDeletions:Z

    if-eqz v10, :cond_2

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->removed()Z

    move-result v10

    if-nez v10, :cond_2

    .line 302
    invoke-direct {p0, p1, v1}, Lcom/bv/wifisync/Job;->writeDeletionTrack(Landroid/content/Context;Ljava/util/HashMap;)V

    .line 303
    :cond_2
    throw v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 304
    .end local v0           #cifsSync:Lcom/bv/sync/CifsSync;
    .end local v2           #fileFilter:[Lcom/bv/sync/IFileFilter;
    .end local v4           #options:Lcom/bv/sync/CifsSync$Options;
    .end local v5           #remoteFile:Lcom/bv/sync/RemoteFile;
    .end local v7           #verifyTimeZone:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;
    :catchall_1
    move-exception v9

    .line 305
    invoke-virtual {v8}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    .line 306
    throw v9
.end method

.method private equals(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "s1"
    .parameter "s2"

    .prologue
    .line 680
    if-eq p1, p2, :cond_2

    if-eqz p1, :cond_0

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private getDateFilter(I)J
    .locals 3
    .parameter "days"

    .prologue
    const/4 v2, 0x0

    .line 352
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 353
    .local v0, calendar:Ljava/util/Calendar;
    const/16 v1, 0xb

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 354
    const/16 v1, 0xc

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 355
    const/16 v1, 0xd

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 356
    const/16 v1, 0xe

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 357
    const/4 v1, 0x6

    neg-int v2, p1

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    .line 358
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    return-wide v1
.end method

.method private getFileFilter(Lcom/bv/sync/LocalFile;Lcom/bv/sync/RemoteFile;)[Lcom/bv/sync/IFileFilter;
    .locals 8
    .parameter "localFile"
    .parameter "remoteFile"

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 321
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 322
    .local v0, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFileFilter;>;"
    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    if-eqz v1, :cond_9

    .line 323
    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, v1, Lcom/bv/wifisync/Job$Filter;->includeLocalFiles:Ljava/util/LinkedHashSet;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 324
    new-instance v1, Lcom/bv/sync/FileFilter;

    iget-object v2, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->includeLocalFiles:Ljava/util/LinkedHashSet;

    sget-object v3, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    new-array v4, v7, [Lcom/bv/sync/IFile;

    aput-object p1, v4, v5

    aput-object p2, v4, v6

    invoke-direct {v1, v2, v3, v4}, Lcom/bv/sync/FileFilter;-><init>(Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 325
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, v1, Lcom/bv/wifisync/Job$Filter;->includeRemoteFiles:Ljava/util/LinkedHashSet;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 326
    new-instance v1, Lcom/bv/sync/FileFilter;

    iget-object v2, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->includeRemoteFiles:Ljava/util/LinkedHashSet;

    sget-object v3, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    new-array v4, v7, [Lcom/bv/sync/IFile;

    aput-object p1, v4, v5

    aput-object p2, v4, v6

    invoke-direct {v1, v2, v3, v4}, Lcom/bv/sync/FileFilter;-><init>(Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 327
    :cond_1
    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, v1, Lcom/bv/wifisync/Job$Filter;->includeExtensions:Ljava/util/LinkedHashSet;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 328
    new-instance v1, Lcom/bv/sync/ExtensionFilter;

    iget-object v2, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->includeExtensions:Ljava/util/LinkedHashSet;

    sget-object v3, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    invoke-direct {v1, v2, v3}, Lcom/bv/sync/ExtensionFilter;-><init>(Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 329
    :cond_2
    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget v1, v1, Lcom/bv/wifisync/Job$Filter;->includeModifiedDate:I

    if-eqz v1, :cond_3

    .line 330
    new-instance v1, Lcom/bv/sync/DateFilter;

    iget-object v2, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget v2, v2, Lcom/bv/wifisync/Job$Filter;->includeModifiedDate:I

    invoke-direct {p0, v2}, Lcom/bv/wifisync/Job;->getDateFilter(I)J

    move-result-wide v2

    sget-object v4, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    invoke-direct {v1, v2, v3, v4}, Lcom/bv/sync/DateFilter;-><init>(JLcom/bv/sync/IFileFilter$Action;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 332
    :cond_3
    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-boolean v1, v1, Lcom/bv/wifisync/Job$Filter;->ignoreHidden:Z

    if-eqz v1, :cond_4

    .line 333
    new-instance v1, Lcom/bv/sync/IgnoreHiddenFilter;

    invoke-direct {v1}, Lcom/bv/sync/IgnoreHiddenFilter;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 334
    :cond_4
    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-boolean v1, v1, Lcom/bv/wifisync/Job$Filter;->ignoreReadProtected:Z

    if-eqz v1, :cond_5

    .line 335
    new-instance v1, Lcom/bv/sync/IgnoreReadProtectedFilter;

    invoke-direct {v1}, Lcom/bv/sync/IgnoreReadProtectedFilter;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 336
    :cond_5
    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, v1, Lcom/bv/wifisync/Job$Filter;->localFiles:Ljava/util/LinkedHashSet;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 337
    new-instance v1, Lcom/bv/sync/FileFilter;

    iget-object v2, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->localFiles:Ljava/util/LinkedHashSet;

    sget-object v3, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    new-array v4, v7, [Lcom/bv/sync/IFile;

    aput-object p1, v4, v5

    aput-object p2, v4, v6

    invoke-direct {v1, v2, v3, v4}, Lcom/bv/sync/FileFilter;-><init>(Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    :cond_6
    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, v1, Lcom/bv/wifisync/Job$Filter;->remoteFiles:Ljava/util/LinkedHashSet;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 339
    new-instance v1, Lcom/bv/sync/FileFilter;

    iget-object v2, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->remoteFiles:Ljava/util/LinkedHashSet;

    sget-object v3, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    new-array v4, v7, [Lcom/bv/sync/IFile;

    aput-object p1, v4, v5

    aput-object p2, v4, v6

    invoke-direct {v1, v2, v3, v4}, Lcom/bv/sync/FileFilter;-><init>(Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 340
    :cond_7
    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, v1, Lcom/bv/wifisync/Job$Filter;->extensions:Ljava/util/LinkedHashSet;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 341
    new-instance v1, Lcom/bv/sync/ExtensionFilter;

    iget-object v2, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->extensions:Ljava/util/LinkedHashSet;

    sget-object v3, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    invoke-direct {v1, v2, v3}, Lcom/bv/sync/ExtensionFilter;-><init>(Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 342
    :cond_8
    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget v1, v1, Lcom/bv/wifisync/Job$Filter;->modifiedDate:I

    if-eqz v1, :cond_9

    .line 343
    new-instance v1, Lcom/bv/sync/DateFilter;

    iget-object v2, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget v2, v2, Lcom/bv/wifisync/Job$Filter;->modifiedDate:I

    invoke-direct {p0, v2}, Lcom/bv/wifisync/Job;->getDateFilter(I)J

    move-result-wide v2

    sget-object v4, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    invoke-direct {v1, v2, v3, v4}, Lcom/bv/sync/DateFilter;-><init>(JLcom/bv/sync/IFileFilter$Action;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 346
    :cond_9
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_a

    .line 347
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lcom/bv/sync/IFileFilter;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/bv/sync/IFileFilter;

    .line 348
    :goto_0
    return-object v1

    :cond_a
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getNewHistoryItemPath(Landroid/content/Context;)Ljava/io/File;
    .locals 5
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 466
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->getWorkingDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 467
    .local v1, workingDir:Ljava/io/File;
    new-instance v0, Ljava/io/File;

    const-string v2, "history"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 468
    .local v0, result:Ljava/io/File;
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1, v0}, Lcom/bv/wifisync/Job;->getNextAvailableDir(Landroid/content/Context;Ljava/io/File;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v2
.end method

.method private static getNextAvailableDir(Landroid/content/Context;Ljava/io/File;)I
    .locals 5
    .parameter "context"
    .parameter "dir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 487
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    const v2, 0x7fffffff

    if-lt v0, v2, :cond_0

    .line 496
    new-instance v2, Ljava/io/IOException;

    const v3, 0x7f060092

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 488
    :cond_0
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 489
    .local v1, result:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 490
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_2

    .line 491
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    const v4, 0x7f060091

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 492
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 491
    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 487
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 493
    :cond_2
    return v0
.end method

.method private getOldWorkingDir(Landroid/content/Context;)Ljava/io/File;
    .locals 4
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 482
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "jobs"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 483
    .local v0, jobsDir:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/bv/wifisync/Job;->id:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method private getSpecialDirectory(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "type"

    .prologue
    .line 547
    invoke-static {p1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSpecialType(Ljava/lang/String;Ljava/lang/String;)Lcom/bv/wifisync/Job$SyncType;
    .locals 3
    .parameter "jobDir"
    .parameter "jobName"

    .prologue
    .line 556
    sget-object v0, Landroid/os/Environment;->DIRECTORY_MUSIC:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/bv/wifisync/Job;->getSpecialDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Music"

    invoke-direct {p0, p2, v0}, Lcom/bv/wifisync/Job;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 557
    :cond_0
    sget-object v0, Lcom/bv/wifisync/Job$SyncType;->Music:Lcom/bv/wifisync/Job$SyncType;

    .line 570
    :goto_0
    return-object v0

    .line 558
    :cond_1
    sget-object v0, Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/bv/wifisync/Job;->getSpecialDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "Videos"

    invoke-direct {p0, p2, v0}, Lcom/bv/wifisync/Job;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 559
    :cond_2
    sget-object v0, Lcom/bv/wifisync/Job$SyncType;->Movies:Lcom/bv/wifisync/Job$SyncType;

    goto :goto_0

    .line 560
    :cond_3
    sget-object v0, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/bv/wifisync/Job;->getSpecialDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 561
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/bv/wifisync/Job;->getSpecialDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 562
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "DCIM"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Pictures"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Camera"

    aput-object v2, v0, v1

    invoke-virtual {p0, p2, v0}, Lcom/bv/wifisync/Job;->equals(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 563
    :cond_4
    sget-object v0, Lcom/bv/wifisync/Job$SyncType;->Pictures:Lcom/bv/wifisync/Job$SyncType;

    goto :goto_0

    .line 564
    :cond_5
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "/sdcard"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 565
    :cond_6
    sget-object v0, Lcom/bv/wifisync/Job$SyncType;->SDCard:Lcom/bv/wifisync/Job$SyncType;

    goto :goto_0

    .line 566
    :cond_7
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 567
    sget-object v0, Lcom/bv/wifisync/Job$SyncType;->Root:Lcom/bv/wifisync/Job$SyncType;

    goto :goto_0

    .line 568
    :cond_8
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/bv/wifisync/Job;->getSpecialDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 569
    sget-object v0, Lcom/bv/wifisync/Job$SyncType;->Downloads:Lcom/bv/wifisync/Job$SyncType;

    goto :goto_0

    .line 570
    :cond_9
    sget-object v0, Lcom/bv/wifisync/Job$SyncType;->Folder:Lcom/bv/wifisync/Job$SyncType;

    goto :goto_0
.end method

.method private getStateFile(Landroid/content/Context;)Ljava/io/File;
    .locals 5
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 393
    iget-object v2, p0, Lcom/bv/wifisync/Job;->stateFilePath:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 394
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/bv/wifisync/Job;->stateFilePath:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 395
    .local v0, result:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 396
    const-string v2, "Warn"

    const-string v3, "DeletionTrack"

    const-string v4, "NotExists"

    invoke-direct {p0, p1, v2, v3, v4}, Lcom/bv/wifisync/Job;->trackWarning(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 397
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/bv/wifisync/Utils;->mkdirs(Landroid/content/Context;Ljava/io/File;)V

    move-object v1, v0

    .line 402
    .end local v0           #result:Ljava/io/File;
    .local v1, result:Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 400
    .end local v1           #result:Ljava/lang/Object;
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->getWorkingDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    const-string v3, "state.dat"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 401
    .restart local v0       #result:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/bv/wifisync/Job;->stateFilePath:Ljava/lang/String;

    move-object v1, v0

    .line 402
    .restart local v1       #result:Ljava/lang/Object;
    goto :goto_0
.end method

.method private getWorkingDir(Landroid/content/Context;)Ljava/io/File;
    .locals 6
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 472
    iget v1, p0, Lcom/bv/wifisync/Job;->id:I

    .line 473
    .local v1, prevId:I
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "jobs"

    invoke-direct {v0, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 474
    .local v0, jobsDir:Ljava/io/File;
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget v4, p0, Lcom/bv/wifisync/Job;->id:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 475
    .local v2, result:Ljava/io/File;
    if-eqz v1, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 476
    const-string v3, "Job"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Job directory is missing, recreating "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 477
    :cond_0
    invoke-static {p1, v2}, Lcom/bv/wifisync/Utils;->mkdirs(Landroid/content/Context;Ljava/io/File;)V

    .line 478
    return-object v2
.end method

.method private initSchedule()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v4, 0x0

    .line 187
    iget-object v0, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    if-nez v0, :cond_2

    .line 188
    const/4 v1, 0x0

    .line 189
    .local v1, scheduleInterval:I
    const/4 v2, 0x0

    .line 190
    .local v2, scheduleTime:I
    iget-object v0, p0, Lcom/bv/wifisync/Job;->scheduleType:Lcom/bv/wifisync/Job$ScheduleType;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/Job;->scheduleType:Lcom/bv/wifisync/Job$ScheduleType;

    sget-object v3, Lcom/bv/wifisync/Job$ScheduleType;->Interval:Lcom/bv/wifisync/Job$ScheduleType;

    if-ne v0, v3, :cond_3

    .line 191
    :cond_0
    iget v1, p0, Lcom/bv/wifisync/Job;->interval:I

    .line 194
    :cond_1
    :goto_0
    new-instance v0, Lcom/bv/wifisync/SyncSchedule;

    iget-object v3, p0, Lcom/bv/wifisync/Job;->scheduleRouters:Ljava/util/LinkedHashSet;

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/bv/wifisync/SyncSchedule;-><init>(IILjava/util/LinkedHashSet;ZI)V

    iput-object v0, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    .line 195
    iput v4, p0, Lcom/bv/wifisync/Job;->interval:I

    .line 196
    iput-object v6, p0, Lcom/bv/wifisync/Job;->scheduleType:Lcom/bv/wifisync/Job$ScheduleType;

    .line 197
    iput-object v6, p0, Lcom/bv/wifisync/Job;->scheduleRouters:Ljava/util/LinkedHashSet;

    .line 199
    .end local v1           #scheduleInterval:I
    .end local v2           #scheduleTime:I
    :cond_2
    return-void

    .line 192
    .restart local v1       #scheduleInterval:I
    .restart local v2       #scheduleTime:I
    :cond_3
    iget-object v0, p0, Lcom/bv/wifisync/Job;->scheduleType:Lcom/bv/wifisync/Job$ScheduleType;

    sget-object v3, Lcom/bv/wifisync/Job$ScheduleType;->Time:Lcom/bv/wifisync/Job$ScheduleType;

    if-ne v0, v3, :cond_1

    .line 193
    iget v2, p0, Lcom/bv/wifisync/Job;->interval:I

    goto :goto_0
.end method

.method private isMediaJob()Z
    .locals 2

    .prologue
    .line 461
    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getSyncType()Lcom/bv/wifisync/Job$SyncType;

    move-result-object v0

    .line 462
    .local v0, syncType:Lcom/bv/wifisync/Job$SyncType;
    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Music:Lcom/bv/wifisync/Job$SyncType;

    if-eq v0, v1, :cond_0

    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Pictures:Lcom/bv/wifisync/Job$SyncType;

    if-eq v0, v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private lockWifi(Landroid/content/Context;)Landroid/net/wifi/WifiManager$WifiLock;
    .locals 5
    .parameter "context"

    .prologue
    .line 386
    const-string v3, "wifi"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 387
    .local v1, wifiManager:Landroid/net/wifi/WifiManager;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xc

    if-lt v3, v4, :cond_0

    const/4 v2, 0x3

    .line 388
    .local v2, wifiMode:I
    :goto_0
    const v3, 0x7f060001

    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v0

    .line 389
    .local v0, wifiLock:Landroid/net/wifi/WifiManager$WifiLock;
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    .line 390
    return-object v0

    .line 387
    .end local v0           #wifiLock:Landroid/net/wifi/WifiManager$WifiLock;
    .end local v2           #wifiMode:I
    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private overlayImage(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;
    .locals 3
    .parameter "context"
    .parameter "id"
    .parameter "overlay"

    .prologue
    .line 581
    const/4 v1, 0x2

    new-array v0, v1, [Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    aput-object v2, v0, v1

    .line 582
    .local v0, dr:[Landroid/graphics/drawable/Drawable;
    new-instance v1, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v1, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    return-object v1
.end method

.method private readDeletionTrack(Landroid/content/Context;)Ljava/util/HashMap;
    .locals 3
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 416
    const/4 v0, 0x0

    .line 417
    .local v0, result:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-direct {p0}, Lcom/bv/wifisync/Job;->deletionTrackIsValid()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 418
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->getStateFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 419
    .local v1, stateFile:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 420
    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/bv/wifisync/Utils;->readObjectFromFile(Ljava/io/File;Z)Ljava/io/Serializable;

    move-result-object v0

    .end local v0           #result:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Long;>;"
    check-cast v0, Ljava/util/HashMap;

    .line 421
    .restart local v0       #result:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Long;>;"
    :cond_0
    if-nez v0, :cond_1

    .line 422
    new-instance v0, Ljava/util/HashMap;

    .end local v0           #result:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 426
    .end local v1           #stateFile:Ljava/io/File;
    .restart local v0       #result:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Long;>;"
    :cond_1
    :goto_0
    return-object v0

    .line 424
    :cond_2
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->removeDeletionTrackFile(Landroid/content/Context;)V

    goto :goto_0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 2
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 176
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 177
    iget-object v0, p0, Lcom/bv/wifisync/Job;->mirror:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 178
    iget-boolean v0, p0, Lcom/bv/wifisync/Job;->trackDeletions:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/wifisync/Job;->mirror:Ljava/lang/Boolean;

    .line 179
    :cond_0
    invoke-direct {p0}, Lcom/bv/wifisync/Job;->initSchedule()V

    .line 180
    return-void

    .line 178
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private refreshMedia(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V
    .locals 3
    .parameter "context"
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 238
    invoke-direct {p0}, Lcom/bv/wifisync/Job;->isMediaJob()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    invoke-interface {v2}, Lcom/bv/wifisync/Job$Plugin;->getChangedItems()Ljava/util/Collection;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 239
    iget-object v2, p0, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    invoke-interface {v2}, Lcom/bv/wifisync/Job$Plugin;->getChangedItems()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/bv/wifisync/Job;->toCreatedList(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    .line 240
    .local v0, createdList:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v2

    if-eqz v2, :cond_0

    .line 241
    invoke-static {p1, v0, p2}, Lcom/bv/wifisync/Utils;->refreshMedia(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    .line 242
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    invoke-interface {v2}, Lcom/bv/wifisync/Job$Plugin;->getChangedItems()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/bv/wifisync/Job;->toDeletedList(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v1

    .line 243
    .local v1, deletedList:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v2

    if-eqz v2, :cond_1

    .line 244
    invoke-static {p1, v1, p2}, Lcom/bv/wifisync/Utils;->refreshDeletedMedia(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    .line 246
    .end local v0           #createdList:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v1           #deletedList:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_1
    return-void
.end method

.method private removeDeletionTrackFile(Landroid/content/Context;)V
    .locals 2
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 623
    iget-object v0, p0, Lcom/bv/wifisync/Job;->stateFilePath:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 624
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/bv/wifisync/Job;->stateFilePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v0}, Lcom/bv/wifisync/Utils;->deleteFile(Landroid/content/Context;Ljava/io/File;)V

    .line 625
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bv/wifisync/Job;->stateFilePath:Ljava/lang/String;

    .line 627
    :cond_0
    return-void
.end method

.method private runPlugin(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V
    .locals 2
    .parameter "context"
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 226
    iget-object v0, p0, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    if-eqz v0, :cond_1

    .line 228
    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    invoke-interface {v0, p0, p1, p2}, Lcom/bv/wifisync/Job$Plugin;->run(Lcom/bv/wifisync/Job;Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 230
    iget-boolean v0, p0, Lcom/bv/wifisync/Job;->skipMediaScan:Z

    if-nez v0, :cond_0

    .line 231
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/Job;->refreshMedia(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V

    .line 232
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    invoke-interface {v0}, Lcom/bv/wifisync/Job$Plugin;->clear()V

    .line 235
    :cond_1
    return-void

    .line 229
    :catchall_0
    move-exception v0

    .line 230
    iget-boolean v1, p0, Lcom/bv/wifisync/Job;->skipMediaScan:Z

    if-nez v1, :cond_2

    .line 231
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/Job;->refreshMedia(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V

    .line 232
    :cond_2
    iget-object v1, p0, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    invoke-interface {v1}, Lcom/bv/wifisync/Job$Plugin;->clear()V

    .line 233
    throw v0
.end method

.method private splitFiles(Ljava/util/Collection;Ljava/util/LinkedList;Ljava/util/LinkedList;Ljava/util/LinkedList;)V
    .locals 10
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/bv/wifisync/SyncFile;",
            ">;",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/bv/wifisync/SyncFile;",
            ">;",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/bv/wifisync/SyncFile;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 500
    .local p1, result:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/SyncItem;>;"
    .local p2, localFiles:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/wifisync/SyncFile;>;"
    .local p3, remoteFiles:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/wifisync/SyncFile;>;"
    .local p4, deletedFiles:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/wifisync/SyncFile;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 510
    return-void

    .line 500
    :cond_0
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/bv/sync/SyncItem;

    .line 502
    .local v8, item:Lcom/bv/sync/SyncItem;
    new-instance v0, Lcom/bv/wifisync/SyncFile;

    iget-object v1, v8, Lcom/bv/sync/SyncItem;->absolutePath:Ljava/lang/String;

    iget-wide v2, v8, Lcom/bv/sync/SyncItem;->size:J

    iget-wide v4, v8, Lcom/bv/sync/SyncItem;->lastModified:J

    iget-boolean v6, v8, Lcom/bv/sync/SyncItem;->isFolder:Z

    invoke-direct/range {v0 .. v6}, Lcom/bv/wifisync/SyncFile;-><init>(Ljava/lang/String;JJZ)V

    .line 503
    .local v0, syncFile:Lcom/bv/wifisync/SyncFile;
    iget-object v1, v8, Lcom/bv/sync/SyncItem;->type:Lcom/bv/sync/SyncItem$Type;

    sget-object v2, Lcom/bv/sync/SyncItem$Type;->Deleted:Lcom/bv/sync/SyncItem$Type;

    if-ne v1, v2, :cond_1

    .line 504
    invoke-virtual {p4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 506
    :cond_1
    iget-object v1, v8, Lcom/bv/sync/SyncItem;->type:Lcom/bv/sync/SyncItem$Type;

    sget-object v2, Lcom/bv/sync/SyncItem$Type;->RemoteFile:Lcom/bv/sync/SyncItem$Type;

    if-ne v1, v2, :cond_2

    move-object v7, p3

    .line 507
    .local v7, collection:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/wifisync/SyncFile;>;"
    :goto_1
    invoke-virtual {v7, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .end local v7           #collection:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/wifisync/SyncFile;>;"
    :cond_2
    move-object v7, p2

    .line 506
    goto :goto_1
.end method

.method private toCreatedList(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/MovedItem;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 379
    .local p1, items:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/MovedItem;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 380
    .local v1, result:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 382
    return-object v1

    .line 380
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/MovedItem;

    .line 381
    .local v0, item:Lcom/bv/sync/MovedItem;
    iget-object v3, v0, Lcom/bv/sync/MovedItem;->newPath:Ljava/lang/String;

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private toDeletedList(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/MovedItem;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 372
    .local p1, items:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/MovedItem;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 373
    .local v1, result:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 375
    return-object v1

    .line 373
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/MovedItem;

    .line 374
    .local v0, item:Lcom/bv/sync/MovedItem;
    iget-object v3, v0, Lcom/bv/sync/MovedItem;->absolutePath:Ljava/lang/String;

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private trackWarning(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "context"
    .parameter "category"
    .parameter "event"
    .parameter "action"

    .prologue
    .line 407
    :try_start_0
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 408
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p2, p3, p4, v2}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 412
    :cond_0
    :goto_0
    return-void

    .line 409
    :catch_0
    move-exception v0

    .line 410
    .local v0, th:Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method private writeDeletionTrack(Landroid/content/Context;Ljava/util/HashMap;)V
    .locals 4
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 362
    .local p2, lastSync:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->getStateFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 363
    .local v0, stateFile:Ljava/io/File;
    invoke-static {p1, v0}, Lcom/bv/wifisync/Utils;->deleteFile(Landroid/content/Context;Ljava/io/File;)V

    .line 364
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/bv/wifisync/Job;->stateFilePath:Ljava/lang/String;

    .line 365
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->getStateFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 366
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ".tmp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 367
    .local v1, tmpFile:Ljava/io/File;
    const/4 v2, 0x1

    invoke-static {v1, p2, v2}, Lcom/bv/wifisync/Utils;->writeObjectToFile(Ljava/io/File;Ljava/io/Serializable;Z)V

    .line 368
    invoke-static {p1, v1, v0}, Lcom/bv/wifisync/Utils;->renameFile(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)V

    .line 369
    return-void
.end method


# virtual methods
.method cancel()V
    .locals 1

    .prologue
    .line 524
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/wifisync/Job;->canceled:Z

    .line 525
    return-void
.end method

.method varargs equals(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 5
    .parameter "name"
    .parameter "strings"

    .prologue
    const/4 v1, 0x0

    .line 574
    array-length v3, p2

    move v2, v1

    :goto_0
    if-lt v2, v3, :cond_0

    .line 577
    :goto_1
    return v1

    .line 574
    :cond_0
    aget-object v0, p2, v2

    .line 575
    .local v0, string:Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 576
    const/4 v1, 0x1

    goto :goto_1

    .line 574
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method getDefaultName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 536
    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v0

    .line 537
    .local v0, dir:Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 538
    const-string v1, "/"

    .line 539
    :goto_0
    return-object v1

    :cond_0
    if-eqz v0, :cond_1

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    const-string v1, ""

    goto :goto_0
.end method

.method getDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 2
    .parameter "context"

    .prologue
    .line 586
    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getIconId()I

    move-result v0

    .line 588
    .local v0, imageId:I
    iget-object v1, p0, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/bv/wifisync/Job;->running:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;

    instance-of v1, v1, Lcom/bv/wifisync/Job$NeverFinishedException;

    if-nez v1, :cond_1

    .line 589
    :cond_0
    const v1, 0x7f020001

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/Job;->overlayImage(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 590
    :goto_0
    return-object v1

    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_0
.end method

.method getHistory()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/Job$HistoryItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 630
    iget-object v0, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    if-nez v0, :cond_0

    .line 631
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    .line 632
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    monitor-enter v1

    .line 633
    :try_start_0
    new-instance v0, Ljava/util/LinkedList;

    iget-object v2, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1

    return-object v0

    .line 632
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getIconId()I
    .locals 2

    .prologue
    .line 594
    const/4 v1, 0x7

    new-array v0, v1, [I

    fill-array-data v0, :array_0

    .line 597
    .local v0, imageIds:[I
    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getSyncType()Lcom/bv/wifisync/Job$SyncType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/Job$SyncType;->ordinal()I

    move-result v1

    aget v1, v0, v1

    return v1

    .line 594
    nop

    :array_0
    .array-data 0x4
        0x1at 0x0t 0x2t 0x7ft
        0x1ct 0x0t 0x2t 0x7ft
        0x20t 0x0t 0x2t 0x7ft
        0x32t 0x0t 0x2t 0x7ft
        0x29t 0x0t 0x2t 0x7ft
        0x1ft 0x0t 0x2t 0x7ft
        0xct 0x0t 0x2t 0x7ft
    .end array-data
.end method

.method getLocalFolder(Landroid/content/Context;)Lcom/bv/sync/LocalFile;
    .locals 3
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 310
    new-instance v0, Lcom/bv/wifisync/LocalFileEx;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, p1, v1}, Lcom/bv/wifisync/LocalFileEx;-><init>(Landroid/content/Context;Ljava/io/File;)V

    return-object v0
.end method

.method getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 532
    iget-object v0, p0, Lcom/bv/wifisync/Job;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getDefaultName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/Job;->name:Ljava/lang/String;

    goto :goto_0
.end method

.method declared-synchronized getNextTimeToRun(Landroid/content/Context;)Ljava/util/Date;
    .locals 4
    .parameter "context"

    .prologue
    .line 688
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    .line 689
    const/4 v0, 0x0

    .line 693
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v0

    .line 690
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget-wide v2, p0, Lcom/bv/wifisync/Job;->lastRun:J

    invoke-virtual {v1, p1, v2, v3}, Lcom/bv/wifisync/SyncSchedule;->getNextTimeToRun(Landroid/content/Context;J)Ljava/util/Date;

    move-result-object v0

    .line 691
    .local v0, result:Ljava/util/Date;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget v1, v1, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    if-eqz v1, :cond_0

    .line 692
    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Job;->checkWakeup(Landroid/content/Context;Ljava/util/Date;)Ljava/util/Date;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 688
    .end local v0           #result:Ljava/util/Date;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method getPcDir()Ljava/lang/String;
    .locals 1

    .prologue
    .line 684
    iget-object v0, p0, Lcom/bv/wifisync/Job;->pcDir:Ljava/lang/String;

    return-object v0
.end method

.method getPhoneDir()Ljava/lang/String;
    .locals 3

    .prologue
    .line 668
    iget-object v0, p0, Lcom/bv/wifisync/Job;->phoneDir:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/Job;->phoneDir:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/Job;->phoneDir:Ljava/lang/String;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 669
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/Job;->phoneDir:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 670
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/Job;->phoneDir:Ljava/lang/String;

    goto :goto_0
.end method

.method getRemoteFolder(Landroid/content/Context;)Lcom/bv/sync/RemoteFile;
    .locals 5
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 314
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "smb://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v2, p1}, Lcom/bv/wifisync/Host;->resolveName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 315
    .local v0, url:Ljava/lang/String;
    iget-boolean v1, p0, Lcom/bv/wifisync/Job;->canceled:Z

    if-eqz v1, :cond_0

    .line 316
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v1

    .line 317
    :cond_0
    new-instance v1, Lcom/bv/sync/RemoteFile;

    iget-object v2, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    iget-object v2, v2, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    iget-object v3, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    iget-object v3, v3, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    iget-object v4, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v4, p1}, Lcom/bv/wifisync/Host;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4, v0}, Lcom/bv/sync/RemoteFile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method getSyncType()Lcom/bv/wifisync/Job$SyncType;
    .locals 2

    .prologue
    .line 551
    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v0

    .line 552
    .local v0, dir:Ljava/lang/String;
    if-nez v0, :cond_0

    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Folder:Lcom/bv/wifisync/Job$SyncType;

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/Job;->getSpecialType(Ljava/lang/String;Ljava/lang/String;)Lcom/bv/wifisync/Job$SyncType;

    move-result-object v1

    goto :goto_0
.end method

.method initRun(Landroid/content/Context;Z)V
    .locals 2
    .parameter "context"
    .parameter "runNow"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bv/wifisync/Job;->canceled:Z

    .line 203
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bv/wifisync/Job;->lastRun:J

    .line 204
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/wifisync/Job;->running:Z

    .line 205
    new-instance v0, Lcom/bv/wifisync/Job$NeverFinishedException;

    const v1, 0x7f060128

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/bv/wifisync/Job$NeverFinishedException;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;

    .line 206
    new-instance v0, Lcom/bv/wifisync/Job$HistoryItem;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/bv/wifisync/Job$HistoryItem;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Job;->addHistory(Landroid/content/Context;Lcom/bv/wifisync/Job$HistoryItem;)V

    .line 207
    return-void
.end method

.method isCanceled()Z
    .locals 1

    .prologue
    .line 528
    iget-boolean v0, p0, Lcom/bv/wifisync/Job;->canceled:Z

    return v0
.end method

.method isChargingDependant()Z
    .locals 1

    .prologue
    .line 752
    iget-object v0, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget-boolean v0, v0, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z

    return v0
.end method

.method declared-synchronized isConnected(Landroid/content/Context;)Z
    .locals 1
    .parameter "context"

    .prologue
    .line 725
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v0, p1}, Lcom/bv/wifisync/SyncSchedule;->isConnected(Landroid/content/Context;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method isReady(Landroid/content/Context;)Z
    .locals 5
    .parameter "context"

    .prologue
    .line 718
    iget-object v1, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget-wide v2, p0, Lcom/bv/wifisync/Job;->lastRun:J

    invoke-virtual {v1, p1, v2, v3}, Lcom/bv/wifisync/SyncSchedule;->isReady(Landroid/content/Context;J)Z

    move-result v0

    .line 719
    .local v0, result:Z
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget v1, v1, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    if-eqz v1, :cond_0

    .line 720
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Job;->getNextTimeToRun(Landroid/content/Context;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-gtz v1, :cond_1

    const/4 v0, 0x1

    .line 721
    :cond_0
    :goto_0
    return v0

    .line 720
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method declared-synchronized isRouterDependant()Z
    .locals 1

    .prologue
    .line 729
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v0}, Lcom/bv/wifisync/SyncSchedule;->isRouterDependant()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method isScheduled()Z
    .locals 1

    .prologue
    .line 733
    iget-object v0, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v0}, Lcom/bv/wifisync/SyncSchedule;->isScheduled()Z

    move-result v0

    return v0
.end method

.method remove(Landroid/content/Context;)V
    .locals 5
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 638
    iget-object v2, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    if-eqz v2, :cond_0

    .line 639
    iget-object v3, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    monitor-enter v3

    .line 640
    :try_start_0
    iget-object v2, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_5

    .line 639
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 644
    :cond_0
    iget v2, p0, Lcom/bv/wifisync/Job;->id:I

    if-eqz v2, :cond_3

    .line 645
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->getOldWorkingDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 646
    .local v1, workingDir:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 647
    invoke-static {p1, v1}, Lcom/bv/wifisync/Utils;->rmdir(Landroid/content/Context;Ljava/io/File;)V

    .line 648
    :cond_1
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->getWorkingDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 649
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 650
    invoke-static {p1, v1}, Lcom/bv/wifisync/Utils;->rmdir(Landroid/content/Context;Ljava/io/File;)V

    .line 651
    :cond_2
    const/4 v2, 0x0

    iput v2, p0, Lcom/bv/wifisync/Job;->id:I

    .line 653
    .end local v1           #workingDir:Ljava/io/File;
    :cond_3
    monitor-enter p0

    .line 654
    :try_start_1
    iget-object v2, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    if-eqz v2, :cond_4

    .line 655
    iget-object v2, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v2, p0}, Lcom/bv/wifisync/Host;->remove(Lcom/bv/wifisync/Job;)V

    .line 656
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    .line 653
    :cond_4
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 659
    return-void

    .line 640
    :cond_5
    :try_start_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Job$HistoryItem;

    .line 641
    .local v0, item:Lcom/bv/wifisync/Job$HistoryItem;
    invoke-virtual {v0, p1}, Lcom/bv/wifisync/Job$HistoryItem;->remove(Landroid/content/Context;)V

    goto :goto_0

    .line 639
    .end local v0           #item:Lcom/bv/wifisync/Job$HistoryItem;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 653
    :catchall_1
    move-exception v2

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v2
.end method

.method removed()Z
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method run(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;Z)V
    .locals 3
    .parameter "context"
    .parameter "progress"
    .parameter "runNow"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 211
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/bv/wifisync/Job;->sync(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V

    .line 212
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 217
    iput-boolean v2, p0, Lcom/bv/wifisync/Job;->running:Z

    iput-boolean v2, p0, Lcom/bv/wifisync/Job;->canceled:Z

    .line 219
    :goto_0
    return-void

    .line 213
    :catch_0
    move-exception v0

    .line 214
    .local v0, e:Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->removed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 215
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 216
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    .line 217
    iput-boolean v2, p0, Lcom/bv/wifisync/Job;->running:Z

    iput-boolean v2, p0, Lcom/bv/wifisync/Job;->canceled:Z

    .line 218
    throw v1

    .line 217
    .restart local v0       #e:Ljava/lang/Exception;
    :cond_0
    iput-boolean v2, p0, Lcom/bv/wifisync/Job;->running:Z

    iput-boolean v2, p0, Lcom/bv/wifisync/Job;->canceled:Z

    goto :goto_0
.end method

.method setName(Ljava/lang/String;)V
    .locals 0
    .parameter "name"

    .prologue
    .line 543
    iput-object p1, p0, Lcom/bv/wifisync/Job;->name:Ljava/lang/String;

    .line 544
    return-void
.end method

.method setPcDir(Ljava/lang/String;)V
    .locals 3
    .parameter "pcDir"

    .prologue
    .line 674
    iget-object v0, p0, Lcom/bv/wifisync/Job;->pcDir:Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lcom/bv/wifisync/Job;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    if-eqz v0, :cond_0

    .line 675
    iget-object v0, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/bv/wifisync/Job$Filter;->includeRemoteFiles:Ljava/util/LinkedHashSet;

    iput-object v2, v0, Lcom/bv/wifisync/Job$Filter;->remoteFiles:Ljava/util/LinkedHashSet;

    .line 676
    :cond_0
    iput-object p1, p0, Lcom/bv/wifisync/Job;->pcDir:Ljava/lang/String;

    .line 677
    return-void
.end method

.method setPhoneDir(Ljava/lang/String;)V
    .locals 3
    .parameter "phoneDir"

    .prologue
    .line 662
    iget-object v0, p0, Lcom/bv/wifisync/Job;->phoneDir:Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lcom/bv/wifisync/Job;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    if-eqz v0, :cond_0

    .line 663
    iget-object v0, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/bv/wifisync/Job$Filter;->includeLocalFiles:Ljava/util/LinkedHashSet;

    iput-object v2, v0, Lcom/bv/wifisync/Job$Filter;->localFiles:Ljava/util/LinkedHashSet;

    .line 664
    :cond_0
    iput-object p1, p0, Lcom/bv/wifisync/Job;->phoneDir:Ljava/lang/String;

    .line 665
    return-void
.end method

.method showHistory(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 756
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/bv/wifisync/HistoryBrowser;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 757
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "RESULT"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 758
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 759
    return-void
.end method

.method sync(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V
    .locals 7
    .parameter "context"
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 250
    iget-object v5, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    monitor-enter v5

    .line 251
    :try_start_0
    iget-object v4, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    iget-object v6, p0, Lcom/bv/wifisync/Job;->history:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/Job$HistoryItem;

    .line 250
    .local v2, historyItem:Lcom/bv/wifisync/Job$HistoryItem;
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    const/4 v3, 0x0

    .line 255
    .local v3, result:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/SyncItem;>;"
    :try_start_1
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 256
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/Job;->runPlugin(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V

    .line 257
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/Job;->doSync(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;

    move-result-object v3

    .line 258
    invoke-static {p1, p2}, Lcom/bv/wifisync/LocalFileEx;->compact(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V

    .line 259
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 270
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, v2, Lcom/bv/wifisync/Job$HistoryItem;->endTime:J

    .line 272
    :goto_0
    if-eqz v3, :cond_0

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->removed()Z

    move-result v4

    if-nez v4, :cond_0

    .line 273
    invoke-direct {p0, v2, p1, v3}, Lcom/bv/wifisync/Job;->addHistoryResult(Lcom/bv/wifisync/Job$HistoryItem;Landroid/content/Context;Ljava/util/Collection;)V

    .line 274
    iget-boolean v4, p0, Lcom/bv/wifisync/Job;->skipMediaScan:Z

    if-nez v4, :cond_0

    .line 275
    invoke-static {p1, v3, p2}, Lcom/bv/wifisync/Utils;->updateMediaFiles(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    .line 277
    :cond_0
    iget-object v4, p0, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;

    if-eqz v4, :cond_3

    .line 278
    iget-object v4, p0, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;

    throw v4

    .line 250
    .end local v2           #historyItem:Lcom/bv/wifisync/Job$HistoryItem;
    .end local v3           #result:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/SyncItem;>;"
    :catchall_0
    move-exception v4

    :try_start_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 260
    .restart local v2       #historyItem:Lcom/bv/wifisync/Job$HistoryItem;
    .restart local v3       #result:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/SyncItem;>;"
    :catch_0
    move-exception v1

    .line 261
    .local v1, e:Ljava/lang/Throwable;
    :try_start_3
    iput-object v1, p0, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;

    .line 262
    instance-of v4, v1, Lcom/bv/sync/CifsSync$SyncException;

    if-eqz v4, :cond_2

    .line 263
    move-object v0, v1

    check-cast v0, Lcom/bv/sync/CifsSync$SyncException;

    move-object v4, v0

    iget-object v3, v4, Lcom/bv/sync/CifsSync$SyncException;->result:Ljava/util/List;

    .line 267
    :cond_1
    :goto_1
    const/4 v4, 0x0

    invoke-static {p1, v1, v4}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;Z)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/bv/wifisync/Job$HistoryItem;->error:Ljava/lang/String;

    .line 268
    const/4 v4, 0x1

    iput-boolean v4, v2, Lcom/bv/wifisync/Job$HistoryItem;->isError:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 270
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, v2, Lcom/bv/wifisync/Job$HistoryItem;->endTime:J

    goto :goto_0

    .line 264
    :cond_2
    :try_start_4
    instance-of v4, v1, Lcom/bv/sync/CifsSync$SyncCancellationException;

    if-eqz v4, :cond_1

    .line 265
    move-object v0, v1

    check-cast v0, Lcom/bv/sync/CifsSync$SyncCancellationException;

    move-object v4, v0

    iget-object v3, v4, Lcom/bv/sync/CifsSync$SyncCancellationException;->syncResult:Ljava/util/List;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    .line 269
    .end local v1           #e:Ljava/lang/Throwable;
    :catchall_1
    move-exception v4

    .line 270
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iput-wide v5, v2, Lcom/bv/wifisync/Job$HistoryItem;->endTime:J

    .line 271
    throw v4

    .line 279
    :cond_3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 744
    const-string v0, ""

    .line 745
    .local v0, result:Ljava/lang/String;
    iget-object v1, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    if-eqz v1, :cond_0

    .line 746
    iget-object v1, p0, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    iget-object v0, v1, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    .line 747
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 748
    return-object v0
.end method

.method declared-synchronized update(Landroid/content/Context;Lcom/bv/wifisync/Job;)V
    .locals 3
    .parameter "context"
    .parameter "another"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 601
    monitor-enter p0

    :try_start_0
    invoke-virtual {p2}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/bv/wifisync/Job;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 602
    invoke-virtual {p2}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/bv/wifisync/Job;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 603
    iget-object v1, p0, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    iget-object v2, p2, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v1, v2, :cond_0

    .line 604
    iget-object v1, p0, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v2, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v1, v2, :cond_2

    .line 605
    iget-object v1, p2, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v2, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v1, v2, :cond_2

    .line 601
    :cond_0
    const/4 v0, 0x0

    .line 607
    .local v0, invalidateDeletionsTrack:Z
    :goto_0
    if-eqz v0, :cond_1

    .line 608
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->removeDeletionTrackFile(Landroid/content/Context;)V

    .line 609
    :cond_1
    invoke-virtual {p2}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/Job;->setPhoneDir(Ljava/lang/String;)V

    .line 610
    invoke-virtual {p2}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/Job;->setPcDir(Ljava/lang/String;)V

    .line 611
    iget-object v1, p2, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    iput-object v1, p0, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    .line 612
    iget-boolean v1, p2, Lcom/bv/wifisync/Job;->overwrite:Z

    iput-boolean v1, p0, Lcom/bv/wifisync/Job;->overwrite:Z

    .line 613
    iget-boolean v1, p2, Lcom/bv/wifisync/Job;->trackDeletions:Z

    iput-boolean v1, p0, Lcom/bv/wifisync/Job;->trackDeletions:Z

    .line 614
    iget-object v1, p2, Lcom/bv/wifisync/Job;->mirror:Ljava/lang/Boolean;

    iput-object v1, p0, Lcom/bv/wifisync/Job;->mirror:Ljava/lang/Boolean;

    .line 615
    iget-object v1, p2, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iput-object v1, p0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    .line 616
    iget-object v1, p2, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    iput-object v1, p0, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    .line 617
    iget-object v1, p2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iput-object v1, p0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    .line 618
    iget-boolean v1, p2, Lcom/bv/wifisync/Job;->skipMediaScan:Z

    iput-boolean v1, p0, Lcom/bv/wifisync/Job;->skipMediaScan:Z

    .line 619
    iget-object v1, p2, Lcom/bv/wifisync/Job;->name:Ljava/lang/String;

    iput-object v1, p0, Lcom/bv/wifisync/Job;->name:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 620
    monitor-exit p0

    return-void

    .line 601
    .end local v0           #invalidateDeletionsTrack:Z
    :cond_2
    const/4 v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method validate(Landroid/content/Context;)V
    .locals 3
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 737
    const-string v0, "Job"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Validating job "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 738
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job;->getWorkingDir(Landroid/content/Context;)Ljava/io/File;

    .line 739
    const-string v0, "Job"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Validated job "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/bv/wifisync/Job;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 740
    return-void
.end method
