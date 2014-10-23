.class Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;
.super Lcom/bv/wifisync/AddSchedule$ScheduleRow;
.source "AddSchedule.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddSchedule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScheduleWakeupRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddSchedule;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule;)V
    .locals 2
    .parameter

    .prologue
    .line 412
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    .line 413
    const v0, 0x7f060104

    const v1, 0x7f020033

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddSchedule$ScheduleRow;-><init>(Lcom/bv/wifisync/AddSchedule;II)V

    .line 414
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)Lcom/bv/wifisync/AddSchedule;
    .locals 1
    .parameter

    .prologue
    .line 411
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    return-object v0
.end method

.method private pickupInterval()V
    .locals 4

    .prologue
    .line 433
    new-instance v1, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1;

    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    invoke-direct {v1, p0, v2}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1;-><init>(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;Lcom/bv/wifisync/AddSchedule;)V

    .line 467
    .local v1, timeSetListener:Lcom/bv/wifisync/AddSchedule$TimeSetListener;
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    new-instance v3, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1MyDialog;

    invoke-direct {v3, p0, v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1MyDialog;-><init>(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;Lcom/bv/wifisync/AddSchedule$TimeSetListener;)V

    #setter for: Lcom/bv/wifisync/AddSchedule;->wakeupDialog:Lcom/bv/wifisync/AddSchedule$TimeDialog;
    invoke-static {v2, v3}, Lcom/bv/wifisync/AddSchedule;->access$14(Lcom/bv/wifisync/AddSchedule;Lcom/bv/wifisync/AddSchedule$TimeDialog;)V

    .line 468
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->wakeupDialog:Lcom/bv/wifisync/AddSchedule$TimeDialog;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$15(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/AddSchedule$TimeDialog;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->show()V

    .line 469
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->wakeupDialog:Lcom/bv/wifisync/AddSchedule$TimeDialog;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$15(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/AddSchedule$TimeDialog;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    .line 470
    .local v0, okButton:Landroid/widget/Button;
    new-instance v2, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$2;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$2;-><init>(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 483
    return-void
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 5

    .prologue
    .line 418
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    iget v0, v0, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    if-eqz v0, :cond_0

    .line 419
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const v1, 0x7f060105

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v4}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v4

    iget v4, v4, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    div-int/lit8 v4, v4, 0x3c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/bv/wifisync/AddSchedule;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 420
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const v1, 0x7f060115

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddSchedule;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 426
    :try_start_0
    invoke-direct {p0}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->pickupInterval()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 430
    :goto_0
    return-void

    .line 427
    :catch_0
    move-exception v0

    .line 428
    .local v0, e:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
