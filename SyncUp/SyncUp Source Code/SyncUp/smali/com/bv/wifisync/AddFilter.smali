.class public Lcom/bv/wifisync/AddFilter;
.super Lcom/bv/wifisync/BrowseActivity;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/AddFilter$DateRow;,
        Lcom/bv/wifisync/AddFilter$ExcludeDateRow;,
        Lcom/bv/wifisync/AddFilter$ExcludeExtensionsRow;,
        Lcom/bv/wifisync/AddFilter$ExcludeLocalFilesRow;,
        Lcom/bv/wifisync/AddFilter$ExcludeRemoteFilesRow;,
        Lcom/bv/wifisync/AddFilter$ExtensionsRow;,
        Lcom/bv/wifisync/AddFilter$FilesRow;,
        Lcom/bv/wifisync/AddFilter$FilterRow;,
        Lcom/bv/wifisync/AddFilter$HeaderRow;,
        Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;,
        Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;,
        Lcom/bv/wifisync/AddFilter$IncludeDateRow;,
        Lcom/bv/wifisync/AddFilter$IncludeExtensionsRow;,
        Lcom/bv/wifisync/AddFilter$IncludeLocalFilesRow;,
        Lcom/bv/wifisync/AddFilter$IncludeRemoteFilesRow;,
        Lcom/bv/wifisync/AddFilter$LocalFilesRow;,
        Lcom/bv/wifisync/AddFilter$RemoteFilesRow;
    }
.end annotation


# instance fields
.field private adapter:Lcom/bv/wifisync/PropertiesAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bv/wifisync/PropertiesAdapter",
            "<",
            "Lcom/bv/wifisync/AddFilter$FilterRow;",
            ">;"
        }
    .end annotation
.end field

.field private job:Lcom/bv/wifisync/Job;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;
    .locals 1
    .parameter

    .prologue
    .line 24
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/PropertiesAdapter;
    .locals 1
    .parameter

    .prologue
    .line 25
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    return-object v0
.end method

.method static synthetic access$5(Lcom/bv/wifisync/AddFilter;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 102
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/AddFilter;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private cancelAll()V
    .locals 2

    .prologue
    .line 571
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/PropertiesAdapter;->getCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 573
    return-void

    .line 572
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v1, v0}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/AddFilter$FilterRow;

    invoke-virtual {v1}, Lcom/bv/wifisync/AddFilter$FilterRow;->cancel()V

    .line 571
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private checkConflicts()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 554
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v0, v0, Lcom/bv/wifisync/Job$Filter;->includeExtensions:Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, v1, Lcom/bv/wifisync/Job$Filter;->extensions:Ljava/util/LinkedHashSet;

    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/AddFilter;->checkConflicts(Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;)V

    .line 555
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v0, v0, Lcom/bv/wifisync/Job$Filter;->includeLocalFiles:Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, v1, Lcom/bv/wifisync/Job$Filter;->localFiles:Ljava/util/LinkedHashSet;

    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/AddFilter;->checkConflicts(Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;)V

    .line 556
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v0, v0, Lcom/bv/wifisync/Job$Filter;->includeRemoteFiles:Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, v1, Lcom/bv/wifisync/Job$Filter;->remoteFiles:Ljava/util/LinkedHashSet;

    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/AddFilter;->checkConflicts(Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;)V

    .line 557
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget v0, v0, Lcom/bv/wifisync/Job$Filter;->modifiedDate:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget v0, v0, Lcom/bv/wifisync/Job$Filter;->includeModifiedDate:I

    if-eqz v0, :cond_0

    .line 558
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget v0, v0, Lcom/bv/wifisync/Job$Filter;->modifiedDate:I

    iget-object v1, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget v1, v1, Lcom/bv/wifisync/Job$Filter;->includeModifiedDate:I

    if-lt v0, v1, :cond_0

    .line 559
    new-instance v0, Ljava/io/IOException;

    const v1, 0x7f0600b5

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddFilter;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 561
    :cond_0
    return-void
.end method

