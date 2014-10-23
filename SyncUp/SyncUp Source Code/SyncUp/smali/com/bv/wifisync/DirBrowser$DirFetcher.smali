.class Lcom/bv/wifisync/DirBrowser$DirFetcher;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "DirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DirFetcher"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Lcom/bv/sync/IFile;",
        "Lcom/bv/wifisync/DirBrowser$ProgressInfo;",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/bv/wifisync/DirBrowser$FileInfo;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final PROGRESS_SIZE:I = 0xc8


# instance fields
.field private dirIsSelectable:Z

.field private emptyView:Landroid/view/View;

.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser;)V
    .locals 1
    .parameter

    .prologue
    .line 1042
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    .line 1043
    const-string v0, "DirFetcher"

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 1044
    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/DirBrowser$DirFetcher;[Ljava/lang/Object;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$DirFetcher;->publishProgress([Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$4(Lcom/bv/wifisync/DirBrowser$DirFetcher;)Lcom/bv/wifisync/DirBrowser;
    .locals 1
    .parameter

    .prologue
    .line 1037
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    return-object v0
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
    check-cast p1, [Lcom/bv/sync/IFile;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$DirFetcher;->atBackground([Lcom/bv/sync/IFile;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method protected varargs atBackground([Lcom/bv/sync/IFile;)Ljava/util/ArrayList;
    .locals 9
    .parameter "folder"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/bv/sync/IFile;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/bv/wifisync/DirBrowser$FileInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 1055
    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;
    invoke-static {v6}, Lcom/bv/wifisync/DirBrowser;->access$3(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/sync/IFile;

    move-result-object v6

    invoke-interface {v6}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;
    invoke-static {v6}, Lcom/bv/wifisync/DirBrowser;->access$3(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/sync/IFile;

    move-result-object v6

    invoke-interface {v6}, Lcom/bv/sync/IFile;->canRead()Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x1

    :goto_0
    iput-boolean v6, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->dirIsSelectable:Z

    .line 1057
    aget-object v1, p1, v7

    .line 1058
    .local v1, file:Lcom/bv/sync/IFile;
    invoke-interface {v1}, Lcom/bv/sync/IFile;->canRead()Z

    move-result v6

    if-nez v6, :cond_1

    .line 1059
    new-instance v6, Ljava/io/IOException;

    iget-object v7, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    const v8, 0x7f0600a5

    invoke-virtual {v7, v8}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .end local v1           #file:Lcom/bv/sync/IFile;
    :cond_0
    move v6, v7

    .line 1055
    goto :goto_0

    .line 1061
    .restart local v1       #file:Lcom/bv/sync/IFile;
    :cond_1
    new-instance v3, Lcom/bv/wifisync/DirBrowser$NameComparator;

    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-direct {v3, v6, v8}, Lcom/bv/wifisync/DirBrowser$NameComparator;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$NameComparator;)V

    .line 1062
    .local v3, nameComparator:Lcom/bv/wifisync/DirBrowser$NameComparator;
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0, v3}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 1063
    .local v0, dirs:Ljava/util/TreeSet;,"Ljava/util/TreeSet<Lcom/bv/wifisync/DirBrowser$FileInfo;>;"
    new-instance v2, Ljava/util/TreeSet;

    invoke-direct {v2, v3}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 1064
    .local v2, files:Ljava/util/TreeSet;,"Ljava/util/TreeSet<Lcom/bv/wifisync/DirBrowser$FileInfo;>;"
    new-instance v4, Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-direct {v4, v6, v8}, Lcom/bv/wifisync/DirBrowser$ProgressInfo;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$ProgressInfo;)V

    .line 1066
    .local v4, progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;
    new-instance v6, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;

    invoke-direct {v6, p0, v4, v0, v2}, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;-><init>(Lcom/bv/wifisync/DirBrowser$DirFetcher;Lcom/bv/wifisync/DirBrowser$ProgressInfo;Ljava/util/TreeSet;Ljava/util/TreeSet;)V

    invoke-interface {v1, v6}, Lcom/bv/sync/IFile;->listFiles(Lcom/bv/sync/IFileFilter;)[Lcom/bv/sync/IFile;

    .line 1082
    new-instance v5, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/TreeSet;->size()I

    move-result v6

    invoke-virtual {v2}, Ljava/util/TreeSet;->size()I

    move-result v7

    add-int/2addr v6, v7

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1083
    .local v5, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/DirBrowser$FileInfo;>;"
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1084
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1085
    return-object v5
.end method

.method protected onCancelled()V
    .locals 2

    .prologue
    .line 1121
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->emptyView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1122
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/DirBrowser;->setProgressVisible(Z)V

    .line 1123
    invoke-super {p0}, Lcom/bv/wifisync/Utils$ProgressTask;->onCancelled()V

    .line 1124
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$DirFetcher;->onPostExecute(Ljava/util/ArrayList;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/ArrayList;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/bv/wifisync/DirBrowser$FileInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/DirBrowser$FileInfo;>;"
    const/4 v3, 0x0

    .line 1099
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->emptyView:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1100
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v1, v3}, Lcom/bv/wifisync/DirBrowser;->setProgressVisible(Z)V

    .line 1101
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 1102
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->error:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 1103
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->error:Ljava/lang/Throwable;

    iput-object v2, v1, Lcom/bv/wifisync/DirBrowser;->lastError:Ljava/lang/Throwable;

    .line 1104
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser;->setHelp()V

    .line 1105
    if-nez p1, :cond_1

    .line 1106
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1107
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "lastError"

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v2, v2, Lcom/bv/wifisync/DirBrowser;->lastError:Ljava/lang/Throwable;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 1108
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v1, v3, v0}, Lcom/bv/wifisync/DirBrowser;->setResult(ILandroid/content/Intent;)V

    .line 1109
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser;->finish()V

    .line 1117
    .end local v0           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 1111
    :cond_1
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v1, v1, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1, p1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->add(Ljava/util/ArrayList;)V

    .line 1112
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v1, v1, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 1113
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    #calls: Lcom/bv/wifisync/DirBrowser;->setTitle()V
    invoke-static {v1}, Lcom/bv/wifisync/DirBrowser;->access$12(Lcom/bv/wifisync/DirBrowser;)V

    .line 1114
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser;->setupButtonChoose()V

    .line 1115
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v1, v1, Lcom/bv/wifisync/DirBrowser;->buttonOk:Landroid/widget/Button;

    iget-boolean v2, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->dirIsSelectable:Z

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 1048
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    const v1, 0x7f0a0001

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/DirBrowser;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->emptyView:Landroid/view/View;

    .line 1049
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->emptyView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1050
    invoke-super {p0}, Lcom/bv/wifisync/Utils$ProgressTask;->onPreExecute()V

    .line 1051
    return-void
.end method

.method protected varargs onProgressUpdate([Lcom/bv/wifisync/DirBrowser$ProgressInfo;)V
    .locals 6
    .parameter "values"

    .prologue
    const/4 v5, 0x0

    .line 1090
    aget-object v0, p1, v5

    .line 1091
    .local v0, progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/DirBrowser;->setProgressVisible(Z)V

    .line 1092
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    const v4, 0x7f0601a3

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/bv/wifisync/DirBrowser$ProgressInfo;->percent:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v5, v2}, Lcom/bv/wifisync/DirBrowser;->setProgress(ILjava/lang/String;)V

    .line 1093
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->emptyView:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1094
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v1, v1, Lcom/bv/wifisync/DirBrowser;->buttonOk:Landroid/widget/Button;

    iget-boolean v2, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher;->dirIsSelectable:Z

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1095
    return-void
.end method

.method protected bridge varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, [Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$DirFetcher;->onProgressUpdate([Lcom/bv/wifisync/DirBrowser$ProgressInfo;)V

    return-void
.end method
