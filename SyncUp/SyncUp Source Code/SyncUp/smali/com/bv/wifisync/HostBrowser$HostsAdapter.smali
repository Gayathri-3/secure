.class Lcom/bv/wifisync/HostBrowser$HostsAdapter;
.super Lcom/bv/wifisync/PropertiesAdapter;
.source "HostBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/HostBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HostsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/PropertiesAdapter",
        "<",
        "Lcom/bv/wifisync/HostBrowser$HostInfoRow;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/HostBrowser;


# direct methods
.method public constructor <init>(Lcom/bv/wifisync/HostBrowser;)V
    .locals 1
    .parameter

    .prologue
    .line 275
    iput-object p1, p0, Lcom/bv/wifisync/HostBrowser$HostsAdapter;->this$0:Lcom/bv/wifisync/HostBrowser;

    .line 276
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertiesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 277
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 281
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/PropertiesAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 282
    .local v1, result:Landroid/view/View;
    const v2, 0x7f0a0007

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 283
    .local v0, checkMoreView:Landroid/view/View;
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 284
    return-object v1
.end method
