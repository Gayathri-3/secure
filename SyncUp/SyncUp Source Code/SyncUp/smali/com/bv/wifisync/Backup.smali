.class public Lcom/bv/wifisync/Backup;
.super Landroid/app/backup/BackupAgentHelper;
.source "Backup.java"


# static fields
.field static final FILES_BACKUP_KEY:Ljava/lang/String; = "files"

.field static final PREFS:Ljava/lang/String; = "preferences"

.field static final PREFS_BACKUP_KEY:Ljava/lang/String; = "prefs"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/app/backup/BackupAgentHelper;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackup(Landroid/os/ParcelFileDescriptor;Landroid/app/backup/BackupDataOutput;Landroid/os/ParcelFileDescriptor;)V
    .locals 2
    .parameter "oldState"
    .parameter "data"
    .parameter "newState"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    sget-object v1, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v1

    .line 47
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Landroid/app/backup/BackupAgentHelper;->onBackup(Landroid/os/ParcelFileDescriptor;Landroid/app/backup/BackupDataOutput;Landroid/os/ParcelFileDescriptor;)V

    .line 46
    monitor-exit v1

    .line 49
    return-void

    .line 46
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onCreate()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 20
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/bv/wifisync/Backup;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "_preferences"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 21
    .local v0, DEFAULT_SHARED_PREFERENCES:Ljava/lang/String;
    new-instance v2, Landroid/app/backup/SharedPreferencesBackupHelper;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "app"

    aput-object v4, v3, v5

    const-string v4, "EULA"

    aput-object v4, v3, v6

    const/4 v4, 0x2

    aput-object v0, v3, v4

    invoke-direct {v2, p0, v3}, Landroid/app/backup/SharedPreferencesBackupHelper;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    .line 22
    .local v2, prefsBackup:Landroid/app/backup/SharedPreferencesBackupHelper;
    const-string v3, "prefs"

    invoke-virtual {p0, v3, v2}, Lcom/bv/wifisync/Backup;->addHelper(Ljava/lang/String;Landroid/app/backup/BackupHelper;)V

    .line 24
    new-instance v1, Lcom/bv/wifisync/Backup$1;

    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "hosts.dat"

    aput-object v4, v3, v5

    invoke-direct {v1, p0, p0, v3}, Lcom/bv/wifisync/Backup$1;-><init>(Lcom/bv/wifisync/Backup;Landroid/content/Context;[Ljava/lang/String;)V

    .line 40
    .local v1, filesBackup:Landroid/app/backup/FileBackupHelper;
    const-string v3, "files"

    invoke-virtual {p0, v3, v1}, Lcom/bv/wifisync/Backup;->addHelper(Ljava/lang/String;Landroid/app/backup/BackupHelper;)V

    .line 41
    return-void
.end method

.method public onRestore(Landroid/app/backup/BackupDataInput;ILandroid/os/ParcelFileDescriptor;)V
    .locals 2
    .parameter "data"
    .parameter "appVersionCode"
    .parameter "newState"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    sget-object v1, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v1

    .line 55
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Landroid/app/backup/BackupAgentHelper;->onRestore(Landroid/app/backup/BackupDataInput;ILandroid/os/ParcelFileDescriptor;)V

    .line 54
    monitor-exit v1

    .line 57
    return-void

    .line 54
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
