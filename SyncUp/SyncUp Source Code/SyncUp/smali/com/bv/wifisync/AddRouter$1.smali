.class Lcom/bv/wifisync/AddRouter$1;
.super Lcom/bv/wifisync/DonateBiller;
.source "AddRouter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddRouter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddRouter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddRouter;Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddRouter$1;->this$0:Lcom/bv/wifisync/AddRouter;

    .line 35
    invoke-direct {p0, p2, p3}, Lcom/bv/wifisync/DonateBiller;-><init>(Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    return-void
.end method


# virtual methods
.method onPurchase()V
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter$1;->this$0:Lcom/bv/wifisync/AddRouter;

    #calls: Lcom/bv/wifisync/AddRouter;->closeActivity()V
    invoke-static {v0}, Lcom/bv/wifisync/AddRouter;->access$3(Lcom/bv/wifisync/AddRouter;)V

    .line 39
    return-void
.end method
