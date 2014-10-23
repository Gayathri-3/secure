.class abstract Lcom/bv/wifisync/DonateBiller;
.super Lcom/bv/wifisync/PremiumBiller;
.source "Biller.java"


# direct methods
.method constructor <init>(Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V
    .locals 0
    .parameter "activity"
    .parameter "chargeType"

    .prologue
    .line 212
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/PremiumBiller;-><init>(Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    .line 213
    return-void
.end method


# virtual methods
.method protected getPurchaseString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 217
    sget-object v0, Lcom/bv/wifisync/Biller$ChargeType;->Donate:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-virtual {v0}, Lcom/bv/wifisync/Biller$ChargeType;->getPurchaseString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
