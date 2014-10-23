.class public Lcom/bv/billing/ResponseHandler;
.super Ljava/lang/Object;
.source "ResponseHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ResponseHandler"

.field private static sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Lcom/bv/billing/PurchaseObserver;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/bv/billing/ResponseHandler;->sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;

    return-object v0
.end method

.method public static buyPageIntentResponse(Landroid/app/PendingIntent;Landroid/content/Intent;)V
    .locals 1
    .parameter "pendingIntent"
    .parameter "intent"

    .prologue
    .line 76
    sget-object v0, Lcom/bv/billing/ResponseHandler;->sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;

    if-nez v0, :cond_0

    .line 83
    :goto_0
    return-void

    .line 82
    :cond_0
    sget-object v0, Lcom/bv/billing/ResponseHandler;->sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;

    invoke-virtual {v0, p0, p1}, Lcom/bv/billing/PurchaseObserver;->startBuyPageActivity(Landroid/app/PendingIntent;Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public static checkBillingSupportedResponse(Z)V
    .locals 1
    .parameter "supported"

    .prologue
    .line 60
    sget-object v0, Lcom/bv/billing/ResponseHandler;->sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;

    if-eqz v0, :cond_0

    .line 61
    sget-object v0, Lcom/bv/billing/ResponseHandler;->sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;

    invoke-virtual {v0, p0}, Lcom/bv/billing/PurchaseObserver;->onBillingSupported(Z)V

    .line 63
    :cond_0
    return-void
.end method

.method public static purchaseResponse(Landroid/content/Context;Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 8
    .parameter "context"
    .parameter "purchaseState"
    .parameter "productId"
    .parameter "orderId"
    .parameter "purchaseTime"
    .parameter "developerPayload"

    .prologue
    .line 113
    new-instance v7, Ljava/lang/Thread;

    new-instance v0, Lcom/bv/billing/ResponseHandler$1;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/bv/billing/ResponseHandler$1;-><init>(Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    invoke-direct {v7, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 125
    invoke-virtual {v7}, Ljava/lang/Thread;->start()V

    .line 126
    return-void
.end method

.method public static declared-synchronized register(Lcom/bv/billing/PurchaseObserver;)V
    .locals 2
    .parameter "observer"

    .prologue
    .line 42
    const-class v0, Lcom/bv/billing/ResponseHandler;

    monitor-enter v0

    :try_start_0
    sput-object p0, Lcom/bv/billing/ResponseHandler;->sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    monitor-exit v0

    return-void

    .line 42
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static responseCodeReceived(Landroid/content/Context;Lcom/bv/billing/BillingService$RequestPurchase;Lcom/bv/billing/Consts$ResponseCode;)V
    .locals 1
    .parameter "context"
    .parameter "request"
    .parameter "responseCode"

    .prologue
    .line 143
    sget-object v0, Lcom/bv/billing/ResponseHandler;->sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;

    if-eqz v0, :cond_0

    .line 144
    sget-object v0, Lcom/bv/billing/ResponseHandler;->sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;

    invoke-virtual {v0, p1, p2}, Lcom/bv/billing/PurchaseObserver;->onRequestPurchaseResponse(Lcom/bv/billing/BillingService$RequestPurchase;Lcom/bv/billing/Consts$ResponseCode;)V

    .line 146
    :cond_0
    return-void
.end method

.method public static responseCodeReceived(Landroid/content/Context;Lcom/bv/billing/BillingService$RestoreTransactions;Lcom/bv/billing/Consts$ResponseCode;)V
    .locals 1
    .parameter "context"
    .parameter "request"
    .parameter "responseCode"

    .prologue
    .line 159
    sget-object v0, Lcom/bv/billing/ResponseHandler;->sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;

    if-eqz v0, :cond_0

    .line 160
    sget-object v0, Lcom/bv/billing/ResponseHandler;->sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;

    invoke-virtual {v0, p1, p2}, Lcom/bv/billing/PurchaseObserver;->onRestoreTransactionsResponse(Lcom/bv/billing/BillingService$RestoreTransactions;Lcom/bv/billing/Consts$ResponseCode;)V

    .line 162
    :cond_0
    return-void
.end method

.method public static declared-synchronized unregister(Lcom/bv/billing/PurchaseObserver;)V
    .locals 2
    .parameter "observer"

    .prologue
    .line 50
    const-class v0, Lcom/bv/billing/ResponseHandler;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    sput-object v1, Lcom/bv/billing/ResponseHandler;->sPurchaseObserver:Lcom/bv/billing/PurchaseObserver;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    monitor-exit v0

    return-void

    .line 50
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
