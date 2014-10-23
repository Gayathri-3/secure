.class Lcom/bv/wifisync/Hosts$CheckHostTask$1;
.super Landroid/content/BroadcastReceiver;
.source "Hosts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Hosts$CheckHostTask;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/Hosts$CheckHostTask;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Hosts$CheckHostTask;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$CheckHostTask$1;->this$1:Lcom/bv/wifisync/Hosts$CheckHostTask;

    .line 905
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 908
    if-eqz p2, :cond_0

    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 909
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckHostTask$1;->this$1:Lcom/bv/wifisync/Hosts$CheckHostTask;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    #setter for: Lcom/bv/wifisync/Hosts$CheckHostTask;->lastReconnect:J
    invoke-static {v0, v1, v2}, Lcom/bv/wifisync/Hosts$CheckHostTask;->access$0(Lcom/bv/wifisync/Hosts$CheckHostTask;J)V

    .line 910
    :cond_0
    return-void
.end method
