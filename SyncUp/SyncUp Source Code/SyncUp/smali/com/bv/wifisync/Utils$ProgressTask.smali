.class abstract Lcom/bv/wifisync/Utils$ProgressTask;
.super Landroid/os/AsyncTask;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ProgressTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Params:",
        "Ljava/lang/Object;",
        "Progress:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/AsyncTask",
        "<TParams;TProgress;TResult;>;"
    }
.end annotation


# instance fields
.field private final activity:Landroid/app/Activity;

.field protected error:Ljava/lang/Throwable;

.field private final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .parameter "activity"
    .parameter "name"

    .prologue
    .line 93
    .local p0, this:Lcom/bv/wifisync/Utils$ProgressTask;,"Lcom/bv/wifisync/Utils$ProgressTask<TParams;TProgress;TResult;>;"
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 94
    iput-object p1, p0, Lcom/bv/wifisync/Utils$ProgressTask;->activity:Landroid/app/Activity;

    .line 95
    iput-object p2, p0, Lcom/bv/wifisync/Utils$ProgressTask;->name:Ljava/lang/String;

    .line 96
    return-void
.end method


# virtual methods
.method protected varargs abstract atBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .parameter "args"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)TResult;"
        }
    .end annotation

    .prologue
    .line 103
    .local p0, this:Lcom/bv/wifisync/Utils$ProgressTask;,"Lcom/bv/wifisync/Utils$ProgressTask<TParams;TProgress;TResult;>;"
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/Utils$ProgressTask;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 104
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->atBackground([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 108
    :goto_0
    return-object v1

    .line 105
    :catch_0
    move-exception v0

    .line 106
    .local v0, e:Ljava/lang/Throwable;
    iput-object v0, p0, Lcom/bv/wifisync/Utils$ProgressTask;->error:Ljava/lang/Throwable;

    .line 108
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected onCancelled()V
    .locals 2

    .prologue
    .line 124
    .local p0, this:Lcom/bv/wifisync/Utils$ProgressTask;,"Lcom/bv/wifisync/Utils$ProgressTask<TParams;TProgress;TResult;>;"
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 125
    iget-object v0, p0, Lcom/bv/wifisync/Utils$ProgressTask;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setProgressBarIndeterminateVisibility(Z)V

    .line 126
    return-void
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p0, this:Lcom/bv/wifisync/Utils$ProgressTask;,"Lcom/bv/wifisync/Utils$ProgressTask<TParams;TProgress;TResult;>;"
    .local p1, result:Ljava/lang/Object;,"TResult;"
    iget-object v0, p0, Lcom/bv/wifisync/Utils$ProgressTask;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setProgressBarIndeterminateVisibility(Z)V

    .line 118
    invoke-virtual {p0}, Lcom/bv/wifisync/Utils$ProgressTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/Utils$ProgressTask;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/bv/wifisync/Utils$ProgressTask;->activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/bv/wifisync/Utils$ProgressTask;->error:Ljava/lang/Throwable;

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 120
    :cond_0
    return-void
.end method

.method varargs run([Ljava/lang/Object;)V
    .locals 2
    .parameter "params"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)V"
        }
    .end annotation

    .prologue
    .line 112
    .local p0, this:Lcom/bv/wifisync/Utils$ProgressTask;,"Lcom/bv/wifisync/Utils$ProgressTask<TParams;TProgress;TResult;>;"
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 113
    iget-object v0, p0, Lcom/bv/wifisync/Utils$ProgressTask;->activity:Landroid/app/Activity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setProgressBarIndeterminateVisibility(Z)V

    .line 114
    return-void
.end method
