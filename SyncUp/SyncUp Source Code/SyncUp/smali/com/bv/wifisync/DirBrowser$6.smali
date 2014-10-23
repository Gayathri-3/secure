.class Lcom/bv/wifisync/DirBrowser$6;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnConfirmListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser;->deleteSelected()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$6;->this$0:Lcom/bv/wifisync/DirBrowser;

    .line 732
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfirm()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 735
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$6;->this$0:Lcom/bv/wifisync/DirBrowser;

    #calls: Lcom/bv/wifisync/DirBrowser;->getSelectedInfos()Ljava/util/List;
    invoke-static {v2}, Lcom/bv/wifisync/DirBrowser;->access$14(Lcom/bv/wifisync/DirBrowser;)Ljava/util/List;

    move-result-object v1

    .line 736
    .local v1, selected:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/DirBrowser$FileInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v0, v2, [Lcom/bv/wifisync/DirBrowser$FileInfo;

    .line 737
    .local v0, array:[Lcom/bv/wifisync/DirBrowser$FileInfo;
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$6;->this$0:Lcom/bv/wifisync/DirBrowser;

    new-instance v3, Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$6;->this$0:Lcom/bv/wifisync/DirBrowser;

    sget-object v5, Lcom/bv/wifisync/DirBrowser$Type;->Delete:Lcom/bv/wifisync/DirBrowser$Type;

    invoke-direct {v3, v4, v5}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$Type;)V

    #setter for: Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;
    invoke-static {v2, v3}, Lcom/bv/wifisync/DirBrowser;->access$5(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$FileManagementTask;)V

    .line 738
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$6;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;
    invoke-static {v2}, Lcom/bv/wifisync/DirBrowser;->access$13(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    move-result-object v3

    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/bv/wifisync/DirBrowser$FileInfo;

    invoke-virtual {v3, v2}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->run([Ljava/lang/Object;)V

    .line 739
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$6;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v3, p0, Lcom/bv/wifisync/DirBrowser$6;->this$0:Lcom/bv/wifisync/DirBrowser;

    const v4, 0x7f06010d

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 740
    return-void
.end method
