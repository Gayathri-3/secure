.class Lcom/bv/wifisync/Utils$FileScanner;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileScanner"
.end annotation


# instance fields
.field private connected:Z

.field private connection:Landroid/media/MediaScannerConnection;

.field protected final context:Landroid/content/Context;

.field private final files:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final progress:Lcom/bv/sync/ProgressNotification;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V
    .locals 0
    .parameter "context"
    .parameter
    .parameter "progress"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/bv/sync/ProgressNotification;",
            ")V"
        }
    .end annotation

    .prologue
    .line 638
    .local p2, files:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 639
    iput-object p1, p0, Lcom/bv/wifisync/Utils$FileScanner;->context:Landroid/content/Context;

    .line 640
    iput-object p3, p0, Lcom/bv/wifisync/Utils$FileScanner;->progress:Lcom/bv/sync/ProgressNotification;

    .line 641
    iput-object p2, p0, Lcom/bv/wifisync/Utils$FileScanner;->files:Ljava/util/Collection;

    .line 642
    return-void
.end method

.method private scanFile(Ljava/lang/String;I)V
    .locals 4
    .parameter "file"
    .parameter "index"

    .prologue
    .line 661
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Utils$FileScanner;->doScan(Ljava/lang/String;)V

    .line 662
    iget-object v0, p0, Lcom/bv/wifisync/Utils$FileScanner;->progress:Lcom/bv/sync/ProgressNotification;

    if-eqz v0, :cond_0

    .line 663
    iget-object v0, p0, Lcom/bv/wifisync/Utils$FileScanner;->progress:Lcom/bv/sync/ProgressNotification;

    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->UpdateMediaStore:Lcom/bv/sync/ProgressNotification$ProgressAction;

    int-to-float v2, p2

    iget-object v3, p0, Lcom/bv/wifisync/Utils$FileScanner;->files:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    const/high16 v3, 0x42c8

    mul-float/2addr v2, v3

    float-to-int v2, v2

    new-instance v3, Lcom/bv/sync/LocalFile;

    invoke-direct {v3, p1}, Lcom/bv/sync/LocalFile;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 664
    new-instance v0, Ljava/util/concurrent/CancellationException;

    invoke-direct {v0}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v0

    .line 665
    :cond_0
    return-void
.end method


# virtual methods
.method protected doScan(Ljava/lang/String;)V
    .locals 2
    .parameter "file"

    .prologue
    .line 635
    iget-object v0, p0, Lcom/bv/wifisync/Utils$FileScanner;->connection:Landroid/media/MediaScannerConnection;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/media/MediaScannerConnection;->scanFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 636
    return-void
.end method

.method public declared-synchronized onMediaScannerConnected()V
    .locals 1

    .prologue
    .line 669
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/bv/wifisync/Utils$FileScanner;->connected:Z

    .line 670
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 671
    monitor-exit p0

    return-void

    .line 669
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 0
    .parameter "path"
    .parameter "uri"

    .prologue
    .line 674
    return-void
.end method

.method declared-synchronized run()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 645
    monitor-enter p0

    :try_start_0
    new-instance v2, Landroid/media/MediaScannerConnection;

    iget-object v3, p0, Lcom/bv/wifisync/Utils$FileScanner;->context:Landroid/content/Context;

    invoke-direct {v2, v3, p0}, Landroid/media/MediaScannerConnection;-><init>(Landroid/content/Context;Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;)V

    iput-object v2, p0, Lcom/bv/wifisync/Utils$FileScanner;->connection:Landroid/media/MediaScannerConnection;

    .line 646
    iget-object v2, p0, Lcom/bv/wifisync/Utils$FileScanner;->connection:Landroid/media/MediaScannerConnection;

    invoke-virtual {v2}, Landroid/media/MediaScannerConnection;->connect()V

    .line 647
    const-wide/16 v2, 0x1388

    invoke-virtual {p0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 649
    const/4 v0, 0x0

    .line 650
    .local v0, count:I
    :try_start_1
    iget-boolean v2, p0, Lcom/bv/wifisync/Utils$FileScanner;->connected:Z

    if-eqz v2, :cond_1

    .line 651
    iget-object v2, p0, Lcom/bv/wifisync/Utils$FileScanner;->files:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    if-nez v3, :cond_0

    .line 656
    :goto_1
    :try_start_2
    iget-object v2, p0, Lcom/bv/wifisync/Utils$FileScanner;->connection:Landroid/media/MediaScannerConnection;

    invoke-virtual {v2}, Landroid/media/MediaScannerConnection;->disconnect()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 658
    monitor-exit p0

    return-void

    .line 651
    :cond_0
    :try_start_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 652
    .local v1, file:Ljava/lang/String;
    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v1, v0}, Lcom/bv/wifisync/Utils$FileScanner;->scanFile(Ljava/lang/String;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 655
    .end local v1           #file:Ljava/lang/String;
    :catchall_0
    move-exception v2

    .line 656
    :try_start_4
    iget-object v3, p0, Lcom/bv/wifisync/Utils$FileScanner;->connection:Landroid/media/MediaScannerConnection;

    invoke-virtual {v3}, Landroid/media/MediaScannerConnection;->disconnect()V

    .line 657
    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 645
    .end local v0           #count:I
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2

    .line 654
    .restart local v0       #count:I
    :cond_1
    :try_start_5
    const-string v2, "Utils"

    const-string v3, "Timeout connecting to MediaScanner"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1
.end method
