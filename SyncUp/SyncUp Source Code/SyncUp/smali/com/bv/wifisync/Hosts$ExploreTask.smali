.class Lcom/bv/wifisync/Hosts$ExploreTask;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "Hosts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Hosts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExploreTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Lcom/bv/wifisync/Host;",
        "Ljava/lang/Void;",
        "Lcom/bv/sync/RemoteFile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Hosts;


# direct methods
.method public constructor <init>(Lcom/bv/wifisync/Hosts;)V
    .locals 1
    .parameter

    .prologue
    .line 619
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$ExploreTask;->this$0:Lcom/bv/wifisync/Hosts;

    .line 620
    const-string v0, "Explore"

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 621
    return-void
.end method


# virtual methods
.method protected varargs atBackground([Lcom/bv/wifisync/Host;)Lcom/bv/sync/RemoteFile;
    .locals 7
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 625
    const/4 v1, 0x0

    aget-object v0, p1, v1

    .line 626
    .local v0, host:Lcom/bv/wifisync/Host;
    new-instance v1, Lcom/bv/sync/RemoteFile;

    iget-object v2, v0, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    iget-object v3, v0, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    iget-object v4, p0, Lcom/bv/wifisync/Hosts$ExploreTask;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v0, v4}, Lcom/bv/wifisync/Host;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 627
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "smb://"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/bv/wifisync/Hosts$ExploreTask;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v0, v6}, Lcom/bv/wifisync/Host;->resolveName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 626
    invoke-direct {v1, v2, v3, v4, v5}, Lcom/bv/sync/RemoteFile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method protected bridge varargs synthetic atBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    check-cast p1, [Lcom/bv/wifisync/Host;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Hosts$ExploreTask;->atBackground([Lcom/bv/wifisync/Host;)Lcom/bv/sync/RemoteFile;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/bv/sync/RemoteFile;)V
    .locals 4
    .parameter "result"

    .prologue
    .line 632
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 633
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$ExploreTask;->error:Ljava/lang/Throwable;

    if-nez v2, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts$ExploreTask;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_0

    .line 634
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/bv/wifisync/Hosts$ExploreTask;->this$0:Lcom/bv/wifisync/Hosts;

    const-class v3, Lcom/bv/wifisync/DirBrowser;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 635
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "RESULT"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 636
    new-instance v1, Lcom/bv/wifisync/DirBrowser$Options;

    invoke-direct {v1}, Lcom/bv/wifisync/DirBrowser$Options;-><init>()V

    .line 637
    .local v1, options:Lcom/bv/wifisync/DirBrowser$Options;
    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/bv/wifisync/DirBrowser$Options;->showButton:Z

    .line 638
    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/bv/wifisync/DirBrowser$Options;->showSelection:Z

    .line 639
    const-string v2, "options"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 640
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$ExploreTask;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/Hosts;->startActivity(Landroid/content/Intent;)V

    .line 642
    .end local v0           #intent:Landroid/content/Intent;
    .end local v1           #options:Lcom/bv/wifisync/DirBrowser$Options;
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/sync/RemoteFile;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Hosts$ExploreTask;->onPostExecute(Lcom/bv/sync/RemoteFile;)V

    return-void
.end method
