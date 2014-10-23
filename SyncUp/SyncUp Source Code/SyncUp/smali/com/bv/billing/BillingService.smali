.class public Lcom/bv/billing/BillingService;
.super Landroid/app/Service;
.source "BillingService.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/billing/BillingService$BillingRequest;,
        Lcom/bv/billing/BillingService$CheckBillingSupported;,
        Lcom/bv/billing/BillingService$ConfirmNotifications;,
        Lcom/bv/billing/BillingService$GetPurchaseInformation;,
        Lcom/bv/billing/BillingService$RequestPurchase;,
        Lcom/bv/billing/BillingService$RestoreTransactions;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "BillingService"

.field private static mPendingRequests:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/bv/billing/BillingService$BillingRequest;",
            ">;"
        }
    .end annotation
.end field

.field private static mSentRequests:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/bv/billing/BillingService$BillingRequest;",
            ">;"
        }
    .end annotation
.end field

.field private static mService:Lcom/android/vending/billing/IMarketBillingService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/bv/billing/BillingService;->mPendingRequests:Ljava/util/LinkedList;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 66
    sput-object v0, Lcom/bv/billing/BillingService;->mSentRequests:Ljava/util/HashMap;

    .line 67
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 341
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 342
    return-void
.end method

.method static synthetic access$0(Lcom/bv/billing/BillingService;)Z
    .locals 1
    .parameter

    .prologue
    .line 403
    invoke-direct {p0}, Lcom/bv/billing/BillingService;->bindToMarketBillingService()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1()Ljava/util/LinkedList;
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lcom/bv/billing/BillingService;->mPendingRequests:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$2()Lcom/android/vending/billing/IMarketBillingService;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/bv/billing/BillingService;->mService:Lcom/android/vending/billing/IMarketBillingService;

    return-object v0
.end method

.method static synthetic access$3()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lcom/bv/billing/BillingService;->mSentRequests:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$4(Lcom/android/vending/billing/IMarketBillingService;)V
    .locals 0
    .parameter

    .prologue
    .line 53
    sput-object p0, Lcom/bv/billing/BillingService;->mService:Lcom/android/vending/billing/IMarketBillingService;

    return-void
.end method

.method private bindToMarketBillingService()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    .line 408
    .line 409
    :try_start_0
    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.android.vending.billing.MarketBillingService.BIND"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 411
    const/4 v4, 0x1

    .line 408
    invoke-virtual {p0, v3, p0, v4}, Lcom/bv/billing/BillingService;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    .line 413
    .local v0, bindResult:Z
    if-eqz v0, :cond_0

    .line 421
    .end local v0           #bindResult:Z
    :goto_0
    return v2

    .line 416
    .restart local v0       #bindResult:Z
    :cond_0
    const-string v2, "BillingService"

    const-string v3, "Could not bind to service."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 421
    .end local v0           #bindResult:Z
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 418
    :catch_0
    move-exception v1

    .line 419
    .local v1, e:Ljava/lang/SecurityException;
    const-string v2, "BillingService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Security exception: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private checkResponseCode(JLcom/bv/billing/Consts$ResponseCode;)V
    .locals 3
    .parameter "requestId"
    .parameter "responseCode"

    .prologue
    .line 530
    sget-object v1, Lcom/bv/billing/BillingService;->mSentRequests:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/billing/BillingService$BillingRequest;

    .line 531
    .local v0, request:Lcom/bv/billing/BillingService$BillingRequest;
    if-eqz v0, :cond_0

    .line 535
    invoke-virtual {v0, p3}, Lcom/bv/billing/BillingService$BillingRequest;->responseCodeReceived(Lcom/bv/billing/Consts$ResponseCode;)V

    .line 537
    :cond_0
    sget-object v1, Lcom/bv/billing/BillingService;->mSentRequests:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    return-void
.end method

