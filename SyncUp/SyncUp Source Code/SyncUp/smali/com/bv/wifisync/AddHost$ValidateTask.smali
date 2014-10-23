.class Lcom/bv/wifisync/AddHost$ValidateTask;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "AddHost.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddHost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ValidateTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddHost;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddHost;)V
    .locals 1
    .parameter

    .prologue
    .line 65
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    .line 66
    const-string v0, "HostValidator"

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 67
    return-void
.end method


# virtual methods
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
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddHost$ValidateTask;->atBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs atBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 6
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 71
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v2, "smb://"

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->newHost:Z
    invoke-static {v2}, Lcom/bv/wifisync/AddHost;->access$3(Lcom/bv/wifisync/AddHost;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v2}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/Host;->getIp()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 72
    .local v1, url:Ljava/lang/String;
    new-instance v0, Lcom/bv/sync/RemoteFile;

    iget-object v2, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v2}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    iget-object v3, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v3}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v3

    iget-object v3, v3, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    iget-object v4, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v4}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v4

    iget-object v5, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/Host;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v2, v3, v4, v1}, Lcom/bv/sync/RemoteFile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .local v0, file:Lcom/bv/sync/RemoteFile;
    invoke-virtual {v0}, Lcom/bv/sync/RemoteFile;->listFiles()[Lcom/bv/sync/IFile;

    .line 74
    const/4 v2, 0x0

    return-object v2

    .line 71
    .end local v0           #file:Lcom/bv/sync/RemoteFile;
    .end local v1           #url:Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v2}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v2

    iget-object v4, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-virtual {v2, v4}, Lcom/bv/wifisync/Host;->resolveName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddHost$ValidateTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 3
    .parameter "result"

    .prologue
    .line 79
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 80
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->error:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 81
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    #calls: Lcom/bv/wifisync/AddHost;->setHelp()V
    invoke-static {v1}, Lcom/bv/wifisync/AddHost;->access$5(Lcom/bv/wifisync/AddHost;)V

    .line 82
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    const/4 v2, 0x0

    #setter for: Lcom/bv/wifisync/AddHost;->validateTask:Lcom/bv/wifisync/AddHost$ValidateTask;
    invoke-static {v1, v2}, Lcom/bv/wifisync/AddHost;->access$6(Lcom/bv/wifisync/AddHost;Lcom/bv/wifisync/AddHost$ValidateTask;)V

    .line 83
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->error:Ljava/lang/Throwable;

    if-nez v1, :cond_2

    .line 84
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 85
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v1}, Lcom/bv/wifisync/AddHost;->access$7(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/PropertiesAdapter;->dispatchGoogleAnalytics(Landroid/app/Activity;)V

    .line 86
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 87
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v2}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 88
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Lcom/bv/wifisync/AddHost;->setResult(ILandroid/content/Intent;)V

    .line 89
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$ValidateTask;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-virtual {v1}, Lcom/bv/wifisync/AddHost;->finish()V

    .line 91
    .end local v0           #intent:Landroid/content/Intent;
    :cond_2
    return-void
.end method
