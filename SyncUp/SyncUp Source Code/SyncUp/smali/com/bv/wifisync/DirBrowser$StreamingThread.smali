.class final Lcom/bv/wifisync/DirBrowser$StreamingThread;
.super Ljava/lang/Thread;
.source "DirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "StreamingThread"
.end annotation


# instance fields
.field private canceled:Z

.field final result:Ljava/io/File;

.field private running:Z

.field private final selectedItem:Lcom/bv/sync/IFile;

.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;Ljava/io/File;)V
    .locals 2
    .parameter
    .parameter "selectedItem"
    .parameter "result"

    .prologue
    .line 422
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->this$0:Lcom/bv/wifisync/DirBrowser;

    .line 423
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "View "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 424
    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->selectedItem:Lcom/bv/sync/IFile;

    .line 425
    iput-object p3, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->result:Ljava/io/File;

    .line 426
    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;Ljava/io/File;Lcom/bv/wifisync/DirBrowser$StreamingThread;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 422
    invoke-direct {p0, p1, p2, p3}, Lcom/bv/wifisync/DirBrowser$StreamingThread;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$1(Lcom/bv/wifisync/DirBrowser$StreamingThread;)Lcom/bv/wifisync/DirBrowser;
    .locals 1
    .parameter

    .prologue
    .line 416
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->this$0:Lcom/bv/wifisync/DirBrowser;

    return-object v0
.end method


# virtual methods
.method cancel()V
    .locals 3

    .prologue
    .line 429
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->canceled:Z

    .line 430
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/4 v1, 0x5

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->running:Z

    if-nez v1, :cond_1

    .line 436
    :cond_0
    return-void

    .line 432
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser$StreamingThread;->interrupt()V

    .line 433
    const-wide/16 v1, 0xc8

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 430
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 434
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 485
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->result:Ljava/io/File;

    return-object v0
.end method

.method public run()V
    .locals 8

    .prologue
    .line 440
    const v5, 0xf000

    new-array v0, v5, [B

    .line 443
    .local v0, buffer:[B
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 444
    const/4 v5, 0x1

    :try_start_1
    iput-boolean v5, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->running:Z

    .line 445
    iget-object v5, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->selectedItem:Lcom/bv/sync/IFile;

    invoke-interface {v5}, Lcom/bv/sync/IFile;->canRead()Z

    move-result v5

    if-nez v5, :cond_1

    .line 446
    new-instance v5, Ljava/io/IOException;

    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->this$0:Lcom/bv/wifisync/DirBrowser;

    const v7, 0x7f060002

    invoke-virtual {v6, v7}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 443
    :catchall_0
    move-exception v5

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v5
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 468
    :catch_0
    move-exception v1

    .line 469
    .local v1, e:Ljava/lang/Exception;
    iget-boolean v5, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->canceled:Z

    if-nez v5, :cond_0

    .line 470
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 471
    iget-object v5, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->this$0:Lcom/bv/wifisync/DirBrowser;

    new-instance v6, Lcom/bv/wifisync/DirBrowser$StreamingThread$1;

    invoke-direct {v6, p0, v1}, Lcom/bv/wifisync/DirBrowser$StreamingThread$1;-><init>(Lcom/bv/wifisync/DirBrowser$StreamingThread;Ljava/lang/Exception;)V

    invoke-virtual {v5, v6}, Lcom/bv/wifisync/DirBrowser;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 482
    .end local v1           #e:Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void

    .line 448
    :cond_1
    :try_start_3
    iget-object v5, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->selectedItem:Lcom/bv/sync/IFile;

    invoke-interface {v5}, Lcom/bv/sync/IFile;->getInputStream()Ljava/io/InputStream;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v2

    .line 450
    .local v2, in:Ljava/io/InputStream;
    :try_start_4
    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v5, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->result:Ljava/io/File;

    invoke-direct {v3, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 452
    .local v3, out:Ljava/io/OutputStream;
    :goto_1
    :try_start_5
    iget-boolean v5, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->canceled:Z

    if-nez v5, :cond_2

    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result v4

    .local v4, size:I
    const/4 v5, -0x1

    if-ne v4, v5, :cond_3

    .line 455
    .end local v4           #size:I
    :cond_2
    :try_start_6
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 458
    :try_start_7
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 459
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->running:Z

    .line 460
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 462
    iget-boolean v5, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->canceled:Z

    if-eqz v5, :cond_5

    .line 463
    iget-object v5, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->result:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 443
    :goto_2
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 453
    .restart local v4       #size:I
    :cond_3
    const/4 v5, 0x0

    :try_start_8
    invoke-virtual {v3, v0, v5, v4}, Ljava/io/OutputStream;->write([BII)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_1

    .line 454
    .end local v4           #size:I
    :catchall_1
    move-exception v5

    .line 455
    :try_start_9
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 456
    throw v5
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 457
    .end local v3           #out:Ljava/io/OutputStream;
    :catchall_2
    move-exception v5

    .line 458
    :try_start_a
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 459
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->running:Z

    .line 460
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 462
    iget-boolean v6, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->canceled:Z

    if-eqz v6, :cond_4

    .line 463
    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->result:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 466
    :goto_3
    throw v5

    .line 465
    :cond_4
    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->result:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->deleteOnExit()V

    goto :goto_3

    .restart local v3       #out:Ljava/io/OutputStream;
    :cond_5
    iget-object v5, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread;->result:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->deleteOnExit()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_2
.end method
