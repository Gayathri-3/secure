.class Lcom/bv/wifisync/Biller;
.super Lcom/bv/billing/PurchaseObserver;
.source "Biller.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/Biller$ChargeType;
    }
.end annotation


# static fields
.field private static final ADD_DIR_EXCLUDE:Ljava/lang/String; = "com.bv.wifisync.excludedir"

.field private static final ADD_ROUTER:Ljava/lang/String; = "com.bv.wifisync.addrouter"

.field private static final ADD_WAKEUP:Ljava/lang/String; = "com.bv.wifisync.addwakeup"

.field private static final ADD_WEEKLY:Ljava/lang/String; = "com.bv.wifisync.addweekly"

.field private static final DONATE:Ljava/lang/String; = "com.bv.wifisync.donate.managed"

.field private static final TAG:Ljava/lang/String; = "Biller"


# instance fields
.field protected billingService:Lcom/bv/billing/BillingService;

.field protected final chargeType:Lcom/bv/wifisync/Biller$ChargeType;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V
    .locals 1
    .parameter "activity"
    .parameter "chargeType"

    .prologue
    .line 30
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/bv/billing/PurchaseObserver;-><init>(Landroid/app/Activity;Landroid/os/Handler;)V

    .line 31
    iput-object p2, p0, Lcom/bv/wifisync/Biller;->chargeType:Lcom/bv/wifisync/Biller$ChargeType;

    .line 32
    return-void
.end method

.method private static validateOrder(Ljava/lang/String;)V
    .locals 5
    .parameter "orderId"

    .prologue
    .line 122
    const-string v2, "Order validation failed"

    .line 123
    .local v2, validationFailed:Ljava/lang/String;
    if-nez p0, :cond_0

    .line 124
    new-instance v3, Ljava/lang/SecurityException;

    const-string v4, "Order validation failed"

    invoke-direct {v3, v4}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 125
    :cond_0
    const/16 v3, 0x2e

    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 126
    .local v0, index:I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_1

    .line 127
    new-instance v3, Ljava/lang/SecurityException;

    const-string v4, "Order validation failed"

    invoke-direct {v3, v4}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 128
    :cond_1
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 129
    .local v1, merchantId:Ljava/lang/String;
    const-string v3, "12999763169054705758"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 130
    new-instance v3, Ljava/lang/SecurityException;

    const-string v4, "Order validation failed"

    invoke-direct {v3, v4}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 131
    :cond_2
    return-void
.end method


# virtual methods
.method charge()V
    .locals 4

    .prologue
    .line 45
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->billingService:Lcom/bv/billing/BillingService;

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->billingService:Lcom/bv/billing/BillingService;

    invoke-virtual {v0}, Lcom/bv/billing/BillingService;->unbind()V

    .line 47
    :cond_0
    new-instance v0, Lcom/bv/billing/BillingService;

    invoke-direct {v0}, Lcom/bv/billing/BillingService;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/Biller;->billingService:Lcom/bv/billing/BillingService;

    .line 48
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->billingService:Lcom/bv/billing/BillingService;

    iget-object v1, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/bv/billing/BillingService;->setContext(Landroid/content/Context;)V

    .line 49
    invoke-static {p0}, Lcom/bv/billing/ResponseHandler;->register(Lcom/bv/billing/PurchaseObserver;)V

    .line 50
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->billingService:Lcom/bv/billing/BillingService;

    invoke-virtual {v0}, Lcom/bv/billing/BillingService;->checkBillingSupported()Z

    move-result v0

    if-nez v0, :cond_1

    .line 51
    invoke-static {p0}, Lcom/bv/billing/ResponseHandler;->unregister(Lcom/bv/billing/PurchaseObserver;)V

    .line 52
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    new-instance v1, Ljava/io/IOException;

    iget-object v2, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const v3, 0x7f060190

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 54
    :cond_1
    return-void
.end method

.method close()V
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->billingService:Lcom/bv/billing/BillingService;

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->billingService:Lcom/bv/billing/BillingService;

    invoke-virtual {v0}, Lcom/bv/billing/BillingService;->unbind()V

    .line 113
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bv/wifisync/Biller;->billingService:Lcom/bv/billing/BillingService;

    .line 115
    :cond_0
    return-void
.end method

.method protected getPurchaseString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->chargeType:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-virtual {v0}, Lcom/bv/wifisync/Biller$ChargeType;->getPurchaseString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method isPurchased(Lcom/bv/wifisync/Biller$ChargeType;)Z
    .locals 1
    .parameter "chargeType"

    .prologue
    .line 118
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Lcom/bv/wifisync/Config;->getPurchase(Landroid/content/Context;Lcom/bv/wifisync/Biller$ChargeType;)Z

    move-result v0

    return v0
.end method

