.class Lcom/bv/wifisync/Hosts$1;
.super Ljava/lang/Object;
.source "Hosts.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Hosts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Hosts;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Hosts;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    .line 847
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 6
    .parameter "className"
    .parameter "binder"

    .prologue
    .line 849
    const-string v2, "Hosts"

    const-string v3, "Service connected"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 851
    :try_start_0
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    check-cast p2, Lcom/bv/wifisync/SyncService$ServiceBinder;

    .end local p2
    invoke-virtual {p2}, Lcom/bv/wifisync/SyncService$ServiceBinder;->getService()Lcom/bv/wifisync/SyncService;

    move-result-object v3

    #setter for: Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;
    invoke-static {v2, v3}, Lcom/bv/wifisync/Hosts;->access$2(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/SyncService;)V

    .line 852
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v3, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;
    invoke-static {v3}, Lcom/bv/wifisync/Hosts;->access$3(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/SyncService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/bv/wifisync/SyncService;->getHosts()Lcom/bv/wifisync/HostList;

    move-result-object v3

    #setter for: Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;
    invoke-static {v2, v3}, Lcom/bv/wifisync/Hosts;->access$4(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/HostList;)V

    .line 853
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    #calls: Lcom/bv/wifisync/Hosts;->readData()V
    invoke-static {v2}, Lcom/bv/wifisync/Hosts;->access$5(Lcom/bv/wifisync/Hosts;)V

    .line 854
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts;->access$3(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/SyncService;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/SyncService;->setUI(Lcom/bv/wifisync/SyncService$Notify;)V

    .line 855
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->checkHostTask:Lcom/bv/wifisync/Hosts$CheckHostTask;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts;->access$6(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$CheckHostTask;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/Hosts$CheckHostTask;->start()V

    .line 856
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    const v3, 0x7f0600f0

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/Hosts;->setTitle(I)V

    .line 857
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->pendingResult:Landroid/content/Intent;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts;->access$7(Lcom/bv/wifisync/Hosts;)Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 858
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v3, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->pendingRequestCode:I
    invoke-static {v3}, Lcom/bv/wifisync/Hosts;->access$8(Lcom/bv/wifisync/Hosts;)I

    move-result v3

    const/4 v4, -0x1

    iget-object v5, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->pendingResult:Landroid/content/Intent;
    invoke-static {v5}, Lcom/bv/wifisync/Hosts;->access$7(Lcom/bv/wifisync/Hosts;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/bv/wifisync/Hosts;->onActivityResult(IILandroid/content/Intent;)V

    .line 859
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v2}, Lcom/bv/wifisync/Hosts;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 860
    .local v1, intent:Landroid/content/Intent;
    if-eqz v1, :cond_1

    .line 861
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    #calls: Lcom/bv/wifisync/Hosts;->handleShortcut(Landroid/content/Intent;)V
    invoke-static {v2, v1}, Lcom/bv/wifisync/Hosts;->access$9(Lcom/bv/wifisync/Hosts;Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 865
    .end local v1           #intent:Landroid/content/Intent;
    :cond_1
    :goto_0
    return-void

    .line 862
    :catch_0
    move-exception v0

    .line 863
    .local v0, e:Ljava/lang/Exception;
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-static {v2, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "className"

    .prologue
    .line 868
    const-string v0, "Hosts"

    const-string v1, "Service disconnected"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 869
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    const/4 v1, 0x0

    #setter for: Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;
    invoke-static {v0, v1}, Lcom/bv/wifisync/Hosts;->access$2(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/SyncService;)V

    .line 870
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$1;->this$0:Lcom/bv/wifisync/Hosts;

    const v1, 0x7f0601a3

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Hosts;->setTitle(I)V

    .line 871
    return-void
.end method
