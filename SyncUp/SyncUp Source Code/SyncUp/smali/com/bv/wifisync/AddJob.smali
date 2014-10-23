.class public Lcom/bv/wifisync/AddJob;
.super Lcom/bv/wifisync/BrowseActivity;
.source "AddJob.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/AddJob$DirectionRow;,
        Lcom/bv/wifisync/AddJob$FilterRow;,
        Lcom/bv/wifisync/AddJob$GroupImagesRow;,
        Lcom/bv/wifisync/AddJob$GroupMp3Row;,
        Lcom/bv/wifisync/AddJob$JobRow;,
        Lcom/bv/wifisync/AddJob$MediaScanRow;,
        Lcom/bv/wifisync/AddJob$OverwriteRow;,
        Lcom/bv/wifisync/AddJob$PCFolderRow;,
        Lcom/bv/wifisync/AddJob$PhoneFolderRow;,
        Lcom/bv/wifisync/AddJob$ScheduleRow;,
        Lcom/bv/wifisync/AddJob$TrackDeletionsRow;
    }
.end annotation


# instance fields
.field private adapter:Lcom/bv/wifisync/PropertiesAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bv/wifisync/PropertiesAdapter",
            "<",
            "Lcom/bv/wifisync/AddJob$JobRow;",
            ">;"
        }
    .end annotation
.end field

.field private job:Lcom/bv/wifisync/Job;

.field private moreMode:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    return-void
.end method

.method static synthetic access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;
    .locals 1
    .parameter

    .prologue
    .line 42
    iget-object v0, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    return-object v0
.end method

