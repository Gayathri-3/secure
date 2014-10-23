.class Lcom/bv/wifisync/ThreadedQueue;
.super Ljava/lang/Object;
.source "ThreadedQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/ThreadedQueue$QueueThread;,
        Lcom/bv/wifisync/ThreadedQueue$Runner;,
        Lcom/bv/wifisync/ThreadedQueue$Wrapper;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private lock:[Ljava/lang/Object;

.field private final queue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lcom/bv/wifisync/ThreadedQueue",
            "<TT;>.Wrapper;>;"
        }
    .end annotation
.end field

.field private final threads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Thread;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>([Lcom/bv/wifisync/ThreadedQueue$Runner;)V
    .locals 5
    .parameter "runnables"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/bv/wifisync/ThreadedQueue$Runner",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/bv/wifisync/ThreadedQueue;,"Lcom/bv/wifisync/ThreadedQueue<TT;>;"
    const/4 v2, 0x0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    invoke-static {v3}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/bv/wifisync/ThreadedQueue;->threads:Ljava/util/List;

    .line 52
    new-array v3, v2, [Ljava/lang/Object;

    iput-object v3, p0, Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;

    .line 25
    new-instance v3, Ljava/util/concurrent/LinkedBlockingQueue;

    array-length v4, p1

    mul-int/lit8 v4, v4, 0x3

    invoke-direct {v3, v4}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object v3, p0, Lcom/bv/wifisync/ThreadedQueue;->queue:Ljava/util/concurrent/BlockingQueue;

    .line 27
    array-length v3, p1

    :goto_0
    if-lt v2, v3, :cond_0

    .line 31
    return-void

    .line 27
    :cond_0
    aget-object v0, p1, v2

    .line 28
    .local v0, runnable:Lcom/bv/wifisync/ThreadedQueue$Runner;,"Lcom/bv/wifisync/ThreadedQueue$Runner<TT;>;"
    iget-object v4, p0, Lcom/bv/wifisync/ThreadedQueue;->threads:Ljava/util/List;

    new-instance v1, Lcom/bv/wifisync/ThreadedQueue$QueueThread;

    invoke-direct {v1, p0, v0}, Lcom/bv/wifisync/ThreadedQueue$QueueThread;-><init>(Lcom/bv/wifisync/ThreadedQueue;Lcom/bv/wifisync/ThreadedQueue$Runner;)V

    .local v1, thread:Ljava/lang/Thread;
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 27
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/List;
    .locals 1
    .parameter

    .prologue
    .line 10
    iget-object v0, p0, Lcom/bv/wifisync/ThreadedQueue;->threads:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 52
    iget-object v0, p0, Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$2(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/concurrent/BlockingQueue;
    .locals 1
    .parameter

    .prologue
    .line 9
    iget-object v0, p0, Lcom/bv/wifisync/ThreadedQueue;->queue:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method


# virtual methods
.method add(Ljava/lang/Object;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 34
    .local p0, this:Lcom/bv/wifisync/ThreadedQueue;,"Lcom/bv/wifisync/ThreadedQueue<TT;>;"
    .local p1, t:Ljava/lang/Object;,"TT;"
    iget-object v0, p0, Lcom/bv/wifisync/ThreadedQueue;->queue:Ljava/util/concurrent/BlockingQueue;

    new-instance v1, Lcom/bv/wifisync/ThreadedQueue$Wrapper;

    invoke-direct {v1, p0, p1}, Lcom/bv/wifisync/ThreadedQueue$Wrapper;-><init>(Lcom/bv/wifisync/ThreadedQueue;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V

    .line 35
    return-void
.end method

.method cancel()V
    .locals 5

    .prologue
    .line 38
    .local p0, this:Lcom/bv/wifisync/ThreadedQueue;,"Lcom/bv/wifisync/ThreadedQueue<TT;>;"
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->clear()V

    .line 39
    :goto_0
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue;->threads:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 50
    return-void

    .line 40
    :cond_0
    iget-object v3, p0, Lcom/bv/wifisync/ThreadedQueue;->threads:Ljava/util/List;

    monitor-enter v3

    .line 41
    :try_start_0
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue;->threads:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 40
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    const-wide/16 v2, 0xa

    :try_start_1
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 46
    :catch_0
    move-exception v0

    .line 47
    .local v0, e1:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 41
    .end local v0           #e1:Ljava/lang/InterruptedException;
    :cond_1
    :try_start_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Thread;

    .line 42
    .local v1, thread:Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_1

    .line 40
    .end local v1           #thread:Ljava/lang/Thread;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method waitFor()V
    .locals 4

    .prologue
    .line 55
    .local p0, this:Lcom/bv/wifisync/ThreadedQueue;,"Lcom/bv/wifisync/ThreadedQueue<TT;>;"
    :goto_0
    iget-object v0, p0, Lcom/bv/wifisync/ThreadedQueue;->threads:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 63
    return-void

    .line 56
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;

    monitor-enter v1

    .line 58
    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/ThreadedQueue;->queue:Ljava/util/concurrent/BlockingQueue;

    new-instance v2, Lcom/bv/wifisync/ThreadedQueue$Wrapper;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/bv/wifisync/ThreadedQueue$Wrapper;-><init>(Lcom/bv/wifisync/ThreadedQueue;Ljava/lang/Object;)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V

    .line 59
    iget-object v0, p0, Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    :goto_1
    :try_start_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 60
    :catch_0
    move-exception v0

    goto :goto_1
.end method
