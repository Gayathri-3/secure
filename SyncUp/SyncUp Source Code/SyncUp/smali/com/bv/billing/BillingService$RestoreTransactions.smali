.class public Lcom/bv/billing/BillingService$RestoreTransactions;
.super Lcom/bv/billing/BillingService$BillingRequest;
.source "BillingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/billing/BillingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RestoreTransactions"
.end annotation


# instance fields
.field mNonce:J

.field final synthetic this$0:Lcom/bv/billing/BillingService;


# direct methods
.method public constructor <init>(Lcom/bv/billing/BillingService;)V
    .locals 1
    .parameter

    .prologue
    .line 309
    iput-object p1, p0, Lcom/bv/billing/BillingService$RestoreTransactions;->this$0:Lcom/bv/billing/BillingService;

    .line 313
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lcom/bv/billing/BillingService$BillingRequest;-><init>(Lcom/bv/billing/BillingService;I)V

    .line 314
    return-void
.end method


# virtual methods
.method public bridge synthetic getStartId()I
    .locals 1

    .prologue
    .line 1
    invoke-super {p0}, Lcom/bv/billing/BillingService$BillingRequest;->getStartId()I

    move-result v0

    return v0
.end method

.method protected onRemoteException(Landroid/os/RemoteException;)V
    .locals 2
    .parameter "e"

    .prologue
    .line 330
    invoke-super {p0, p1}, Lcom/bv/billing/BillingService$BillingRequest;->onRemoteException(Landroid/os/RemoteException;)V

    .line 331
    iget-wide v0, p0, Lcom/bv/billing/BillingService$RestoreTransactions;->mNonce:J

    invoke-static {v0, v1}, Lcom/bv/billing/Security;->removeNonce(J)V

    .line 332
    return-void
.end method

.method protected responseCodeReceived(Lcom/bv/billing/Consts$ResponseCode;)V
    .locals 1
    .parameter "responseCode"

    .prologue
    .line 336
    iget-object v0, p0, Lcom/bv/billing/BillingService$RestoreTransactions;->this$0:Lcom/bv/billing/BillingService;

    invoke-static {v0, p0, p1}, Lcom/bv/billing/ResponseHandler;->responseCodeReceived(Landroid/content/Context;Lcom/bv/billing/BillingService$RestoreTransactions;Lcom/bv/billing/Consts$ResponseCode;)V

    .line 337
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
    .line 318
    invoke-static {}, Lcom/bv/billing/Security;->generateNonce()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/bv/billing/BillingService$RestoreTransactions;->mNonce:J

    .line 320
    const-string v2, "RESTORE_TRANSACTIONS"

    invoke-virtual {p0, v2}, Lcom/bv/billing/BillingService$RestoreTransactions;->makeRequestBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 321
    .local v0, request:Landroid/os/Bundle;
    const-string v2, "NONCE"

    iget-wide v3, p0, Lcom/bv/billing/BillingService$RestoreTransactions;->mNonce:J

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 322
    invoke-static {}, Lcom/bv/billing/BillingService;->access$2()Lcom/android/vending/billing/IMarketBillingService;

    move-result-object v2

    invoke-interface {v2, v0}, Lcom/android/vending/billing/IMarketBillingService;->sendBillingRequest(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    .line 323
    .local v1, response:Landroid/os/Bundle;
    const-string v2, "restoreTransactions"

    invoke-virtual {p0, v2, v1}, Lcom/bv/billing/BillingService$RestoreTransactions;->logResponseCode(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 324
    const-string v2, "REQUEST_ID"

    .line 325
    sget-wide v3, Lcom/bv/billing/Consts;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    .line 324
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    return-wide v2
.end method

.method public bridge synthetic runIfConnected()Z
    .locals 1

    .prologue
    .line 1
    invoke-super {p0}, Lcom/bv/billing/BillingService$BillingRequest;->runIfConnected()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic runRequest()Z
    .locals 1

    .prologue
    .line 1
    invoke-super {p0}, Lcom/bv/billing/BillingService$BillingRequest;->runRequest()Z

    move-result v0

    return v0
.end method
