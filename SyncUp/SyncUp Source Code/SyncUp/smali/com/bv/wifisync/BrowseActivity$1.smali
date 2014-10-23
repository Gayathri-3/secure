.class Lcom/bv/wifisync/BrowseActivity$1;
.super Lcom/bv/wifisync/DonateBiller;
.source "BrowseActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/BrowseActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/BrowseActivity;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/BrowseActivity;Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/BrowseActivity$1;->this$0:Lcom/bv/wifisync/BrowseActivity;

    .line 50
    invoke-direct {p0, p2, p3}, Lcom/bv/wifisync/DonateBiller;-><init>(Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    return-void
.end method


# virtual methods
.method onPurchase()V
    .locals 0

    .prologue
    .line 52
    return-void
.end method
