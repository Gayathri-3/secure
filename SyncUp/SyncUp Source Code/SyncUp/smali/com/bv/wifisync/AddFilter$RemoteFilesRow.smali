.class abstract Lcom/bv/wifisync/AddFilter$RemoteFilesRow;
.super Lcom/bv/wifisync/AddFilter$FilesRow;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "RemoteFilesRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;)V
    .locals 1
    .parameter

    .prologue
    .line 318
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$RemoteFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    .line 319
    const v0, 0x7f06018a

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/AddFilter$FilesRow;-><init>(Lcom/bv/wifisync/AddFilter;I)V

    .line 320
    return-void
.end method


# virtual methods
.method protected getEnabled()Z
    .locals 1

    .prologue
    .line 346
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$RemoteFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 324
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$RemoteFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddFilter;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020004

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getRootDir()Lcom/bv/sync/IFile;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 341
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$RemoteFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$RemoteFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Job;->getRemoteFolder(Landroid/content/Context;)Lcom/bv/sync/RemoteFile;

    move-result-object v0

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 330
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$RemoteFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 331
    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$RemoteFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 332
    new-instance v1, Ljava/io/IOException;

    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$RemoteFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    const v3, 0x7f06018c

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddFilter;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 334
    :catch_0
    move-exception v0

    .line 335
    .local v0, e:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$RemoteFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 337
    .end local v0           #e:Ljava/lang/Exception;
    :goto_0
    return-void

    .line 333
    :cond_0
    :try_start_1
    invoke-super {p0, p1}, Lcom/bv/wifisync/AddFilter$FilesRow;->onClick(Landroid/view/View;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
