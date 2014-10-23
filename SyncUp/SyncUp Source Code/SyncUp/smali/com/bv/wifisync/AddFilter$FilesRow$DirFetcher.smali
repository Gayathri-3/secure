.class Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter$FilesRow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DirFetcher"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddFilter$FilesRow;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter$FilesRow;)V
    .locals 2
    .parameter

    .prologue
    .line 208
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;->this$1:Lcom/bv/wifisync/AddFilter$FilesRow;

    .line 209
    #getter for: Lcom/bv/wifisync/AddFilter$FilesRow;->this$0:Lcom/bv/wifisync/AddFilter;
    invoke-static {p1}, Lcom/bv/wifisync/AddFilter$FilesRow;->access$1(Lcom/bv/wifisync/AddFilter$FilesRow;)Lcom/bv/wifisync/AddFilter;

    move-result-object v0

    const-string v1, "DirFetcher"

    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 210
    #setter for: Lcom/bv/wifisync/AddFilter$FilesRow;->fetcher:Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;
    invoke-static {p1, p0}, Lcom/bv/wifisync/AddFilter$FilesRow;->access$0(Lcom/bv/wifisync/AddFilter$FilesRow;Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;)V

    .line 211
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
    check-cast p1, [Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;->atBackground([Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs atBackground([Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;)Ljava/lang/Void;
    .locals 9
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v7, 0x2f

    .line 215
    const/4 v5, 0x0

    aget-object v1, p1, v5

    .line 216
    .local v1, options:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    new-instance v5, Ljava/util/LinkedHashSet;

    invoke-direct {v5}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v5, v1, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    .line 217
    iget-object v5, p0, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;->this$1:Lcom/bv/wifisync/AddFilter$FilesRow;

    invoke-virtual {v5}, Lcom/bv/wifisync/AddFilter$FilesRow;->getRootDir()Lcom/bv/sync/IFile;

    move-result-object v3

    .line 218
    .local v3, root:Lcom/bv/sync/IFile;
    invoke-interface {v3}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 219
    .local v4, rootPath:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v7, :cond_0

    .line 220
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 221
    :cond_0
    iget-object v5, p0, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;->this$1:Lcom/bv/wifisync/AddFilter$FilesRow;

    invoke-virtual {v5}, Lcom/bv/wifisync/AddFilter$FilesRow;->getFilterFiles()Ljava/util/LinkedHashSet;

    move-result-object v0

    .line 222
    .local v0, files:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    if-eqz v0, :cond_1

    .line 223
    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_2

    .line 225
    :cond_1
    iget-object v5, p0, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;->this$1:Lcom/bv/wifisync/AddFilter$FilesRow;

    #getter for: Lcom/bv/wifisync/AddFilter$FilesRow;->this$0:Lcom/bv/wifisync/AddFilter;
    invoke-static {v5}, Lcom/bv/wifisync/AddFilter$FilesRow;->access$1(Lcom/bv/wifisync/AddFilter$FilesRow;)Lcom/bv/wifisync/AddFilter;

    move-result-object v5

    invoke-static {v5, v3, v1}, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectDir(Landroid/app/Activity;Lcom/bv/sync/IFile;Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;)V

    .line 226
    const/4 v5, 0x0

    return-object v5

    .line 223
    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 224
    .local v2, path:Ljava/lang/String;
    iget-object v6, v1, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method protected onCancelled()V
    .locals 2

    .prologue
    .line 231
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;->this$1:Lcom/bv/wifisync/AddFilter$FilesRow;

    const/4 v1, 0x0

    #setter for: Lcom/bv/wifisync/AddFilter$FilesRow;->fetcher:Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;
    invoke-static {v0, v1}, Lcom/bv/wifisync/AddFilter$FilesRow;->access$0(Lcom/bv/wifisync/AddFilter$FilesRow;Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;)V

    .line 232
    invoke-super {p0}, Lcom/bv/wifisync/Utils$ProgressTask;->onCancelled()V

    .line 233
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2
    .parameter "result"

    .prologue
    .line 237
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;->this$1:Lcom/bv/wifisync/AddFilter$FilesRow;

    const/4 v1, 0x0

    #setter for: Lcom/bv/wifisync/AddFilter$FilesRow;->fetcher:Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;
    invoke-static {v0, v1}, Lcom/bv/wifisync/AddFilter$FilesRow;->access$0(Lcom/bv/wifisync/AddFilter$FilesRow;Lcom/bv/wifisync/AddFilter$FilesRow$DirFetcher;)V

    .line 238
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 239
    return-void
.end method
