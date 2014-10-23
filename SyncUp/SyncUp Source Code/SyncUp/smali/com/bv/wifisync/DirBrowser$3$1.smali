.class Lcom/bv/wifisync/DirBrowser$3$1;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "DirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser$3;->onClick(Landroid/content/DialogInterface;)Z
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
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/DirBrowser$3;

.field private final synthetic val$selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser$3;Landroid/app/Activity;Ljava/lang/String;Lcom/bv/wifisync/DirBrowser$FileInfo;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$3$1;->this$1:Lcom/bv/wifisync/DirBrowser$3;

    iput-object p4, p0, Lcom/bv/wifisync/DirBrowser$3$1;->val$selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;

    .line 364
    invoke-direct {p0, p2, p3}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

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
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$3$1;->atBackground([Ljava/lang/String;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs atBackground([Ljava/lang/String;)Ljava/lang/Void;
    .locals 3
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 367
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$3$1;->val$selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;

    iget-object v1, v1, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getParent()Lcom/bv/sync/IFile;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-interface {v1, v2}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 368
    .local v0, file:Lcom/bv/sync/IFile;
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$3$1;->val$selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;

    iget-object v1, v1, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v1, v0}, Lcom/bv/sync/IFile;->renameTo(Lcom/bv/sync/IFile;)V

    .line 369
    const/4 v1, 0x0

    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$3$1;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2
    .parameter "result"

    .prologue
    .line 373
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 374
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$3$1;->error:Ljava/lang/Throwable;

    if-nez v0, :cond_1

    .line 375
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser$3$1;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 376
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$3$1;->this$1:Lcom/bv/wifisync/DirBrowser$3;

    #getter for: Lcom/bv/wifisync/DirBrowser$3;->this$0:Lcom/bv/wifisync/DirBrowser;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser$3;->access$0(Lcom/bv/wifisync/DirBrowser$3;)Lcom/bv/wifisync/DirBrowser;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->refresh()V

    .line 380
    :cond_0
    :goto_0
    return-void

    .line 378
    :cond_1
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$3$1;->this$1:Lcom/bv/wifisync/DirBrowser$3;

    #getter for: Lcom/bv/wifisync/DirBrowser$3;->this$0:Lcom/bv/wifisync/DirBrowser;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser$3;->access$0(Lcom/bv/wifisync/DirBrowser$3;)Lcom/bv/wifisync/DirBrowser;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$3$1;->error:Ljava/lang/Throwable;

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
