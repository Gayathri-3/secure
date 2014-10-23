.class Lcom/bv/wifisync/DirBrowser$4;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnConfirmListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser;->deleteSelectedItem(Lcom/bv/wifisync/DirBrowser$FileInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;

.field private final synthetic val$selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$FileInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$4;->this$0:Lcom/bv/wifisync/DirBrowser;

    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$4;->val$selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;

    .line 406
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfirm()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 409
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$4;->this$0:Lcom/bv/wifisync/DirBrowser;

    new-instance v1, Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$4;->this$0:Lcom/bv/wifisync/DirBrowser;

    sget-object v3, Lcom/bv/wifisync/DirBrowser$Type;->Delete:Lcom/bv/wifisync/DirBrowser$Type;

    invoke-direct {v1, v2, v3}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$Type;)V

    #setter for: Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;
    invoke-static {v0, v1}, Lcom/bv/wifisync/DirBrowser;->access$5(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$FileManagementTask;)V

    .line 410
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$4;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser;->access$13(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/bv/wifisync/DirBrowser$FileInfo;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/bv/wifisync/DirBrowser$4;->val$selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->run([Ljava/lang/Object;)V

    .line 411
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$4;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$4;->this$0:Lcom/bv/wifisync/DirBrowser;

    const v2, 0x7f06010d

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 412
    return-void
.end method
