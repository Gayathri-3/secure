package com.bv.wifisync;

import android.app.backup.*;
import android.view.*;
import android.os.*;
import android.annotation.*;
import android.preference.*;
import android.content.*;
import java.io.*;
import com.bv.sync.*;

public class Settings extends PreferenceActivity implements SharedPreferences$OnSharedPreferenceChangeListener, Preference$OnPreferenceChangeListener
{
    private BackupManager backupManager;
    
    private boolean isValidNumber(final Object o) {
        try {
            return new StringBuilder().append(Integer.parseInt((String)o)).toString().equals(o);
        }
        catch (Throwable t) {
            return false;
        }
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.addPreferencesFromResource(2131034113);
        this.setTitle(2131099970);
        this.backupManager = new BackupManager((Context)this);
        PreferenceManager.getDefaultSharedPreferences((Context)this).registerOnSharedPreferenceChangeListener((SharedPreferences$OnSharedPreferenceChangeListener)this);
        this.getPreferenceScreen().findPreference((CharSequence)this.getString(2131100091)).setOnPreferenceChangeListener((Preference$OnPreferenceChangeListener)this);
    }
    
    @TargetApi(11)
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        if (Build$VERSION.SDK_INT >= 11 && menuItem != null && menuItem.getItemId() == 16908332) {
            this.onBackPressed();
        }
        return super.onOptionsItemSelected(menuItem);
    }
    
    public boolean onPreferenceChange(final Preference preference, final Object o) {
        final boolean validNumber = this.isValidNumber(o);
        if (!validNumber) {
            Dialogs.showMessage((Context)this, this.getString(2131099824, new Object[] { o }));
        }
        return validNumber;
    }
    
    public void onSharedPreferenceChanged(final SharedPreferences sharedPreferences, final String s) {
        try {
            this.backupManager.dataChanged();
            final String string = this.getString(2131099974);
            Label_0067: {
                if (!string.equals(s) || !sharedPreferences.getBoolean(string, false)) {
                    break Label_0067;
                }
                synchronized (Utils.configReadWriteLock) {
                    new File(this.getFilesDir(), "hosts.dat").setLastModified(System.currentTimeMillis());
                    // monitorexit(Utils.configReadWriteLock)
                    if (this.getString(2131100076).equals(s)) {
                        RemoteFile.setRetryCount(Config.getNetworkTimeout((Context)this) / 3);
                    }
                }
            }
        }
        catch (Exception ex) {
            Dialogs.showError((Context)this, ex);
        }
    }
}
