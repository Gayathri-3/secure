package com.bv.wifisync;

import com.bv.sync.*;
import android.net.wifi.*;
import java.util.*;
import java.io.*;
import android.content.*;

class SyncSchedule extends Schedule implements Serializable
{
    private static final long serialVersionUID = -415135055304416987L;
    private boolean off;
    LinkedHashSet<String> routers;
    int wakeupInterval;
    boolean whenCharging;
    
    SyncSchedule(final int interval, final int exactTime, final LinkedHashSet<String> routers, final boolean whenCharging, final int wakeupInterval) {
        super();
        this.interval = interval;
        this.exactTime = exactTime;
        this.routers = routers;
        this.whenCharging = whenCharging;
        this.wakeupInterval = wakeupInterval;
    }
    
    private boolean isRouterConnected(final Context context) {
        final boolean wifiConnected = Utils.isWifiConnected(context);
        boolean b = false;
        if (wifiConnected) {
            final String ssid = ((WifiManager)context.getSystemService("wifi")).getConnectionInfo().getSSID();
            b = false;
            if (ssid != null) {
                final int length = ssid.length();
                b = false;
                if (length != 0) {
                    final boolean contains = this.routers.contains(Utils.stripQuotes(ssid));
                    b = false;
                    if (contains) {
                        b = true;
                    }
                }
            }
        }
        return b;
    }
    
    private void readObject(final ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        objectInputStream.defaultReadObject();
        this.interval = objectInputStream.readInt();
        this.exactTime = objectInputStream.readInt();
        this.weekdays = (boolean[])objectInputStream.readObject();
    }
    
    private Date tomorrow(final Date time) {
        final Calendar instance = Calendar.getInstance();
        instance.setTime(time);
        instance.add(5, 1);
        return instance.getTime();
    }
    
    private void writeObject(final ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.defaultWriteObject();
        objectOutputStream.writeInt(this.interval);
        objectOutputStream.writeInt(this.exactTime);
        objectOutputStream.writeObject(this.weekdays);
    }
    
    boolean getEnabled() {
        return !this.off;
    }
    
    int getExactTime() {
        return this.exactTime;
    }
    
    int getInterval() {
        return this.interval;
    }
    
    Date getNextTimeToRun(final Context context, final long n) {
        Date date;
        if (!this.off) {
            date = this.getNextTimeToRun(n);
            if (date == null && (this.isRouterDependant() || this.whenCharging)) {
                date = Schedule.getStartOfTheDay();
                if (n > date.getTime()) {
                    date = this.tomorrow(date);
                }
            }
        }
        else {
            date = null;
        }
        return date;
    }
    
    boolean[] getWeekdays() {
        return this.weekdays;
    }
    
    boolean isCharging(final Context context) {
        boolean b = true;
        final int intExtra = context.registerReceiver((BroadcastReceiver)null, new IntentFilter("android.intent.action.BATTERY_CHANGED")).getIntExtra("plugged", -1);
        if (intExtra != b && intExtra != 2 && intExtra != 4) {
            b = false;
        }
        return b;
    }
    
    boolean isChargingDependant() {
        synchronized (this) {
            return this.whenCharging;
        }
    }
    
    boolean isConnected(final Context context) {
        boolean b = true;
        synchronized (this) {
            final boolean routerDependant = this.isRouterDependant();
            if (routerDependant && this.whenCharging) {
                if (!this.isRouterConnected(context) || !this.isCharging(context)) {
                    b = false;
                }
            }
            else if (routerDependant) {
                b = this.isRouterConnected(context);
            }
            else if (this.whenCharging) {
                b = this.isCharging(context);
            }
            return b;
        }
    }
    
    boolean isReady(final Context context, final long n) {
        final Date nextTimeToRun = this.getNextTimeToRun(context, n);
        return nextTimeToRun != null && nextTimeToRun.getTime() <= System.currentTimeMillis() && this.isWeekDay() && this.isConnected(context);
    }
    
    boolean isRouterDependant() {
        synchronized (this) {
            return this.routers != null && this.routers.size() > 0;
        }
    }
    
    boolean isScheduled() {
        return !this.off && (this.interval != 0 || this.exactTime != 0 || this.weekScheduleExists() || this.isRouterDependant() || this.whenCharging);
    }
    
    void setEnabled(final boolean b) {
        this.off = !b;
    }
    
    void setExactTime(final int exactTime) {
        this.exactTime = exactTime;
    }
    
    void setInterval(final int interval) {
        this.interval = interval;
    }
}
