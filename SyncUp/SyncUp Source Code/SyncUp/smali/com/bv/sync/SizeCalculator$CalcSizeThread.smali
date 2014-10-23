.class final Lcom/bv/sync/SizeCalculator$CalcSizeThread;
.super Ljava/lang/Thread;
.source "SizeCalculator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/SizeCalculator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "CalcSizeThread"
.end annotation


# instance fields
.field protected count:J

.field private final files:[Lcom/bv/sync/IFile;

.field private final filters:[Lcom/bv/sync/IFileFilter;

.field size:J

.field final synthetic this$0:Lcom/bv/sync/SizeCalculator;


# direct methods
.method private varargs constructor <init>(Lcom/bv/sync/SizeCalculator;[Lcom/bv/sync/IFileFilter;[Lcom/bv/sync/IFile;)V
    .locals 2
    .parameter
    .parameter "filters"
    .parameter "files"

    .prologue
    .line 107
    iput-object p1, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->this$0:Lcom/bv/sync/SizeCalculator;

    .line 108
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v0, "Size calculator: "

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v0, p3

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 109
    iput-object p3, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->files:[Lcom/bv/sync/IFile;

    .line 110
    iput-object p2, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->filters:[Lcom/bv/sync/IFileFilter;

    .line 111
    return-void

    .line 108
    :cond_0
    const/4 v0, 0x0

    aget-object v0, p3, v0

    invoke-interface {v0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method synthetic constructor <init>(Lcom/bv/sync/SizeCalculator;[Lcom/bv/sync/IFileFilter;[Lcom/bv/sync/IFile;Lcom/bv/sync/SizeCalculator$CalcSizeThread;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 107
    invoke-direct {p0, p1, p2, p3}, Lcom/bv/sync/SizeCalculator$CalcSizeThread;-><init>(Lcom/bv/sync/SizeCalculator;[Lcom/bv/sync/IFileFilter;[Lcom/bv/sync/IFile;)V

    return-void
.end method

.method static synthetic access$0(Lcom/bv/sync/SizeCalculator$CalcSizeThread;Lcom/bv/sync/IFile;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    invoke-direct {p0, p1}, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->calcFileSize(Lcom/bv/sync/IFile;)V

    return-void
.end method

.method static synthetic access$2(Lcom/bv/sync/SizeCalculator$CalcSizeThread;)Lcom/bv/sync/SizeCalculator;
    .locals 1
    .parameter

    .prologue
    .line 101
    iget-object v0, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->this$0:Lcom/bv/sync/SizeCalculator;

    return-object v0
.end method

.method private calcDirSize(Lcom/bv/sync/IFile;)V
    .locals 6
    .parameter "dir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    iget-wide v2, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->count:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->count:J

    .line 146
    new-instance v2, Lcom/bv/sync/SizeCalculator$CalcSizeThread$1;

    invoke-direct {v2, p0}, Lcom/bv/sync/SizeCalculator$CalcSizeThread$1;-><init>(Lcom/bv/sync/SizeCalculator$CalcSizeThread;)V

    invoke-interface {p1, v2}, Lcom/bv/sync/IFile;->listFiles(Lcom/bv/sync/IFileFilter;)[Lcom/bv/sync/IFile;

    move-result-object v0

    .line 157
    .local v0, dirs:[Lcom/bv/sync/IFile;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->canceled:Z
    invoke-static {v2}, Lcom/bv/sync/SizeCalculator;->access$0(Lcom/bv/sync/SizeCalculator;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 160
    :cond_0
    return-void

    .line 158
    :cond_1
    aget-object v2, v0, v1

    invoke-direct {p0, v2}, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->isSyncable(Lcom/bv/sync/IFile;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 159
    aget-object v2, v0, v1

    invoke-direct {p0, v2}, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->calcDirSize(Lcom/bv/sync/IFile;)V

    .line 157
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private calcFileSize(Lcom/bv/sync/IFile;)V
    .locals 4
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-direct {p0, p1}, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->isSyncable(Lcom/bv/sync/IFile;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    iget-wide v0, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->count:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->count:J

    .line 140
    iget-wide v0, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->size:J

    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->size:J

    .line 142
    :cond_0
    return-void
.end method

.method private isSyncable(Lcom/bv/sync/IFile;)Z
    .locals 6
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 163
    iget-object v2, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->filters:[Lcom/bv/sync/IFileFilter;

    if-eqz v2, :cond_0

    .line 164
    iget-object v3, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->filters:[Lcom/bv/sync/IFileFilter;

    array-length v4, v3

    move v2, v1

    :goto_0
    if-lt v2, v4, :cond_2

    .line 167
    :cond_0
    const/4 v1, 0x1

    :cond_1
    return v1

    .line 164
    :cond_2
    aget-object v0, v3, v2

    .line 165
    .local v0, filter:Lcom/bv/sync/IFileFilter;
    invoke-interface {v0, p1}, Lcom/bv/sync/IFileFilter;->accept(Lcom/bv/sync/IFile;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 164
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 115
    :try_start_0
    iget-object v3, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->files:[Lcom/bv/sync/IFile;

    array-length v4, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_1

    .line 127
    iget-object v2, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->canceled:Z
    invoke-static {v2}, Lcom/bv/sync/SizeCalculator;->access$0(Lcom/bv/sync/SizeCalculator;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 129
    :try_start_1
    iget-object v2, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->barier:Ljava/util/concurrent/CyclicBarrier;
    invoke-static {v2}, Lcom/bv/sync/SizeCalculator;->access$1(Lcom/bv/sync/SizeCalculator;)Ljava/util/concurrent/CyclicBarrier;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/CyclicBarrier;->await()I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/util/concurrent/BrokenBarrierException; {:try_start_1 .. :try_end_1} :catch_2

    .line 135
    :cond_0
    :goto_1
    return-void

    .line 115
    :cond_1
    :try_start_2
    aget-object v1, v3, v2

    .line 116
    .local v1, file:Lcom/bv/sync/IFile;
    if-eqz v1, :cond_2

    .line 117
    invoke-interface {v1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 118
    invoke-direct {p0, v1}, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->calcDirSize(Lcom/bv/sync/IFile;)V

    .line 115
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 120
    :cond_3
    invoke-direct {p0, v1}, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->calcFileSize(Lcom/bv/sync/IFile;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    .line 123
    .end local v1           #file:Lcom/bv/sync/IFile;
    :catch_0
    move-exception v0

    .line 124
    .local v0, e:Ljava/lang/Throwable;
    :try_start_3
    iget-object v2, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->this$0:Lcom/bv/sync/SizeCalculator;

    #setter for: Lcom/bv/sync/SizeCalculator;->error:Ljava/lang/Throwable;
    invoke-static {v2, v0}, Lcom/bv/sync/SizeCalculator;->access$2(Lcom/bv/sync/SizeCalculator;Ljava/lang/Throwable;)V

    .line 125
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 127
    iget-object v2, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->canceled:Z
    invoke-static {v2}, Lcom/bv/sync/SizeCalculator;->access$0(Lcom/bv/sync/SizeCalculator;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 129
    :try_start_4
    iget-object v2, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->barier:Ljava/util/concurrent/CyclicBarrier;
    invoke-static {v2}, Lcom/bv/sync/SizeCalculator;->access$1(Lcom/bv/sync/SizeCalculator;)Ljava/util/concurrent/CyclicBarrier;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/CyclicBarrier;->await()I
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/util/concurrent/BrokenBarrierException; {:try_start_4 .. :try_end_4} :catch_6

    goto :goto_1

    .line 131
    :catch_1
    move-exception v2

    goto :goto_1

    .line 126
    .end local v0           #e:Ljava/lang/Throwable;
    :catchall_0
    move-exception v2

    .line 127
    iget-object v3, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->canceled:Z
    invoke-static {v3}, Lcom/bv/sync/SizeCalculator;->access$0(Lcom/bv/sync/SizeCalculator;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 129
    :try_start_5
    iget-object v3, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->barier:Ljava/util/concurrent/CyclicBarrier;
    invoke-static {v3}, Lcom/bv/sync/SizeCalculator;->access$1(Lcom/bv/sync/SizeCalculator;)Ljava/util/concurrent/CyclicBarrier;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/CyclicBarrier;->await()I
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/util/concurrent/BrokenBarrierException; {:try_start_5 .. :try_end_5} :catch_4

    .line 134
    :cond_4
    :goto_3
    throw v2

    .line 132
    :catch_2
    move-exception v2

    goto :goto_1

    .line 131
    :catch_3
    move-exception v2

    goto :goto_1

    .line 132
    :catch_4
    move-exception v3

    goto :goto_3

    .line 131
    :catch_5
    move-exception v3

    goto :goto_3

    .line 132
    .restart local v0       #e:Ljava/lang/Throwable;
    :catch_6
    move-exception v2

    goto :goto_1
.end method
