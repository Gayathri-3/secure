.class Lcom/bv/billing/BillingService$GetPurchaseInformation;
.super Lcom/bv/billing/BillingService$BillingRequest;
.source "BillingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/billing/BillingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GetPurchaseInformation"
.end annotation


# instance fields
.field mNonce:J

.field final mNotifyIds:[Ljava/lang/String;

.field final synthetic this$0:Lcom/bv/billing/BillingService;


# direct methods
.method public constructor <init>(Lcom/bv/billing/BillingService;I[Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "startId"
    .parameter "notifyIds"

    .prologue
    .line 278
    iput-object p1, p0, Lcom/bv/billing/BillingService$GetPurchaseInformation;->this$0:Lcom/bv/billing/BillingService;

    .line 279
    invoke-direct {p0, p1, p2}, Lcom/bv/billing/BillingService$BillingRequest;-><init>(Lcom/bv/billing/BillingService;I)V

    .line 280
    iput-object p3, p0, Lcom/bv/billing/BillingService$GetPurchaseInformation;->mNotifyIds:[Ljava/lang/String;

    .line 281
    return-void
.end method


# virtual methods
.method protected onRemoteException(Landroid/os/RemoteException;)V
    .locals 2
    .parameter "e"

    .prologue
    .line 298
    invoke-super {p0, p1}, Lcom/bv/billing/BillingService$BillingRequest;->onRemoteException(Landroid/os/RemoteException;)V

    .line 299
    iget-wide v0, p0, Lcom/bv/billing/BillingService$GetPurchaseInformation;->mNonce:J

    invoke-static {v0, v1}, Lcom/bv/billing/Security;->removeNonce(J)V

    .line 300
    return-void
.end method

.method protected run()J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 285
    invoke-static {}, Lcom/bv/billing/Security;->generateNonce()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/bv/billing/BillingService$GetPurchaseInformation;->mNonce:J

    .line 287
    const-string v2, "GET_PURCHASE_INFORMATION"

    invoke-virtual {p0, v2}, Lcom/bv/billing/BillingService$GetPurchaseInformation;->makeRequestBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 288
    .local v0, request:Landroid/os/Bundle;
    const-string v2, "NONCE"

    iget-wide v3, p0, Lcom/bv/billing/BillingService$GetPurchaseInformation;->mNonce:J

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 289
    const-string v2, "NOTIFY_IDS"

    iget-object v3, p0, Lcom/bv/billing/BillingService$GetPurchaseInformation;->mNotifyIds:[Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 290
    invoke-static {}, Lcom/bv/billing/BillingService;->access$2()Lcom/android/vending/billing/IMarketBillingService;

    move-result-object v2

    invoke-interface {v2, v0}, Lcom/android/vending/billing/IMarketBillingService;->sendBillingRequest(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    .line 291
    .local v1, response:Landroid/os/Bundle;
    const-string v2, "getPurchaseInformation"

    invoke-virtual {p0, v2, v1}, Lcom/bv/billing/BillingService$GetPurchaseInformation;->logResponseCode(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 292
    const-string v2, "REQUEST_ID"

    .line 293
    sget-wide v3, Lcom/bv/billing/Consts;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    .line 292
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    return-wide v2
.end method
