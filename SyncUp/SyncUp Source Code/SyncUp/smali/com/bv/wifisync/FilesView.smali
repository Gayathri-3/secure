.class public Lcom/bv/wifisync/FilesView;
.super Lcom/bv/wifisync/BrowseActivity;
.source "FilesView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/FilesView$ItemRow;
    }
.end annotation


# static fields
.field private static final IMAGE_TOP_PADDING:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onButtonClick(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 82
    return-void
.end method

.method public bridge synthetic onClick(Landroid/view/View;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onClick(Landroid/view/View;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter "savedInstanceState"

    .prologue
    .line 49
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 50
    const v6, 0x7f060161

    invoke-virtual {p0, v6}, Lcom/bv/wifisync/FilesView;->setTitle(I)V

    .line 51
    iget-object v6, p0, Lcom/bv/wifisync/FilesView;->buttonOk:Landroid/widget/Button;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 52
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .local v5, rows:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/FilesView$ItemRow;>;"
    :try_start_0
    invoke-virtual {p0}, Lcom/bv/wifisync/FilesView;->getData()Ljava/io/Serializable;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    .line 55
    .local v4, path:Ljava/io/File;
    invoke-static {v4}, Lcom/bv/wifisync/SyncFile;->read(Ljava/io/File;)Ljava/util/List;

    move-result-object v3

    .line 57
    .local v3, list:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/SyncFile;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    if-nez v7, :cond_0

    .line 62
    .end local v3           #list:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/SyncFile;>;"
    .end local v4           #path:Ljava/io/File;
    :goto_1
    new-instance v0, Lcom/bv/wifisync/FilesView$1;

    invoke-direct {v0, p0, p0, v5}, Lcom/bv/wifisync/FilesView$1;-><init>(Lcom/bv/wifisync/FilesView;Landroid/content/Context;Ljava/util/List;)V

    .line 77
    .local v0, adapter:Lcom/bv/wifisync/PropertiesAdapter;,"Lcom/bv/wifisync/PropertiesAdapter<Lcom/bv/wifisync/FilesView$ItemRow;>;"
    invoke-virtual {p0, v0}, Lcom/bv/wifisync/FilesView;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 78
    const v6, 0x7f0600e0

    invoke-virtual {p0, v6}, Lcom/bv/wifisync/FilesView;->setHelp(I)V

    .line 79
    return-void

    .line 57
    .end local v0           #adapter:Lcom/bv/wifisync/PropertiesAdapter;,"Lcom/bv/wifisync/PropertiesAdapter<Lcom/bv/wifisync/FilesView$ItemRow;>;"
    .restart local v3       #list:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/SyncFile;>;"
    .restart local v4       #path:Ljava/io/File;
    :cond_0
    :try_start_1
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/SyncFile;

    .line 58
    .local v2, file:Lcom/bv/wifisync/SyncFile;
    new-instance v7, Lcom/bv/wifisync/FilesView$ItemRow;

    invoke-direct {v7, p0, v2}, Lcom/bv/wifisync/FilesView$ItemRow;-><init>(Lcom/bv/wifisync/FilesView;Lcom/bv/wifisync/SyncFile;)V

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 59
    .end local v2           #file:Lcom/bv/wifisync/SyncFile;
    .end local v3           #list:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/SyncFile;>;"
    .end local v4           #path:Ljava/io/File;
    :catch_0
    move-exception v1

    .line 60
    .local v1, e:Ljava/lang/Exception;
    invoke-static {p0, v1}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public bridge synthetic onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic setProgress(ILjava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1, p2}, Lcom/bv/wifisync/BrowseActivity;->setProgress(ILjava/lang/String;)V

    return-void
.end method
