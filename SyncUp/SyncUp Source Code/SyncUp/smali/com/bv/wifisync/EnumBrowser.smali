.class public Lcom/bv/wifisync/EnumBrowser;
.super Lcom/bv/wifisync/BrowseActivity;
.source "EnumBrowser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/EnumBrowser$Enumeration;,
        Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;,
        Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;
    }
.end annotation


# instance fields
.field private enumeration:Lcom/bv/wifisync/EnumBrowser$Enumeration;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/EnumBrowser;)Lcom/bv/wifisync/EnumBrowser$Enumeration;
    .locals 1
    .parameter

    .prologue
    .line 24
    iget-object v0, p0, Lcom/bv/wifisync/EnumBrowser;->enumeration:Lcom/bv/wifisync/EnumBrowser$Enumeration;

    return-object v0
.end method


# virtual methods
.method public onButtonClick(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 165
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
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    .line 124
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 125
    invoke-virtual {p0}, Lcom/bv/wifisync/EnumBrowser;->getData()Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Lcom/bv/wifisync/EnumBrowser$Enumeration;

    iput-object v3, p0, Lcom/bv/wifisync/EnumBrowser;->enumeration:Lcom/bv/wifisync/EnumBrowser$Enumeration;

    .line 126
    iget-object v3, p0, Lcom/bv/wifisync/EnumBrowser;->enumeration:Lcom/bv/wifisync/EnumBrowser$Enumeration;

    invoke-virtual {v3, p0}, Lcom/bv/wifisync/EnumBrowser$Enumeration;->getTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/EnumBrowser;->setTitle(Ljava/lang/CharSequence;)V

    .line 127
    iget-object v3, p0, Lcom/bv/wifisync/EnumBrowser;->buttonOk:Landroid/widget/Button;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 128
    iget-object v3, p0, Lcom/bv/wifisync/EnumBrowser;->enumeration:Lcom/bv/wifisync/EnumBrowser$Enumeration;

    iget v3, v3, Lcom/bv/wifisync/EnumBrowser$Enumeration;->hint:I

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/EnumBrowser;->setHelp(I)V

    .line 129
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .local v2, values:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/bv/wifisync/EnumBrowser;->enumeration:Lcom/bv/wifisync/EnumBrowser$Enumeration;

    invoke-virtual {v3}, Lcom/bv/wifisync/EnumBrowser$Enumeration;->getValues()[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v5, :cond_0

    .line 133
    new-instance v0, Lcom/bv/wifisync/EnumBrowser$1;

    const v3, 0x7f0a000a

    invoke-direct {v0, p0, p0, v3, v2}, Lcom/bv/wifisync/EnumBrowser$1;-><init>(Lcom/bv/wifisync/EnumBrowser;Landroid/content/Context;ILjava/util/List;)V

    .line 152
    .local v0, adapter:Landroid/widget/ListAdapter;
    invoke-virtual {p0}, Lcom/bv/wifisync/EnumBrowser;->getListView()Landroid/widget/ListView;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 153
    invoke-virtual {p0}, Lcom/bv/wifisync/EnumBrowser;->getListView()Landroid/widget/ListView;

    move-result-object v3

    new-instance v4, Lcom/bv/wifisync/EnumBrowser$2;

    invoke-direct {v4, p0}, Lcom/bv/wifisync/EnumBrowser$2;-><init>(Lcom/bv/wifisync/EnumBrowser;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 162
    return-void

    .line 130
    .end local v0           #adapter:Landroid/widget/ListAdapter;
    :cond_0
    aget-object v1, v4, v3

    .line 131
    .local v1, value:Ljava/lang/String;
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
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
