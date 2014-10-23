package com.bv.wifisync;

import android.os.*;
import android.preference.*;
import android.content.*;

public class Config
{
    private static final String EULA_ACCEPTED = "accepted";
    private static final String LAST_MODIFIED_INDEX = "last_modified_index";
    private static final String SHOW_EDIT_MODE = "show_edit_mode";
    private static final String TRANSACTION_RESTORED_KEY = "transaction_restored";
    
    static boolean getAssistantVisible(final Context context) {
        return getBoolean(context, context.getString(2131099971), true);
    }
    
    static boolean getBoolean(final Context context, final String s, final boolean b) {
        synchronized (Utils.configReadWriteLock) {
            return getPreferences(context).getBoolean(s, b);
        }
    }
    
    static boolean getDontShow(final Context context, final DontShowDialogs dontShowDialogs, final boolean b) {
        return getBoolean(context, dontShowDialogs.toString(), b);
    }
    
    static boolean getForceWifi(final Context context) {
        return getBoolean(context, context.getString(2131099983), true);
    }
    
    static boolean getIgnoreSymLinks(final Context context) {
        return getBoolean(context, context.getString(2131099992), false);
    }
    
    static boolean getIgnoreTimeZones(final Context context) {
        return getBoolean(context, context.getString(2131099989), false);
    }
    
    static boolean getInstalled(final Context context) {
        synchronized (Utils.configReadWriteLock) {
            return context.getSharedPreferences("EULA", 0).getBoolean("accepted", false);
        }
    }
    
    static int getLastModifiedIndex(final Context context) {
        synchronized (Utils.configReadWriteLock) {
            return getPreferences(context).getInt("last_modified_index", 0);
        }
    }
    
    static int getMaxHistoryLines() {
        return 10;
    }
    
    static long getMinFreeSpace(final Context context) {
        long n;
        if (Build$VERSION.SDK_INT < 9) {
            n = 0L;
        }
        else {
            n = 1024L * (1024L * Integer.parseInt(getPreferences(context).getString(context.getString(2131100091), "10")));
        }
        return n;
    }
    
    static int getNetworkTimeout(final Context context) {
        int int1 = 30;
        synchronized (Utils.configReadWriteLock) {
            try {
                int1 = Integer.parseInt(getPreferences(context).getString(context.getString(2131100076), new StringBuilder().append(int1).toString()));
            }
            catch (Exception ex) {}
        }
        return int1;
    }
    
    static boolean getNoMediaRescan(final Context context) {
        return getBoolean(context, context.getString(2131099995), false);
    }
    
    private static SharedPreferences getPreferences(final Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context);
    }
    
    static boolean getPurchase(final Context context, final Biller.ChargeType chargeType) {
        return getBoolean(context, chargeType.getPurchaseString(), false);
    }
    
    static boolean getShowDeviceRoot(final Context context) {
        return getBoolean(context, context.getString(2131099977), false);
    }
    
    static boolean getShowEditMode(final Context context) {
        return getBoolean(context, "show_edit_mode", false);
    }
    
    static boolean getShowErrorNotification(final Context context) {
        return getBoolean(context, context.getString(2131099986), true);
    }
    
    static boolean getSyncButtonMode(final Context context) {
        return getBoolean(context, context.getString(2131100079), false);
    }
    
    static boolean getVibrate(final Context context) {
        return getBoolean(context, context.getString(2131099980), true);
    }
    
    static void saveBoolean(final Context context, final String s, final boolean b) {
        synchronized (Utils.configReadWriteLock) {
            final SharedPreferences$Editor edit = getPreferences(context).edit();
            edit.putBoolean(s, b);
            edit.commit();
        }
    }
    
    static void setDontShow(final Context context, final DontShowDialogs dontShowDialogs, final boolean b) {
        saveBoolean(context, dontShowDialogs.toString(), b);
    }
    
    static void setInstalled(final Context context) {
        synchronized (Utils.configReadWriteLock) {
            final SharedPreferences$Editor edit = context.getSharedPreferences("EULA", 0).edit();
            edit.putBoolean("accepted", true);
            edit.commit();
        }
    }
    
    static void setLastModifiedIndex(final Context context, final int n) {
        synchronized (Utils.configReadWriteLock) {
            final SharedPreferences$Editor edit = getPreferences(context).edit();
            edit.putInt("last_modified_index", n);
            edit.commit();
        }
    }
    
    static void setPurchase(final Context context, final String s, final boolean b) {
        saveBoolean(context, s, b);
    }
    
    static void setShowEditMode(final Context context, final boolean b) {
        saveBoolean(context, "show_edit_mode", b);
    }
    
    static void setSyncButtonMode(final Context context, final boolean b) {
        saveBoolean(context, context.getString(2131100079), b);
    }
    
    static void setTransactionRestored(final Context context, final boolean b) {
        saveBoolean(context, "transaction_restored", b);
    }
    
    static boolean transactionRestored(final Context context) {
        return getBoolean(context, "transaction_restored", false);
    }
    
    enum DontShowDialogs
    {
        MirrorMode("MirrorMode", 1), 
        ModifiedTimeWarning("ModifiedTimeWarning", 0);
    }
}
