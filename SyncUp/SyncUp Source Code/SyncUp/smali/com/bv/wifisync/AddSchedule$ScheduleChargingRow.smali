.class Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;
.super Lcom/bv/wifisync/AddSchedule$ScheduleRow;
.source "AddSchedule.java"

# interfaces
.implements Lcom/bv/wifisync/OnCheckedChangeListenerEx;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddSchedule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScheduleChargingRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddSchedule;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule;)V
    .locals 2
    .parameter

    .prologue
    .line 384
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    .line 385
    const v0, 0x7f0601a2

    const v1, 0x7f020002

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddSchedule$ScheduleRow;-><init>(Lcom/bv/wifisync/AddSchedule;II)V

    .line 386
    return-void
.end method


# virtual methods
.method public getBooleanValue()Z
    .locals 1

    .prologue
    .line 396
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    iget-boolean v0, v0, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z

    return v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 401
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    iget-boolean v0, v0, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z

    if-eqz v0, :cond_0

    const v0, 0x7f06011f

    :goto_0
    invoke-virtual {v1, v0}, Lcom/bv/wifisync/AddSchedule;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const v0, 0x7f060120

    goto :goto_0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 390
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    iput-boolean p2, v0, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z

    .line 391
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$4(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 392
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 406
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v1

    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    iget-boolean v0, v0, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v1, Lcom/bv/wifisync/SyncSchedule;->whenCharging:Z

    .line 407
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$4(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 408
    return-void

    .line 406
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
