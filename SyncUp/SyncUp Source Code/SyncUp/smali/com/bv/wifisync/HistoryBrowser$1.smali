.class Lcom/bv/wifisync/HistoryBrowser$1;
.super Lcom/bv/wifisync/PropertiesAdapter;
.source "HistoryBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/HistoryBrowser;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/PropertiesAdapter",
        "<",
        "Lcom/bv/wifisync/HistoryBrowser$HistoryRow;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/HistoryBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HistoryBrowser;Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter

    .prologue
    .line 1
    .local p3, $anonymous1:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/HistoryBrowser$HistoryRow;>;"
    iput-object p1, p0, Lcom/bv/wifisync/HistoryBrowser$1;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    .line 88
    invoke-direct {p0, p2, p3}, Lcom/bv/wifisync/PropertiesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 90
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/PropertiesAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 91
    .local v1, result:Landroid/view/View;
    const v2, 0x7f0a0004

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 92
    .local v0, imageview:Landroid/widget/ImageView;
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 93
    return-object v1
.end method

.method public isEnabled(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 98
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HistoryBrowser$1;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/bv/wifisync/HistoryBrowser$ClickableHistoryRow;

    return v0
.end method
