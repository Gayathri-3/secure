.class Lcom/bv/wifisync/HostBrowser$HostInfoRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "HostBrowser.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/HostBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HostInfoRow"
.end annotation


# instance fields
.field final hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;

.field final synthetic this$0:Lcom/bv/wifisync/HostBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HostBrowser;Lcom/bv/sync/CifsUtils$HostInfo;)V
    .locals 1
    .parameter
    .parameter "hostInfo"

    .prologue
    .line 40
    iput-object p1, p0, Lcom/bv/wifisync/HostBrowser$HostInfoRow;->this$0:Lcom/bv/wifisync/HostBrowser;

    .line 41
    iget-object v0, p2, Lcom/bv/sync/CifsUtils$HostInfo;->name:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 42
    iput-object p2, p0, Lcom/bv/wifisync/HostBrowser$HostInfoRow;->hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;

    .line 43
    return-void
.end method


# virtual methods
.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostInfoRow;->this$0:Lcom/bv/wifisync/HostBrowser;

    invoke-virtual {v0}, Lcom/bv/wifisync/HostBrowser;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020004

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getMissingValueText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostInfoRow;->this$0:Lcom/bv/wifisync/HostBrowser;

    const v1, 0x7f0601b3

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/HostBrowser;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostInfoRow;->hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;

    iget-object v0, v0, Lcom/bv/sync/CifsUtils$HostInfo;->ip:Ljava/lang/String;

    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser$HostInfoRow;->hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;

    iget-object v1, v1, Lcom/bv/sync/CifsUtils$HostInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    const/4 v0, 0x0

    .line 54
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostInfoRow;->hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;

    iget-object v0, v0, Lcom/bv/sync/CifsUtils$HostInfo;->ip:Ljava/lang/String;

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "paramView"

    .prologue
    .line 47
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostInfoRow;->this$0:Lcom/bv/wifisync/HostBrowser;

    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser$HostInfoRow;->hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;

    #calls: Lcom/bv/wifisync/HostBrowser;->finish(Lcom/bv/sync/CifsUtils$HostInfo;)V
    invoke-static {v0, v1}, Lcom/bv/wifisync/HostBrowser;->access$2(Lcom/bv/wifisync/HostBrowser;Lcom/bv/sync/CifsUtils$HostInfo;)V

    .line 48
    return-void
.end method