.method public onBillingSupported(Z)V
    .locals 4
    .parameter "supported"

    .prologue
    .line 58
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/Biller;->billingService:Lcom/bv/billing/BillingService;

    invoke-virtual {p0}, Lcom/bv/wifisync/Biller;->getPurchaseString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/bv/billing/BillingService;->requestPurchase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 59
    :cond_0
    invoke-static {p0}, Lcom/bv/billing/ResponseHandler;->unregister(Lcom/bv/billing/PurchaseObserver;)V

    .line 60
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    new-instance v1, Ljava/io/IOException;

    iget-object v2, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const v3, 0x7f060190

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 62
    :cond_1
    return-void
.end method

.method public onPurchaseStateChange(Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V
    .locals 3
    .parameter "purchaseState"
    .parameter "itemId"
    .parameter "orderId"
    .parameter "quantity"
    .parameter "purchaseTime"
    .parameter "developerPayload"

    .prologue
    .line 72
    sget-object v0, Lcom/bv/billing/Consts$PurchaseState;->CANCELED:Lcom/bv/billing/Consts$PurchaseState;

    if-ne p1, v0, :cond_1

    .line 73
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const v2, 0x7f060193

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 83
    :cond_0
    :goto_0
    return-void

    .line 74
    :cond_1
    sget-object v0, Lcom/bv/billing/Consts$PurchaseState;->PURCHASED:Lcom/bv/billing/Consts$PurchaseState;

    if-ne p1, v0, :cond_2

    .line 75
    const-string v0, "Biller"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Purchased "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    invoke-static {p3}, Lcom/bv/wifisync/Biller;->validateOrder(Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x1

    invoke-static {v0, p2, v1}, Lcom/bv/wifisync/Config;->setPurchase(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 78
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const v2, 0x7f060191

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 79
    :cond_2
    sget-object v0, Lcom/bv/billing/Consts$PurchaseState;->REFUNDED:Lcom/bv/billing/Consts$PurchaseState;

    if-ne p1, v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-static {v0, p2, v1}, Lcom/bv/wifisync/Config;->setPurchase(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 81
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const v2, 0x7f060192

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onRequestPurchaseResponse(Lcom/bv/billing/BillingService$RequestPurchase;Lcom/bv/billing/Consts$ResponseCode;)V
    .locals 7
    .parameter "request"
    .parameter "responseCode"

    .prologue
    .line 87
    sget-object v0, Lcom/bv/billing/Consts$ResponseCode;->RESULT_OK:Lcom/bv/billing/Consts$ResponseCode;

    if-ne p2, v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const v2, 0x7f060194

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 95
    :goto_0
    return-void

    .line 89
    :cond_0
    sget-object v0, Lcom/bv/billing/Consts$ResponseCode;->RESULT_USER_CANCELED:Lcom/bv/billing/Consts$ResponseCode;

    if-ne p2, v0, :cond_1

    .line 90
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const v2, 0x7f060193

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 91
    :cond_1
    sget-object v0, Lcom/bv/billing/Consts$ResponseCode;->RESULT_DEVELOPER_ERROR:Lcom/bv/billing/Consts$ResponseCode;

    if-eq p2, v0, :cond_2

    .line 92
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    new-instance v1, Ljava/io/IOException;

    iget-object v2, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const v3, 0x7f0600ab

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p2}, Lcom/bv/billing/Consts$ResponseCode;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 94
    :cond_2
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Suspected transaction restore "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/bv/billing/Consts$ResponseCode;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    goto :goto_0
.end method

.method public onRestoreTransactionsResponse(Lcom/bv/billing/BillingService$RestoreTransactions;Lcom/bv/billing/Consts$ResponseCode;)V
    .locals 2
    .parameter "request"
    .parameter "responseCode"

    .prologue
    .line 99
    iget-object v1, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    sget-object v0, Lcom/bv/billing/Consts$ResponseCode;->RESULT_OK:Lcom/bv/billing/Consts$ResponseCode;

    if-ne p2, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lcom/bv/wifisync/Config;->setTransactionRestored(Landroid/content/Context;Z)V

    .line 100
    return-void

    .line 99
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method restoreTransactions()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    const-string v0, "Biller"

    const-string v1, "Restoring transactions"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->billingService:Lcom/bv/billing/BillingService;

    invoke-virtual {v0}, Lcom/bv/billing/BillingService;->restoreTransactions()Z

    move-result v0

    if-nez v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/bv/wifisync/Config;->setTransactionRestored(Landroid/content/Context;Z)V

    .line 106
    new-instance v0, Ljava/io/IOException;

    iget-object v1, p0, Lcom/bv/wifisync/Biller;->mActivity:Landroid/app/Activity;

    const v2, 0x7f0600ac

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_0
    return-void
.end method
