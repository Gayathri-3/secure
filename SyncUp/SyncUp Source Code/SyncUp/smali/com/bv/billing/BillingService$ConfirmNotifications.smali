.class Lcom/bv/billing/BillingService$ConfirmNotifications;
.super Lcom/bv/billing/BillingService$BillingRequest;
.source "BillingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/billing/BillingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ConfirmNotifications"
.end annotation


# instance fields
.field final mNotifyIds:[Ljava/lang/String;

.field final synthetic this$0:Lcom/bv/billing/BillingService;


# direct methods
.method public constructor <init>(Lcom/bv/billing/BillingService;I[Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "startId"
    .parameter "notifyIds"

    .prologue
    .line 255
    iput-object p1, p0, Lcom/bv/billing/BillingService$ConfirmNotifications;->this$0:Lcom/bv/billing/BillingService;

    .line 256
    invoke-direct {p0, p1, p2}, Lcom/bv/billing/BillingService$BillingRequest;-><init>(Lcom/bv/billing/BillingService;I)V

    .line 257
    iput-object p3, p0, Lcom/bv/billing/BillingService$ConfirmNotifications;->mNotifyIds:[Ljava/lang/String;

    .line 258
    return-void
.end method


# virtual methods
.method protected run()J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 262
    const-string v2, "CONFIRM_NOTIFICATIONS"

    invoke-virtual {p0, v2}, Lcom/bv/billing/BillingService$ConfirmNotifications;->makeRequestBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 263
    .local v0, request:Landroid/os/Bundle;
    const-string v2, "NOTIFY_IDS"

    iget-object v3, p0, Lcom/bv/billing/BillingService$ConfirmNotifications;->mNotifyIds:[Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 264
    invoke-static {}, Lcom/bv/billing/BillingService;->access$2()Lcom/android/vending/billing/IMarketBillingService;

    move-result-object v2

    invoke-interface {v2, v0}, Lcom/android/vending/billing/IMarketBillingService;->sendBillingRequest(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    .line 265
    .local v1, response:Landroid/os/Bundle;
    const-string v2, "confirmNotifications"

    invoke-virtual {p0, v2, v1}, Lcom/bv/billing/BillingService$ConfirmNotifications;->logResponseCode(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 266
    const-string v2, "REQUEST_ID"

    .line 267
    sget-wide v3, Lcom/bv/billing/Consts;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    .line 266
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    return-wide v2
.end method
