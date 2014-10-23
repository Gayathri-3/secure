.class Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;
.super Ljava/lang/Thread;
.source "HostList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/HostList$ConnectionDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CheckTask"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final host:Lcom/bv/wifisync/Host;

.field final synthetic this$1:Lcom/bv/wifisync/HostList$ConnectionDetector;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HostList$ConnectionDetector;Landroid/content/Context;Lcom/bv/wifisync/Host;)V
    .locals 1
    .parameter
    .parameter "context"
    .parameter "host"

    .prologue
    .line 267
    iput-object p1, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->this$1:Lcom/bv/wifisync/HostList$ConnectionDetector;

    .line 268
    const-string v0, "CheckTask"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 269
    iput-object p3, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    .line 270
    iput-object p2, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->context:Landroid/content/Context;

    .line 271
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;)Lcom/bv/wifisync/Host;
    .locals 1
    .parameter

    .prologue
    .line 264
    iget-object v0, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    return-object v0
.end method

.method private resolveName()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 291
    iget-object v3, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, v3, Lcom/bv/wifisync/Host;->lastResolve:J

    .line 292
    iget-object v3, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v3}, Lcom/bv/wifisync/Host;->getIp()Ljava/lang/String;

    move-result-object v0

    .line 293
    .local v0, ip:Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v3}, Lcom/bv/wifisync/Host;->getMac()[B

    move-result-object v1

    .line 294
    .local v1, mac:[B
    iget-object v3, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    iget-object v4, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->context:Landroid/content/Context;

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/Host;->resolveName(Landroid/content/Context;)Ljava/lang/String;

    .line 295
    iget-object v3, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v3}, Lcom/bv/wifisync/Host;->getIp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    if-nez v1, :cond_1

    iget-object v3, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v3}, Lcom/bv/wifisync/Host;->getMac()[B

    move-result-object v3

    if-eqz v3, :cond_1

    .line 296
    :cond_0
    iget-object v3, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->this$1:Lcom/bv/wifisync/HostList$ConnectionDetector;

    #getter for: Lcom/bv/wifisync/HostList$ConnectionDetector;->this$0:Lcom/bv/wifisync/HostList;
    invoke-static {v3}, Lcom/bv/wifisync/HostList$ConnectionDetector;->access$2(Lcom/bv/wifisync/HostList$ConnectionDetector;)Lcom/bv/wifisync/HostList;

    move-result-object v3

    iget-object v4, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->context:Landroid/content/Context;

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/HostList;->save(Landroid/content/Context;)V

    .line 297
    :cond_1
    iget-object v3, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    iget-boolean v2, v3, Lcom/bv/wifisync/Host;->isUp:Z

    .line 298
    .local v2, result:Z
    iget-object v3, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v3, v2}, Lcom/bv/wifisync/Host;->setConnected(Z)V

    .line 299
    return v2
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 276
    :try_start_0
    iget-object v4, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v4}, Lcom/bv/wifisync/Host;->isUp()Z

    move-result v2

    .line 277
    .local v2, isUp:Z
    iget-object v4, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v4}, Lcom/bv/wifisync/Host;->getConnected()Z

    move-result v4

    xor-int v0, v4, v2

    .line 278
    .local v0, changed:Z
    if-eqz v0, :cond_0

    .line 279
    iget-object v4, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v4, v2}, Lcom/bv/wifisync/Host;->setConnected(Z)V

    .line 280
    iget-object v4, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->this$1:Lcom/bv/wifisync/HostList$ConnectionDetector;

    #getter for: Lcom/bv/wifisync/HostList$ConnectionDetector;->listener:Lcom/bv/wifisync/HostList$ChangeListener;
    invoke-static {v4}, Lcom/bv/wifisync/HostList$ConnectionDetector;->access$0(Lcom/bv/wifisync/HostList$ConnectionDetector;)Lcom/bv/wifisync/HostList$ChangeListener;

    move-result-object v4

    invoke-interface {v4}, Lcom/bv/wifisync/HostList$ChangeListener;->onChanged()V

    .line 282
    :cond_0
    if-nez v2, :cond_3

    iget-object v4, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    iget-wide v4, v4, Lcom/bv/wifisync/Host;->lastResolve:J

    iget-object v6, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->this$1:Lcom/bv/wifisync/HostList$ConnectionDetector;

    #getter for: Lcom/bv/wifisync/HostList$ConnectionDetector;->lastReconnect:J
    invoke-static {v6}, Lcom/bv/wifisync/HostList$ConnectionDetector;->access$1(Lcom/bv/wifisync/HostList$ConnectionDetector;)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-ltz v4, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v6, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->host:Lcom/bv/wifisync/Host;

    iget-wide v6, v6, Lcom/bv/wifisync/Host;->lastResolve:J

    sub-long/2addr v4, v6

    const-wide/32 v6, 0x493e0

    cmp-long v4, v4, v6

    if-lez v4, :cond_3

    :cond_1
    const/4 v3, 0x1

    .line 283
    .local v3, shouldResolve:Z
    :goto_0
    if-eqz v3, :cond_2

    invoke-direct {p0}, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->resolveName()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 284
    iget-object v4, p0, Lcom/bv/wifisync/HostList$ConnectionDetector$CheckTask;->this$1:Lcom/bv/wifisync/HostList$ConnectionDetector;

    #getter for: Lcom/bv/wifisync/HostList$ConnectionDetector;->listener:Lcom/bv/wifisync/HostList$ChangeListener;
    invoke-static {v4}, Lcom/bv/wifisync/HostList$ConnectionDetector;->access$0(Lcom/bv/wifisync/HostList$ConnectionDetector;)Lcom/bv/wifisync/HostList$ChangeListener;

    move-result-object v4

    invoke-interface {v4}, Lcom/bv/wifisync/HostList$ChangeListener;->onChanged()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    .end local v0           #changed:Z
    .end local v2           #isUp:Z
    .end local v3           #shouldResolve:Z
    :cond_2
    :goto_1
    return-void

    .line 282
    .restart local v0       #changed:Z
    .restart local v2       #isUp:Z
    :cond_3
    const/4 v3, 0x0

    goto :goto_0

    .line 285
    .end local v0           #changed:Z
    .end local v2           #isUp:Z
    :catch_0
    move-exception v1

    .line 286
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
