.class public Lcom/bv/wifisync/HostBrowser;
.super Lcom/bv/wifisync/BrowseActivity;
.source "HostBrowser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/HostBrowser$HostFetcher;,
        Lcom/bv/wifisync/HostBrowser$HostInfoRow;,
        Lcom/bv/wifisync/HostBrowser$HostsAdapter;,
        Lcom/bv/wifisync/HostBrowser$IpFinder;,
        Lcom/bv/wifisync/HostBrowser$ProgressInfo;
    }
.end annotation


# instance fields
.field private adapter:Lcom/bv/wifisync/HostBrowser$HostsAdapter;

.field private hostFetcher:Lcom/bv/wifisync/HostBrowser$HostFetcher;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    return-void
.end method

.method static synthetic access$2(Lcom/bv/wifisync/HostBrowser;Lcom/bv/sync/CifsUtils$HostInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 255
    invoke-direct {p0, p1}, Lcom/bv/wifisync/HostBrowser;->finish(Lcom/bv/sync/CifsUtils$HostInfo;)V

    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/HostBrowser;)Lcom/bv/wifisync/HostBrowser$HostsAdapter;
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser;->adapter:Lcom/bv/wifisync/HostBrowser$HostsAdapter;

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/HostBrowser;)Lcom/bv/wifisync/HostBrowser$HostFetcher;
    .locals 1
    .parameter

    .prologue
    .line 35
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser;->hostFetcher:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    return-object v0
.end method

