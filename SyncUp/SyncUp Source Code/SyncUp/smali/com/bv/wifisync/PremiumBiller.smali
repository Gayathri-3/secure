.class abstract Lcom/bv/wifisync/PremiumBiller;
.super Lcom/bv/wifisync/Biller;
.source "Biller.java"


# direct methods
.method constructor <init>(Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V
    .locals 0
    .parameter "activity"
    .parameter "chargeType"

    .prologue
    .line 139
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/Biller;-><init>(Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    .line 140
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/PremiumBiller;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 176
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/PremiumBiller;->track(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private track(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "itemId"
    .parameter "action"

    .prologue
    .line 178
    :try_start_0
    iget-object v2, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v1

    .line 179
    .local v1, tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Pay"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    invoke-static {v3}, Lcom/bv/wifisync/Utils;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v1, v2, p1, p2, v3}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 180
    invoke-virtual {v1}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->dispatch()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    .end local v1           #tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;
    :goto_0
    return-void

    .line 181
    :catch_0
    move-exception v0

    .line 182
    .local v0, t:Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method protected getDonated()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 201
    iget-object v1, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    const v3, 0x7f060182

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 202
    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->Donate:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/PremiumBiller;->isPurchased(Lcom/bv/wifisync/Biller$ChargeType;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 201
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method isPurchased()Z
    .locals 1

    .prologue
    .line 187
    invoke-virtual {p0}, Lcom/bv/wifisync/PremiumBiller;->getDonated()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/PremiumBiller;->chargeType:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/PremiumBiller;->isPurchased(Lcom/bv/wifisync/Biller$ChargeType;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onBillingSupported(Z)V
    .locals 2
    .parameter "supported"

    .prologue
    .line 145
    if-eqz p1, :cond_0

    .line 146
    :try_start_0
    invoke-virtual {p0}, Lcom/bv/wifisync/PremiumBiller;->restoreTransactions()V

    .line 147
    :cond_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/Biller;->onBillingSupported(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    :goto_0
    return-void

    .line 148
    :catch_0
    move-exception v0

    .line 149
    .local v0, e:Ljava/io/IOException;
    iget-object v1, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method abstract onPurchase()V
.end method

.method public onPurchaseStateChange(Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V
    .locals 2
    .parameter "purchaseState"
    .parameter "itemId"
    .parameter "orderId"
    .parameter "quantity"
    .parameter "purchaseTime"
    .parameter "developerPayload"

    .prologue
    .line 158
    :try_start_0
    invoke-super/range {p0 .. p7}, Lcom/bv/wifisync/Biller;->onPurchaseStateChange(Lcom/bv/billing/Consts$PurchaseState;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    .line 160
    sget-object v1, Lcom/bv/billing/Consts$PurchaseState;->PURCHASED:Lcom/bv/billing/Consts$PurchaseState;

    if-ne p1, v1, :cond_2

    .line 161
    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->Donate:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Biller$ChargeType;->getPurchaseString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 162
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/PremiumBiller;->setDonated(Z)V

    .line 163
    :cond_0
    invoke-virtual {p0}, Lcom/bv/wifisync/PremiumBiller;->isPurchased()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 164
    const-string v1, "Purchase"

    invoke-direct {p0, p2, v1}, Lcom/bv/wifisync/PremiumBiller;->track(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    invoke-virtual {p0}, Lcom/bv/wifisync/PremiumBiller;->onPurchase()V

    .line 174
    :cond_1
    :goto_0
    return-void

    .line 167
    :cond_2
    sget-object v1, Lcom/bv/billing/Consts$PurchaseState;->REFUNDED:Lcom/bv/billing/Consts$PurchaseState;

    if-ne p1, v1, :cond_1

    .line 168
    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->Donate:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Biller$ChargeType;->getPurchaseString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 169
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/PremiumBiller;->setDonated(Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 171
    :catch_0
    move-exception v0

    .line 172
    .local v0, th:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method purchase()V
    .locals 5

    .prologue
    .line 191
    iget-object v0, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    const v2, 0x7f060195

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    const v3, 0x7f060196

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-instance v4, Lcom/bv/wifisync/PremiumBiller$1;

    invoke-direct {v4, p0}, Lcom/bv/wifisync/PremiumBiller$1;-><init>(Lcom/bv/wifisync/PremiumBiller;)V

    invoke-static {v0, v1, v2, v3, v4}, Lcom/bv/wifisync/Dialogs;->showConfirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnConfirmListener;)V

    .line 198
    return-void
.end method

.method protected setDonated(Z)V
    .locals 3
    .parameter "value"

    .prologue
    .line 206
    iget-object v0, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/bv/wifisync/PremiumBiller;->mActivity:Landroid/app/Activity;

    const v2, 0x7f060182

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/bv/wifisync/Config;->saveBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 207
    return-void
.end method
