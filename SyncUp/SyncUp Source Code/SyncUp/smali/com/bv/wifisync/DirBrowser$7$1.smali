.class Lcom/bv/wifisync/DirBrowser$7$1;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "DirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser$7;->onClick(Landroid/content/DialogInterface;)Z
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
.field final synthetic this$1:Lcom/bv/wifisync/DirBrowser$7;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser$7;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$7$1;->this$1:Lcom/bv/wifisync/DirBrowser$7;

    .line 808
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

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$7$1;->atBackground([Ljava/lang/String;)Ljava/lang/Void;

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
    .line 811
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$7$1;->this$1:Lcom/bv/wifisync/DirBrowser$7;

    #getter for: Lcom/bv/wifisync/DirBrowser$7;->this$0:Lcom/bv/wifisync/DirBrowser;
    invoke-static {v1}, Lcom/bv/wifisync/DirBrowser$7;->access$0(Lcom/bv/wifisync/DirBrowser$7;)Lcom/bv/wifisync/DirBrowser;

    move-result-object v1

    #getter for: Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;
    invoke-static {v1}, Lcom/bv/wifisync/DirBrowser;->access$3(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/sync/IFile;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-interface {v1, v2}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 812
    .local v0, newDir:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->mkdir()V

    .line 813
    const/4 v1, 0x0

    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$7$1;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 1
    .parameter "result"

    .prologue
    .line 817
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 818
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$7$1;->error:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    .line 819
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$7$1;->this$1:Lcom/bv/wifisync/DirBrowser$7;

    #getter for: Lcom/bv/wifisync/DirBrowser$7;->this$0:Lcom/bv/wifisync/DirBrowser;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser$7;->access$0(Lcom/bv/wifisync/DirBrowser$7;)Lcom/bv/wifisync/DirBrowser;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->refresh()V

    .line 820
    :cond_0
    return-void
.end method