.method private buildIpStartString(II)Ljava/lang/String;
    .locals 7
    .parameter "ip"
    .parameter "mask"

    .prologue
    .line 379
    const/4 v5, -0x1

    rsub-int/lit8 v6, p2, 0x20

    shl-int v3, v5, v6

    .line 380
    .local v3, netMask:I
    and-int v2, p1, v3

    .line 381
    .local v2, lowest:I
    const/4 v5, 0x4

    new-array v0, v5, [B

    const/4 v5, 0x0

    shr-int/lit8 v6, v2, 0x18

    int-to-byte v6, v6

    aput-byte v6, v0, v5

    const/4 v5, 0x1

    shl-int/lit8 v6, v2, 0x8

    shr-int/lit8 v6, v6, 0x18

    int-to-byte v6, v6

    aput-byte v6, v0, v5

    const/4 v5, 0x2

    shl-int/lit8 v6, v2, 0x10

    shr-int/lit8 v6, v6, 0x18

    int-to-byte v6, v6

    aput-byte v6, v0, v5

    const/4 v5, 0x3

    shl-int/lit8 v6, v2, 0x18

    shr-int/lit8 v6, v6, 0x18

    int-to-byte v6, v6

    aput-byte v6, v0, v5

    .line 382
    .local v0, bytes:[B
    const-string v4, ""

    .line 383
    .local v4, result:Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v5, v0

    if-ge v1, v5, :cond_0

    div-int/lit8 v5, p2, 0x8

    if-lt v1, v5, :cond_1

    .line 385
    :cond_0
    return-object v4

    .line 384
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-byte v6, v0, v1

    and-int/lit16 v6, v6, 0xff

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 383
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private cancelScan()V
    .locals 1

    .prologue
    .line 270
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser;->hostFetcher:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    if-eqz v0, :cond_0

    .line 271
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser;->hostFetcher:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    invoke-virtual {v0}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->cancel()V

    .line 272
    :cond_0
    return-void
.end method

.method private finish(Lcom/bv/sync/CifsUtils$HostInfo;)V
    .locals 2
    .parameter "hostInfo"

    .prologue
    .line 256
    invoke-direct {p0}, Lcom/bv/wifisync/HostBrowser;->cancelScan()V

    .line 257
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 258
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "RESULT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 259
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/bv/wifisync/HostBrowser;->setResult(ILandroid/content/Intent;)V

    .line 260
    invoke-virtual {p0}, Lcom/bv/wifisync/HostBrowser;->finish()V

    .line 261
    return-void
.end method

.method private getStartIps()[Ljava/lang/String;
    .locals 9

    .prologue
    .line 366
    :try_start_0
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getNetInfo(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 367
    .local v3, ipInfo:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    new-array v5, v6, [Ljava/lang/String;

    .line 368
    .local v5, result:[Ljava/lang/String;
    const/4 v1, 0x0

    .line 369
    .local v1, i:I
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v2, v1

    .end local v1           #i:I
    .local v2, i:I
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 374
    .end local v2           #i:I
    .end local v3           #ipInfo:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    .end local v5           #result:[Ljava/lang/String;
    :goto_1
    return-object v5

    .line 369
    .restart local v2       #i:I
    .restart local v3       #ipInfo:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    .restart local v5       #result:[Ljava/lang/String;
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/wifisync/Utils$NetInfo;

    .line 370
    .local v4, netInfo:Lcom/bv/wifisync/Utils$NetInfo;
    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    iget v7, v4, Lcom/bv/wifisync/Utils$NetInfo;->ip:I

    iget v8, v4, Lcom/bv/wifisync/Utils$NetInfo;->mask:I

    invoke-direct {p0, v7, v8}, Lcom/bv/wifisync/HostBrowser;->buildIpStartString(II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v1

    .end local v1           #i:I
    .restart local v2       #i:I
    goto :goto_0

    .line 372
    .end local v2           #i:I
    .end local v3           #ipInfo:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    .end local v4           #netInfo:Lcom/bv/wifisync/Utils$NetInfo;
    .end local v5           #result:[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 373
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 374
    const/4 v6, 0x0

    new-array v5, v6, [Ljava/lang/String;

    goto :goto_1
.end method


# virtual methods
.method public onBackPressed()V
    .locals 0

    .prologue
    .line 251
    invoke-direct {p0}, Lcom/bv/wifisync/HostBrowser;->cancelScan()V

    .line 252
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onBackPressed()V

    .line 253
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
    .line 290
    invoke-direct {p0}, Lcom/bv/wifisync/HostBrowser;->cancelScan()V

    .line 291
    new-instance v0, Lcom/bv/wifisync/HostBrowser$HostFetcher;

    invoke-direct {v0, p0}, Lcom/bv/wifisync/HostBrowser$HostFetcher;-><init>(Lcom/bv/wifisync/HostBrowser;)V

    iput-object v0, p0, Lcom/bv/wifisync/HostBrowser;->hostFetcher:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    .line 292
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser;->adapter:Lcom/bv/wifisync/HostBrowser$HostsAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/HostBrowser$HostsAdapter;->clear()V

    .line 293
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser;->hostFetcher:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Void;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->run([Ljava/lang/Object;)V

    .line 294
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
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    .line 70
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 71
    const v1, 0x7f060127

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/HostBrowser;->setTitle(I)V

    .line 72
    const v1, 0x7f0600d7

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/HostBrowser;->setHelp(I)V

    .line 73
    new-instance v1, Lcom/bv/wifisync/HostBrowser$HostsAdapter;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/HostBrowser$HostsAdapter;-><init>(Lcom/bv/wifisync/HostBrowser;)V

    iput-object v1, p0, Lcom/bv/wifisync/HostBrowser;->adapter:Lcom/bv/wifisync/HostBrowser$HostsAdapter;

    .line 74
    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser;->adapter:Lcom/bv/wifisync/HostBrowser$HostsAdapter;

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/HostBrowser;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 75
    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser;->buttonOk:Landroid/widget/Button;

    const v2, 0x7f060169

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(I)V

    .line 76
    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser;->buttonOk:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    :try_start_0
    new-instance v1, Lcom/bv/wifisync/HostBrowser$HostFetcher;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/HostBrowser$HostFetcher;-><init>(Lcom/bv/wifisync/HostBrowser;)V

    iput-object v1, p0, Lcom/bv/wifisync/HostBrowser;->hostFetcher:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    .line 79
    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser;->hostFetcher:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Void;

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->run([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    :goto_0
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, e:Ljava/io/IOException;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 298
    invoke-virtual {p0}, Lcom/bv/wifisync/HostBrowser;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f090005

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 299
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 8
    .parameter "item"

    .prologue
    .line 331
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v5

    const v6, 0x7f0a0028

    if-ne v5, v6, :cond_2

    .line 332
    invoke-direct {p0}, Lcom/bv/wifisync/HostBrowser;->getStartIps()[Ljava/lang/String;

    move-result-object v4

    .line 333
    .local v4, ips:[Ljava/lang/String;
    new-instance v1, Landroid/view/ContextThemeWrapper;

    const v5, 0x7f080002

    invoke-direct {v1, p0, v5}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 334
    .local v1, contextThemeWrapper:Landroid/view/ContextThemeWrapper;
    new-instance v3, Lcom/bv/wifisync/HostBrowser$1;

    invoke-direct {v3, p0, v1}, Lcom/bv/wifisync/HostBrowser$1;-><init>(Lcom/bv/wifisync/HostBrowser;Landroid/content/Context;)V

    .line 340
    .local v3, edit:Landroid/widget/AutoCompleteTextView;
    array-length v5, v4

    const/4 v6, 0x1

    if-le v5, v6, :cond_0

    .line 341
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v5, 0x1090003

    invoke-direct {v0, p0, v5, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 342
    .local v0, adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {v3, v0}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 344
    .end local v0           #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    :cond_0
    array-length v5, v4

    if-lez v5, :cond_1

    .line 345
    const/4 v5, 0x0

    aget-object v5, v4, v5

    invoke-virtual {v3, v5}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 347
    :cond_1
    invoke-virtual {v3}, Landroid/widget/AutoCompleteTextView;->getInputType()I

    move-result v5

    const/high16 v6, 0x8

    or-int/2addr v5, v6

    invoke-virtual {v3, v5}, Landroid/widget/AutoCompleteTextView;->setInputType(I)V

    .line 348
    const v5, 0x7f06016b

    invoke-virtual {p0, v5}, Lcom/bv/wifisync/HostBrowser;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 349
    const v6, 0x7f06016c

    invoke-virtual {p0, v6}, Lcom/bv/wifisync/HostBrowser;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/bv/wifisync/HostBrowser$2;

    invoke-direct {v7, p0, v3}, Lcom/bv/wifisync/HostBrowser$2;-><init>(Lcom/bv/wifisync/HostBrowser;Landroid/widget/AutoCompleteTextView;)V

    .line 348
    invoke-static {p0, v5, v6, v3, v7}, Lcom/bv/wifisync/Dialogs;->showInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Lcom/bv/wifisync/Dialogs$OnOkClickListener;)Landroid/app/AlertDialog;

    move-result-object v2

    .line 358
    .local v2, dialog:Landroid/app/AlertDialog;
    const v5, 0x7f020004

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog;->setIcon(I)V

    .line 359
    invoke-virtual {v3}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    .line 361
    .end local v1           #contextThemeWrapper:Landroid/view/ContextThemeWrapper;
    .end local v2           #dialog:Landroid/app/AlertDialog;
    .end local v3           #edit:Landroid/widget/AutoCompleteTextView;
    .end local v4           #ips:[Ljava/lang/String;
    :cond_2
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v5

    return v5
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
    .line 265
    invoke-direct {p0}, Lcom/bv/wifisync/HostBrowser;->cancelScan()V

    .line 266
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onProgressCancelClick(Landroid/view/View;)V

    .line 267
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
