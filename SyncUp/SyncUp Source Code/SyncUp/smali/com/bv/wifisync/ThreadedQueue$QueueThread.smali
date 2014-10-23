.class Lcom/bv/wifisync/ThreadedQueue$QueueThread;
.super Ljava/lang/Thread;
.source "ThreadedQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/ThreadedQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "QueueThread"
.end annotation


# instance fields
.field private final runnable:Lcom/bv/wifisync/ThreadedQueue$Runner;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bv/wifisync/ThreadedQueue$Runner",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/bv/wifisync/ThreadedQueue;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/ThreadedQueue;Lcom/bv/wifisync/ThreadedQueue$Runner;)V
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/wifisync/ThreadedQueue$Runner",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p2, runnable:Lcom/bv/wifisync/ThreadedQueue$Runner;,"Lcom/bv/wifisync/ThreadedQueue$Runner<TT;>;"
    iput-object p1, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    .line 69
    const-string v0, "ConnectThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 70
    iput-object p2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->runnable:Lcom/bv/wifisync/ThreadedQueue$Runner;

    .line 71
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 78
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->queue:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v2}, Lcom/bv/wifisync/ThreadedQueue;->access$2(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/ThreadedQueue$Wrapper;

    .local v1, wrapper:Lcom/bv/wifisync/ThreadedQueue$Wrapper;,"Lcom/bv/wifisync/ThreadedQueue<TT;>.Wrapper;"
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/bv/wifisync/ThreadedQueue$Wrapper;->t:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-nez v2, :cond_1

    .line 84
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->threads:Ljava/util/List;
    invoke-static {v2}, Lcom/bv/wifisync/ThreadedQueue;->access$0(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 85
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;
    invoke-static {v2}, Lcom/bv/wifisync/ThreadedQueue;->access$1(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 86
    :try_start_1
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;
    invoke-static {v2}, Lcom/bv/wifisync/ThreadedQueue;->access$1(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 85
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 89
    .end local v1           #wrapper:Lcom/bv/wifisync/ThreadedQueue$Wrapper;,"Lcom/bv/wifisync/ThreadedQueue<TT;>.Wrapper;"
    :goto_1
    return-void

    .line 79
    .restart local v1       #wrapper:Lcom/bv/wifisync/ThreadedQueue$Wrapper;,"Lcom/bv/wifisync/ThreadedQueue<TT;>.Wrapper;"
    :cond_1
    :try_start_2
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->runnable:Lcom/bv/wifisync/ThreadedQueue$Runner;

    iget-object v3, v1, Lcom/bv/wifisync/ThreadedQueue$Wrapper;->t:Ljava/lang/Object;

    invoke-interface {v2, v3}, Lcom/bv/wifisync/ThreadedQueue$Runner;->run(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 80
    .end local v1           #wrapper:Lcom/bv/wifisync/ThreadedQueue$Wrapper;,"Lcom/bv/wifisync/ThreadedQueue<TT;>.Wrapper;"
    :catch_0
    move-exception v2

    .line 84
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->threads:Ljava/util/List;
    invoke-static {v2}, Lcom/bv/wifisync/ThreadedQueue;->access$0(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 85
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;
    invoke-static {v2}, Lcom/bv/wifisync/ThreadedQueue;->access$1(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 86
    :try_start_3
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;
    invoke-static {v2}, Lcom/bv/wifisync/ThreadedQueue;->access$1(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 85
    monitor-exit v3

    goto :goto_1

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2

    .line 81
    :catch_1
    move-exception v0

    .line 82
    .local v0, e:Ljava/lang/Exception;
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 84
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->threads:Ljava/util/List;
    invoke-static {v2}, Lcom/bv/wifisync/ThreadedQueue;->access$0(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 85
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;
    invoke-static {v2}, Lcom/bv/wifisync/ThreadedQueue;->access$1(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 86
    :try_start_5
    iget-object v2, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;
    invoke-static {v2}, Lcom/bv/wifisync/ThreadedQueue;->access$1(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 85
    monitor-exit v3

    goto :goto_1

    :catchall_1
    move-exception v2

    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v2

    .line 83
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_2
    move-exception v2

    .line 84
    iget-object v3, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->threads:Ljava/util/List;
    invoke-static {v3}, Lcom/bv/wifisync/ThreadedQueue;->access$0(Lcom/bv/wifisync/ThreadedQueue;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 85
    iget-object v3, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;
    invoke-static {v3}, Lcom/bv/wifisync/ThreadedQueue;->access$1(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 86
    :try_start_6
    iget-object v4, p0, Lcom/bv/wifisync/ThreadedQueue$QueueThread;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    #getter for: Lcom/bv/wifisync/ThreadedQueue;->lock:[Ljava/lang/Object;
    invoke-static {v4}, Lcom/bv/wifisync/ThreadedQueue;->access$1(Lcom/bv/wifisync/ThreadedQueue;)[Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->notify()V

    .line 85
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 88
    throw v2

    .line 85
    :catchall_3
    move-exception v2

    :try_start_7
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw v2

    .restart local v1       #wrapper:Lcom/bv/wifisync/ThreadedQueue$Wrapper;,"Lcom/bv/wifisync/ThreadedQueue<TT;>.Wrapper;"
    :catchall_4
    move-exception v2

    :try_start_8
    monitor-exit v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    throw v2
.end method
