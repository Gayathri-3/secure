package com.bv.wifisync;

import android.content.*;
import android.util.*;

public class ChargeConnectReceiver extends BroadcastReceiver
{
    public void onReceive(final Context context, final Intent intent) {
        Log.i("ChargeConnectReceiver", "Started");
        if (intent != null && "android.intent.action.ACTION_POWER_CONNECTED".equals(intent.getAction())) {
            SyncService.start(context);
        }
    }
}
