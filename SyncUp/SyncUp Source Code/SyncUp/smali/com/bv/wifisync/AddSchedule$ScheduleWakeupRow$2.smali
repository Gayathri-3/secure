.class Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$2;
.super Ljava/lang/Object;
.source "AddSchedule.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
.method constructor <init>(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    .line 470
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 474
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    #getter for: Lcom/bv/wifisync/AddSchedule;->wakeupBiller:Lcom/bv/wifisync/DonateBiller;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule;->access$16(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/DonateBiller;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/DonateBiller;->isPurchased()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    #getter for: Lcom/bv/wifisync/AddSchedule;->wakeupDialog:Lcom/bv/wifisync/AddSchedule$TimeDialog;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule;->access$15(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/AddSchedule$TimeDialog;

    move-result-object v1

    iget v1, v1, Lcom/bv/wifisync/AddSchedule$TimeDialog;->seconds:I

    if-nez v1, :cond_1

    .line 475
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    #calls: Lcom/bv/wifisync/AddSchedule;->closeWakeupDialog()V
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule;->access$3(Lcom/bv/wifisync/AddSchedule;)V

    .line 481
    :goto_0
    return-void

    .line 477
    :cond_1
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    #getter for: Lcom/bv/wifisync/AddSchedule;->wakeupBiller:Lcom/bv/wifisync/DonateBiller;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule;->access$16(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/DonateBiller;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/DonateBiller;->purchase()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 478
    :catch_0
    move-exception v0

    .line 479
    .local v0, e:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
