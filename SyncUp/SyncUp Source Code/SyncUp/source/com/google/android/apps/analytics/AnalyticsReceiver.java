package com.google.android.apps.analytics;

import android.content.*;
import android.util.*;

public class AnalyticsReceiver extends BroadcastReceiver
{
    static final String INSTALL_ACTION = "com.android.vending.INSTALL_REFERRER";
    static final String REFERRER_KEY = "referrer";
    
    public void onReceive(final Context context, final Intent intent) {
        final String stringExtra = intent.getStringExtra("referrer");
        if ("com.android.vending.INSTALL_REFERRER".equals(intent.getAction()) && stringExtra != null) {
            Log.i("GoogleAnalyticsTracker", "referrer=" + stringExtra);
            if (new PersistentHitStore(context).setReferrer(stringExtra)) {
                Log.d("GoogleAnalyticsTracker", "Referrer store attemped succeeded.");
            }
            else {
                Log.w("GoogleAnalyticsTracker", "Referrer store attempt failed.");
            }
        }
    }
}
