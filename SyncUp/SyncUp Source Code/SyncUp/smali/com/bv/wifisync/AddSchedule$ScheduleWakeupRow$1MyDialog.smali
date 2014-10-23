.class Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1MyDialog;
.super Lcom/bv/wifisync/AddSchedule$TimeDialog;
.source "AddSchedule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->pickupInterval()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyDialog"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;


# direct methods
.method protected constructor <init>(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;Lcom/bv/wifisync/AddSchedule$TimeSetListener;)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 441
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1MyDialog;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    .line 442
    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {p1}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v0

    const/4 v1, 0x1

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {p1}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v2

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v2

    iget v2, v2, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    invoke-direct {p0, v0, v1, v2, p2}, Lcom/bv/wifisync/AddSchedule$TimeDialog;-><init>(Lcom/bv/wifisync/AddSchedule;ZILcom/bv/wifisync/AddSchedule$TimeSetListener;)V

    .line 443
    return-void
.end method


# virtual methods
.method protected formatMessage(II)Ljava/lang/String;
    .locals 6
    .parameter "hour"
    .parameter "minute"

    .prologue
    .line 447
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1MyDialog;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    const v2, 0x7f060105

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    mul-int/lit8 v5, p1, 0x3c

    add-int/2addr v5, p2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/bv/wifisync/AddSchedule;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1MyDialog;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    const v2, 0x7f0600e9

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddSchedule;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 452
    invoke-super {p0, p1}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->onCreate(Landroid/os/Bundle;)V

    .line 453
    const v0, 0x7f060104

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1MyDialog;->setTitle(I)V

    .line 454
    const v0, 0x7f020033

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1MyDialog;->setIcon(I)V

    .line 455
    return-void
.end method

.method public onTimeChanged(Landroid/widget/TimePicker;II)V
    .locals 1
    .parameter "view"
    .parameter "hourOfDay"
    .parameter "minute"

    .prologue
    .line 458
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->onTimeChanged(Landroid/widget/TimePicker;II)V

    .line 459
    const v0, 0x7f060104

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1MyDialog;->setTitle(I)V

    .line 460
    return-void
.end method

.method protected setDefaults()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 464
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1, v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1MyDialog;->onTimeChanged(Landroid/widget/TimePicker;II)V

    .line 465
    return-void
.end method
