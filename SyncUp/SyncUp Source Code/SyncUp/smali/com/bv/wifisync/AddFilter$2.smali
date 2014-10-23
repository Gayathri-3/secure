.class Lcom/bv/wifisync/AddFilter$2;
.super Lcom/bv/wifisync/PropertiesAdapter;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddFilter;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/PropertiesAdapter",
        "<",
        "Lcom/bv/wifisync/AddFilter$FilterRow;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter

    .prologue
    .line 1
    .local p3, $anonymous1:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/AddFilter$FilterRow;>;"
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$2;->this$0:Lcom/bv/wifisync/AddFilter;

    .line 507
    invoke-direct {p0, p2, p3}, Lcom/bv/wifisync/PropertiesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    return-void
.end method

.method private isHeader(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 535
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddFilter$2;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/bv/wifisync/AddFilter$HeaderRow;

    return v0
.end method


# virtual methods
.method public getItemViewType(I)I
    .locals 1
    .parameter "position"

    .prologue
    .line 526
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddFilter$2;->isHeader(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 510
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/PropertiesAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 511
    .local v1, result:Landroid/view/View;
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddFilter$2;->isHeader(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 512
    const v2, 0x1080012

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 513
    const v2, 0x7f0a0004

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 514
    .local v0, image:Landroid/widget/ImageView;
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 516
    .end local v0           #image:Landroid/widget/ImageView;
    :cond_0
    return-object v1
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 521
    const/4 v0, 0x2

    return v0
.end method

.method public isEnabled(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 531
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddFilter$2;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/AddFilter$FilterRow;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddFilter$FilterRow;->getEnabled()Z

    move-result v0

    return v0
.end method
