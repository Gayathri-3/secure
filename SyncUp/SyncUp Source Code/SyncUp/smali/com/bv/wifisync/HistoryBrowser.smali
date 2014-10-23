.class public Lcom/bv/wifisync/HistoryBrowser;
.super Lcom/bv/wifisync/BrowseActivity;
.source "HistoryBrowser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/HistoryBrowser$ClickableHistoryRow;,
        Lcom/bv/wifisync/HistoryBrowser$HistoryRow;
    }
.end annotation


# instance fields
.field private adapter:Lcom/bv/wifisync/PropertiesAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bv/wifisync/PropertiesAdapter",
            "<",
            "Lcom/bv/wifisync/HistoryBrowser$HistoryRow;",
            ">;"
        }
    .end annotation
.end field

.field private job:Lcom/bv/wifisync/Job;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    return-void
.end method

.method private copyText(Lcom/bv/wifisync/HistoryBrowser$HistoryRow;)V
    .locals 3
    .parameter "selectedItem"

    .prologue
    .line 140
    invoke-virtual {p1}, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    .line 141
    .local v1, text:Landroid/text/Spanned;
    const-string v2, "clipboard"

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/HistoryBrowser;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 142
    .local v0, clipBoard:Landroid/text/ClipboardManager;
    invoke-virtual {v0, v1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 143
    return-void
.end method

.method private getHistoryRow(Lcom/bv/wifisync/Job$HistoryItem;)Lcom/bv/wifisync/HistoryBrowser$HistoryRow;
    .locals 2
    .parameter "item"

    .prologue
    .line 108
    iget v1, p1, Lcom/bv/wifisync/Job$HistoryItem;->localFileCount:I

    if-nez v1, :cond_0

    iget v1, p1, Lcom/bv/wifisync/Job$HistoryItem;->remoteFilesCount:I

    if-nez v1, :cond_0

    iget v1, p1, Lcom/bv/wifisync/Job$HistoryItem;->deletedFilesCount:I

    if-nez v1, :cond_0

    iget-object v1, p1, Lcom/bv/wifisync/Job$HistoryItem;->error:Ljava/lang/String;

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 109
    .local v0, notClickable:Z
    :goto_0
    if-eqz v0, :cond_1

    new-instance v1, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;

    invoke-direct {v1, p0, p1}, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;-><init>(Lcom/bv/wifisync/HistoryBrowser;Lcom/bv/wifisync/Job$HistoryItem;)V

    :goto_1
    return-object v1

    .line 108
    .end local v0           #notClickable:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 109
    .restart local v0       #notClickable:Z
    :cond_1
    new-instance v1, Lcom/bv/wifisync/HistoryBrowser$ClickableHistoryRow;

    invoke-direct {v1, p0, p1}, Lcom/bv/wifisync/HistoryBrowser$ClickableHistoryRow;-><init>(Lcom/bv/wifisync/HistoryBrowser;Lcom/bv/wifisync/Job$HistoryItem;)V

    goto :goto_1
.end method


# virtual methods
.method public onButtonClick(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 173
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

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 8
    .parameter "item"

    .prologue
    const/4 v5, 0x1

    .line 116
    :try_start_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 117
    .local v0, info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    iget-object v6, p0, Lcom/bv/wifisync/HistoryBrowser;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    iget v7, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v6, v7}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;

    .line 119
    .local v3, selectedItem:Lcom/bv/wifisync/HistoryBrowser$HistoryRow;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    const v7, 0x7f0a001e

    if-ne v6, v7, :cond_0

    .line 120
    #getter for: Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;
    invoke-static {v3}, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->access$0(Lcom/bv/wifisync/HistoryBrowser$HistoryRow;)Lcom/bv/wifisync/Job$HistoryItem;

    move-result-object v6

    invoke-virtual {v6}, Lcom/bv/wifisync/Job$HistoryItem;->getLocalFilesPath()Ljava/io/File;

    move-result-object v2

    .line 130
    .local v2, param:Ljava/io/File;
    :goto_0
    new-instance v1, Landroid/content/Intent;

    const-class v6, Lcom/bv/wifisync/FilesView;

    invoke-direct {v1, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 131
    .local v1, intent:Landroid/content/Intent;
    const-string v6, "RESULT"

    invoke-virtual {v1, v6, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 132
    invoke-virtual {p0, v1}, Lcom/bv/wifisync/HistoryBrowser;->startActivity(Landroid/content/Intent;)V

    .line 136
    .end local v0           #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .end local v1           #intent:Landroid/content/Intent;
    .end local v2           #param:Ljava/io/File;
    .end local v3           #selectedItem:Lcom/bv/wifisync/HistoryBrowser$HistoryRow;
    :goto_1
    return v5

    .line 121
    .restart local v0       #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .restart local v3       #selectedItem:Lcom/bv/wifisync/HistoryBrowser$HistoryRow;
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    const v7, 0x7f0a001f

    if-ne v6, v7, :cond_1

    .line 122
    #getter for: Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;
    invoke-static {v3}, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->access$0(Lcom/bv/wifisync/HistoryBrowser$HistoryRow;)Lcom/bv/wifisync/Job$HistoryItem;

    move-result-object v6

    invoke-virtual {v6}, Lcom/bv/wifisync/Job$HistoryItem;->getRemoteFilesPath()Ljava/io/File;

    move-result-object v2

    .line 123
    .restart local v2       #param:Ljava/io/File;
    goto :goto_0

    .end local v2           #param:Ljava/io/File;
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    const v7, 0x7f0a0020

    if-ne v6, v7, :cond_2

    .line 124
    #getter for: Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;
    invoke-static {v3}, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->access$0(Lcom/bv/wifisync/HistoryBrowser$HistoryRow;)Lcom/bv/wifisync/Job$HistoryItem;

    move-result-object v6

    invoke-virtual {v6}, Lcom/bv/wifisync/Job$HistoryItem;->getDeletedFilesPath()Ljava/io/File;

    move-result-object v2

    .line 125
    .restart local v2       #param:Ljava/io/File;
    goto :goto_0

    .end local v2           #param:Ljava/io/File;
    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    const v7, 0x7f0a0021

    if-ne v6, v7, :cond_3

    .line 126
    invoke-direct {p0, v3}, Lcom/bv/wifisync/HistoryBrowser;->copyText(Lcom/bv/wifisync/HistoryBrowser$HistoryRow;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 133
    .end local v0           #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .end local v3           #selectedItem:Lcom/bv/wifisync/HistoryBrowser$HistoryRow;
    :catch_0
    move-exception v4

    .line 134
    .local v4, t:Ljava/lang/Throwable;
    invoke-static {p0, v4}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 129
    .end local v4           #t:Ljava/lang/Throwable;
    .restart local v0       #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .restart local v3       #selectedItem:Lcom/bv/wifisync/HistoryBrowser$HistoryRow;
    :cond_3
    :try_start_1
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result v5

    goto :goto_1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    .line 76
    const/4 v3, 0x6

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/HistoryBrowser;->requestWindowFeature(I)Z

    .line 77
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 78
    invoke-virtual {p0}, Lcom/bv/wifisync/HistoryBrowser;->getData()Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Lcom/bv/wifisync/Job;

    iput-object v3, p0, Lcom/bv/wifisync/HistoryBrowser;->job:Lcom/bv/wifisync/Job;

    .line 79
    const v3, 0x7f060126

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/HistoryBrowser;->setTitle(I)V

    .line 80
    const v3, 0x7f0600d8

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/HistoryBrowser;->setHelp(I)V

    .line 81
    iget-object v3, p0, Lcom/bv/wifisync/HistoryBrowser;->buttonOk:Landroid/widget/Button;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 82
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v1, historyRows:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/HistoryBrowser$HistoryRow;>;"
    iget-object v3, p0, Lcom/bv/wifisync/HistoryBrowser;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v3}, Lcom/bv/wifisync/Job;->getHistory()Ljava/util/List;

    move-result-object v0

    .line 84
    .local v0, history:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Job$HistoryItem;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v0, v3}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v2

    .line 85
    .local v2, iter:Ljava/util/ListIterator;,"Ljava/util/ListIterator<Lcom/bv/wifisync/Job$HistoryItem;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v3

    if-nez v3, :cond_0

    .line 88
    new-instance v3, Lcom/bv/wifisync/HistoryBrowser$1;

    invoke-direct {v3, p0, p0, v1}, Lcom/bv/wifisync/HistoryBrowser$1;-><init>(Lcom/bv/wifisync/HistoryBrowser;Landroid/content/Context;Ljava/util/List;)V

    iput-object v3, p0, Lcom/bv/wifisync/HistoryBrowser;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    .line 101
    iget-object v3, p0, Lcom/bv/wifisync/HistoryBrowser;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/HistoryBrowser;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 102
    invoke-virtual {p0}, Lcom/bv/wifisync/HistoryBrowser;->getListView()Landroid/widget/ListView;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/HistoryBrowser;->registerForContextMenu(Landroid/view/View;)V

    .line 103
    invoke-virtual {p0}, Lcom/bv/wifisync/HistoryBrowser;->getListView()Landroid/widget/ListView;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/widget/ListView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 104
    invoke-virtual {p0}, Lcom/bv/wifisync/HistoryBrowser;->getListView()Landroid/widget/ListView;

    move-result-object v3

    const/4 v4, 0x5

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 105
    return-void

    .line 86
    :cond_0
    invoke-interface {v2}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bv/wifisync/Job$HistoryItem;

    invoke-direct {p0, v3}, Lcom/bv/wifisync/HistoryBrowser;->getHistoryRow(Lcom/bv/wifisync/Job$HistoryItem;)Lcom/bv/wifisync/HistoryBrowser$HistoryRow;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 13
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo"

    .prologue
    .line 148
    invoke-super/range {p0 .. p3}, Lcom/bv/wifisync/BrowseActivity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    move-object/from16 v1, p3

    .line 149
    check-cast v1, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 150
    .local v1, info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    iget-object v11, p0, Lcom/bv/wifisync/HistoryBrowser;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    iget v12, v1, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v11, v12}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;

    .line 151
    .local v3, selectedItem:Lcom/bv/wifisync/HistoryBrowser$HistoryRow;
    #getter for: Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;
    invoke-static {v3}, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->access$0(Lcom/bv/wifisync/HistoryBrowser$HistoryRow;)Lcom/bv/wifisync/Job$HistoryItem;

    move-result-object v2

    .line 152
    .local v2, item:Lcom/bv/wifisync/Job$HistoryItem;
    iget v11, v2, Lcom/bv/wifisync/Job$HistoryItem;->localFileCount:I

    if-lez v11, :cond_1

    const/4 v5, 0x1

    .line 153
    .local v5, showLocalFiles:Z
    :goto_0
    iget v11, v2, Lcom/bv/wifisync/Job$HistoryItem;->remoteFilesCount:I

    if-lez v11, :cond_2

    const/4 v7, 0x1

    .line 154
    .local v7, showRemoteFiles:Z
    :goto_1
    iget v11, v2, Lcom/bv/wifisync/Job$HistoryItem;->deletedFilesCount:I

    if-lez v11, :cond_3

    const/4 v4, 0x1

    .line 155
    .local v4, showDeletedFiles:Z
    :goto_2
    iget-object v11, v2, Lcom/bv/wifisync/Job$HistoryItem;->error:Ljava/lang/String;

    if-eqz v11, :cond_4

    const/4 v0, 0x1

    .line 157
    .local v0, hasError:Z
    :goto_3
    if-nez v5, :cond_5

    if-nez v7, :cond_5

    if-nez v4, :cond_5

    if-nez v0, :cond_5

    const/4 v6, 0x0

    .line 159
    .local v6, showMenu:Z
    :goto_4
    if-eqz v6, :cond_0

    .line 160
    invoke-virtual {p0}, Lcom/bv/wifisync/HistoryBrowser;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v11

    const v12, 0x7f090003

    invoke-virtual {v11, v12, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 161
    invoke-virtual {v3}, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v11

    invoke-interface {p1, v11}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 162
    invoke-virtual {v3}, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->getImage()Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-interface {p1, v11}, Landroid/view/ContextMenu;->setHeaderIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/ContextMenu;

    .line 163
    const v11, 0x7f0a001e

    invoke-interface {p1, v11}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v9

    .line 164
    .local v9, viewDeviceFiles:Landroid/view/MenuItem;
    invoke-interface {v9, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 165
    const v11, 0x7f0a001f

    invoke-interface {p1, v11}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v10

    .line 166
    .local v10, viewPCFiles:Landroid/view/MenuItem;
    invoke-interface {v10, v7}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 167
    const v11, 0x7f0a0020

    invoke-interface {p1, v11}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    .line 168
    .local v8, viewDeletedFiles:Landroid/view/MenuItem;
    invoke-interface {v8, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 170
    .end local v8           #viewDeletedFiles:Landroid/view/MenuItem;
    .end local v9           #viewDeviceFiles:Landroid/view/MenuItem;
    .end local v10           #viewPCFiles:Landroid/view/MenuItem;
    :cond_0
    return-void

    .line 152
    .end local v0           #hasError:Z
    .end local v4           #showDeletedFiles:Z
    .end local v5           #showLocalFiles:Z
    .end local v6           #showMenu:Z
    .end local v7           #showRemoteFiles:Z
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 153
    .restart local v5       #showLocalFiles:Z
    :cond_2
    const/4 v7, 0x0

    goto :goto_1

    .line 154
    .restart local v7       #showRemoteFiles:Z
    :cond_3
    const/4 v4, 0x0

    goto :goto_2

    .line 155
    .restart local v4       #showDeletedFiles:Z
    :cond_4
    const/4 v0, 0x0

    goto :goto_3

    .line 157
    .restart local v0       #hasError:Z
    :cond_5
    const/4 v6, 0x1

    goto :goto_4
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
