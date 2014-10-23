.class public Lcom/bv/wifisync/Mp3Group;
.super Lcom/bv/wifisync/BrowseActivity;
.source "Mp3Group.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/Mp3Group$GroupByRow;,
        Lcom/bv/wifisync/Mp3Group$PreviewRow;,
        Lcom/bv/wifisync/Mp3Group$PreviewTask;,
        Lcom/bv/wifisync/Mp3Group$ProgressInfo;,
        Lcom/bv/wifisync/Mp3Group$RenameSongRow;,
        Lcom/bv/wifisync/Mp3Group$RowType;
    }
.end annotation


# instance fields
.field private adapter:Lcom/bv/wifisync/PropertiesAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bv/wifisync/PropertiesAdapter",
            "<",
            "Lcom/bv/wifisync/PropertyRow;",
            ">;"
        }
    .end annotation
.end field

.field private canceled:Z

.field private job:Lcom/bv/wifisync/Job;

.field private final names:[I

.field private plugin:Lcom/bv/wifisync/Mp3Plugin;

.field private rows:[Lcom/bv/wifisync/PropertyRow;

.field scanner:Lcom/bv/sync/Mp3Scanner;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    .line 26
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/bv/wifisync/Mp3Group;->names:[I

    .line 100
    new-instance v0, Lcom/bv/sync/Mp3Scanner;

    invoke-direct {v0}, Lcom/bv/sync/Mp3Scanner;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/Mp3Group;->scanner:Lcom/bv/sync/Mp3Scanner;

    .line 21
    return-void

    .line 26
    nop

    :array_0
    .array-data 0x4
        0x76t 0x1t 0x6t 0x7ft
        0x77t 0x1t 0x6t 0x7ft
        0x78t 0x1t 0x6t 0x7ft
    .end array-data
.end method

.method static synthetic access$3(Lcom/bv/wifisync/Mp3Group;)[I
    .locals 1
    .parameter

    .prologue
    .line 26
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group;->names:[I

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/Mp3Plugin;
    .locals 1
    .parameter

    .prologue
    .line 23
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group;->plugin:Lcom/bv/wifisync/Mp3Plugin;

    return-object v0
.end method

.method static synthetic access$5(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/PropertiesAdapter;
    .locals 1
    .parameter

    .prologue
    .line 28
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    return-object v0
.end method

.method static synthetic access$6(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/Job;
    .locals 1
    .parameter

    .prologue
    .line 22
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group;->job:Lcom/bv/wifisync/Job;

    return-object v0
.end method

.method static synthetic access$7(Lcom/bv/wifisync/Mp3Group;)Z
    .locals 1
    .parameter

    .prologue
    .line 27
    iget-boolean v0, p0, Lcom/bv/wifisync/Mp3Group;->canceled:Z

    return v0
.end method

.method static synthetic access$8(Lcom/bv/wifisync/Mp3Group;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/bv/wifisync/Mp3Group;->canceled:Z

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 1

    .prologue
    .line 204
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/wifisync/Mp3Group;->canceled:Z

    .line 205
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onBackPressed()V

    .line 206
    return-void
.end method

.method protected onButtonClick(Landroid/view/View;)V
    .locals 3
    .parameter "arg0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 197
    .local v0, result:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/Mp3Group;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 198
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/bv/wifisync/Mp3Group;->setResult(ILandroid/content/Intent;)V

    .line 199
    invoke-virtual {p0}, Lcom/bv/wifisync/Mp3Group;->finish()V

    .line 200
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
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 179
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 180
    const v0, 0x7f06010b

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Mp3Group;->setTitle(I)V

    .line 181
    invoke-virtual {p0}, Lcom/bv/wifisync/Mp3Group;->getData()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Job;

    iput-object v0, p0, Lcom/bv/wifisync/Mp3Group;->job:Lcom/bv/wifisync/Job;

    .line 182
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group;->job:Lcom/bv/wifisync/Job;

    iget-object v0, v0, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    check-cast v0, Lcom/bv/wifisync/Mp3Plugin;

    iput-object v0, p0, Lcom/bv/wifisync/Mp3Group;->plugin:Lcom/bv/wifisync/Mp3Plugin;

    .line 183
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/bv/wifisync/PropertyRow;

    const/4 v1, 0x0

    .line 184
    new-instance v2, Lcom/bv/wifisync/Mp3Group$GroupByRow;

    sget-object v3, Lcom/bv/wifisync/Mp3Group$RowType;->GroupByArtist:Lcom/bv/wifisync/Mp3Group$RowType;

    invoke-direct {v2, p0, v3}, Lcom/bv/wifisync/Mp3Group$GroupByRow;-><init>(Lcom/bv/wifisync/Mp3Group;Lcom/bv/wifisync/Mp3Group$RowType;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 185
    new-instance v2, Lcom/bv/wifisync/Mp3Group$GroupByRow;

    sget-object v3, Lcom/bv/wifisync/Mp3Group$RowType;->GroupByAlbum:Lcom/bv/wifisync/Mp3Group$RowType;

    invoke-direct {v2, p0, v3}, Lcom/bv/wifisync/Mp3Group$GroupByRow;-><init>(Lcom/bv/wifisync/Mp3Group;Lcom/bv/wifisync/Mp3Group$RowType;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 186
    new-instance v2, Lcom/bv/wifisync/Mp3Group$RenameSongRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/Mp3Group$RenameSongRow;-><init>(Lcom/bv/wifisync/Mp3Group;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 187
    new-instance v2, Lcom/bv/wifisync/Mp3Group$PreviewRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/Mp3Group$PreviewRow;-><init>(Lcom/bv/wifisync/Mp3Group;)V

    aput-object v2, v0, v1

    .line 183
    iput-object v0, p0, Lcom/bv/wifisync/Mp3Group;->rows:[Lcom/bv/wifisync/PropertyRow;

    .line 189
    new-instance v0, Lcom/bv/wifisync/PropertiesAdapter;

    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group;->rows:[Lcom/bv/wifisync/PropertyRow;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/bv/wifisync/PropertiesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Lcom/bv/wifisync/Mp3Group;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    .line 190
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Mp3Group;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 191
    const v0, 0x7f0600e2

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Mp3Group;->setHelp(I)V

    .line 192
    return-void
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

.method protected onProgressCancelClick(Landroid/view/View;)V
    .locals 1
    .parameter "view"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 210
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/wifisync/Mp3Group;->canceled:Z

    .line 211
    return-void
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
