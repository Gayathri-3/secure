.class public Lcom/bv/billing/BillingService$RequestPurchase;
.super Lcom/bv/billing/BillingService$BillingRequest;
.source "BillingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/billing/BillingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RequestPurchase"
.end annotation


# instance fields
.field public final mDeveloperPayload:Ljava/lang/String;

.field public final mProductId:Ljava/lang/String;

.field final synthetic this$0:Lcom/bv/billing/BillingService;


# direct methods
.method public constructor <init>(Lcom/bv/billing/BillingService;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter "itemId"

    .prologue
    .line 209
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/bv/billing/BillingService$RequestPurchase;-><init>(Lcom/bv/billing/BillingService;Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    return-void
.end method

.method public constructor <init>(Lcom/bv/billing/BillingService;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter "itemId"
    .parameter "developerPayload"

    .prologue
    .line 212
    iput-object p1, p0, Lcom/bv/billing/BillingService$RequestPurchase;->this$0:Lcom/bv/billing/BillingService;

    .line 216
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lcom/bv/billing/BillingService$BillingRequest;-><init>(Lcom/bv/billing/BillingService;I)V

    .line 217
    iput-object p2, p0, Lcom/bv/billing/BillingService$RequestPurchase;->mProductId:Ljava/lang/String;

    .line 218
    iput-object p3, p0, Lcom/bv/billing/BillingService$RequestPurchase;->mDeveloperPayload:Ljava/lang/String;

    .line 219
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

.method protected responseCodeReceived(Lcom/bv/billing/Consts$ResponseCode;)V
    .locals 1
    .parameter "responseCode"

    .prologue
    .line 245
    iget-object v0, p0, Lcom/bv/billing/BillingService$RequestPurchase;->this$0:Lcom/bv/billing/BillingService;

    invoke-static {v0, p0, p1}, Lcom/bv/billing/ResponseHandler;->responseCodeReceived(Landroid/content/Context;Lcom/bv/billing/BillingService$RequestPurchase;Lcom/bv/billing/Consts$ResponseCode;)V

    .line 246
    return-void
.end method

.method protected run()J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 223
    const-string v4, "REQUEST_PURCHASE"

    invoke-virtual {p0, v4}, Lcom/bv/billing/BillingService$RequestPurchase;->makeRequestBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 224
    .local v2, request:Landroid/os/Bundle;
    const-string v4, "ITEM_ID"

    iget-object v5, p0, Lcom/bv/billing/BillingService$RequestPurchase;->mProductId:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    iget-object v4, p0, Lcom/bv/billing/BillingService$RequestPurchase;->mDeveloperPayload:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 227
    const-string v4, "DEVELOPER_PAYLOAD"

    iget-object v5, p0, Lcom/bv/billing/BillingService$RequestPurchase;->mDeveloperPayload:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    :cond_0
    invoke-static {}, Lcom/bv/billing/BillingService;->access$2()Lcom/android/vending/billing/IMarketBillingService;

    move-result-object v4

    invoke-interface {v4, v2}, Lcom/android/vending/billing/IMarketBillingService;->sendBillingRequest(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v3

    .line 231
    .local v3, response:Landroid/os/Bundle;
    const-string v4, "PURCHASE_INTENT"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/app/PendingIntent;

    .line 232
    .local v1, pendingIntent:Landroid/app/PendingIntent;
    if-nez v1, :cond_1

    .line 233
    const-string v4, "BillingService"

    const-string v5, "Error with requestPurchase"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    sget-wide v4, Lcom/bv/billing/Consts;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    .line 239
    :goto_0
    return-wide v4

    .line 237
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 238
    .local v0, intent:Landroid/content/Intent;
    invoke-static {v1, v0}, Lcom/bv/billing/ResponseHandler;->buyPageIntentResponse(Landroid/app/PendingIntent;Landroid/content/Intent;)V

    .line 239
    const-string v4, "REQUEST_ID"

    .line 240
    sget-wide v5, Lcom/bv/billing/Consts;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    .line 239
    invoke-virtual {v3, v4, v5, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    goto :goto_0
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
