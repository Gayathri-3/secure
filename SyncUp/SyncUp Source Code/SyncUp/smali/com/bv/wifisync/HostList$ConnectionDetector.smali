.class Lcom/bv/wifisync/HostList$ConnectionDetector;
.super Ljava/lang/Object;
.source "HostList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/HostList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectionDetector"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;
    }
.end annotation


# static fields
.field private static final RESOLVE_TIMEOUT:J = 0x493e0L


# instance fields
.field private final context:Landroid/content/Context;

.field private final lastReconnect:J

.field private final listener:Lcom/bv/wifisync/HostList$ChangeListener;

.field final synthetic this$0:Lcom/bv/wifisync/HostList;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HostList;Landroid/content/Context;JLcom/bv/wifisync/HostList$ChangeListener;)V
    .locals 0
    .parameter
    .parameter "context"
    .parameter "lastReconnect"
    .parameter "listener"

    .prologue
    .line 238
    iput-object p1, p0, Lcom/bv/wifisync/HostList$ConnectionDetector;->this$0:Lcom/bv/wifisync/HostList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    iput-object p5, p0, Lcom/bv/wifisync/HostList$ConnectionDetector;->listener:Lcom/bv/wifisync/HostList$ChangeListener;

    .line 240
    iput-object p2, p0, Lcom/bv/wifisync/HostList$ConnectionDetector;->context:Landroid/content/Context;

    .line 241
    iput-wide p3, p0, Lcom/bv/wifisync/HostList$ConnectionDetector;->lastReconnect:J

    .line 242
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/HostList$ConnectionDetector;)Lcom/bv/wifisync/HostList$ChangeListener;
    .locals 1
    .parameter

    .prologue
    .line 234
    iget-object v0, p0, Lcom/bv/wifisync/HostList$ConnectionDetector;->listener:Lcom/bv/wifisync/HostList$ChangeListener;

    return-object v0
.end method

.method static synthetic access$1(Lcom/bv/wifisync/HostList$ConnectionDetector;)J
    .locals 2
    .parameter

    .prologue
    .line 236
    iget-wide v0, p0, Lcom/bv/wifisync/HostList$ConnectionDetector;->lastReconnect:J

    return-wide v0
.end method

.method static synthetic access$2(Lcom/bv/wifisync/HostList$ConnectionDetector;)Lcom/bv/wifisync/HostList;
    .locals 1
    .parameter

    .prologue
    .line 232
    iget-object v0, p0, Lcom/bv/wifisync/HostList$ConnectionDetector;->this$0:Lcom/bv/wifisync/HostList;

    return-object v0
.end method


# virtual methods
.method run()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 245
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 246
    .local v3, tasks:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;>;"
    monitor-enter p0

    .line 247
    :try_start_0
    iget-object v5, p0, Lcom/bv/wifisync/HostList$ConnectionDetector;->this$0:Lcom/bv/wifisync/HostList;

    invoke-virtual {v5}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_1

    .line 246
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 251
    iget-object v5, p0, Lcom/bv/wifisync/HostList$ConnectionDetector;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/bv/wifisync/Config;->getForceWifi(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/bv/wifisync/HostList$ConnectionDetector;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/bv/wifisync/Utils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_2

    move v1, v4

    .line 252
    .local v1, isConnected:Z
    :goto_1
    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_3

    .line 258
    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_5

    .line 261
    return-void

    .line 247
    .end local v1           #isConnected:Z
    :cond_1
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 248
    .local v0, host:Lcom/bv/wifisync/Host;
    new-instance v6, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;

    iget-object v7, p0, Lcom/bv/wifisync/HostList$ConnectionDetector;->context:Landroid/content/Context;

    invoke-direct {v6, p0, v7, v0}, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;-><init>(Lcom/bv/wifisync/HostList$ConnectionDetector;Landroid/content/Context;Lcom/bv/wifisync/Host;)V

    invoke-virtual {v3, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 246
    .end local v0           #host:Lcom/bv/wifisync/Host;
    :catchall_0
    move-exception v4

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 251
    :cond_2
    const/4 v1, 0x1

    goto :goto_1

    .line 252
    .restart local v1       #isConnected:Z
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;

    .line 253
    .local v2, task:Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;
    if-nez v1, :cond_4

    .line 254
    #getter for: Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;
    invoke-static {v2}, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->access$0(Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;)Lcom/bv/wifisync/Host;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/bv/wifisync/Host;->setConnected(Z)V

    goto :goto_2

    .line 256
    :cond_4
    invoke-virtual {v2}, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->start()V

    goto :goto_2

    .line 258
    .end local v2           #task:Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;
    :cond_5
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;

    .line 259
    .restart local v2       #task:Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;
    invoke-virtual {v2}, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->isAlive()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 260
    invoke-virtual {v2}, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->join()V

    goto :goto_3
.end method
