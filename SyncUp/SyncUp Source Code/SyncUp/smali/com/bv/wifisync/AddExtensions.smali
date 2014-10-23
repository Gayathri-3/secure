.class public Lcom/bv/wifisync/AddExtensions;
.super Lcom/bv/wifisync/BrowseActivity;
.source "AddExtensions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/AddExtensions$AddDialog;,
        Lcom/bv/wifisync/AddExtensions$ExtensionScanner;,
        Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;,
        Lcom/bv/wifisync/AddExtensions$SelectedItem;
    }
.end annotation


# static fields
.field private static final MIN_REFRESH_TIME:I = 0x32


# instance fields
.field private adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

.field private addDialog:Lcom/bv/wifisync/AddExtensions$AddDialog;

.field private addExtensionBiller:Lcom/bv/wifisync/DonateBiller;

.field private extensions:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private job:Lcom/bv/wifisync/Job;

.field private lastAddTime:J

.field private scanner:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    .line 49
    new-instance v0, Lcom/bv/wifisync/AddExtensions$1;

    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->AddDirExclude:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-direct {v0, p0, p0, v1}, Lcom/bv/wifisync/AddExtensions$1;-><init>(Lcom/bv/wifisync/AddExtensions;Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    iput-object v0, p0, Lcom/bv/wifisync/AddExtensions;->addExtensionBiller:Lcom/bv/wifisync/DonateBiller;

    .line 40
    return-void
.end method

.method static synthetic access$10(Lcom/bv/wifisync/AddExtensions;Lcom/bv/wifisync/AddExtensions$ExtensionScanner;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 44
    iput-object p1, p0, Lcom/bv/wifisync/AddExtensions;->scanner:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;

    return-void
.end method

.method static synthetic access$11(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$ExtensionScanner;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->scanner:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;

    return-object v0
.end method

.method static synthetic access$2(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$AddDialog;
    .locals 1
    .parameter

    .prologue
    .line 45
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->addDialog:Lcom/bv/wifisync/AddExtensions$AddDialog;

    return-object v0
.end method

.method static synthetic access$3(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/DonateBiller;
    .locals 1
    .parameter

    .prologue
    .line 49
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->addExtensionBiller:Lcom/bv/wifisync/DonateBiller;

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/AddExtensions;)Ljava/util/LinkedHashSet;
    .locals 1
    .parameter

    .prologue
    .line 42
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;

    return-object v0
.end method

.method static synthetic access$5(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    return-object v0
.end method

.method static synthetic access$6(Lcom/bv/wifisync/AddExtensions;Lcom/bv/wifisync/AddExtensions$AddDialog;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 45
    iput-object p1, p0, Lcom/bv/wifisync/AddExtensions;->addDialog:Lcom/bv/wifisync/AddExtensions$AddDialog;

    return-void
.end method

.method static synthetic access$7(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/Job;
    .locals 1
    .parameter

    .prologue
    .line 41
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->job:Lcom/bv/wifisync/Job;

    return-object v0
.end method

.method static synthetic access$8(Lcom/bv/wifisync/AddExtensions;)J
    .locals 2
    .parameter

    .prologue
    .line 47
    iget-wide v0, p0, Lcom/bv/wifisync/AddExtensions;->lastAddTime:J

    return-wide v0
.end method

.method static synthetic access$9(Lcom/bv/wifisync/AddExtensions;J)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 47
    iput-wide p1, p0, Lcom/bv/wifisync/AddExtensions;->lastAddTime:J

    return-void
.end method

.method private cancelScan()V
    .locals 2

    .prologue
    .line 353
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->scanner:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;

    if-eqz v0, :cond_0

    .line 354
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->scanner:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->cancel(Z)Z

    .line 355
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bv/wifisync/AddExtensions;->scanner:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;

    .line 356
    return-void
.end method

.method private clearAll()V
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->clear()V

    .line 113
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->notifyDataSetChanged()V

    .line 114
    return-void
.end method

.method private readParams()V
    .locals 3

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/bv/wifisync/AddExtensions;->getData()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Job;

    iput-object v0, p0, Lcom/bv/wifisync/AddExtensions;->job:Lcom/bv/wifisync/Job;

    .line 74
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {p0}, Lcom/bv/wifisync/AddExtensions;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "RESULT1"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    iput-object v0, v1, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    .line 75
    invoke-virtual {p0}, Lcom/bv/wifisync/AddExtensions;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "RESULT2"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedHashSet;

    iput-object v0, p0, Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;

    .line 76
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;

    .line 78
    :cond_0
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 0

    .prologue
    .line 342
    invoke-direct {p0}, Lcom/bv/wifisync/AddExtensions;->cancelScan()V

    .line 343
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onBackPressed()V

    .line 344
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
    .line 82
    invoke-direct {p0}, Lcom/bv/wifisync/AddExtensions;->cancelScan()V

    .line 83
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 84
    .local v0, result:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 85
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/bv/wifisync/AddExtensions;->setResult(ILandroid/content/Intent;)V

    .line 86
    invoke-virtual {p0}, Lcom/bv/wifisync/AddExtensions;->finish()V

    .line 87
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
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 63
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 64
    invoke-direct {p0}, Lcom/bv/wifisync/AddExtensions;->readParams()V

    .line 65
    const v0, 0x7f0601a1

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddExtensions;->setTitle(I)V

    .line 66
    const v0, 0x7f0600e8

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddExtensions;->setHelp(I)V

    .line 67
    new-instance v0, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    invoke-direct {v0, p0}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;-><init>(Lcom/bv/wifisync/AddExtensions;)V

    iput-object v0, p0, Lcom/bv/wifisync/AddExtensions;->adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    .line 68
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddExtensions;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 69
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 97
    invoke-virtual {p0}, Lcom/bv/wifisync/AddExtensions;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f09

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 98
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 91
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onDestroy()V

    .line 92
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions;->addExtensionBiller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->close()V

    .line 93
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 103
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 104
    .local v0, itemId:I
    const v1, 0x7f0a0012

    if-ne v0, v1, :cond_1

    .line 105
    new-instance v1, Lcom/bv/wifisync/AddExtensions$AddDialog;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/AddExtensions$AddDialog;-><init>(Lcom/bv/wifisync/AddExtensions;)V

    iput-object v1, p0, Lcom/bv/wifisync/AddExtensions;->addDialog:Lcom/bv/wifisync/AddExtensions$AddDialog;

    .line 108
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1

    .line 106
    :cond_1
    const v1, 0x7f0a0013

    if-ne v0, v1, :cond_0

    .line 107
    invoke-direct {p0}, Lcom/bv/wifisync/AddExtensions;->clearAll()V

    goto :goto_0
.end method

.method protected onProgressCancelClick(Landroid/view/View;)V
    .locals 0
    .parameter "view"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 348
    invoke-direct {p0}, Lcom/bv/wifisync/AddExtensions;->cancelScan()V

    .line 349
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onProgressCancelClick(Landroid/view/View;)V

    .line 350
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
