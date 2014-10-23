.class Lcom/bv/wifisync/DirBrowser$8;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnConfirmListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser;->onBackPressed()V
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
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$8;->this$0:Lcom/bv/wifisync/DirBrowser;

    .line 1141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfirm()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1144
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$8;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser;->access$13(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1145
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$8;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser;->access$13(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->cancel(Z)Z

    .line 1146
    :cond_0
    return-void
.end method
