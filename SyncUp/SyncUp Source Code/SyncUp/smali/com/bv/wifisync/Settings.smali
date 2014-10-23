.class public Lcom/bv/wifisync/Settings;
.super Landroid/preference/PreferenceActivity;
.source "Settings.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private backupManager:Landroid/app/backup/BackupManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method private isValidNumber(Ljava/lang/Object;)Z
    .locals 4
    .parameter "newValue"

    .prologue
    .line 71
    :try_start_0
    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    move-object v3, v0

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 72
    .local v2, value:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 74
    .end local v2           #value:I
    :goto_0
    return v3

    .line 73
    :catch_0
    move-exception v1

    .line 74
    .local v1, e:Ljava/lang/Throwable;
    const/4 v3, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 25
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    const v1, 0x7f050001

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/Settings;->addPreferencesFromResource(I)V

    .line 27
    const v1, 0x7f060142

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/Settings;->setTitle(I)V

    .line 28
    new-instance v1, Landroid/app/backup/BackupManager;

    invoke-direct {v1, p0}, Landroid/app/backup/BackupManager;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/bv/wifisync/Settings;->backupManager:Landroid/app/backup/BackupManager;

    .line 29
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 30
    invoke-virtual {p0}, Lcom/bv/wifisync/Settings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    const v2, 0x7f0601bb

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/Settings;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 31
    .local v0, preference:Landroid/preference/Preference;
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 32
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 55
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 56
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 57
    invoke-virtual {p0}, Lcom/bv/wifisync/Settings;->onBackPressed()V

    .line 58
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 4
    .parameter "preference"
    .parameter "newValue"

    .prologue
    .line 63
    invoke-direct {p0, p2}, Lcom/bv/wifisync/Settings;->isValidNumber(Ljava/lang/Object;)Z

    move-result v0

    .line 64
    .local v0, result:Z
    if-nez v0, :cond_0

    .line 65
    const v1, 0x7f0600b0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/bv/wifisync/Settings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 66
    :cond_0
    return v0
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 7
    .parameter "pref"
    .parameter "key"

    .prologue
    .line 37
    :try_start_0
    iget-object v3, p0, Lcom/bv/wifisync/Settings;->backupManager:Landroid/app/backup/BackupManager;

    invoke-virtual {v3}, Landroid/app/backup/BackupManager;->dataChanged()V

    .line 38
    const v3, 0x7f060146

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/Settings;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, backup:Ljava/lang/String;
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x0

    invoke-interface {p1, v0, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 40
    sget-object v4, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    :try_start_1
    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Lcom/bv/wifisync/Settings;->getFilesDir()Ljava/io/File;

    move-result-object v5

    const-string v6, "hosts.dat"

    invoke-direct {v3, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Ljava/io/File;->setLastModified(J)Z

    .line 40
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    :cond_0
    const v3, 0x7f0601ac

    :try_start_2
    invoke-virtual {p0, v3}, Lcom/bv/wifisync/Settings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 45
    .local v2, networkTimeout:Ljava/lang/String;
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 46
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getNetworkTimeout(Landroid/content/Context;)I

    move-result v3

    div-int/lit8 v3, v3, 0x3

    invoke-static {v3}, Lcom/bv/sync/RemoteFile;->setRetryCount(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 50
    .end local v0           #backup:Ljava/lang/String;
    .end local v2           #networkTimeout:Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 40
    .restart local v0       #backup:Ljava/lang/String;
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v3
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 47
    .end local v0           #backup:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 48
    .local v1, e:Ljava/lang/Exception;
    invoke-static {p0, v1}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
