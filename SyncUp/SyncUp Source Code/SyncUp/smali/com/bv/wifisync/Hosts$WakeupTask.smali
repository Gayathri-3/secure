.class Lcom/bv/wifisync/Hosts$WakeupTask;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "Hosts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Hosts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WakeupTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Lcom/bv/wifisync/Host;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Hosts;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Hosts;)V
    .locals 1
    .parameter

    .prologue
    .line 579
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$WakeupTask;->this$0:Lcom/bv/wifisync/Hosts;

    .line 580
    const-string v0, "Wakeup"

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 581
    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic atBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    check-cast p1, [Lcom/bv/wifisync/Host;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Hosts$WakeupTask;->atBackground([Lcom/bv/wifisync/Host;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs atBackground([Lcom/bv/wifisync/Host;)Ljava/lang/Void;
    .locals 2
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 585
    const/4 v1, 0x0

    aget-object v0, p1, v1

    .line 586
    .local v0, host:Lcom/bv/wifisync/Host;
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$WakeupTask;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Host;->wakeup(Landroid/content/Context;)V

    .line 587
    const/4 v1, 0x0

    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Hosts$WakeupTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 3
    .parameter "result"

    .prologue
    .line 592
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 593
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$WakeupTask;->error:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts$WakeupTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 594
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$WakeupTask;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$WakeupTask;->this$0:Lcom/bv/wifisync/Hosts;

    const v2, 0x7f060107

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 595
    :cond_0
    return-void
.end method
