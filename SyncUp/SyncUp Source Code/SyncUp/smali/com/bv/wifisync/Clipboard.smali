.class Lcom/bv/wifisync/Clipboard;
.super Ljava/lang/Object;
.source "Clipboard.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/Clipboard$CopyType;,
        Lcom/bv/wifisync/Clipboard$CutSubscriber;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Clipboard"

.field private static files:[Lcom/bv/sync/IFile;

.field private static subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;

.field private static type:Lcom/bv/wifisync/Clipboard$CopyType;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static acquireWakeLock(Landroid/content/Context;)Landroid/os/PowerManager$WakeLock;
    .locals 4
    .parameter "context"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Wakelock"
        }
    .end annotation

    .prologue
    .line 108
    const-string v2, "power"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 109
    .local v0, powerManager:Landroid/os/PowerManager;
    const/4 v2, 0x1

    const v3, 0x7f060001

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    .line 110
    .local v1, result:Landroid/os/PowerManager$WakeLock;
    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 111
    return-object v1
.end method

.method static clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 115
    sput-object v0, Lcom/bv/wifisync/Clipboard;->files:[Lcom/bv/sync/IFile;

    .line 116
    sput-object v0, Lcom/bv/wifisync/Clipboard;->subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;

    .line 117
    return-void
.end method

.method static clearSubscriber(Lcom/bv/wifisync/Clipboard$CutSubscriber;)V
    .locals 1
    .parameter "subscriber"

    .prologue
    .line 43
    sget-object v0, Lcom/bv/wifisync/Clipboard;->subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;

    if-ne p0, v0, :cond_0

    .line 44
    const/4 v0, 0x0

    sput-object v0, Lcom/bv/wifisync/Clipboard;->subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;

    .line 45
    :cond_0
    return-void
.end method

.method static declared-synchronized copy([Lcom/bv/sync/IFile;)V
    .locals 2
    .parameter "files"

    .prologue
    .line 32
    const-class v1, Lcom/bv/wifisync/Clipboard;

    monitor-enter v1

    :try_start_0
    sput-object p0, Lcom/bv/wifisync/Clipboard;->files:[Lcom/bv/sync/IFile;

    .line 33
    sget-object v0, Lcom/bv/wifisync/Clipboard$CopyType;->Copy:Lcom/bv/wifisync/Clipboard$CopyType;

    sput-object v0, Lcom/bv/wifisync/Clipboard;->type:Lcom/bv/wifisync/Clipboard$CopyType;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    monitor-exit v1

    return-void

    .line 32
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized cut([Lcom/bv/sync/IFile;Lcom/bv/wifisync/Clipboard$CutSubscriber;)V
    .locals 2
    .parameter "files"
    .parameter "subscriber"

    .prologue
    .line 37
    const-class v1, Lcom/bv/wifisync/Clipboard;

    monitor-enter v1

    :try_start_0
    sput-object p0, Lcom/bv/wifisync/Clipboard;->files:[Lcom/bv/sync/IFile;

    .line 38
    sget-object v0, Lcom/bv/wifisync/Clipboard$CopyType;->Cut:Lcom/bv/wifisync/Clipboard$CopyType;

    sput-object v0, Lcom/bv/wifisync/Clipboard;->type:Lcom/bv/wifisync/Clipboard$CopyType;

    .line 39
    sput-object p1, Lcom/bv/wifisync/Clipboard;->subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    monitor-exit v1

    return-void

    .line 37
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static delete(Landroid/content/Context;[Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)I
    .locals 2
    .parameter "context"
    .parameter "files"
    .parameter "progressNotification"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .local v0, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    :try_start_0
    invoke-static {p1, p2, v0}, Lcom/bv/sync/FileManager;->delete([Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;Ljava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    invoke-static {p0, v0, p2}, Lcom/bv/wifisync/Utils;->updateMediaFiles(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    .line 89
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    return v1

    .line 86
    :catchall_0
    move-exception v1

    .line 87
    invoke-static {p0, v0, p2}, Lcom/bv/wifisync/Utils;->updateMediaFiles(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    .line 88
    throw v1
.end method

.method static getDataType()Lcom/bv/wifisync/Clipboard$CopyType;
    .locals 1

    .prologue
    .line 120
    sget-object v0, Lcom/bv/wifisync/Clipboard;->type:Lcom/bv/wifisync/Clipboard$CopyType;

    return-object v0
.end method

.method static declared-synchronized hasData()Z
    .locals 2

    .prologue
    .line 48
    const-class v1, Lcom/bv/wifisync/Clipboard;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/bv/wifisync/Clipboard;->files:[Lcom/bv/sync/IFile;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/bv/wifisync/Clipboard;->files:[Lcom/bv/sync/IFile;

    array-length v0, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static varargs lockIsNeeded([Lcom/bv/sync/IFile;)Z
    .locals 5
    .parameter "files"

    .prologue
    const/4 v1, 0x0

    .line 93
    array-length v3, p0

    move v2, v1

    :goto_0
    if-lt v2, v3, :cond_0

    .line 96
    :goto_1
    return v1

    .line 93
    :cond_0
    aget-object v0, p0, v2

    .line 94
    .local v0, file:Lcom/bv/sync/IFile;
    instance-of v4, v0, Lcom/bv/sync/RemoteFile;

    if-eqz v4, :cond_1

    .line 95
    const/4 v1, 0x1

    goto :goto_1

    .line 93
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static lockWifi(Landroid/content/Context;)Landroid/net/wifi/WifiManager$WifiLock;
    .locals 4
    .parameter "context"

    .prologue
    .line 100
    const-string v2, "wifi"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 101
    .local v1, wifiManager:Landroid/net/wifi/WifiManager;
    const/4 v2, 0x1

    const-string v3, "Clipboard"

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v0

    .line 102
    .local v0, result:Landroid/net/wifi/WifiManager$WifiLock;
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    .line 103
    return-object v0
.end method

.method static paste(Landroid/content/Context;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)I
    .locals 7
    .parameter "context"
    .parameter "destination"
    .parameter "progressNotification"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 53
    const-class v5, Lcom/bv/wifisync/Clipboard;

    monitor-enter v5

    .line 54
    :try_start_0
    sget-object v2, Lcom/bv/wifisync/Clipboard;->files:[Lcom/bv/sync/IFile;

    .line 53
    .local v2, sourceFiles:[Lcom/bv/sync/IFile;
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .local v1, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    invoke-static {p0}, Lcom/bv/wifisync/Clipboard;->acquireWakeLock(Landroid/content/Context;)Landroid/os/PowerManager$WakeLock;

    move-result-object v3

    .line 59
    .local v3, wakeLock:Landroid/os/PowerManager$WakeLock;
    const/4 v0, 0x0

    .line 60
    .local v0, lock:Landroid/net/wifi/WifiManager$WifiLock;
    :try_start_1
    invoke-static {v2}, Lcom/bv/wifisync/Clipboard;->lockIsNeeded([Lcom/bv/sync/IFile;)Z

    move-result v4

    if-nez v4, :cond_0

    const/4 v4, 0x1

    new-array v4, v4, [Lcom/bv/sync/IFile;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v4}, Lcom/bv/wifisync/Clipboard;->lockIsNeeded([Lcom/bv/sync/IFile;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 61
    :cond_0
    invoke-static {p0}, Lcom/bv/wifisync/Clipboard;->lockWifi(Landroid/content/Context;)Landroid/net/wifi/WifiManager$WifiLock;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-result-object v0

    .line 63
    :cond_1
    :try_start_2
    sget-object v4, Lcom/bv/wifisync/Clipboard;->type:Lcom/bv/wifisync/Clipboard$CopyType;

    sget-object v5, Lcom/bv/wifisync/Clipboard$CopyType;->Copy:Lcom/bv/wifisync/Clipboard$CopyType;

    if-ne v4, v5, :cond_5

    .line 64
    invoke-static {v2, p1, p2, v1}, Lcom/bv/sync/FileManager;->copy([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;Ljava/util/List;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 68
    :goto_0
    if-eqz v0, :cond_2

    .line 69
    :try_start_3
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    .line 70
    :cond_2
    sget-object v4, Lcom/bv/wifisync/Clipboard;->type:Lcom/bv/wifisync/Clipboard$CopyType;

    sget-object v5, Lcom/bv/wifisync/Clipboard$CopyType;->Cut:Lcom/bv/wifisync/Clipboard$CopyType;

    if-ne v4, v5, :cond_3

    .line 71
    const/4 v4, 0x0

    sput-object v4, Lcom/bv/wifisync/Clipboard;->files:[Lcom/bv/sync/IFile;

    .line 72
    :cond_3
    invoke-static {p0, v1, p2}, Lcom/bv/wifisync/Utils;->updateMediaFiles(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    .line 73
    sget-object v4, Lcom/bv/wifisync/Clipboard;->subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;

    if-eqz v4, :cond_4

    .line 74
    sget-object v4, Lcom/bv/wifisync/Clipboard;->subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;

    invoke-interface {v4}, Lcom/bv/wifisync/Clipboard$CutSubscriber;->onPaste()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 77
    :cond_4
    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 79
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    return v4

    .line 53
    .end local v0           #lock:Landroid/net/wifi/WifiManager$WifiLock;
    .end local v1           #result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    .end local v2           #sourceFiles:[Lcom/bv/sync/IFile;
    .end local v3           #wakeLock:Landroid/os/PowerManager$WakeLock;
    :catchall_0
    move-exception v4

    :try_start_4
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v4

    .line 66
    .restart local v0       #lock:Landroid/net/wifi/WifiManager$WifiLock;
    .restart local v1       #result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    .restart local v2       #sourceFiles:[Lcom/bv/sync/IFile;
    .restart local v3       #wakeLock:Landroid/os/PowerManager$WakeLock;
    :cond_5
    :try_start_5
    invoke-static {v2, p1, p2, v1}, Lcom/bv/sync/FileManager;->move([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;Ljava/util/List;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    .line 67
    :catchall_1
    move-exception v4

    .line 68
    if-eqz v0, :cond_6

    .line 69
    :try_start_6
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    .line 70
    :cond_6
    sget-object v5, Lcom/bv/wifisync/Clipboard;->type:Lcom/bv/wifisync/Clipboard$CopyType;

    sget-object v6, Lcom/bv/wifisync/Clipboard$CopyType;->Cut:Lcom/bv/wifisync/Clipboard$CopyType;

    if-ne v5, v6, :cond_7

    .line 71
    const/4 v5, 0x0

    sput-object v5, Lcom/bv/wifisync/Clipboard;->files:[Lcom/bv/sync/IFile;

    .line 72
    :cond_7
    invoke-static {p0, v1, p2}, Lcom/bv/wifisync/Utils;->updateMediaFiles(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    .line 73
    sget-object v5, Lcom/bv/wifisync/Clipboard;->subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;

    if-eqz v5, :cond_8

    .line 74
    sget-object v5, Lcom/bv/wifisync/Clipboard;->subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;

    invoke-interface {v5}, Lcom/bv/wifisync/Clipboard$CutSubscriber;->onPaste()V

    .line 75
    :cond_8
    throw v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 76
    :catchall_2
    move-exception v4

    .line 77
    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 78
    throw v4
.end method