.method static synthetic access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/AddJob;III[Ljava/lang/String;[[II)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 620
    invoke-direct/range {p0 .. p6}, Lcom/bv/wifisync/AddJob;->showEnumBrowser(III[Ljava/lang/String;[[II)V

    return-void
.end method

.method static synthetic access$5(Lcom/bv/wifisync/AddJob;)V
    .locals 0
    .parameter

    .prologue
    .line 547
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob;->addRows()V

    return-void
.end method

.method private addRows()V
    .locals 4

    .prologue
    .line 548
    const/4 v1, 0x7

    new-array v0, v1, [Lcom/bv/wifisync/AddJob$JobRow;

    const/4 v1, 0x0

    .line 549
    new-instance v2, Lcom/bv/wifisync/AddJob$PhoneFolderRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddJob$PhoneFolderRow;-><init>(Lcom/bv/wifisync/AddJob;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lcom/bv/wifisync/AddJob$PCFolderRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddJob$PCFolderRow;-><init>(Lcom/bv/wifisync/AddJob;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lcom/bv/wifisync/AddJob$ScheduleRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddJob$ScheduleRow;-><init>(Lcom/bv/wifisync/AddJob;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 550
    new-instance v2, Lcom/bv/wifisync/AddJob$DirectionRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddJob$DirectionRow;-><init>(Lcom/bv/wifisync/AddJob;)V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-instance v2, Lcom/bv/wifisync/AddJob$OverwriteRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddJob$OverwriteRow;-><init>(Lcom/bv/wifisync/AddJob;)V

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-instance v2, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;-><init>(Lcom/bv/wifisync/AddJob;)V

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-instance v2, Lcom/bv/wifisync/AddJob$FilterRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddJob$FilterRow;-><init>(Lcom/bv/wifisync/AddJob;)V

    aput-object v2, v0, v1

    .line 552
    .local v0, rowArray:[Lcom/bv/wifisync/AddJob$JobRow;
    new-instance v1, Lcom/bv/wifisync/PropertiesAdapter;

    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {v1, p0, v2}, Lcom/bv/wifisync/PropertiesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v1, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    .line 554
    iget-boolean v1, p0, Lcom/bv/wifisync/AddJob;->moreMode:Z

    if-eqz v1, :cond_0

    .line 555
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    new-instance v2, Lcom/bv/wifisync/AddJob$MediaScanRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddJob$MediaScanRow;-><init>(Lcom/bv/wifisync/AddJob;)V

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/PropertiesAdapter;->add(Ljava/lang/Object;)V

    .line 556
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->getSyncType()Lcom/bv/wifisync/Job$SyncType;

    move-result-object v1

    sget-object v2, Lcom/bv/wifisync/Job$SyncType;->Pictures:Lcom/bv/wifisync/Job$SyncType;

    if-ne v1, v2, :cond_3

    .line 557
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    instance-of v1, v1, Lcom/bv/wifisync/ImagePlugin;

    if-nez v1, :cond_2

    .line 558
    :cond_1
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    new-instance v2, Lcom/bv/wifisync/ImagePlugin;

    invoke-direct {v2}, Lcom/bv/wifisync/ImagePlugin;-><init>()V

    iput-object v2, v1, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    .line 559
    :cond_2
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    new-instance v2, Lcom/bv/wifisync/AddJob$GroupImagesRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddJob$GroupImagesRow;-><init>(Lcom/bv/wifisync/AddJob;)V

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/PropertiesAdapter;->add(Ljava/lang/Object;)V

    .line 567
    :goto_0
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddJob;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 568
    return-void

    .line 560
    :cond_3
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->getSyncType()Lcom/bv/wifisync/Job$SyncType;

    move-result-object v1

    sget-object v2, Lcom/bv/wifisync/Job$SyncType;->Music:Lcom/bv/wifisync/Job$SyncType;

    if-ne v1, v2, :cond_6

    .line 561
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    instance-of v1, v1, Lcom/bv/wifisync/Mp3Plugin;

    if-nez v1, :cond_5

    .line 562
    :cond_4
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    new-instance v2, Lcom/bv/wifisync/Mp3Plugin;

    invoke-direct {v2}, Lcom/bv/wifisync/Mp3Plugin;-><init>()V

    iput-object v2, v1, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    .line 563
    :cond_5
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    new-instance v2, Lcom/bv/wifisync/AddJob$GroupMp3Row;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddJob$GroupMp3Row;-><init>(Lcom/bv/wifisync/AddJob;)V

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/PropertiesAdapter;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 565
    :cond_6
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    goto :goto_0
.end method

.method private cancelAll()V
    .locals 2

    .prologue
    .line 646
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/PropertiesAdapter;->getCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 648
    return-void

    .line 647
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v1, v0}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/AddJob$JobRow;

    invoke-virtual {v1}, Lcom/bv/wifisync/AddJob$JobRow;->cancel()V

    .line 646
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private containsReadProtected(Ljava/lang/String;)Z
    .locals 7
    .parameter "phoneDir"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 580
    if-eqz p1, :cond_0

    .line 581
    const/4 v4, 0x3

    new-array v1, v4, [Ljava/lang/String;

    const-string v4, "/"

    aput-object v4, v1, v3

    const-string v4, "/sdcard"

    aput-object v4, v1, v2

    const/4 v4, 0x2

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v4

    .line 582
    .local v1, dirs:[Ljava/lang/String;
    array-length v5, v1

    move v4, v3

    :goto_0
    if-lt v4, v5, :cond_2

    .end local v1           #dirs:[Ljava/lang/String;
    :cond_0
    move v2, v3

    .line 586
    :cond_1
    return v2

    .line 582
    .restart local v1       #dirs:[Ljava/lang/String;
    :cond_2
    aget-object v0, v1, v4

    .line 583
    .local v0, dir:Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 582
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method private enableButtons()V
    .locals 2

    .prologue
    .line 612
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 613
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 614
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 612
    const/4 v0, 0x1

    .line 615
    .local v0, enabled:Z
    :goto_0
    const v1, 0x7f0a0003

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddJob;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 616
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob;->updateHelp()V

    .line 617
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 618
    return-void

    .line 612
    .end local v0           #enabled:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private readProtectedExcluded()Z
    .locals 3

    .prologue
    .line 590
    const/4 v0, 0x0

    .line 591
    .local v0, result:Z
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    if-eqz v1, :cond_0

    .line 592
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-boolean v0, v1, Lcom/bv/wifisync/Job$Filter;->ignoreReadProtected:Z

    .line 593
    if-nez v0, :cond_0

    .line 594
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, v1, Lcom/bv/wifisync/Job$Filter;->localFiles:Ljava/util/LinkedHashSet;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, v1, Lcom/bv/wifisync/Job$Filter;->localFiles:Ljava/util/LinkedHashSet;

    const-string v2, ".android_secure"

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    .line 596
    :cond_0
    :goto_0
    return v0

    .line 594
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private rename()V
    .locals 6

    .prologue
    .line 684
    new-instance v1, Landroid/widget/EditText;

    new-instance v3, Landroid/view/ContextThemeWrapper;

    const v4, 0x7f080002

    invoke-direct {v3, p0, v4}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v1, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 685
    .local v1, edit:Landroid/widget/EditText;
    const/16 v3, 0x2000

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 686
    iget-object v3, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v3}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 687
    iget-object v3, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v3}, Lcom/bv/wifisync/Job;->getDefaultName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 688
    const v3, 0x7f06013d

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f0600ea

    invoke-virtual {p0, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/bv/wifisync/AddJob$1;

    invoke-direct {v5, p0, v1}, Lcom/bv/wifisync/AddJob$1;-><init>(Lcom/bv/wifisync/AddJob;Landroid/widget/EditText;)V

    invoke-static {p0, v3, v4, v1, v5}, Lcom/bv/wifisync/Dialogs;->showInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Lcom/bv/wifisync/Dialogs$OnOkClickListener;)Landroid/app/AlertDialog;

    move-result-object v0

    .line 703
    .local v0, dialog:Landroid/app/AlertDialog;
    iget-object v3, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v3, p0}, Lcom/bv/wifisync/Job;->getDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 704
    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    .line 705
    .local v2, okButton:Landroid/widget/Button;
    new-instance v3, Lcom/bv/wifisync/AddJob$2;

    invoke-direct {v3, p0, v2}, Lcom/bv/wifisync/AddJob$2;-><init>(Lcom/bv/wifisync/AddJob;Landroid/widget/Button;)V

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 717
    return-void
.end method

.method private showEnumBrowser(III[Ljava/lang/String;[[II)V
    .locals 8
    .parameter "title"
    .parameter "helpId"
    .parameter "position"
    .parameter "values"
    .parameter "images"
    .parameter "selectedIndex"

    .prologue
    .line 621
    new-instance v6, Landroid/content/Intent;

    const-class v0, Lcom/bv/wifisync/EnumBrowser;

    invoke-direct {v6, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 622
    .local v6, intent:Landroid/content/Intent;
    const-string v7, "RESULT"

    new-instance v0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;

    move v1, p1

    move v2, p2

    move-object v3, p4

    move-object v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;-><init>(II[Ljava/lang/String;[[II)V

    invoke-virtual {v6, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 623
    invoke-virtual {p0, v6, p3}, Lcom/bv/wifisync/AddJob;->startActivityForResult(Landroid/content/Intent;I)V

    .line 624
    return-void
.end method

.method private showMore()V
    .locals 2

    .prologue
    .line 678
    iget-boolean v0, p0, Lcom/bv/wifisync/AddJob;->moreMode:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/bv/wifisync/AddJob;->moreMode:Z

    .line 679
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob;->addRows()V

    .line 680
    invoke-virtual {p0}, Lcom/bv/wifisync/AddJob;->getListView()Landroid/widget/ListView;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/PropertiesAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 681
    return-void

    .line 678
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private updateHelp()V
    .locals 3

    .prologue
    .line 571
    iget-object v2, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v2}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v1

    .line 572
    .local v1, phoneDir:Ljava/lang/String;
    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v2}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v0, 0x0

    .line 573
    .local v0, newJob:Z
    :goto_0
    invoke-direct {p0, v1}, Lcom/bv/wifisync/AddJob;->containsReadProtected(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/bv/wifisync/AddJob;->readProtectedExcluded()Z

    move-result v2

    if-nez v2, :cond_1

    .line 574
    const v2, 0x7f0600d6

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/AddJob;->setHelp(I)V

    .line 577
    :goto_1
    return-void

    .line 572
    .end local v0           #newJob:Z
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 576
    .restart local v0       #newJob:Z
    :cond_1
    if-eqz v0, :cond_2

    const v2, 0x7f0600d4

    :goto_2
    invoke-virtual {p0, v2}, Lcom/bv/wifisync/AddJob;->setHelp(I)V

    goto :goto_1

    :cond_2
    const v2, 0x7f0600d5

    goto :goto_2
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 602
    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 603
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v1, p1}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/AddJob$JobRow;

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "RESULT"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddJob$JobRow;->update(Ljava/lang/Object;)V

    .line 604
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob;->enableButtons()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 609
    :cond_0
    :goto_0
    return-void

    .line 606
    :catch_0
    move-exception v0

    .line 607
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 721
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onBackPressed()V

    .line 722
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob;->cancelAll()V

    .line 723
    return-void
.end method

.method public onButtonClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 628
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v1, p0}, Lcom/bv/wifisync/Job;->getLocalFolder(Landroid/content/Context;)Lcom/bv/sync/LocalFile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/sync/LocalFile;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 629
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const v3, 0x7f0600a5

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v3}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 630
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    iget-object v1, v1, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v2, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v1, v2, :cond_1

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v2}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->canWrite()Z

    move-result v1

    if-nez v1, :cond_1

    .line 631
    new-instance v1, Ljava/io/IOException;

    const v2, 0x7f06009c

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 633
    :cond_1
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getIgnoreSymLinks(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v1, p0}, Lcom/bv/wifisync/Job;->getLocalFolder(Landroid/content/Context;)Lcom/bv/sync/LocalFile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/sync/LocalFile;->isSymlink()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 634
    new-instance v1, Ljava/io/IOException;

    const v2, 0x7f0600b4

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 635
    :cond_2
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 636
    .local v0, result:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 637
    const-string v1, "RESULT1"

    iget-object v2, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    iget-object v2, v2, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 638
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/bv/wifisync/AddJob;->setResult(ILandroid/content/Intent;)V

    .line 639
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 640
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v1, p0}, Lcom/bv/wifisync/PropertiesAdapter;->dispatchGoogleAnalytics(Landroid/app/Activity;)V

    .line 641
    :cond_3
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob;->cancelAll()V

    .line 642
    invoke-virtual {p0}, Lcom/bv/wifisync/AddJob;->finish()V

    .line 643
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

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 537
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 538
    invoke-virtual {p0}, Lcom/bv/wifisync/AddJob;->getData()Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job;

    iput-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    .line 539
    iget-object v2, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {p0}, Lcom/bv/wifisync/AddJob;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "RESULT1"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Host;

    iput-object v1, v2, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    .line 540
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob;->addRows()V

    .line 541
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v0

    .line 542
    .local v0, name:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    const v1, 0x7f0600f9

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    .end local v0           #name:Ljava/lang/String;
    :cond_0
    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddJob;->setTitle(Ljava/lang/CharSequence;)V

    .line 543
    invoke-virtual {p0}, Lcom/bv/wifisync/AddJob;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddJob;->registerForContextMenu(Landroid/view/View;)V

    .line 544
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob;->enableButtons()V

    .line 545
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v2, 0x1

    .line 652
    invoke-virtual {p0}, Lcom/bv/wifisync/AddJob;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v3, 0x7f090008

    invoke-virtual {v1, v3, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 653
    const v1, 0x7f0a002e

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 654
    .local v0, item:Landroid/view/MenuItem;
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->getHistory()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 655
    return v2

    .line 654
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 660
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 661
    .local v0, itemId:I
    const v1, 0x7f0a002e

    if-ne v0, v1, :cond_1

    .line 662
    iget-object v1, p0, Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v1, p0}, Lcom/bv/wifisync/Job;->showHistory(Landroid/content/Context;)V

    .line 667
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1

    .line 663
    :cond_1
    const v1, 0x7f0a002f

    if-ne v0, v1, :cond_2

    .line 664
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob;->rename()V

    goto :goto_0

    .line 665
    :cond_2
    const v1, 0x7f0a0030

    if-ne v0, v1, :cond_0

    .line 666
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob;->showMore()V

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 672
    const v1, 0x7f0a0030

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 673
    .local v0, item:Landroid/view/MenuItem;
    iget-boolean v1, p0, Lcom/bv/wifisync/AddJob;->moreMode:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 674
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v1

    return v1

    .line 673
    :cond_0
    const/4 v1, 0x1

    goto :goto_0
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
