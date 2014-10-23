.class Lcom/bv/sync/SizeCalculator$CalcSizeThread$1;
.super Ljava/lang/Object;
.source "SizeCalculator.java"

# interfaces
.implements Lcom/bv/sync/IFileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/SizeCalculator$CalcSizeThread;->calcDirSize(Lcom/bv/sync/IFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/sync/SizeCalculator$CalcSizeThread;


# direct methods
.method constructor <init>(Lcom/bv/sync/SizeCalculator$CalcSizeThread;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread$1;->this$1:Lcom/bv/sync/SizeCalculator$CalcSizeThread;

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/bv/sync/IFile;)Z
    .locals 2
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    iget-object v1, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread$1;->this$1:Lcom/bv/sync/SizeCalculator$CalcSizeThread;

    #getter for: Lcom/bv/sync/SizeCalculator$CalcSizeThread;->this$0:Lcom/bv/sync/SizeCalculator;
    invoke-static {v1}, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->access$2(Lcom/bv/sync/SizeCalculator$CalcSizeThread;)Lcom/bv/sync/SizeCalculator;

    move-result-object v1

    #getter for: Lcom/bv/sync/SizeCalculator;->canceled:Z
    invoke-static {v1}, Lcom/bv/sync/SizeCalculator;->access$0(Lcom/bv/sync/SizeCalculator;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 150
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v1

    .line 151
    :cond_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v0

    .line 152
    .local v0, result:Z
    if-nez v0, :cond_1

    .line 153
    iget-object v1, p0, Lcom/bv/sync/SizeCalculator$CalcSizeThread$1;->this$1:Lcom/bv/sync/SizeCalculator$CalcSizeThread;

    #calls: Lcom/bv/sync/SizeCalculator$CalcSizeThread;->calcFileSize(Lcom/bv/sync/IFile;)V
    invoke-static {v1, p1}, Lcom/bv/sync/SizeCalculator$CalcSizeThread;->access$0(Lcom/bv/sync/SizeCalculator$CalcSizeThread;Lcom/bv/sync/IFile;)V

    .line 154
    :cond_1
    return v0
.end method