.method private confirmNotifications(I[Ljava/lang/String;)Z
    .locals 1
    .parameter "startId"
    .parameter "notifyIds"

    .prologue
    .line 468
    new-instance v0, Lcom/bv/billing/BillingService$ConfirmNotifications;

    invoke-direct {v0, p0, p1, p2}, Lcom/bv/billing/BillingService$ConfirmNotifications;-><init>(Lcom/bv/billing/BillingService;I[Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/bv/billing/BillingService$ConfirmNotifications;->runRequest()Z

    move-result v0

    return v0
.end method

.method private getPurchaseInformation(I[Ljava/lang/String;)Z
    .locals 1
    .parameter "startId"
    .parameter "notifyIds"

    .prologue
    .line 485
    new-instance v0, Lcom/bv/billing/BillingService$GetPurchaseInformation;

    invoke-direct {v0, p0, p1, p2}, Lcom/bv/billing/BillingService$GetPurchaseInformation;-><init>(Lcom/bv/billing/BillingService;I[Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/bv/billing/BillingService$GetPurchaseInformation;->runRequest()Z

    move-result v0

    return v0
.end method

.method private purchaseStateChanged(ILjava/lang/String;Ljava/lang/String;)V
    .locals 12
    .parameter "startId"
    .parameter "signedData"
    .parameter "signature"

    .prologue
    .line 498
    invoke-static {p2, p3}, Lcom/bv/billing/Security;->verifyPurchase(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v9

    .line 499
    .local v9, purchases:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/billing/Security$VerifiedPurchase;>;"
    if-nez v9, :cond_1

    .line 515
    :cond_0
    :goto_0
    return-void

    .line 503
    :cond_1
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 504
    .local v8, notifyList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 511
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 512
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    .line 513
    .local v7, notifyIds:[Ljava/lang/String;
    invoke-direct {p0, p1, v7}, Lcom/bv/billing/BillingService;->confirmNotifications(I[Ljava/lang/String;)Z

    goto :goto_0

    .line 504
    .end local v7           #notifyIds:[Ljava/lang/String;
    :cond_2
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/bv/billing/Security$VerifiedPurchase;

    .line 505
    .local v10, vp:Lcom/bv/billing/Security$VerifiedPurchase;
    iget-object v0, v10, Lcom/bv/billing/Security$VerifiedPurchase;->notificationId:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 506
    iget-object v0, v10, Lcom/bv/billing/Security$VerifiedPurchase;->notificationId:Ljava/lang/String;

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 508
    :cond_3
    iget-object v1, v10, Lcom/bv/billing/Security$VerifiedPurchase;->purchaseState:Lcom/bv/billing/Consts$PurchaseState;

    iget-object v2, v10, Lcom/bv/billing/Security$VerifiedPurchase;->productId:Ljava/lang/String;

    .line 509
    iget-object v3, v10, Lcom/bv/billing/Security$VerifiedPurchase;->orderId:Ljava/lang/String;

    iget-wide v4, v10, Lcom/bv/billing/Security$VerifiedPurchase;->purchaseTime:J

    iget-object v6, v10, Lcom/bv/billing/Security$VerifiedPurchase;->developerPayload:Ljava/lang/String;

    move-object v0, p0

    .line 508
    invoke-static/range {v0 .. v6}, Lcom/bv/billing/ResponseHandler;->purchaseResponse(Landroid/content/Context;Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    goto :goto_1
.end method

.method private runPendingRequests()V
    .locals 3

    .prologue
    .line 545
    const/4 v0, -0x1

    .line 547
    .local v0, maxStartId:I
    :cond_0
    :goto_0
    sget-object v2, Lcom/bv/billing/BillingService;->mPendingRequests:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/billing/BillingService$BillingRequest;

    .local v1, request:Lcom/bv/billing/BillingService$BillingRequest;
    if-nez v1, :cond_2

    .line 568
    if-ltz v0, :cond_1

    .line 572
    invoke-virtual {p0, v0}, Lcom/bv/billing/BillingService;->stopSelf(I)V

    .line 574
    :cond_1
    :goto_1
    return-void

    .line 548
    :cond_2
    invoke-virtual {v1}, Lcom/bv/billing/BillingService$BillingRequest;->runIfConnected()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 550
    sget-object v2, Lcom/bv/billing/BillingService;->mPendingRequests:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    .line 554
    invoke-virtual {v1}, Lcom/bv/billing/BillingService$BillingRequest;->getStartId()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 555
    invoke-virtual {v1}, Lcom/bv/billing/BillingService$BillingRequest;->getStartId()I

    move-result v0

    .line 557
    goto :goto_0

    .line 560
    :cond_3
    invoke-direct {p0}, Lcom/bv/billing/BillingService;->bindToMarketBillingService()Z

    goto :goto_1
.end method


# virtual methods
.method public checkBillingSupported()Z
    .locals 1

    .prologue
    .line 429
    new-instance v0, Lcom/bv/billing/BillingService$CheckBillingSupported;

    invoke-direct {v0, p0}, Lcom/bv/billing/BillingService$CheckBillingSupported;-><init>(Lcom/bv/billing/BillingService;)V

    invoke-virtual {v0}, Lcom/bv/billing/BillingService$CheckBillingSupported;->runRequest()Z

    move-result v0

    return v0
.end method

.method public handleCommand(Landroid/content/Intent;I)V
    .locals 12
    .parameter "intent"
    .parameter "startId"

    .prologue
    .line 374
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 378
    .local v0, action:Ljava/lang/String;
    const-string v9, "com.bv.billing.CONFIRM_NOTIFICATION"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 379
    const-string v9, "notification_id"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 380
    .local v2, notifyIds:[Ljava/lang/String;
    invoke-direct {p0, p2, v2}, Lcom/bv/billing/BillingService;->confirmNotifications(I[Ljava/lang/String;)Z

    .line 396
    .end local v2           #notifyIds:[Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 381
    :cond_1
    const-string v9, "com.bv.billing.GET_PURCHASE_INFORMATION"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 382
    const-string v9, "notification_id"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 383
    .local v1, notifyId:Ljava/lang/String;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    invoke-direct {p0, p2, v9}, Lcom/bv/billing/BillingService;->getPurchaseInformation(I[Ljava/lang/String;)Z

    goto :goto_0

    .line 384
    .end local v1           #notifyId:Ljava/lang/String;
    :cond_2
    const-string v9, "com.android.vending.billing.PURCHASE_STATE_CHANGED"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 385
    const-string v9, "inapp_signed_data"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 386
    .local v8, signedData:Ljava/lang/String;
    const-string v9, "inapp_signature"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 387
    .local v7, signature:Ljava/lang/String;
    invoke-direct {p0, p2, v8, v7}, Lcom/bv/billing/BillingService;->purchaseStateChanged(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 388
    .end local v7           #signature:Ljava/lang/String;
    .end local v8           #signedData:Ljava/lang/String;
    :cond_3
    const-string v9, "com.android.vending.billing.RESPONSE_CODE"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 389
    const-string v9, "request_id"

    const-wide/16 v10, -0x1

    invoke-virtual {p1, v9, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    .line 390
    .local v3, requestId:J
    const-string v9, "response_code"

    .line 391
    sget-object v10, Lcom/bv/billing/Consts$ResponseCode;->RESULT_ERROR:Lcom/bv/billing/Consts$ResponseCode;

    invoke-virtual {v10}, Lcom/bv/billing/Consts$ResponseCode;->ordinal()I

    move-result v10

    .line 390
    invoke-virtual {p1, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 392
    .local v6, responseCodeIndex:I
    invoke-static {v6}, Lcom/bv/billing/Consts$ResponseCode;->valueOf(I)Lcom/bv/billing/Consts$ResponseCode;

    move-result-object v5

    .line 393
    .local v5, responseCode:Lcom/bv/billing/Consts$ResponseCode;
    invoke-direct {p0, v3, v4, v5}, Lcom/bv/billing/BillingService;->checkResponseCode(JLcom/bv/billing/Consts$ResponseCode;)V

    .line 394
    invoke-virtual {p0, p2}, Lcom/bv/billing/BillingService;->stopSelf(I)V

    goto :goto_0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 353
    const/4 v0, 0x0

    return-object v0
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1
    .parameter "name"
    .parameter "service"

    .prologue
    .line 584
    invoke-static {p2}, Lcom/android/vending/billing/IMarketBillingService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/vending/billing/IMarketBillingService;

    move-result-object v0

    sput-object v0, Lcom/bv/billing/BillingService;->mService:Lcom/android/vending/billing/IMarketBillingService;

    .line 585
    invoke-direct {p0}, Lcom/bv/billing/BillingService;->runPendingRequests()V

    .line 586
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "name"

    .prologue
    .line 592
    const-string v0, "BillingService"

    const-string v1, "Billing service disconnected"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    const/4 v0, 0x0

    sput-object v0, Lcom/bv/billing/BillingService;->mService:Lcom/android/vending/billing/IMarketBillingService;

    .line 594
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2
    .parameter "intent"
    .parameter "options"
    .parameter "startId"

    .prologue
    .line 359
    if-eqz p1, :cond_0

    .line 360
    :try_start_0
    invoke-virtual {p0, p1, p3}, Lcom/bv/billing/BillingService;->handleCommand(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 364
    :cond_0
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 361
    :catch_0
    move-exception v0

    .line 362
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public requestPurchase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "productId"
    .parameter "developerPayload"

    .prologue
    .line 443
    new-instance v0, Lcom/bv/billing/BillingService$RequestPurchase;

    invoke-direct {v0, p0, p1, p2}, Lcom/bv/billing/BillingService$RequestPurchase;-><init>(Lcom/bv/billing/BillingService;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/bv/billing/BillingService$RequestPurchase;->runRequest()Z

    move-result v0

    return v0
.end method

.method public restoreTransactions()Z
    .locals 1

    .prologue
    .line 453
    new-instance v0, Lcom/bv/billing/BillingService$RestoreTransactions;

    invoke-direct {v0, p0}, Lcom/bv/billing/BillingService$RestoreTransactions;-><init>(Lcom/bv/billing/BillingService;)V

    invoke-virtual {v0}, Lcom/bv/billing/BillingService$RestoreTransactions;->runRequest()Z

    move-result v0

    return v0
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 345
    invoke-virtual {p0, p1}, Lcom/bv/billing/BillingService;->attachBaseContext(Landroid/content/Context;)V

    .line 346
    return-void
.end method

.method public unbind()V
    .locals 1

    .prologue
    .line 602
    :try_start_0
    invoke-virtual {p0, p0}, Lcom/bv/billing/BillingService;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 606
    :goto_0
    return-void

    .line 603
    :catch_0
    move-exception v0

    goto :goto_0
.end method
