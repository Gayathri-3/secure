.class Lcom/bv/wifisync/PremiumBiller$1;
.super Ljava/lang/Object;
.source "Biller.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnConfirmListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/PremiumBiller;->purchase()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/PremiumBiller;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/PremiumBiller;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/PremiumBiller$1;->this$0:Lcom/bv/wifisync/PremiumBiller;

    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfirm()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 194
    iget-object v0, p0, Lcom/bv/wifisync/PremiumBiller$1;->this$0:Lcom/bv/wifisync/PremiumBiller;

    iget-object v1, p0, Lcom/bv/wifisync/PremiumBiller$1;->this$0:Lcom/bv/wifisync/PremiumBiller;

    iget-object v1, v1, Lcom/bv/wifisync/PremiumBiller;->chargeType:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Biller$ChargeType;->getPurchaseString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Charge"

    #calls: Lcom/bv/wifisync/PremiumBiller;->track(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v1, v2}, Lcom/bv/wifisync/PremiumBiller;->access$0(Lcom/bv/wifisync/PremiumBiller;Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    iget-object v0, p0, Lcom/bv/wifisync/PremiumBiller$1;->this$0:Lcom/bv/wifisync/PremiumBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/PremiumBiller;->charge()V

    .line 196
    return-void
.end method
