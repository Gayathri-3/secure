.class Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1;
.super Lcom/bv/wifisync/AddSchedule$TimeSetListener;
.source "AddSchedule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->pickupInterval()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;Lcom/bv/wifisync/AddSchedule;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    .line 433
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/bv/wifisync/AddSchedule$TimeSetListener;-><init>(Lcom/bv/wifisync/AddSchedule;Lcom/bv/wifisync/AddSchedule$TimeSetListener;)V

    return-void
.end method


# virtual methods
.method protected timeChanged(I)V
    .locals 1
    .parameter "time"

    .prologue
    .line 436
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$1;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    iput p1, v0, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    .line 437
    return-void
.end method
