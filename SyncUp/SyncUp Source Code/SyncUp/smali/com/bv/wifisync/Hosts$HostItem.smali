.class Lcom/bv/wifisync/Hosts$HostItem;
.super Lcom/bv/wifisync/Hosts$CheckItem;
.source "Hosts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Hosts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HostItem"
.end annotation


# instance fields
.field private final host:Lcom/bv/wifisync/Host;

.field final synthetic this$0:Lcom/bv/wifisync/Hosts;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/Host;)V
    .locals 2
    .parameter
    .parameter "host"

    .prologue
    .line 126
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    .line 127
    iget-object v0, p2, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/Hosts$CheckItem;-><init>(Lcom/bv/wifisync/Hosts;Ljava/lang/String;I)V

    .line 128
    iput-object p2, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    .line 129
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/Hosts$HostItem;)Lcom/bv/wifisync/Host;
    .locals 1
    .parameter

    .prologue
    .line 124
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    return-object v0
.end method


# virtual methods
.method canRun()Z
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method cancel()V
    .locals 2

    .prologue
    .line 178
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$3(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/SyncService;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 179
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$3(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/SyncService;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/SyncService;->cancel(Lcom/bv/wifisync/Host;)V

    .line 180
    :cond_0
    return-void
.end method

.method public edit()V
    .locals 6

    .prologue
    .line 156
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    const-class v1, Lcom/bv/wifisync/AddHost;

    iget-object v2, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts;->access$14(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$ItemsAdapter;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/io/Serializable;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    aput-object v5, v3, v4

    #calls: Lcom/bv/wifisync/Hosts;->showProps(Ljava/lang/Class;I[Ljava/io/Serializable;)V
    invoke-static {v0, v1, v2, v3}, Lcom/bv/wifisync/Hosts;->access$16(Lcom/bv/wifisync/Hosts;Ljava/lang/Class;I[Ljava/io/Serializable;)V

    .line 157
    return-void
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    iget v0, v0, Lcom/bv/wifisync/Host;->id:I

    return v0
.end method

.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v0}, Lcom/bv/wifisync/Hosts;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020004

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    iget-object v0, v0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    iget-object v1, v1, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\\"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    iget-object v1, v1, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected isRunning()Z
    .locals 3

    .prologue
    .line 170
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v1}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 173
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 170
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Job;

    .line 171
    .local v0, job:Lcom/bv/wifisync/Job;
    iget-boolean v2, v0, Lcom/bv/wifisync/Job;->running:Z

    if-eqz v2, :cond_0

    .line 172
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 189
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->shortcutSetupMode:Z
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$11(Lcom/bv/wifisync/Hosts;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    iget v1, v1, Lcom/bv/wifisync/Host;->id:I

    iget-object v2, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    iget-object v2, v2, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    const v3, 0x7f020004

    #calls: Lcom/bv/wifisync/Hosts;->addShortcut(ILjava/lang/String;I)V
    invoke-static {v0, v1, v2, v3}, Lcom/bv/wifisync/Hosts;->access$17(Lcom/bv/wifisync/Hosts;ILjava/lang/String;I)V

    .line 193
    :goto_0
    return-void

    .line 192
    :cond_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/Hosts$CheckItem;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method

.method remove()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Host;->remove(Landroid/content/Context;)V

    .line 144
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$15(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/HostList;

    move-result-object v1

    monitor-enter v1

    .line 145
    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$15(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/HostList;

    move-result-object v0

    iget-object v2, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v0, v2}, Lcom/bv/wifisync/HostList;->remove(Ljava/lang/Object;)Z

    .line 144
    monitor-exit v1

    .line 147
    return-void

    .line 144
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method run()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 162
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v1}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 164
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    const-class v4, Lcom/bv/wifisync/SyncService;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Hosts;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 165
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v2, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    const v3, 0x7f06012f

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 166
    return-void

    .line 162
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Job;

    .line 163
    .local v0, job:Lcom/bv/wifisync/Job;
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$HostItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts;->access$3(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/SyncService;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/SyncService;->runNow(Lcom/bv/wifisync/Job;)V

    goto :goto_0
.end method
