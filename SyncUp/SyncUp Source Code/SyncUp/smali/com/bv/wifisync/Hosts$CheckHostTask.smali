.class Lcom/bv/wifisync/Hosts$CheckHostTask;
.super Ljava/lang/Thread;
.source "Hosts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Hosts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CheckHostTask"
.end annotation


# static fields
.field private static final SCREEN_REFRESH_TIMEOUT:J = 0xea60L


# instance fields
.field enabled:Z

.field private lastReconnect:J

.field lastRefreshTime:J

.field final synthetic this$0:Lcom/bv/wifisync/Hosts;


# direct methods
.method public constructor <init>(Lcom/bv/wifisync/Hosts;)V
    .locals 1
    .parameter

    .prologue
    .line 898
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;

    .line 899
    const-string v0, "CheckHostTask"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 894
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->enabled:Z

    .line 900
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/Hosts$CheckHostTask;J)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 896
    iput-wide p1, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->lastReconnect:J

    return-void
.end method

.method static synthetic access$1(Lcom/bv/wifisync/Hosts$CheckHostTask;)Lcom/bv/wifisync/Hosts;
    .locals 1
    .parameter

    .prologue
    .line 892
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;

    return-object v0
.end method

.method private checkHostConnected()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 934
    iget-boolean v0, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->enabled:Z

    if-eqz v0, :cond_0

    .line 935
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$15(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/HostList;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;

    iget-wide v2, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->lastReconnect:J

    new-instance v4, Lcom/bv/wifisync/Hosts$CheckHostTask$2;

    invoke-direct {v4, p0}, Lcom/bv/wifisync/Hosts$CheckHostTask$2;-><init>(Lcom/bv/wifisync/Hosts$CheckHostTask;)V

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/bv/wifisync/HostList;->checkConnected(Landroid/content/Context;JLcom/bv/wifisync/HostList$ChangeListener;)V

    .line 946
    :cond_0
    return-void
.end method

.method private refreshScreen()V
    .locals 6

    .prologue
    .line 949
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 950
    .local v0, now:J
    iget-wide v2, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->lastRefreshTime:J

    sub-long v2, v0, v2

    const-wide/32 v4, 0xea60

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 951
    iput-wide v0, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->lastRefreshTime:J

    .line 952
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;

    new-instance v3, Lcom/bv/wifisync/Hosts$CheckHostTask$3;

    invoke-direct {v3, p0}, Lcom/bv/wifisync/Hosts$CheckHostTask$3;-><init>(Lcom/bv/wifisync/Hosts$CheckHostTask;)V

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/Hosts;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 959
    :cond_0
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 904
    const/16 v2, 0x13

    invoke-static {v2}, Landroid/os/Process;->setThreadPriority(I)V

    .line 905
    new-instance v0, Lcom/bv/wifisync/Hosts$CheckHostTask$1;

    invoke-direct {v0, p0}, Lcom/bv/wifisync/Hosts$CheckHostTask$1;-><init>(Lcom/bv/wifisync/Hosts$CheckHostTask;)V

    .line 912
    .local v0, receiver:Landroid/content/BroadcastReceiver;
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v3}, Lcom/bv/wifisync/Hosts;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 914
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/bv/wifisync/Hosts$CheckHostTask;->interrupted()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    move-result v2

    if-eqz v2, :cond_0

    .line 926
    :try_start_1
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/Hosts;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_5

    .line 931
    :goto_1
    return-void

    .line 915
    :cond_0
    :try_start_2
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts;->access$14(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$ItemsAdapter;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 916
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts$CheckHostTask;->checkHostConnected()V

    .line 917
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts$CheckHostTask;->refreshScreen()V

    .line 919
    :cond_1
    const-wide/16 v2, 0x1388

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 921
    :catch_0
    move-exception v2

    .line 926
    :try_start_3
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/Hosts;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 927
    :catch_1
    move-exception v1

    .line 928
    .local v1, th:Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    .line 922
    .end local v1           #th:Ljava/lang/Throwable;
    :catch_2
    move-exception v1

    .line 923
    .restart local v1       #th:Ljava/lang/Throwable;
    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 926
    :try_start_5
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/Hosts;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_1

    .line 927
    :catch_3
    move-exception v1

    .line 928
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    .line 924
    .end local v1           #th:Ljava/lang/Throwable;
    :catchall_0
    move-exception v2

    .line 926
    :try_start_6
    iget-object v3, p0, Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v3, v0}, Lcom/bv/wifisync/Hosts;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_4

    .line 930
    :goto_2
    throw v2

    .line 927
    :catch_4
    move-exception v1

    .line 928
    .restart local v1       #th:Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_2

    .line 927
    .end local v1           #th:Ljava/lang/Throwable;
    :catch_5
    move-exception v1

    .line 928
    .restart local v1       #th:Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1
.end method
