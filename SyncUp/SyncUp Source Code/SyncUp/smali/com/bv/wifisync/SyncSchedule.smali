.class Lcom/bv/wifisync/SyncSchedule;
.super Lcom/bv/sync/Schedule;
.source "SyncSchedule.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x5c2db22213b5edbL


# instance fields
.field private off:Z

.field routers:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field wakeupInterval:I

.field whenCharging:Z


# direct methods
.method constructor <init>(IILjava/util/LinkedHashSet;ZI)V
    .locals 0
    .parameter "interval"
    .parameter "exactTime"
    .parameter
    .parameter "whenCharging"
    .parameter "wakeupInterval"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;ZI)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p3, routers:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/bv/sync/Schedule;-><init>()V

    .line 40
    iput p1, p0, Lcom/bv/wifisync/SyncSchedule;->interval:I

    .line 41
    iput p2, p0, Lcom/bv/wifisync/SyncSchedule;->exactTime:I

    .line 42
    iput-object p3, p0, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    .line 43
    iput-boolean p4, p0, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z

    .line 44
    iput p5, p0, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    .line 45
    return-void
.end method

.method private isRouterConnected(Landroid/content/Context;)Z
    .locals 6
    .parameter "context"

    .prologue
    const/4 v3, 0x0

    .line 83
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 84
    const-string v4, "wifi"

    invoke-virtual {p1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    .line 85
    .local v2, wifiManager:Landroid/net/wifi/WifiManager;
    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    .line 86
    .local v0, connectionInfo:Landroid/net/wifi/WifiInfo;
    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v1

    .line 87
    .local v1, ssid:Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->stripQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v3, 0x1

    .line 89
    .end local v0           #connectionInfo:Landroid/net/wifi/WifiInfo;
    .end local v1           #ssid:Ljava/lang/String;
    .end local v2           #wifiManager:Landroid/net/wifi/WifiManager;
    :cond_0
    return v3
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 33
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 34
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lcom/bv/wifisync/SyncSchedule;->interval:I

    .line 35
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lcom/bv/wifisync/SyncSchedule;->exactTime:I

    .line 36
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    iput-object v0, p0, Lcom/bv/wifisync/SyncSchedule;->weekdays:[Z

    .line 37
    return-void
.end method

.method private tomorrow(Ljava/util/Date;)Ljava/util/Date;
    .locals 3
    .parameter "time"

    .prologue
    .line 125
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 126
    .local v0, calendar:Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 127
    const/4 v1, 0x5

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    .line 128
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 26
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 27
    iget v0, p0, Lcom/bv/wifisync/SyncSchedule;->interval:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 28
    iget v0, p0, Lcom/bv/wifisync/SyncSchedule;->exactTime:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 29
    iget-object v0, p0, Lcom/bv/wifisync/SyncSchedule;->weekdays:[Z

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 30
    return-void
.end method


# virtual methods
.method getEnabled()Z
    .locals 1

    .prologue
    .line 142
    iget-boolean v0, p0, Lcom/bv/wifisync/SyncSchedule;->off:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method getExactTime()I
    .locals 1

    .prologue
    .line 105
    iget v0, p0, Lcom/bv/wifisync/SyncSchedule;->exactTime:I

    return v0
.end method

.method getInterval()I
    .locals 1

    .prologue
    .line 109
    iget v0, p0, Lcom/bv/wifisync/SyncSchedule;->interval:I

    return v0
.end method

.method getNextTimeToRun(Landroid/content/Context;J)Ljava/util/Date;
    .locals 3
    .parameter "context"
    .parameter "lastRunTime"

    .prologue
    .line 48
    iget-boolean v1, p0, Lcom/bv/wifisync/SyncSchedule;->off:Z

    if-nez v1, :cond_2

    .line 49
    invoke-virtual {p0, p2, p3}, Lcom/bv/wifisync/SyncSchedule;->getNextTimeToRun(J)Ljava/util/Date;

    move-result-object v0

    .line 50
    .local v0, result:Ljava/util/Date;
    if-nez v0, :cond_1

    .line 51
    invoke-virtual {p0}, Lcom/bv/wifisync/SyncSchedule;->isRouterDependant()Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z

    if-eqz v1, :cond_1

    .line 52
    :cond_0
    invoke-static {}, Lcom/bv/wifisync/SyncSchedule;->getStartOfTheDay()Ljava/util/Date;

    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    cmp-long v1, p2, v1

    if-lez v1, :cond_1

    .line 54
    invoke-direct {p0, v0}, Lcom/bv/wifisync/SyncSchedule;->tomorrow(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    .line 59
    .end local v0           #result:Ljava/util/Date;
    :cond_1
    :goto_0
    return-object v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getWeekdays()[Z
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/bv/wifisync/SyncSchedule;->weekdays:[Z

    return-object v0
.end method

.method isCharging(Landroid/content/Context;)Z
    .locals 7
    .parameter "context"

    .prologue
    const/4 v3, 0x1

    .line 132
    const/4 v4, 0x0

    new-instance v5, Landroid/content/IntentFilter;

    const-string v6, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v5, v6}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v4, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v1

    .line 133
    .local v1, intent:Landroid/content/Intent;
    const-string v4, "plugged"

    const/4 v5, -0x1

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 134
    .local v2, plugged:I
    const/4 v0, 0x4

    .line 135
    .local v0, BATTERY_PLUGGED_WIRELESS:I
    if-eq v2, v3, :cond_0

    .line 136
    const/4 v4, 0x2

    if-eq v2, v4, :cond_0

    .line 137
    const/4 v4, 0x4

    if-eq v2, v4, :cond_0

    .line 135
    const/4 v3, 0x0

    .line 138
    .local v3, result:Z
    :cond_0
    return v3
.end method

.method declared-synchronized isChargingDependant()Z
    .locals 1

    .prologue
    .line 97
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized isConnected(Landroid/content/Context;)Z
    .locals 3
    .parameter "context"

    .prologue
    const/4 v1, 0x1

    .line 72
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/bv/wifisync/SyncSchedule;->isRouterDependant()Z

    move-result v0

    .line 73
    .local v0, routerDependant:Z
    if-eqz v0, :cond_2

    iget-boolean v2, p0, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z

    if-eqz v2, :cond_2

    .line 74
    invoke-direct {p0, p1}, Lcom/bv/wifisync/SyncSchedule;->isRouterConnected(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/SyncSchedule;->isCharging(Landroid/content/Context;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_1

    .line 79
    :cond_0
    :goto_0
    monitor-exit p0

    return v1

    .line 74
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 75
    :cond_2
    if-eqz v0, :cond_3

    .line 76
    :try_start_1
    invoke-direct {p0, p1}, Lcom/bv/wifisync/SyncSchedule;->isRouterConnected(Landroid/content/Context;)Z

    move-result v1

    goto :goto_0

    .line 77
    :cond_3
    iget-boolean v2, p0, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z

    if-eqz v2, :cond_0

    .line 78
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/SyncSchedule;->isCharging(Landroid/content/Context;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    goto :goto_0

    .line 72
    .end local v0           #routerDependant:Z
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method isReady(Landroid/content/Context;J)Z
    .locals 6
    .parameter "context"
    .parameter "lastRunTime"

    .prologue
    .line 63
    invoke-virtual {p0, p1, p2, p3}, Lcom/bv/wifisync/SyncSchedule;->getNextTimeToRun(Landroid/content/Context;J)Ljava/util/Date;

    move-result-object v0

    .line 64
    .local v0, nextRun:Ljava/util/Date;
    if-eqz v0, :cond_0

    .line 65
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gtz v2, :cond_0

    .line 66
    invoke-virtual {p0}, Lcom/bv/wifisync/SyncSchedule;->isWeekDay()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 67
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/SyncSchedule;->isConnected(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 64
    const/4 v1, 0x1

    .line 68
    .local v1, result:Z
    :goto_0
    return v1

    .line 64
    .end local v1           #result:Z
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method declared-synchronized isRouterDependant()Z
    .locals 1

    .prologue
    .line 93
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method isScheduled()Z
    .locals 1

    .prologue
    .line 101
    iget-boolean v0, p0, Lcom/bv/wifisync/SyncSchedule;->off:Z

    if-nez v0, :cond_1

    iget v0, p0, Lcom/bv/wifisync/SyncSchedule;->interval:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/bv/wifisync/SyncSchedule;->exactTime:I

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/SyncSchedule;->weekScheduleExists()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/SyncSchedule;->isRouterDependant()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method setEnabled(Z)V
    .locals 1
    .parameter "value"

    .prologue
    .line 146
    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/bv/wifisync/SyncSchedule;->off:Z

    .line 147
    return-void

    .line 146
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method setExactTime(I)V
    .locals 0
    .parameter "exactTime"

    .prologue
    .line 117
    iput p1, p0, Lcom/bv/wifisync/SyncSchedule;->exactTime:I

    .line 118
    return-void
.end method

.method setInterval(I)V
    .locals 0
    .parameter "interval"

    .prologue
    .line 121
    iput p1, p0, Lcom/bv/wifisync/SyncSchedule;->interval:I

    .line 122
    return-void
.end method
