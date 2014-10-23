package com.bv.wifisync;

import android.app.*;

abstract class DonateBiller extends PremiumBiller
{
    DonateBiller(final Activity activity, final Biller.ChargeType chargeType) {
        super(activity, chargeType);
    }
    
    protected String getPurchaseString() {
        return Biller.ChargeType.Donate.getPurchaseString();
    }
}
