.class public Lcom/bv/wifisync/AddRouter;
.super Lcom/bv/wifisync/BrowseActivity;
.source "AddRouter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/AddRouter$RouterInfo;,
        Lcom/bv/wifisync/AddRouter$RoutersAdapter;
    }
.end annotation


# instance fields
.field private adapter:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

.field private biller:Lcom/bv/wifisync/DonateBiller;

.field private schedule:Lcom/bv/wifisync/SyncSchedule;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    .line 35
    new-instance v0, Lcom/bv/wifisync/AddRouter$1;

    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->AddRouter:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-direct {v0, p0, p0, v1}, Lcom/bv/wifisync/AddRouter$1;-><init>(Lcom/bv/wifisync/AddRouter;Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    iput-object v0, p0, Lcom/bv/wifisync/AddRouter;->biller:Lcom/bv/wifisync/DonateBiller;

    .line 32
    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/AddRouter;)V
    .locals 0
    .parameter

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/bv/wifisync/AddRouter;->closeActivity()V

    return-void
.end method

.method static synthetic access$4(Lcom/bv/wifisync/AddRouter;)Lcom/bv/wifisync/AddRouter$RoutersAdapter;
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter;->adapter:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    return-object v0
.end method

.method static synthetic access$5(Lcom/bv/wifisync/AddRouter;)Lcom/bv/wifisync/SyncSchedule;
    .locals 1
    .parameter

    .prologue
    .line 33
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter;->schedule:Lcom/bv/wifisync/SyncSchedule;

    return-object v0
.end method

.method private closeActivity()V
    .locals 6

    .prologue
    .line 54
    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    .line 55
    .local v3, selectedRouters:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v4, p0, Lcom/bv/wifisync/AddRouter;->adapter:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    invoke-virtual {v4}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->getCount()I

    move-result v4

    if-lt v0, v4, :cond_1

    .line 60
    iget-object v4, p0, Lcom/bv/wifisync/AddRouter;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v3}, Ljava/util/LinkedHashSet;->size()I

    move-result v5

    if-nez v5, :cond_0

    const/4 v3, 0x0

    .end local v3           #selectedRouters:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    :cond_0
    iput-object v3, v4, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    .line 61
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 62
    .local v2, result:Landroid/content/Intent;
    const-string v4, "RESULT"

    iget-object v5, p0, Lcom/bv/wifisync/AddRouter;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 63
    const/4 v4, -0x1

    invoke-virtual {p0, v4, v2}, Lcom/bv/wifisync/AddRouter;->setResult(ILandroid/content/Intent;)V

    .line 64
    invoke-virtual {p0}, Lcom/bv/wifisync/AddRouter;->finish()V

    .line 65
    return-void

    .line 56
    .end local v2           #result:Landroid/content/Intent;
    .restart local v3       #selectedRouters:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    :cond_1
    iget-object v4, p0, Lcom/bv/wifisync/AddRouter;->adapter:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    invoke-virtual {v4, v0}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/AddRouter$RouterInfo;

    .line 57
    .local v1, item:Lcom/bv/wifisync/AddRouter$RouterInfo;
    iget-boolean v4, v1, Lcom/bv/wifisync/AddRouter$RouterInfo;->checked:Z

    if-eqz v4, :cond_2

    .line 58
    iget-object v4, v1, Lcom/bv/wifisync/AddRouter$RouterInfo;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 55
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private getCheckCount()I
    .locals 3

    .prologue
    .line 76
    const/4 v1, 0x0

    .line 77
    .local v1, result:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/bv/wifisync/AddRouter;->adapter:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    invoke-virtual {v2}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->getCount()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 80
    return v1

    .line 78
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/AddRouter;->adapter:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/AddRouter$RouterInfo;

    iget-boolean v2, v2, Lcom/bv/wifisync/AddRouter$RouterInfo;->checked:Z

    if-eqz v2, :cond_1

    .line 79
    add-int/lit8 v1, v1, 0x1

    .line 77
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected onButtonClick(Landroid/view/View;)V
    .locals 1
    .parameter "arg0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter;->biller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->isPurchased()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/bv/wifisync/AddRouter;->getCheckCount()I

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter;->biller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->purchase()V

    .line 73
    :goto_0
    return-void

    .line 72
    :cond_0
    invoke-direct {p0}, Lcom/bv/wifisync/AddRouter;->closeActivity()V

    goto :goto_0
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
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 44
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 45
    invoke-virtual {p0}, Lcom/bv/wifisync/AddRouter;->getData()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/SyncSchedule;

    iput-object v0, p0, Lcom/bv/wifisync/AddRouter;->schedule:Lcom/bv/wifisync/SyncSchedule;

    .line 46
    const v0, 0x7f060100

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddRouter;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddRouter;->setTitle(Ljava/lang/CharSequence;)V

    .line 47
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter;->buttonOk:Landroid/widget/Button;

    const v1, 0x104000a

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 48
    const v0, 0x7f0600e4

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddRouter;->setHelp(I)V

    .line 49
    new-instance v0, Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    invoke-direct {v0, p0}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;-><init>(Lcom/bv/wifisync/AddRouter;)V

    iput-object v0, p0, Lcom/bv/wifisync/AddRouter;->adapter:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    .line 50
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter;->adapter:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddRouter;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 51
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 199
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onDestroy()V

    .line 200
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter;->biller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->close()V

    .line 201
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
