.class Lcom/bv/wifisync/DirBrowser$5$1;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "DirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser$5;->onClick(Landroid/content/DialogInterface;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Lcom/bv/sync/IFile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/DirBrowser$5;

.field private final synthetic val$dialogInterface:Landroid/content/DialogInterface;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser$5;Landroid/app/Activity;Ljava/lang/String;Landroid/content/DialogInterface;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$5$1;->this$1:Lcom/bv/wifisync/DirBrowser$5;

    iput-object p4, p0, Lcom/bv/wifisync/DirBrowser$5$1;->val$dialogInterface:Landroid/content/DialogInterface;

    .line 709
    invoke-direct {p0, p2, p3}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected varargs atBackground([Ljava/lang/String;)Lcom/bv/sync/IFile;
    .locals 2
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 712
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$5$1;->this$1:Lcom/bv/wifisync/DirBrowser$5;

    #getter for: Lcom/bv/wifisync/DirBrowser$5;->this$0:Lcom/bv/wifisync/DirBrowser;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser$5;->access$0(Lcom/bv/wifisync/DirBrowser$5;)Lcom/bv/wifisync/DirBrowser;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser;->access$3(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/sync/IFile;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-interface {v0, v1}, Lcom/bv/sync/IFile;->openFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

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
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$5$1;->atBackground([Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/bv/sync/IFile;)V
    .locals 2
    .parameter "result"

    .prologue
    .line 717
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 718
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$5$1;->error:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    .line 719
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$5$1;->val$dialogInterface:Landroid/content/DialogInterface;

    invoke-interface {v0}, Landroid/content/DialogInterface;->dismiss()V

    .line 720
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser$5$1;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 721
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$5$1;->this$1:Lcom/bv/wifisync/DirBrowser$5;

    #getter for: Lcom/bv/wifisync/DirBrowser$5;->this$0:Lcom/bv/wifisync/DirBrowser;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser$5;->access$0(Lcom/bv/wifisync/DirBrowser$5;)Lcom/bv/wifisync/DirBrowser;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$5$1;->this$1:Lcom/bv/wifisync/DirBrowser$5;

    #getter for: Lcom/bv/wifisync/DirBrowser$5;->this$0:Lcom/bv/wifisync/DirBrowser;
    invoke-static {v1}, Lcom/bv/wifisync/DirBrowser$5;->access$0(Lcom/bv/wifisync/DirBrowser$5;)Lcom/bv/wifisync/DirBrowser;

    move-result-object v1

    iget-object v1, v1, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    invoke-static {v0, p1, v1}, Lcom/bv/wifisync/DirBrowser;->selectDir(Landroid/app/Activity;Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;)V

    .line 723
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/sync/IFile;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$5$1;->onPostExecute(Lcom/bv/sync/IFile;)V

    return-void
.end method
