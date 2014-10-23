.class public Lcom/bv/wifisync/Config;
.super Ljava/lang/Object;
.source "Config.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/Config$DontShowDialogs;
    }
.end annotation


# static fields
.field private static final EULA_ACCEPTED:Ljava/lang/String; = "accepted"

.field private static final LAST_MODIFIED_INDEX:Ljava/lang/String; = "last_modified_index"

.field private static final SHOW_EDIT_MODE:Ljava/lang/String; = "show_edit_mode"

.field private static final TRANSACTION_RESTORED_KEY:Ljava/lang/String; = "transaction_restored"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getAssistantVisible(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 34
    const v0, 0x7f060143

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 2
    .parameter "context"
    .parameter "key"
    .parameter "defaultValue"

    .prologue
    .line 24
    sget-object v1, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v1

    .line 25
    :try_start_0
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    monitor-exit v1

    return v0

    .line 24
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static getDontShow(Landroid/content/Context;Lcom/bv/wifisync/Config$DontShowDialogs;Z)Z
    .locals 1
    .parameter "context"
    .parameter "dialog"
    .parameter "defaultValue"

    .prologue
    .line 134
    invoke-virtual {p1}, Lcom/bv/wifisync/Config$DontShowDialogs;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static getForceWifi(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 67
    const v0, 0x7f06014f

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static getIgnoreSymLinks(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 95
    const v0, 0x7f060158

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static getIgnoreTimeZones(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 91
    const v0, 0x7f060155

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static getInstalled(Landroid/content/Context;)Z
    .locals 4
    .parameter "context"

    .prologue
    .line 109
    sget-object v2, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v2

    .line 110
    :try_start_0
    const-string v1, "EULA"

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 111
    .local v0, settings:Landroid/content/SharedPreferences;
    const-string v1, "accepted"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    monitor-exit v2

    return v1

    .line 109
    .end local v0           #settings:Landroid/content/SharedPreferences;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static getLastModifiedIndex(Landroid/content/Context;)I
    .locals 4
    .parameter "context"

    .prologue
    .line 52
    sget-object v1, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v1

    .line 53
    :try_start_0
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "last_modified_index"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    monitor-exit v1

    return v0

    .line 52
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static getMaxHistoryLines()I
    .locals 1

    .prologue
    .line 30
    const/16 v0, 0xa

    return v0
.end method

.method static getMinFreeSpace(Landroid/content/Context;)J
    .locals 8
    .parameter "context"

    .prologue
    const-wide/16 v6, 0x400

    .line 162
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x9

    if-ge v3, v4, :cond_0

    .line 163
    const-wide/16 v3, 0x0

    .line 166
    :goto_0
    return-wide v3

    .line 164
    :cond_0
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const v4, 0x7f0601bb

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "10"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 165
    .local v2, value:Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    int-to-long v0, v3

    .line 166
    .local v0, parseInt:J
    mul-long v3, v0, v6

    mul-long/2addr v3, v6

    goto :goto_0
.end method

.method static getNetworkTimeout(Landroid/content/Context;)I
    .locals 7
    .parameter "context"

    .prologue
    .line 142
    const/16 v0, 0x1e

    .line 143
    .local v0, DEFAULT_TIMEOUT:I
    sget-object v4, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v4

    .line 145
    :try_start_0
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const v5, 0x7f0601ac

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 146
    .local v2, timeout:Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .end local v0           #DEFAULT_TIMEOUT:I
    :try_start_1
    monitor-exit v4

    .line 148
    .end local v2           #timeout:Ljava/lang/String;
    :goto_0
    return v0

    .line 147
    .restart local v0       #DEFAULT_TIMEOUT:I
    :catch_0
    move-exception v1

    .line 148
    .local v1, e:Ljava/lang/Exception;
    monitor-exit v4

    goto :goto_0

    .line 143
    .end local v0           #DEFAULT_TIMEOUT:I
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method static getNoMediaRescan(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 138
    const v0, 0x7f06015b

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 1
    .parameter "context"

    .prologue
    .line 38
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method static getPurchase(Landroid/content/Context;Lcom/bv/wifisync/Biller$ChargeType;)Z
    .locals 2
    .parameter "context"
    .parameter "chargeType"

    .prologue
    .line 71
    invoke-virtual {p1}, Lcom/bv/wifisync/Biller$ChargeType;->getPurchaseString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static getShowDeviceRoot(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 42
    const v0, 0x7f060149

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static getShowEditMode(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 103
    const-string v0, "show_edit_mode"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static getShowErrorNotification(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 87
    const v0, 0x7f060152

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static getSyncButtonMode(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 154
    const v0, 0x7f0601af

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static getVibrate(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 46
    const v0, 0x7f06014c

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static saveBoolean(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 4
    .parameter "context"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 15
    sget-object v3, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v3

    .line 16
    :try_start_0
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 17
    .local v1, prefs:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 18
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 19
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 15
    monitor-exit v3

    .line 21
    return-void

    .line 15
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v1           #prefs:Landroid/content/SharedPreferences;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method static setDontShow(Landroid/content/Context;Lcom/bv/wifisync/Config$DontShowDialogs;Z)V
    .locals 1
    .parameter "context"
    .parameter "dialog"
    .parameter "value"

    .prologue
    .line 130
    invoke-virtual {p1}, Lcom/bv/wifisync/Config$DontShowDialogs;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lcom/bv/wifisync/Config;->saveBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 131
    return-void
.end method

.method static setInstalled(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    .line 116
    sget-object v3, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v3

    .line 117
    :try_start_0
    const-string v2, "EULA"

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 118
    .local v1, settings:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 119
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v2, "accepted"

    const/4 v4, 0x1

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 120
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 116
    monitor-exit v3

    .line 122
    return-void

    .line 116
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v1           #settings:Landroid/content/SharedPreferences;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method static setLastModifiedIndex(Landroid/content/Context;I)V
    .locals 4
    .parameter "context"
    .parameter "value"

    .prologue
    .line 58
    sget-object v3, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v3

    .line 59
    :try_start_0
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 60
    .local v1, prefs:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 61
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v2, "last_modified_index"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 62
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 58
    monitor-exit v3

    .line 64
    return-void

    .line 58
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v1           #prefs:Landroid/content/SharedPreferences;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method static setPurchase(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0
    .parameter "context"
    .parameter "type"
    .parameter "value"

    .prologue
    .line 75
    invoke-static {p0, p1, p2}, Lcom/bv/wifisync/Config;->saveBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 76
    return-void
.end method

.method static setShowEditMode(Landroid/content/Context;Z)V
    .locals 1
    .parameter "context"
    .parameter "value"

    .prologue
    .line 99
    const-string v0, "show_edit_mode"

    invoke-static {p0, v0, p1}, Lcom/bv/wifisync/Config;->saveBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 100
    return-void
.end method

.method static setSyncButtonMode(Landroid/content/Context;Z)V
    .locals 1
    .parameter "context"
    .parameter "value"

    .prologue
    .line 158
    const v0, 0x7f0601af

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1}, Lcom/bv/wifisync/Config;->saveBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 159
    return-void
.end method

.method static setTransactionRestored(Landroid/content/Context;Z)V
    .locals 1
    .parameter "context"
    .parameter "value"

    .prologue
    .line 83
    const-string v0, "transaction_restored"

    invoke-static {p0, v0, p1}, Lcom/bv/wifisync/Config;->saveBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 84
    return-void
.end method

.method static transactionRestored(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 79
    const-string v0, "transaction_restored"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
