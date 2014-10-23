.class Lcom/bv/sync/SizeCalculator$1;
.super Ljava/lang/Object;
.source "SizeCalculator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/SizeCalculator;-><init>([Lcom/bv/sync/IFileFilter;[Lcom/bv/sync/IFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/SizeCalculator;


# direct methods
.method constructor <init>(Lcom/bv/sync/SizeCalculator;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/SizeCalculator$1;->this$0:Lcom/bv/sync/SizeCalculator;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 43
    iget-object v5, p0, Lcom/bv/sync/SizeCalculator$1;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->error:Ljava/lang/Throwable;
    invoke-static {v5}, Lcom/bv/sync/SizeCalculator;->access$3(Lcom/bv/sync/SizeCalculator;)Ljava/lang/Throwable;

    move-result-object v5

    if-nez v5, :cond_0

    .line 44
    const-wide/16 v3, 0x0

    .line 45
    .local v3, tmpSize:J
    const-wide/16 v1, 0x0

    .line 46
    .local v1, tmpCount:J
    iget-object v5, p0, Lcom/bv/sync/SizeCalculator$1;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->threads:Ljava/util/List;
    invoke-static {v5}, Lcom/bv/sync/SizeCalculator;->access$4(Lcom/bv/sync/SizeCalculator;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_1

    .line 50
    iget-object v5, p0, Lcom/bv/sync/SizeCalculator$1;->this$0:Lcom/bv/sync/SizeCalculator;

    #setter for: Lcom/bv/sync/SizeCalculator;->size:J
    invoke-static {v5, v3, v4}, Lcom/bv/sync/SizeCalculator;->access$5(Lcom/bv/sync/SizeCalculator;J)V

    .line 51
    iget-object v5, p0, Lcom/bv/sync/SizeCalculator$1;->this$0:Lcom/bv/sync/SizeCalculator;

    #setter for: Lcom/bv/sync/SizeCalculator;->count:J
    invoke-static {v5, v1, v2}, Lcom/bv/sync/SizeCalculator;->access$6(Lcom/bv/sync/SizeCalculator;J)V

    .line 53
    .end local v1           #tmpCount:J
    .end local v3           #tmpSize:J
    :cond_0
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Calculated: size="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/bv/sync/SizeCalculator$1;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->size:J
    invoke-static {v7}, Lcom/bv/sync/SizeCalculator;->access$7(Lcom/bv/sync/SizeCalculator;)J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", count="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/bv/sync/SizeCalculator$1;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->count:J
    invoke-static {v7}, Lcom/bv/sync/SizeCalculator;->access$8(Lcom/bv/sync/SizeCalculator;)J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", time="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    iget-object v9, p0, Lcom/bv/sync/SizeCalculator$1;->this$0:Lcom/bv/sync/SizeCalculator;

    #getter for: Lcom/bv/sync/SizeCalculator;->start:J
    invoke-static {v9}, Lcom/bv/sync/SizeCalculator;->access$9(Lcom/bv/sync/SizeCalculator;)J

    move-result-wide v9

    sub-long/2addr v7, v9

    const-wide/16 v9, 0x3e8

    div-long/2addr v7, v9

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 55
    iget-object v6, p0, Lcom/bv/sync/SizeCalculator$1;->this$0:Lcom/bv/sync/SizeCalculator;

    monitor-enter v6

    .line 56
    :try_start_0
    iget-object v5, p0, Lcom/bv/sync/SizeCalculator$1;->this$0:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V

    .line 55
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    return-void

    .line 46
    .restart local v1       #tmpCount:J
    .restart local v3       #tmpSize:J
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;

    .line 47
    .local v0, thread:Lcom/bv/sync/SizeCalculator$CalcSizeThread;
    iget-wide v6, v0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->size:J

    add-long/2addr v3, v6

    .line 48
    iget-wide v6, v0, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->count:J

    add-long/2addr v1, v6

    goto :goto_0

    .line 55
    .end local v0           #thread:Lcom/bv/sync/SizeCalculator$CalcSizeThread;
    .end local v1           #tmpCount:J
    .end local v3           #tmpSize:J
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5
.end method
