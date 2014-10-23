package com.bv.wifisync;

import android.content.*;
import android.util.*;

public class Autostart extends BroadcastReceiver
{
    public void onReceive(final Context context, final Intent intent) {
        Log.i("Autostart", "Started");
        SyncService.start(context);
    }
}
