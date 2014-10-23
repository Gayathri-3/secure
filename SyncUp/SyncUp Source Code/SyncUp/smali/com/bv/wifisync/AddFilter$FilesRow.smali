.class abstract Lcom/bv/wifisync/AddFilter$FilesRow;
.super Lcom/bv/wifisync/AddFilter$FilterRow;
.source "AddFilter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "FilesRow"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;
    }
.end annotation


# instance fields
.field private fetcher:Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;

.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;I)V
    .locals 0
    .parameter
    .parameter "name"

    .prologue
    .line 172
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$FilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    .line 173
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/AddFilter$FilterRow;-><init>(Lcom/bv/wifisync/AddFilter;I)V

    .line 174
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddFilter$FilesRow;Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 170
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$FilesRow;->fetcher:Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;

    return-void
.end method

.method static synthetic access$1(Lcom/bv/wifisync/AddFilter$FilesRow;)Lcom/bv/wifisync/AddFilter;
    .locals 1
    .parameter

    .prologue
    .line 169
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$FilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    return-object v0
.end method


# virtual methods
.method cancel()V
    .locals 2

    .prologue
    .line 254
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$FilesRow;->fetcher:Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;

    if-eqz v0, :cond_0

    .line 255
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$FilesRow;->fetcher:Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;->cancel(Z)Z

    .line 256
    :cond_0
    invoke-super {p0}, Lcom/bv/wifisync/AddFilter$FilterRow;->cancel()V

    .line 257
    return-void
.end method

.method protected abstract getFilterFiles()Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method protected abstract getRootDir()Lcom/bv/sync/IFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected getValue()Ljava/lang/String;
    .locals 5

    .prologue
    .line 182
    const-string v2, ""

    .line 183
    .local v2, result:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/bv/wifisync/AddFilter$FilesRow;->getFilterFiles()Ljava/util/LinkedHashSet;

    move-result-object v0

    .line 184
    .local v0, files:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    if-eqz v0, :cond_1

    .line 185
    invoke-virtual {p0}, Lcom/bv/wifisync/AddFilter$FilesRow;->getFilterFiles()Ljava/util/LinkedHashSet;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 190
    :goto_1
    return-object v2

    .line 185
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 186
    .local v1, path:Ljava/lang/String;
    iget-object v4, p0, Lcom/bv/wifisync/AddFilter$FilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #calls: Lcom/bv/wifisync/AddFilter;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4, v2, v1}, Lcom/bv/wifisync/AddFilter;->access$5(Lcom/bv/wifisync/AddFilter;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 188
    .end local v1           #path:Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lcom/bv/wifisync/AddFilter$FilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    const v4, 0x7f060115

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddFilter;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 196
    :try_start_0
    new-instance v1, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    invoke-direct {v1}, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;-><init>()V

    .line 197
    .local v1, options:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->readOnly:Z

    .line 198
    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->showButton:Z

    .line 199
    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$FilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/AddFilter;->access$4(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, v1, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->requestCode:Ljava/lang/Integer;

    .line 200
    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$FilesRow;->fetcher:Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;

    if-nez v2, :cond_0

    .line 201
    new-instance v2, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;-><init>(Lcom/bv/wifisync/AddFilter$FilesRow;)V

    const/4 v3, 0x1

    new-array v3, v3, [Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;->run([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 205
    .end local v1           #options:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    :cond_0
    :goto_0
    return-void

    .line 202
    :catch_0
    move-exception v0

    .line 203
    .local v0, e:Ljava/lang/Exception;
    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$FilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-static {v2, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected abstract setFilterFiles(Ljava/util/LinkedHashSet;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method update(Ljava/lang/Object;)V
    .locals 6
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 244
    move-object v0, p1

    check-cast v0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    .line 245
    .local v0, options:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    invoke-virtual {p0}, Lcom/bv/wifisync/AddFilter$FilesRow;->getRootDir()Lcom/bv/sync/IFile;

    move-result-object v4

    invoke-interface {v4}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 246
    .local v1, parentPath:Ljava/lang/String;
    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    .line 247
    .local v3, result:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    iget-object v4, v0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    invoke-virtual {v4}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 249
    invoke-virtual {p0, v3}, Lcom/bv/wifisync/AddFilter$FilesRow;->setFilterFiles(Ljava/util/LinkedHashSet;)V

    .line 250
    return-void

    .line 247
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 248
    .local v2, path:Ljava/lang/String;
    invoke-static {v2, v1}, Lcom/bv/sync/CifsSync;->getRelativePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method
