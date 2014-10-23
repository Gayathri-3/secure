.class abstract Lcom/bv/wifisync/AddFilter$LocalFilesRow;
.super Lcom/bv/wifisync/AddFilter$FilesRow;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "LocalFilesRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;)V
    .locals 1
    .parameter

    .prologue
    .line 261
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$LocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    .line 262
    const v0, 0x7f060189

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/AddFilter$FilesRow;-><init>(Lcom/bv/wifisync/AddFilter;I)V

    .line 263
    return-void
.end method


# virtual methods
.method protected getEnabled()Z
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$LocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

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
    .line 267
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$LocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddFilter;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02001f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getRootDir()Lcom/bv/sync/IFile;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$LocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$LocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Job;->getLocalFolder(Landroid/content/Context;)Lcom/bv/sync/LocalFile;

    move-result-object v0

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 277
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$LocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 278
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$LocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$LocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    const v2, 0x7f06018b

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddFilter;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 281
    :goto_0
    return-void

    .line 280
    :cond_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/AddFilter$FilesRow;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method
