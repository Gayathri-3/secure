.class Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;
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
    name = "ScheduleIntervalRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddSchedule;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule;)V
    .locals 2
    .parameter

    .prologue
    .line 216
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    .line 217
    const v0, 0x7f060180

    const v1, 0x7f020018

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddSchedule$ScheduleRow;-><init>(Lcom/bv/wifisync/AddSchedule;II)V

    .line 218
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;)Lcom/bv/wifisync/AddSchedule;
    .locals 1
    .parameter

    .prologue
    .line 215
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    return-object v0
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 7

    .prologue
    .line 222
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncSchedule;->getInterval()I

    move-result v2

    if-nez v2, :cond_0

    .line 223
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const v3, 0x7f060115

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddSchedule;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 226
    :goto_0
    return-object v2

    .line 224
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncSchedule;->getInterval()I

    move-result v2

    #calls: Lcom/bv/wifisync/AddSchedule;->getHour(I)I
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$6(I)I

    move-result v0

    .line 225
    .local v0, hour:I
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncSchedule;->getInterval()I

    move-result v2

    #calls: Lcom/bv/wifisync/AddSchedule;->getMinute(I)I
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$7(I)I

    move-result v1

    .line 226
    .local v1, minute:I
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const v3, 0x7f0600fd

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/AddSchedule;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .parameter "v"

    .prologue
    .line 231
    new-instance v5, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$1;

    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    invoke-direct {v5, p0, v0}, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$1;-><init>(Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;Lcom/bv/wifisync/AddSchedule;)V

    .line 238
    .local v5, timeSetListener:Lcom/bv/wifisync/AddSchedule$TimeSetListener;
    new-instance v0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$2;

    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const/4 v3, 0x1

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/SyncSchedule;->getInterval()I

    move-result v4

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$2;-><init>(Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;Lcom/bv/wifisync/AddSchedule;ZILcom/bv/wifisync/AddSchedule$TimeSetListener;)V

    .line 260
    invoke-virtual {v0}, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$2;->show()V

    .line 261
    return-void
.end method
