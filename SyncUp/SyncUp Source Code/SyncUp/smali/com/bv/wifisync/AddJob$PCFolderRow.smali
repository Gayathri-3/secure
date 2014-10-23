.class Lcom/bv/wifisync/AddJob$PCFolderRow;
.super Lcom/bv/wifisync/AddJob$JobRow;
.source "AddJob.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PCFolderRow"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;
    }
.end annotation


# instance fields
.field private browsePC:Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;

.field final synthetic this$0:Lcom/bv/wifisync/AddJob;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddJob;)V
    .locals 2
    .parameter

    .prologue
    .line 169
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    .line 170
    const v0, 0x7f0600f3

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f020004

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddJob$JobRow;-><init>(Lcom/bv/wifisync/AddJob;Ljava/lang/String;I)V

    .line 171
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddJob$PCFolderRow;Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 133
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->browsePC:Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;

    return-void
.end method

.method static synthetic access$1(Lcom/bv/wifisync/AddJob$PCFolderRow;)Lcom/bv/wifisync/AddJob;
    .locals 1
    .parameter

    .prologue
    .line 132
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    return-object v0
.end method


# virtual methods
.method cancel()V
    .locals 2

    .prologue
    .line 198
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->browsePC:Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;

    if-eqz v0, :cond_0

    .line 199
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->browsePC:Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->cancel(Z)Z

    .line 200
    :cond_0
    return-void
.end method

.method protected getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 176
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/bv/wifisync/Utils;->urlToPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 177
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 183
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 184
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->browsePC:Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;

    if-nez v1, :cond_0

    .line 185
    new-instance v1, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;-><init>(Lcom/bv/wifisync/AddJob$PCFolderRow;I)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddJob$PCFolderRow$BrowsePC;->run([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    :cond_0
    :goto_0
    return-void

    .line 186
    :catch_0
    move-exception v0

    .line 187
    .local v0, e:Ljava/io/IOException;
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method update(Ljava/lang/Object;)V
    .locals 2
    .parameter "data"

    .prologue
    .line 193
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$PCFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    check-cast p1, Ljava/lang/String;

    .end local p1
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->stripUrlPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Job;->setPcDir(Ljava/lang/String;)V

    .line 194
    return-void
.end method
