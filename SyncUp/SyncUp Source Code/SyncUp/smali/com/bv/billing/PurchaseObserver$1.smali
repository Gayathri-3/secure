.class Lcom/bv/billing/PurchaseObserver$1;
.super Ljava/lang/Object;
.source "PurchaseObserver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/billing/PurchaseObserver;->postPurchaseStateChange(Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/billing/PurchaseObserver;

.field private final synthetic val$developerPayload:Ljava/lang/String;

.field private final synthetic val$itemId:Ljava/lang/String;

.field private final synthetic val$orderId:Ljava/lang/String;

.field private final synthetic val$purchaseState:Lcom/bv/billing/Consts$PurchaseState;

.field private final synthetic val$purchaseTime:J

.field private final synthetic val$quantity:I


# direct methods
.method constructor <init>(Lcom/bv/billing/PurchaseObserver;Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/billing/PurchaseObserver$1;->this$0:Lcom/bv/billing/PurchaseObserver;

    iput-object p2, p0, Lcom/bv/billing/PurchaseObserver$1;->val$purchaseState:Lcom/bv/billing/Consts$PurchaseState;

    iput-object p3, p0, Lcom/bv/billing/PurchaseObserver$1;->val$itemId:Ljava/lang/String;

    iput-object p4, p0, Lcom/bv/billing/PurchaseObserver$1;->val$orderId:Ljava/lang/String;

    iput p5, p0, Lcom/bv/billing/PurchaseObserver$1;->val$quantity:I

    iput-wide p6, p0, Lcom/bv/billing/PurchaseObserver$1;->val$purchaseTime:J

    iput-object p8, p0, Lcom/bv/billing/PurchaseObserver$1;->val$developerPayload:Ljava/lang/String;

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 157
    iget-object v0, p0, Lcom/bv/billing/PurchaseObserver$1;->this$0:Lcom/bv/billing/PurchaseObserver;

    .line 158
    iget-object v1, p0, Lcom/bv/billing/PurchaseObserver$1;->val$purchaseState:Lcom/bv/billing/Consts$PurchaseState;

    iget-object v2, p0, Lcom/bv/billing/PurchaseObserver$1;->val$itemId:Ljava/lang/String;

    iget-object v3, p0, Lcom/bv/billing/PurchaseObserver$1;->val$orderId:Ljava/lang/String;

    iget v4, p0, Lcom/bv/billing/PurchaseObserver$1;->val$quantity:I

    iget-wide v5, p0, Lcom/bv/billing/PurchaseObserver$1;->val$purchaseTime:J

    iget-object v7, p0, Lcom/bv/billing/PurchaseObserver$1;->val$developerPayload:Ljava/lang/String;

    .line 157
    invoke-virtual/range {v0 .. v7}, Lcom/bv/billing/PurchaseObserver;->onPurchaseStateChange(Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    .line 159
    return-void
.end method
