.class public Lcom/bv/wifisync/ImageGroup;
.super Lcom/bv/wifisync/BrowseActivity;
.source "ImageGroup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/ImageGroup$GroupByRow;,
        Lcom/bv/wifisync/ImageGroup$OptionsRow;,
        Lcom/bv/wifisync/ImageGroup$PreviewRow;,
        Lcom/bv/wifisync/ImageGroup$PreviewTask;,
        Lcom/bv/wifisync/ImageGroup$ProgressInfo;,
        Lcom/bv/wifisync/ImageGroup$RowType;
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

.field parser:Lcom/bv/sync/ImageScanner$Parser;

.field private plugin:Lcom/bv/wifisync/ImagePlugin;

.field private rows:[Lcom/bv/wifisync/PropertyRow;

.field scanner:Lcom/bv/sync/ImageScanner;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    .line 30
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/bv/wifisync/ImageGroup;->names:[I

    .line 144
    new-instance v0, Lcom/bv/wifisync/JpegParser;

    invoke-direct {v0, p0}, Lcom/bv/wifisync/JpegParser;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/bv/wifisync/ImageGroup;->parser:Lcom/bv/sync/ImageScanner$Parser;

    .line 145
    new-instance v0, Lcom/bv/sync/ImageScanner;

    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup;->parser:Lcom/bv/sync/ImageScanner$Parser;

    invoke-direct {v0, v1}, Lcom/bv/sync/ImageScanner;-><init>(Lcom/bv/sync/ImageScanner$Parser;)V

    iput-object v0, p0, Lcom/bv/wifisync/ImageGroup;->scanner:Lcom/bv/sync/ImageScanner;

    .line 25
    return-void

    .line 30
    :array_0
    .array-data 0x4
        0x6ft 0x1t 0x6t 0x7ft
        0x70t 0x1t 0x6t 0x7ft
        0x71t 0x1t 0x6t 0x7ft
        0x72t 0x1t 0x6t 0x7ft
    .end array-data
.end method

.method static synthetic access$3(Lcom/bv/wifisync/ImageGroup;)[I
    .locals 1
    .parameter

    .prologue
    .line 30
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup;->names:[I

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;
    .locals 1
    .parameter

    .prologue
    .line 27
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;

    return-object v0
.end method

.method static synthetic access$5(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/PropertiesAdapter;
    .locals 1
    .parameter

    .prologue
    .line 32
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    return-object v0
.end method

.method static synthetic access$6(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/Job;
    .locals 1
    .parameter

    .prologue
    .line 26
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup;->job:Lcom/bv/wifisync/Job;

    return-object v0
.end method

.method static synthetic access$7(Lcom/bv/wifisync/ImageGroup;)Z
    .locals 1
    .parameter

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/bv/wifisync/ImageGroup;->canceled:Z

    return v0
.end method

.method static synthetic access$8(Lcom/bv/wifisync/ImageGroup;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/bv/wifisync/ImageGroup;->canceled:Z

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 1

    .prologue
    .line 257
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/wifisync/ImageGroup;->canceled:Z

    .line 258
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onBackPressed()V

    .line 259
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
    const/4 v2, 0x0

    .line 243
    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;

    iget-object v1, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v1, v1, Lcom/bv/sync/ImageScanner$Options;->groupByMonth:Z

    if-nez v1, :cond_0

    .line 244
    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;

    iget-object v1, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iput-boolean v2, v1, Lcom/bv/sync/ImageScanner$Options;->numericMonth:Z

    .line 245
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;

    iget-object v1, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v1, v1, Lcom/bv/sync/ImageScanner$Options;->groupByDay:Z

    if-nez v1, :cond_1

    .line 246
    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;

    iget-object v1, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iput-boolean v2, v1, Lcom/bv/sync/ImageScanner$Options;->doubleDigitDay:Z

    .line 247
    :cond_1
    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;

    iget-object v1, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v1, v1, Lcom/bv/sync/ImageScanner$Options;->groupByYear:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;

    iget-object v1, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v1, v1, Lcom/bv/sync/ImageScanner$Options;->groupByMonth:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;

    iget-object v1, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v1, v1, Lcom/bv/sync/ImageScanner$Options;->groupByDay:Z

    if-nez v1, :cond_2

    .line 248
    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;

    iget-object v1, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iput-boolean v2, v1, Lcom/bv/sync/ImageScanner$Options;->groupVideos:Z

    .line 249
    :cond_2
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 250
    .local v0, result:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/ImageGroup;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 251
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/bv/wifisync/ImageGroup;->setResult(ILandroid/content/Intent;)V

    .line 252
    invoke-virtual {p0}, Lcom/bv/wifisync/ImageGroup;->finish()V

    .line 253
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
    .line 224
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 225
    const v0, 0x7f06010a

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/ImageGroup;->setTitle(I)V

    .line 226
    invoke-virtual {p0}, Lcom/bv/wifisync/ImageGroup;->getData()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Job;

    iput-object v0, p0, Lcom/bv/wifisync/ImageGroup;->job:Lcom/bv/wifisync/Job;

    .line 227
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup;->job:Lcom/bv/wifisync/Job;

    iget-object v0, v0, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    check-cast v0, Lcom/bv/wifisync/ImagePlugin;

    iput-object v0, p0, Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;

    .line 228
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/bv/wifisync/PropertyRow;

    const/4 v1, 0x0

    .line 229
    new-instance v2, Lcom/bv/wifisync/ImageGroup$GroupByRow;

    sget-object v3, Lcom/bv/wifisync/ImageGroup$RowType;->GroupByYear:Lcom/bv/wifisync/ImageGroup$RowType;

    invoke-direct {v2, p0, v3}, Lcom/bv/wifisync/ImageGroup$GroupByRow;-><init>(Lcom/bv/wifisync/ImageGroup;Lcom/bv/wifisync/ImageGroup$RowType;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 230
    new-instance v2, Lcom/bv/wifisync/ImageGroup$GroupByRow;

    sget-object v3, Lcom/bv/wifisync/ImageGroup$RowType;->GroupByMonth:Lcom/bv/wifisync/ImageGroup$RowType;

    invoke-direct {v2, p0, v3}, Lcom/bv/wifisync/ImageGroup$GroupByRow;-><init>(Lcom/bv/wifisync/ImageGroup;Lcom/bv/wifisync/ImageGroup$RowType;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 231
    new-instance v2, Lcom/bv/wifisync/ImageGroup$GroupByRow;

    sget-object v3, Lcom/bv/wifisync/ImageGroup$RowType;->GroupByDay:Lcom/bv/wifisync/ImageGroup$RowType;

    invoke-direct {v2, p0, v3}, Lcom/bv/wifisync/ImageGroup$GroupByRow;-><init>(Lcom/bv/wifisync/ImageGroup;Lcom/bv/wifisync/ImageGroup$RowType;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 232
    new-instance v2, Lcom/bv/wifisync/ImageGroup$GroupByRow;

    sget-object v3, Lcom/bv/wifisync/ImageGroup$RowType;->GroupByAddress:Lcom/bv/wifisync/ImageGroup$RowType;

    invoke-direct {v2, p0, v3}, Lcom/bv/wifisync/ImageGroup$GroupByRow;-><init>(Lcom/bv/wifisync/ImageGroup;Lcom/bv/wifisync/ImageGroup$RowType;)V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    .line 233
    new-instance v2, Lcom/bv/wifisync/ImageGroup$OptionsRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/ImageGroup$OptionsRow;-><init>(Lcom/bv/wifisync/ImageGroup;)V

    aput-object v2, v0, v1

    const/4 v1, 0x5

    .line 234
    new-instance v2, Lcom/bv/wifisync/ImageGroup$PreviewRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/ImageGroup$PreviewRow;-><init>(Lcom/bv/wifisync/ImageGroup;)V

    aput-object v2, v0, v1

    .line 228
    iput-object v0, p0, Lcom/bv/wifisync/ImageGroup;->rows:[Lcom/bv/wifisync/PropertyRow;

    .line 236
    new-instance v0, Lcom/bv/wifisync/PropertiesAdapter;

    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup;->rows:[Lcom/bv/wifisync/PropertyRow;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/bv/wifisync/PropertiesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Lcom/bv/wifisync/ImageGroup;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    .line 237
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/ImageGroup;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 238
    const v0, 0x7f0600e1

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/ImageGroup;->setHelp(I)V

    .line 239
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
    .line 263
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/wifisync/ImageGroup;->canceled:Z

    .line 264
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
