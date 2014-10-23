.class public Lcom/bv/wifisync/WifiConnectReceiver;
.super Landroid/content/BroadcastReceiver;
.source "WifiConnectReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private wifiConnected(Landroid/content/Intent;)Z
    .locals 4
    .parameter "intent"

    .prologue
    .line 18
    const/4 v1, 0x0

    .line 19
    .local v1, result:Z
    if-eqz p1, :cond_0

    const-string v2, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 20
    const-string v2, "networkInfo"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/NetworkInfo;

    .line 21
    .local v0, info:Landroid/net/NetworkInfo;
    if-eqz v0, :cond_1

    sget-object v2, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/NetworkInfo$State;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    .line 23
    .end local v0           #info:Landroid/net/NetworkInfo;
    :cond_0
    :goto_0
    const-string v3, "WifiConnectReceiver"

    if-eqz v1, :cond_2

    const-string v2, " connected"

    :goto_1
    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    return v1

    .line 21
    .restart local v0       #info:Landroid/net/NetworkInfo;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 23
    .end local v0           #info:Landroid/net/NetworkInfo;
    :cond_2
    const-string v2, " disconnected"

    goto :goto_1
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 13
    invoke-direct {p0, p2}, Lcom/bv/wifisync/WifiConnectReceiver;->wifiConnected(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 14
    invoke-static {p1}, Lcom/bv/wifisync/SyncService;->start(Landroid/content/Context;)V

    .line 15
    :cond_0
    return-void
.end method
