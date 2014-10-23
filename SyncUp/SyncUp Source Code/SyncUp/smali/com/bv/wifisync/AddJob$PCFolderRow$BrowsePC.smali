.class Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "AddJob.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddJob$PCFolderRow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BrowsePC"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/bv/sync/RemoteFile;",
        ">;"
    }
.end annotation


# instance fields
.field private final position:I

.field final synthetic this$1:Lcom/bv/wifisync/AddJob$PCFolderRow;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddJob$PCFolderRow;I)V
    .locals 2
    .parameter
    .parameter "position"

    .prologue
    .line 138
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->this$1:Lcom/bv/wifisync/AddJob$PCFolderRow;

    .line 139
    #getter for: Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;
    invoke-static {p1}, Lcom/bv/wifisync/AddJob$PCFolderRow;->access$1(Lcom/bv/wifisync/AddJob$PCFolderRow;)Lcom/bv/wifisync/AddJob;

    move-result-object v0

    const-string v1, "BrowsePC"

    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 140
    iput p2, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->position:I

    .line 141
    #setter for: Lcom/bv/wifisync/AddJob$PCFolderRow;->browsePC:Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;
    invoke-static {p1, p0}, Lcom/bv/wifisync/AddJob$PCFolderRow;->access$0(Lcom/bv/wifisync/AddJob$PCFolderRow;Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;)V

    .line 142
    return-void
.end method


# virtual methods
.method protected varargs atBackground([Ljava/lang/Void;)Lcom/bv/sync/RemoteFile;
    .locals 7
    .parameter "arg0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 158
    new-instance v0, Lcom/bv/sync/RemoteFile;

    iget-object v1, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->this$1:Lcom/bv/wifisync/AddJob$PCFolderRow;

    #getter for: Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;
    invoke-static {v1}, Lcom/bv/wifisync/AddJob$PCFolderRow;->access$1(Lcom/bv/wifisync/AddJob$PCFolderRow;)Lcom/bv/wifisync/AddJob;

    move-result-object v1

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v1

    iget-object v1, v1, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    iget-object v1, v1, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->this$1:Lcom/bv/wifisync/AddJob$PCFolderRow;

    #getter for: Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob$PCFolderRow;->access$1(Lcom/bv/wifisync/AddJob$PCFolderRow;)Lcom/bv/wifisync/AddJob;

    move-result-object v2

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    iget-object v2, v2, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    .line 159
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->this$1:Lcom/bv/wifisync/AddJob$PCFolderRow;

    #getter for: Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;
    invoke-static {v3}, Lcom/bv/wifisync/AddJob$PCFolderRow;->access$1(Lcom/bv/wifisync/AddJob$PCFolderRow;)Lcom/bv/wifisync/AddJob;

    move-result-object v3

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v3}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v3

    iget-object v3, v3, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->this$1:Lcom/bv/wifisync/AddJob$PCFolderRow;

    #getter for: Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob$PCFolderRow;->access$1(Lcom/bv/wifisync/AddJob$PCFolderRow;)Lcom/bv/wifisync/AddJob;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/Host;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "smb://"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->this$1:Lcom/bv/wifisync/AddJob$PCFolderRow;

    #getter for: Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;
    invoke-static {v5}, Lcom/bv/wifisync/AddJob$PCFolderRow;->access$1(Lcom/bv/wifisync/AddJob$PCFolderRow;)Lcom/bv/wifisync/AddJob;

    move-result-object v5

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v5}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v5

    iget-object v5, v5, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    iget-object v6, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->this$1:Lcom/bv/wifisync/AddJob$PCFolderRow;

    #getter for: Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;
    invoke-static {v6}, Lcom/bv/wifisync/AddJob$PCFolderRow;->access$1(Lcom/bv/wifisync/AddJob$PCFolderRow;)Lcom/bv/wifisync/AddJob;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/bv/wifisync/Host;->resolveName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 158
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/bv/sync/RemoteFile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
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
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->atBackground([Ljava/lang/Void;)Lcom/bv/sync/RemoteFile;

    move-result-object v0

    return-object v0
.end method

.method protected onCancelled()V
    .locals 2

    .prologue
    .line 164
    invoke-super {p0}, Lcom/bv/wifisync/Utils$ProgressTask;->onCancelled()V

    .line 165
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->this$1:Lcom/bv/wifisync/AddJob$PCFolderRow;

    const/4 v1, 0x0

    #setter for: Lcom/bv/wifisync/AddJob$PCFolderRow;->browsePC:Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;
    invoke-static {v0, v1}, Lcom/bv/wifisync/AddJob$PCFolderRow;->access$0(Lcom/bv/wifisync/AddJob$PCFolderRow;Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;)V

    .line 166
    return-void
.end method

.method protected onPostExecute(Lcom/bv/sync/RemoteFile;)V
    .locals 3
    .parameter "result"

    .prologue
    .line 146
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->this$1:Lcom/bv/wifisync/AddJob$PCFolderRow;

    const/4 v2, 0x0

    #setter for: Lcom/bv/wifisync/AddJob$PCFolderRow;->browsePC:Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;
    invoke-static {v1, v2}, Lcom/bv/wifisync/AddJob$PCFolderRow;->access$0(Lcom/bv/wifisync/AddJob$PCFolderRow;Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;)V

    .line 147
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 148
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->error:Ljava/lang/Throwable;

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 149
    new-instance v0, Lcom/bv/wifisync/DirBrowser$Options;

    invoke-direct {v0}, Lcom/bv/wifisync/DirBrowser$Options;-><init>()V

    .line 150
    .local v0, options:Lcom/bv/wifisync/DirBrowser$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/bv/wifisync/DirBrowser$Options;->showSelection:Z

    .line 151
    iget v1, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->position:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/bv/wifisync/DirBrowser$Options;->requestCode:Ljava/lang/Integer;

    .line 152
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->this$1:Lcom/bv/wifisync/AddJob$PCFolderRow;

    #getter for: Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;
    invoke-static {v1}, Lcom/bv/wifisync/AddJob$PCFolderRow;->access$1(Lcom/bv/wifisync/AddJob$PCFolderRow;)Lcom/bv/wifisync/AddJob;

    move-result-object v1

    invoke-static {v1, p1, v0}, Lcom/bv/wifisync/DirBrowser;->selectDir(Landroid/app/Activity;Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;)V

    .line 154
    .end local v0           #options:Lcom/bv/wifisync/DirBrowser$Options;
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/sync/RemoteFile;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->onPostExecute(Lcom/bv/sync/RemoteFile;)V

    return-void
.end method
