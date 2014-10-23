.class Lcom/bv/wifisync/Mp3Group$PreviewTask;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "Mp3Group.java"

# interfaces
.implements Lcom/bv/sync/ProgressNotification;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Mp3Group;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PreviewTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Ljava/lang/Void;",
        "Lcom/bv/wifisync/Mp3Group$ProgressInfo;",
        "Lcom/bv/sync/IFile;",
        ">;",
        "Lcom/bv/sync/ProgressNotification;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Mp3Group;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Mp3Group;)V
    .locals 1
    .parameter

    .prologue
    .line 103
    iput-object p1, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    .line 104
    const-string v0, "Mp3 Group Preview"

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 105
    return-void
.end method


# virtual methods
.method protected varargs atBackground([Ljava/lang/Void;)Lcom/bv/sync/IFile;
    .locals 3
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->plugin:Lcom/bv/wifisync/Mp3Plugin;
    invoke-static {v1}, Lcom/bv/wifisync/Mp3Group;->access$4(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/Mp3Plugin;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/Mp3Plugin;->isRunnable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 116
    new-instance v1, Ljava/io/IOException;

    const-string v2, "No query"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 117
    :cond_0
    new-instance v0, Lcom/bv/sync/VirtualFile;

    new-instance v1, Lcom/bv/sync/LocalFile;

    iget-object v2, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/Mp3Group;->access$6(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/Job;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/bv/sync/LocalFile;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/bv/sync/VirtualFile;-><init>(Lcom/bv/sync/IFile;)V

    .line 118
    .local v0, result:Lcom/bv/sync/VirtualFile;
    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    iget-object v1, v1, Lcom/bv/wifisync/Mp3Group;->scanner:Lcom/bv/sync/Mp3Scanner;

    iget-object v2, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->plugin:Lcom/bv/wifisync/Mp3Plugin;
    invoke-static {v2}, Lcom/bv/wifisync/Mp3Group;->access$4(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/Mp3Plugin;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    invoke-virtual {v1, v0, v2, p0}, Lcom/bv/sync/Mp3Scanner;->run(Lcom/bv/sync/IFile;Lcom/bv/sync/Mp3Scanner$Options;Lcom/bv/sync/ProgressNotification;)V

    .line 119
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

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Mp3Group$PreviewTask;->atBackground([Ljava/lang/Void;)Lcom/bv/sync/IFile;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/bv/sync/IFile;)V
    .locals 3
    .parameter "result"

    .prologue
    const/4 v2, 0x0

    .line 140
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 141
    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Mp3Group;->setProgressVisible(Z)V

    .line 142
    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->canceled:Z
    invoke-static {v1}, Lcom/bv/wifisync/Mp3Group;->access$7(Lcom/bv/wifisync/Mp3Group;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->error:Ljava/lang/Throwable;

    if-nez v1, :cond_0

    .line 143
    new-instance v0, Lcom/bv/wifisync/DirBrowser$Options;

    invoke-direct {v0}, Lcom/bv/wifisync/DirBrowser$Options;-><init>()V

    .line 144
    .local v0, options:Lcom/bv/wifisync/DirBrowser$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/bv/wifisync/DirBrowser$Options;->readOnly:Z

    .line 145
    iput-boolean v2, v0, Lcom/bv/wifisync/DirBrowser$Options;->showButton:Z

    .line 146
    iput-boolean v2, v0, Lcom/bv/wifisync/DirBrowser$Options;->showSelection:Z

    .line 147
    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    invoke-static {v1, p1, v0}, Lcom/bv/wifisync/DirBrowser;->selectDir(Landroid/app/Activity;Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;)V

    .line 149
    .end local v0           #options:Lcom/bv/wifisync/DirBrowser$Options;
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/sync/IFile;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Mp3Group$PreviewTask;->onPostExecute(Lcom/bv/sync/IFile;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 109
    invoke-super {p0}, Lcom/bv/wifisync/Utils$ProgressTask;->onPreExecute()V

    .line 110
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Mp3Group;->setProgressVisible(Z)V

    .line 111
    return-void
.end method

.method protected varargs onProgressUpdate([Lcom/bv/wifisync/Mp3Group$ProgressInfo;)V
    .locals 7
    .parameter "values"

    .prologue
    const/4 v6, 0x0

    .line 133
    aget-object v0, p1, v6

    .line 134
    .local v0, progress:Lcom/bv/wifisync/Mp3Group$ProgressInfo;
    iget-object v2, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    const v3, 0x7f06016d

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget v5, v0, Lcom/bv/wifisync/Mp3Group$ProgressInfo;->percent:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    const/4 v5, 0x1

    iget-object v6, v0, Lcom/bv/wifisync/Mp3Group$ProgressInfo;->name:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/Mp3Group;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 135
    .local v1, title:Ljava/lang/String;
    iget-object v2, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    iget v3, v0, Lcom/bv/wifisync/Mp3Group$ProgressInfo;->percent:I

    invoke-virtual {v2, v3, v1}, Lcom/bv/wifisync/Mp3Group;->setProgress(ILjava/lang/String;)V

    .line 136
    return-void
.end method

.method protected bridge varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, [Lcom/bv/wifisync/Mp3Group$ProgressInfo;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Mp3Group$PreviewTask;->onProgressUpdate([Lcom/bv/wifisync/Mp3Group$ProgressInfo;)V

    return-void
.end method

.method public update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z
    .locals 5
    .parameter "action"
    .parameter "percent"
    .parameter "file"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 124
    new-instance v0, Lcom/bv/wifisync/Mp3Group$ProgressInfo;

    iget-object v3, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4}, Lcom/bv/wifisync/Mp3Group$ProgressInfo;-><init>(Lcom/bv/wifisync/Mp3Group;Lcom/bv/wifisync/Mp3Group$ProgressInfo;)V

    .line 125
    .local v0, progress:Lcom/bv/wifisync/Mp3Group$ProgressInfo;
    iput p2, v0, Lcom/bv/wifisync/Mp3Group$ProgressInfo;->percent:I

    .line 126
    invoke-interface {p3}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/bv/wifisync/Mp3Group$ProgressInfo;->name:Ljava/lang/String;

    .line 127
    new-array v3, v2, [Lcom/bv/wifisync/Mp3Group$ProgressInfo;

    aput-object v0, v3, v1

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/Mp3Group$PreviewTask;->publishProgress([Ljava/lang/Object;)V

    .line 128
    iget-object v3, p0, Lcom/bv/wifisync/Mp3Group$PreviewTask;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->canceled:Z
    invoke-static {v3}, Lcom/bv/wifisync/Mp3Group;->access$7(Lcom/bv/wifisync/Mp3Group;)Z

    move-result v3

    if-eqz v3, :cond_0

    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method
