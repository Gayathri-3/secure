package com.bv.wifisync;

import android.net.*;
import android.util.*;
import android.content.*;

public class WifiConnectReceiver extends BroadcastReceiver
{
    private boolean wifiConnected(final Intent intent) {
        boolean b = false;
        if (intent != null) {
            final boolean equals = "android.net.wifi.STATE_CHANGE".equals(intent.getAction());
            b = false;
            if (equals) {
                final NetworkInfo networkInfo = (NetworkInfo)intent.getParcelableExtra("networkInfo");
                b = (networkInfo != null && NetworkInfo$State.CONNECTED.equals((Object)networkInfo.getState()));
            }
        }
        String s;
        if (b) {
            s = " connected";
        }
        else {
            s = " disconnected";
        }
        Log.i("WifiConnectReceiver", s);
        return b;
    }
    
    public void onReceive(final Context context, final Intent intent) {
        if (this.wifiConnected(intent)) {
            SyncService.start(context);
        }
    }
}
