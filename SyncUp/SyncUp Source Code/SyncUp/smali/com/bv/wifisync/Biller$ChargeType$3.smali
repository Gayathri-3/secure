.class enum Lcom/bv/wifisync/Biller$ChargeType$3;
.super Lcom/bv/wifisync/Biller$ChargeType;
.source "Biller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Biller$ChargeType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4000
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/bv/wifisync/Biller$ChargeType;-><init>(Ljava/lang/String;ILcom/bv/wifisync/Biller$ChargeType;)V

    .line 1
    return-void
.end method


# virtual methods
.method public getPurchaseString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    const-string v0, "com.bv.wifisync.excludedir"

    return-object v0
.end method