.method private checkConflicts(Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;)V
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 564
    .local p1, set1:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    .local p2, set2:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p2}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 565
    invoke-virtual {p1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 568
    :cond_1
    return-void

    .line 565
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 566
    .local v0, entry:Ljava/lang/String;
    invoke-virtual {p2, v0}, Ljava/util/LinkedHashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 567
    new-instance v1, Ljava/io/IOException;

    const v2, 0x7f0600b5

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/AddFilter;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "result"
    .parameter "value"

    .prologue
    .line 103
    const-string v0, ","

    invoke-static {p1, p2, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "intent"

    .prologue
    .line 446
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/BrowseActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 447
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 448
    new-instance v0, Lcom/bv/wifisync/AddFilter$1;

    const-string v1, "UpdateFilter"

    invoke-direct {v0, p0, p0, v1, p1}, Lcom/bv/wifisync/AddFilter$1;-><init>(Lcom/bv/wifisync/AddFilter;Landroid/app/Activity;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 460
    const-string v3, "RESULT"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddFilter$1;->run([Ljava/lang/Object;)V

    .line 462
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 577
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onBackPressed()V

    .line 578
    invoke-direct {p0}, Lcom/bv/wifisync/AddFilter;->cancelAll()V

    .line 579
    return-void
.end method

.method protected onButtonClick(Landroid/view/View;)V
    .locals 3
    .parameter "view"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 545
    invoke-direct {p0}, Lcom/bv/wifisync/AddFilter;->checkConflicts()V

    .line 546
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 547
    .local v0, result:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 548
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/bv/wifisync/AddFilter;->setResult(ILandroid/content/Intent;)V

    .line 549
    invoke-direct {p0}, Lcom/bv/wifisync/AddFilter;->cancelAll()V

    .line 550
    invoke-virtual {p0}, Lcom/bv/wifisync/AddFilter;->finish()V

    .line 551
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
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x0

    .line 497
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 498
    invoke-virtual {p0}, Lcom/bv/wifisync/AddFilter;->getData()Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job;

    iput-object v1, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    .line 499
    iget-object v2, p0, Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {p0}, Lcom/bv/wifisync/AddFilter;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "RESULT1"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Host;

    iput-object v1, v2, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    .line 500
    const/16 v1, 0xc

    new-array v0, v1, [Lcom/bv/wifisync/AddFilter$FilterRow;

    const/4 v1, 0x0

    .line 501
    new-instance v2, Lcom/bv/wifisync/AddFilter$HeaderRow;

    const v3, 0x7f060185

    const-string v4, "Green"

    const-string v5, "+"

    invoke-direct {v2, p0, v3, v4, v5}, Lcom/bv/wifisync/AddFilter$HeaderRow;-><init>(Lcom/bv/wifisync/AddFilter;ILjava/lang/String;Ljava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 502
    new-instance v2, Lcom/bv/wifisync/AddFilter$IncludeLocalFilesRow;

    invoke-direct {v2, p0, v6}, Lcom/bv/wifisync/AddFilter$IncludeLocalFilesRow;-><init>(Lcom/bv/wifisync/AddFilter;Lcom/bv/wifisync/AddFilter$IncludeLocalFilesRow;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lcom/bv/wifisync/AddFilter$IncludeRemoteFilesRow;

    invoke-direct {v2, p0, v6}, Lcom/bv/wifisync/AddFilter$IncludeRemoteFilesRow;-><init>(Lcom/bv/wifisync/AddFilter;Lcom/bv/wifisync/AddFilter$IncludeRemoteFilesRow;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lcom/bv/wifisync/AddFilter$IncludeExtensionsRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddFilter$IncludeExtensionsRow;-><init>(Lcom/bv/wifisync/AddFilter;)V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-instance v2, Lcom/bv/wifisync/AddFilter$IncludeDateRow;

    invoke-direct {v2, p0, v6}, Lcom/bv/wifisync/AddFilter$IncludeDateRow;-><init>(Lcom/bv/wifisync/AddFilter;Lcom/bv/wifisync/AddFilter$IncludeDateRow;)V

    aput-object v2, v0, v1

    const/4 v1, 0x5

    .line 503
    new-instance v2, Lcom/bv/wifisync/AddFilter$HeaderRow;

    const v3, 0x7f060186

    const-string v4, "Red"

    const-string v5, "-"

    invoke-direct {v2, p0, v3, v4, v5}, Lcom/bv/wifisync/AddFilter$HeaderRow;-><init>(Lcom/bv/wifisync/AddFilter;ILjava/lang/String;Ljava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 504
    new-instance v2, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;-><init>(Lcom/bv/wifisync/AddFilter;)V

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-instance v2, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;-><init>(Lcom/bv/wifisync/AddFilter;)V

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 505
    new-instance v2, Lcom/bv/wifisync/AddFilter$ExcludeLocalFilesRow;

    invoke-direct {v2, p0, v6}, Lcom/bv/wifisync/AddFilter$ExcludeLocalFilesRow;-><init>(Lcom/bv/wifisync/AddFilter;Lcom/bv/wifisync/AddFilter$ExcludeLocalFilesRow;)V

    aput-object v2, v0, v1

    const/16 v1, 0x9

    new-instance v2, Lcom/bv/wifisync/AddFilter$ExcludeRemoteFilesRow;

    invoke-direct {v2, p0, v6}, Lcom/bv/wifisync/AddFilter$ExcludeRemoteFilesRow;-><init>(Lcom/bv/wifisync/AddFilter;Lcom/bv/wifisync/AddFilter$ExcludeRemoteFilesRow;)V

    aput-object v2, v0, v1

    const/16 v1, 0xa

    new-instance v2, Lcom/bv/wifisync/AddFilter$ExcludeExtensionsRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddFilter$ExcludeExtensionsRow;-><init>(Lcom/bv/wifisync/AddFilter;)V

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 506
    new-instance v2, Lcom/bv/wifisync/AddFilter$ExcludeDateRow;

    invoke-direct {v2, p0, v6}, Lcom/bv/wifisync/AddFilter$ExcludeDateRow;-><init>(Lcom/bv/wifisync/AddFilter;Lcom/bv/wifisync/AddFilter$ExcludeDateRow;)V

    aput-object v2, v0, v1

    .line 507
    .local v0, rows:[Lcom/bv/wifisync/AddFilter$FilterRow;
    new-instance v1, Lcom/bv/wifisync/AddFilter$2;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, p0, p0, v2}, Lcom/bv/wifisync/AddFilter$2;-><init>(Lcom/bv/wifisync/AddFilter;Landroid/content/Context;Ljava/util/List;)V

    iput-object v1, p0, Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    .line 538
    iget-object v1, p0, Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddFilter;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 539
    const v1, 0x7f060184

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddFilter;->setTitle(I)V

    .line 540
    const v1, 0x7f0600e3

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddFilter;->setHelp(I)V

    .line 541
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

.method public bridge synthetic setProgress(ILjava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1, p2}, Lcom/bv/wifisync/BrowseActivity;->setProgress(ILjava/lang/String;)V

    return-void
.end method
