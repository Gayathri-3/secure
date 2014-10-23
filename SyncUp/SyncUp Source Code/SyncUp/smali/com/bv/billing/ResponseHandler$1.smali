.class Lcom/bv/billing/ResponseHandler$1;
.super Ljava/lang/Object;
.source "ResponseHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/billing/ResponseHandler;->purchaseResponse(Landroid/content/Context;Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$developerPayload:Ljava/lang/String;

.field private final synthetic val$orderId:Ljava/lang/String;

.field private final synthetic val$productId:Ljava/lang/String;

.field private final synthetic val$purchaseState:Lcom/bv/billing/Consts$PurchaseState;

.field private final synthetic val$purchaseTime:J


# direct methods
.method constructor <init>(Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/billing/ResponseHandler$1;->val$purchaseState:Lcom/bv/billing/Consts$PurchaseState;

    iput-object p2, p0, Lcom/bv/billing/ResponseHandler$1;->val$productId:Ljava/lang/String;

    iput-object p3, p0, Lcom/bv/billing/ResponseHandler$1;->val$orderId:Ljava/lang/String;

    iput-wide p4, p0, Lcom/bv/billing/ResponseHandler$1;->val$purchaseTime:J

    iput-object p6, p0, Lcom/bv/billing/ResponseHandler$1;->val$developerPayload:Ljava/lang/String;

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 117
    const-class v8, Lcom/bv/billing/ResponseHandler;

    monitor-enter v8

    .line 118
    const/4 v4, 0x1

    .line 119
    .local v4, quantity:I
    :try_start_0
    invoke-static {}, Lcom/bv/billing/ResponseHandler;->access$0()Lcom/bv/billing/PurchaseObserver;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 120
    invoke-static {}, Lcom/bv/billing/ResponseHandler;->access$0()Lcom/bv/billing/PurchaseObserver;

    move-result-object v0

    .line 121
    iget-object v1, p0, Lcom/bv/billing/ResponseHandler$1;->val$purchaseState:Lcom/bv/billing/Consts$PurchaseState;

    iget-object v2, p0, Lcom/bv/billing/ResponseHandler$1;->val$productId:Ljava/lang/String;

    iget-object v3, p0, Lcom/bv/billing/ResponseHandler$1;->val$orderId:Ljava/lang/String;

    iget-wide v5, p0, Lcom/bv/billing/ResponseHandler$1;->val$purchaseTime:J

    iget-object v7, p0, Lcom/bv/billing/ResponseHandler$1;->val$developerPayload:Ljava/lang/String;

    .line 120
    invoke-virtual/range {v0 .. v7}, Lcom/bv/billing/PurchaseObserver;->postPurchaseStateChange(Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    .line 117
    :cond_0
    monitor-exit v8

    .line 124
    return-void

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
