package com.bv.wifisync;

import android.app.*;
import android.content.*;
import com.google.android.apps.analytics.*;
import java.io.*;
import com.bv.billing.*;
import android.view.*;

abstract class PremiumBiller extends Biller
{
    PremiumBiller(final Activity activity, final Biller.ChargeType chargeType) {
        super(activity, chargeType);
    }
    
    private void track(final String s, final String s2) {
        try {
            final GoogleAnalyticsTracker tracker = Utils.getTracker((Context)this.mActivity);
            tracker.trackEvent("Pay" + Utils.getAppVersion((Context)this.mActivity), s, s2, 1);
            tracker.dispatch();
        }
        catch (Throwable t) {
            t.printStackTrace();
        }
    }
    
    protected boolean getDonated() {
        if (Config.getBoolean((Context)this.mActivity, this.mActivity.getString(2131100034), false)) {
            return true;
        }
        final boolean purchased = this.isPurchased(Biller.ChargeType.Donate);
        boolean b = false;
        if (purchased) {
            return true;
        }
        return b;
        b = true;
        return b;
    }
    
    boolean isPurchased() {
        return this.getDonated() || this.isPurchased(this.chargeType) || Utils.isDebugBuild((Context)this.mActivity);
    }
    
    public void onBillingSupported(final boolean b) {
        Label_0008: {
            if (!b) {
                break Label_0008;
            }
            try {
                this.restoreTransactions();
                super.onBillingSupported(b);
            }
            catch (IOException ex) {
                Dialogs.showError((Context)this.mActivity, ex);
            }
        }
    }
    
    abstract void onPurchase();
    
    public void onPurchaseStateChange(final Consts.PurchaseState purchaseState, final String s, final String s2, final int n, final long n2, final String s3) {
        try {
            super.onPurchaseStateChange(purchaseState, s, s2, n, n2, s3);
            if (purchaseState == Consts.PurchaseState.PURCHASED) {
                if (s.equals(Biller.ChargeType.Donate.getPurchaseString())) {
                    this.setDonated(true);
                }
                if (this.isPurchased()) {
                    this.track(s, "Purchase");
                    this.onPurchase();
                }
            }
            else if (purchaseState == Consts.PurchaseState.REFUNDED && s.equals(Biller.ChargeType.Donate.getPurchaseString())) {
                this.setDonated(false);
            }
        }
        catch (Throwable t) {
            Dialogs.showError((Context)this.mActivity, t);
        }
    }
    
    void purchase() {
        Dialogs.showConfirm((Context)this.mActivity, this.mActivity.getString(2131100053), this.mActivity.getString(2131100054), null, (Dialogs.OnConfirmListener)new Dialogs.OnConfirmListener() {
            public void onConfirm() throws Exception {
                PremiumBiller.this.track(PremiumBiller.this.chargeType.getPurchaseString(), "Charge");
                PremiumBiller.this.charge();
            }
        });
    }
    
    protected void setDonated(final boolean b) {
        Config.saveBoolean((Context)this.mActivity, this.mActivity.getString(2131100034), b);
    }
}
