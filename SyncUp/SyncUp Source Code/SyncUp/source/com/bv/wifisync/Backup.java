package com.bv.wifisync;

import android.os.*;
import java.io.*;
import android.content.*;
import android.preference.*;
import android.app.backup.*;

public class Backup extends BackupAgentHelper
{
    static final String FILES_BACKUP_KEY = "files";
    static final String PREFS = "preferences";
    static final String PREFS_BACKUP_KEY = "prefs";
    
    public void onBackup(final ParcelFileDescriptor parcelFileDescriptor, final BackupDataOutput backupDataOutput, final ParcelFileDescriptor parcelFileDescriptor2) throws IOException {
        synchronized (Utils.configReadWriteLock) {
            super.onBackup(parcelFileDescriptor, backupDataOutput, parcelFileDescriptor2);
        }
    }
    
    public void onCreate() {
        this.addHelper("prefs", (BackupHelper)new SharedPreferencesBackupHelper((Context)this, new String[] { "app", "EULA", String.valueOf(this.getPackageName()) + "_preferences" }));
        this.addHelper("files", (BackupHelper)new FileBackupHelper(this, new String[] { "hosts.dat" }) {
            public void performBackup(final ParcelFileDescriptor parcelFileDescriptor, final BackupDataOutput backupDataOutput, final ParcelFileDescriptor parcelFileDescriptor2) {
                Label_0049: {
                    if (PreferenceManager.getDefaultSharedPreferences((Context)Backup.this).getBoolean(Backup.this.getString(2131099974), false)) {
                        break Label_0049;
                    }
                    try {
                        backupDataOutput.writeEntityHeader("hosts.dat", -1);
                        return;
                    }
                    catch (IOException ex) {
                        Errors.getErrorMessage((Context)Backup.this, ex);
                        return;
                    }
                }
                super.performBackup(parcelFileDescriptor, backupDataOutput, parcelFileDescriptor2);
            }
        });
    }
    
    public void onRestore(final BackupDataInput backupDataInput, final int n, final ParcelFileDescriptor parcelFileDescriptor) throws IOException {
        synchronized (Utils.configReadWriteLock) {
            super.onRestore(backupDataInput, n, parcelFileDescriptor);
        }
    }
}
