package com.bv.wifisync;

import android.app.*;
import android.os.*;
import android.content.*;
import java.io.*;
import com.bv.billing.*;
import android.util.*;

class Biller extends PurchaseObserver
{
    private static final String ADD_DIR_EXCLUDE = "com.bv.wifisync.excludedir";
    private static final String ADD_ROUTER = "com.bv.wifisync.addrouter";
    private static final String ADD_WAKEUP = "com.bv.wifisync.addwakeup";
    private static final String ADD_WEEKLY = "com.bv.wifisync.addweekly";
    private static final String DONATE = "com.bv.wifisync.donate.managed";
    private static final String TAG = "Biller";
    protected BillingService billingService;
    protected final ChargeType chargeType;
    
    public Biller(final Activity activity, final ChargeType chargeType) {
        super(activity, new Handler());
        this.chargeType = chargeType;
    }
    
    private static void validateOrder(final String s) {
        if (s == null) {
            throw new SecurityException("Order validation failed");
        }
        final int index = s.indexOf(46);
        if (index == -1) {
            throw new SecurityException("Order validation failed");
        }
        if (!"12999763169054705758".equals(s.substring(0, index))) {
            throw new SecurityException("Order validation failed");
        }
    }
    
    void charge() {
        if (this.billingService != null) {
            this.billingService.unbind();
        }
        (this.billingService = new BillingService()).setContext((Context)this.mActivity);
        ResponseHandler.register(this);
        if (!this.billingService.checkBillingSupported()) {
            ResponseHandler.unregister(this);
            Dialogs.showError((Context)this.mActivity, new IOException(this.mActivity.getString(2131100048)));
        }
    }
    
    void close() {
        if (this.billingService != null) {
            this.billingService.unbind();
            this.billingService = null;
        }
    }
    
    protected String getPurchaseString() {
        return this.chargeType.getPurchaseString();
    }
    
    boolean isPurchased(final ChargeType chargeType) {
        return Config.getPurchase((Context)this.mActivity, chargeType);
    }
    
    public void onBillingSupported(final boolean b) {
        if (!b || !this.billingService.requestPurchase(this.getPurchaseString(), null)) {
            ResponseHandler.unregister(this);
            Dialogs.showError((Context)this.mActivity, new IOException(this.mActivity.getString(2131100048)));
        }
    }
    
    public void onPurchaseStateChange(final Consts.PurchaseState purchaseState, final String s, final String s2, final int n, final long n2, final String s3) {
        if (purchaseState == Consts.PurchaseState.CANCELED) {
            Dialogs.showMessage((Context)this.mActivity, this.mActivity.getString(2131100051));
        }
        else if (purchaseState == Consts.PurchaseState.PURCHASED) {
            Log.i("Biller", "Purchased " + s);
            validateOrder(s2);
            Config.setPurchase((Context)this.mActivity, s, true);
            Dialogs.showMessage((Context)this.mActivity, this.mActivity.getString(2131100049));
        }
        else if (purchaseState == Consts.PurchaseState.REFUNDED) {
            Config.setPurchase((Context)this.mActivity, s, false);
            Dialogs.showMessage((Context)this.mActivity, this.mActivity.getString(2131100050));
        }
    }
    
    public void onRequestPurchaseResponse(final BillingService.RequestPurchase requestPurchase, final Consts.ResponseCode responseCode) {
        if (responseCode == Consts.ResponseCode.RESULT_OK) {
            Dialogs.showMessage((Context)this.mActivity, this.mActivity.getString(2131100052));
        }
        else if (responseCode == Consts.ResponseCode.RESULT_USER_CANCELED) {
            Dialogs.showMessage((Context)this.mActivity, this.mActivity.getString(2131100051));
        }
        else if (responseCode != Consts.ResponseCode.RESULT_DEVELOPER_ERROR) {
            Dialogs.showError((Context)this.mActivity, new IOException(this.mActivity.getString(2131099819, new Object[] { responseCode.toString() })));
        }
        else {
            Errors.getErrorMessage((Context)this.mActivity, new IOException("Suspected transaction restore " + responseCode.toString()));
        }
    }
    
    public void onRestoreTransactionsResponse(final BillingService.RestoreTransactions restoreTransactions, final Consts.ResponseCode responseCode) {
        Config.setTransactionRestored((Context)this.mActivity, responseCode == Consts.ResponseCode.RESULT_OK);
    }
    
    void restoreTransactions() throws IOException {
        Log.i("Biller", "Restoring transactions");
        if (!this.billingService.restoreTransactions()) {
            Config.setTransactionRestored((Context)this.mActivity, false);
            throw new IOException(this.mActivity.getString(2131099820));
        }
    }
    
    enum ChargeType
    {
        AddDirExclude {
            public String getPurchaseString() {
                return "com.bv.wifisync.excludedir";
            }
        }, 
        AddRouter {
            public String getPurchaseString() {
                return "com.bv.wifisync.addrouter";
            }
        }, 
        AddWakeupSchedule {
            public String getPurchaseString() {
                return "com.bv.wifisync.addwakeup";
            }
        }, 
        AddWeeklySchedule {
            public String getPurchaseString() {
                return "com.bv.wifisync.addweekly";
            }
        }, 
        Donate {
            public String getPurchaseString() {
                return "com.bv.wifisync.donate.managed";
            }
        };
        
        protected abstract String getPurchaseString();
    }
}
