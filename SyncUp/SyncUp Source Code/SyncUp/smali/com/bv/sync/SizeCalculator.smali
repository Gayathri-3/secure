.class Lcom/bv/sync/SizeCalculator;
.super Ljava/lang/Object;
.source "SizeCalculator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/SizeCalculator$CalcSizeThread;
    }
.end annotation


# instance fields
.field private final barier:Ljava/util/concurrent/CyclicBarrier;

.field private canceled:Z

.field private volatile count:J

.field private error:Ljava/lang/Throwable;

.field fileComparator:Lcom/bv/sync/Utils$FileComparator;

.field private volatile size:J

.field private final start:J

.field private final threads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SizeCalculator$CalcSizeThread;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>([Lcom/bv/sync/IFile;)V
    .locals 1
    .parameter "files"

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/bv/sync/SizeCalculator;-><init>([Lcom/bv/sync/IFileFilter;[Lcom/bv/sync/IFile;)V

    .line 72
    return-void
.end method

.method varargs constructor <init>([Lcom/bv/sync/IFileFilter;[Lcom/bv/sync/IFile;)V
    .locals 7
    .parameter "filters"
    .parameter "files"

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v4, Lcom/bv/sync/Utils$FileComparator;

    invoke-direct {v4}, Lcom/bv/sync/Utils$FileComparator;-><init>()V

    iput-object v4, p0, Lcom/bv/sync/SizeCalculator;->fileComparator:Lcom/bv/sync/Utils$FileComparator;

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/bv/sync/SizeCalculator;->start:J

    .line 25
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    iput-object v4, p0, Lcom/bv/sync/SizeCalculator;->threads:Ljava/util/List;

    .line 26
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .local v1, local:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .local v3, remote:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .local v2, other:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    array-length v5, p2

    const/4 v4, 0x0

    :goto_0
    if-lt v4, v5, :cond_0

    .line 36
    invoke-direct {p0, p1, v1}, Lcom/bv/sync/SizeCalculator;->addThread([Lcom/bv/sync/IFileFilter;Ljava/util/List;)V

    .line 37
    invoke-direct {p0, p1, v3}, Lcom/bv/sync/SizeCalculator;->addThread([Lcom/bv/sync/IFileFilter;Ljava/util/List;)V

    .line 38
    invoke-direct {p0, p1, v2}, Lcom/bv/sync/SizeCalculator;->addThread([Lcom/bv/sync/IFileFilter;Ljava/util/List;)V

    .line 40
    new-instance v4, Ljava/util/concurrent/CyclicBarrier;

    iget-object v5, p0, Lcom/bv/sync/SizeCalculator;->threads:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    new-instance v6, Lcom/bv/sync/SizeCalculator$1;

    invoke-direct {v6, p0}, Lcom/bv/sync/SizeCalculator$1;-><init>(Lcom/bv/sync/SizeCalculator;)V

    invoke-direct {v4, v5, v6}, Ljava/util/concurrent/CyclicBarrier;-><init>(ILjava/lang/Runnable;)V

    iput-object v4, p0, Lcom/bv/sync/SizeCalculator;->barier:Ljava/util/concurrent/CyclicBarrier;

    .line 60
    return-void

    .line 29
    :cond_0
    aget-object v0, p2, v4

    .line 30
    .local v0, file:Lcom/bv/sync/IFile;
    instance-of v6, v0, Lcom/bv/sync/LocalFile;

    if-eqz v6, :cond_1

    .line 31
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 32
    :cond_1
    instance-of v6, v0, Lcom/bv/sync/RemoteFile;

    if-eqz v6, :cond_2

    .line 33
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 35
    :cond_2
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method static synthetic access$0(Lcom/bv/sync/SizeCalculator;)Z
    .locals 1
    .parameter

    .prologue
    .line 18
    iget-boolean v0, p0, Lcom/bv/sync/SizeCalculator;->canceled:Z

    return v0
.end method

.method static synthetic access$1(Lcom/bv/sync/SizeCalculator;)Ljava/util/concurrent/CyclicBarrier;
    .locals 1
    .parameter

    .prologue
    .line 14
    iget-object v0, p0, Lcom/bv/sync/SizeCalculator;->barier:Ljava/util/concurrent/CyclicBarrier;

    return-object v0
.end method

.method static synthetic access$2(Lcom/bv/sync/SizeCalculator;Ljava/lang/Throwable;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 19
    iput-object p1, p0, Lcom/bv/sync/SizeCalculator;->error:Ljava/lang/Throwable;

    return-void
.end method

.method static synthetic access$3(Lcom/bv/sync/SizeCalculator;)Ljava/lang/Throwable;
    .locals 1
    .parameter

    .prologue
    .line 19
    iget-object v0, p0, Lcom/bv/sync/SizeCalculator;->error:Ljava/lang/Throwable;

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/sync/SizeCalculator;)Ljava/util/List;
    .locals 1
    .parameter

    .prologue
    .line 15
    iget-object v0, p0, Lcom/bv/sync/SizeCalculator;->threads:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$5(Lcom/bv/sync/SizeCalculator;J)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 16
    iput-wide p1, p0, Lcom/bv/sync/SizeCalculator;->size:J

    return-void
.end method

.method static synthetic access$6(Lcom/bv/sync/SizeCalculator;J)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 17
    iput-wide p1, p0, Lcom/bv/sync/SizeCalculator;->count:J

    return-void
.end method

.method static synthetic access$7(Lcom/bv/sync/SizeCalculator;)J
    .locals 2
    .parameter

    .prologue
    .line 16
    iget-wide v0, p0, Lcom/bv/sync/SizeCalculator;->size:J

    return-wide v0
.end method

.method static synthetic access$8(Lcom/bv/sync/SizeCalculator;)J
    .locals 2
    .parameter

    .prologue
    .line 17
    iget-wide v0, p0, Lcom/bv/sync/SizeCalculator;->count:J

    return-wide v0
.end method

.method static synthetic access$9(Lcom/bv/sync/SizeCalculator;)J
    .locals 2
    .parameter

    .prologue
    .line 21
    iget-wide v0, p0, Lcom/bv/sync/SizeCalculator;->start:J

    return-wide v0
.end method

.method private addThread([Lcom/bv/sync/IFileFilter;Ljava/util/List;)V
    .locals 3
    .parameter "filters"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/bv/sync/IFileFilter;",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p2, list:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_0

    .line 64
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcom/bv/sync/IFile;

    invoke-interface {p2, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/bv/sync/IFile;

    .line 65
    .local v0, files:[Lcom/bv/sync/IFile;
    new-instance v1, Lcom/bv/sync/SizeCalculator$CalcSizeThread;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v0, v2}, Lcom/bv/sync/SizeCalculator$CalcSizeThread;-><init>(Lcom/bv/sync/SizeCalculator;[Lcom/bv/sync/IFileFilter;[Lcom/bv/sync/IFile;Lcom/bv/sync/SizeCalculator$CalcSizeThread;)V

    .line 66
    .local v1, thread:Lcom/bv/sync/SizeCalculator$CalcSizeThread;
    iget-object v2, p0, Lcom/bv/sync/SizeCalculator;->threads:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .end local v0           #files:[Lcom/bv/sync/IFile;
    .end local v1           #thread:Lcom/bv/sync/SizeCalculator$CalcSizeThread;
    :cond_0
    return-void
.end method


# virtual methods
.method declared-synchronized calcSize()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 75
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/bv/sync/SizeCalculator;->start()V

    .line 76
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 77
    iget-object v0, p0, Lcom/bv/sync/SizeCalculator;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/bv/sync/SizeCalculator;->error:Ljava/lang/Throwable;

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 79
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/bv/sync/SizeCalculator;->getSize()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    monitor-exit p0

    return-wide v0
.end method

.method cancel()V
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/sync/SizeCalculator;->canceled:Z

    .line 98
    iget-object v0, p0, Lcom/bv/sync/SizeCalculator;->barier:Ljava/util/concurrent/CyclicBarrier;

    invoke-virtual {v0}, Ljava/util/concurrent/CyclicBarrier;->reset()V

    .line 99
    return-void
.end method

.method getCount()J
    .locals 2

    .prologue
    .line 93
    iget-wide v0, p0, Lcom/bv/sync/SizeCalculator;->count:J

    return-wide v0
.end method

.method getSize()J
    .locals 2

    .prologue
    .line 89
    iget-wide v0, p0, Lcom/bv/sync/SizeCalculator;->size:J

    return-wide v0
.end method

.method start()V
    .locals 3

    .prologue
    .line 83
    iget-object v1, p0, Lcom/bv/sync/SizeCalculator;->threads:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 86
    return-void

    .line 83
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Thread;

    .line 84
    .local v0, thread:Ljava/lang/Thread;
    if-eqz v0, :cond_0

    .line 85
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method
