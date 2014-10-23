.class public Lcom/bv/wifisync/Autostart;
.super Landroid/content/BroadcastReceiver;
.source "Autostart.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "arg1"

    .prologue
    .line 10
    const-string v0, "Autostart"

    const-string v1, "Started"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    invoke-static {p1}, Lcom/bv/wifisync/SyncService;->start(Landroid/content/Context;)V

    .line 12
    return-void
.end method
