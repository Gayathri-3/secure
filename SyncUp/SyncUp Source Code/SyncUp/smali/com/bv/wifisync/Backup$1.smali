.class Lcom/bv/wifisync/Backup$1;
.super Landroid/app/backup/FileBackupHelper;
.source "Backup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Backup;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Backup;


# direct methods
.method varargs constructor <init>(Lcom/bv/wifisync/Backup;Landroid/content/Context;[Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Backup$1;->this$0:Lcom/bv/wifisync/Backup;

    .line 24
    invoke-direct {p0, p2, p3}, Landroid/app/backup/FileBackupHelper;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public performBackup(Landroid/os/ParcelFileDescriptor;Landroid/app/backup/BackupDataOutput;Landroid/os/ParcelFileDescriptor;)V
    .locals 5
    .parameter "oldState"
    .parameter "data"
    .parameter "newState"

    .prologue
    .line 27
    iget-object v2, p0, Lcom/bv/wifisync/Backup$1;->this$0:Lcom/bv/wifisync/Backup;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 28
    iget-object v3, p0, Lcom/bv/wifisync/Backup$1;->this$0:Lcom/bv/wifisync/Backup;

    const v4, 0x7f060146

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/Backup;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 30
    .local v0, backupProfiles:Z
    if-nez v0, :cond_0

    .line 32
    :try_start_0
    const-string v2, "hosts.dat"

    const/4 v3, -0x1

    invoke-virtual {p2, v2, v3}, Landroid/app/backup/BackupDataOutput;->writeEntityHeader(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    :goto_0
    return-void

    .line 33
    :catch_0
    move-exception v1

    .line 34
    .local v1, e:Ljava/io/IOException;
    iget-object v2, p0, Lcom/bv/wifisync/Backup$1;->this$0:Lcom/bv/wifisync/Backup;

    invoke-static {v2, v1}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    goto :goto_0

    .line 37
    .end local v1           #e:Ljava/io/IOException;
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/app/backup/FileBackupHelper;->performBackup(Landroid/os/ParcelFileDescriptor;Landroid/app/backup/BackupDataOutput;Landroid/os/ParcelFileDescriptor;)V

    goto :goto_0
.end method
