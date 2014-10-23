.class Lcom/bv/wifisync/MultiSelectDirBrowser$1;
.super Lcom/bv/wifisync/DonateBiller;
.source "MultiSelectDirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/MultiSelectDirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/MultiSelectDirBrowser;Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$1;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    .line 23
    invoke-direct {p0, p2, p3}, Lcom/bv/wifisync/DonateBiller;-><init>(Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    return-void
.end method


# virtual methods
.method onPurchase()V
    .locals 2

    .prologue
    .line 26
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$1;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    const/4 v1, -0x1

    #calls: Lcom/bv/wifisync/MultiSelectDirBrowser;->returnResult(I)V
    invoke-static {v0, v1}, Lcom/bv/wifisync/MultiSelectDirBrowser;->access$2(Lcom/bv/wifisync/MultiSelectDirBrowser;I)V

    .line 27
    return-void
.end method
