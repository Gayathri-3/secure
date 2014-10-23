.class Lcom/bv/wifisync/Utils$1PostMortem;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Utils;->setPostMortem(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PostMortem"
.end annotation


# instance fields
.field private final oldHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Ljava/lang/Thread$UncaughtExceptionHandler;Landroid/content/Context;)V
    .locals 0
    .parameter "oldHandler"
    .parameter

    .prologue
    .line 818
    iput-object p2, p0, Lcom/bv/wifisync/Utils$1PostMortem;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 819
    iput-object p1, p0, Lcom/bv/wifisync/Utils$1PostMortem;->oldHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 820
    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 3
    .parameter "thread"
    .parameter "ex"

    .prologue
    .line 825
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/Utils$1PostMortem;->val$context:Landroid/content/Context;

    invoke-static {v1, p2}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 829
    iget-object v1, p0, Lcom/bv/wifisync/Utils$1PostMortem;->oldHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v1, :cond_0

    .line 830
    iget-object v1, p0, Lcom/bv/wifisync/Utils$1PostMortem;->oldHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v1, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 832
    :cond_0
    :goto_0
    return-void

    .line 826
    :catch_0
    move-exception v0

    .line 827
    .local v0, th:Ljava/lang/Throwable;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 829
    iget-object v1, p0, Lcom/bv/wifisync/Utils$1PostMortem;->oldHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v1, :cond_0

    .line 830
    iget-object v1, p0, Lcom/bv/wifisync/Utils$1PostMortem;->oldHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v1, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 828
    .end local v0           #th:Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    .line 829
    iget-object v2, p0, Lcom/bv/wifisync/Utils$1PostMortem;->oldHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v2, :cond_1

    .line 830
    iget-object v2, p0, Lcom/bv/wifisync/Utils$1PostMortem;->oldHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v2, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 831
    :cond_1
    throw v1
.end method
