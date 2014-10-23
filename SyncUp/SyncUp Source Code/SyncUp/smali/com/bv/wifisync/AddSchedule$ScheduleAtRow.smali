.class Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;
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
    name = "ScheduleAtRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddSchedule;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule;)V
    .locals 2
    .parameter

    .prologue
    .line 160
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    .line 161
    const v0, 0x7f06017f

    const v1, 0x7f02000f

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddSchedule$ScheduleRow;-><init>(Lcom/bv/wifisync/AddSchedule;II)V

    .line 162
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;)Lcom/bv/wifisync/AddSchedule;
    .locals 1
    .parameter

    .prologue
    .line 159
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    return-object v0
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 7

    .prologue
    .line 166
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncSchedule;->getExactTime()I

    move-result v2

    if-nez v2, :cond_0

    .line 167
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const v3, 0x7f060115

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddSchedule;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 170
    :goto_0
    return-object v2

    .line 168
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncSchedule;->getExactTime()I

    move-result v2

    #calls: Lcom/bv/wifisync/AddSchedule;->getHour(I)I
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$6(I)I

    move-result v0

    .line 169
    .local v0, hour:I
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncSchedule;->getExactTime()I

    move-result v2

    #calls: Lcom/bv/wifisync/AddSchedule;->getMinute(I)I
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$7(I)I

    move-result v1

    .line 170
    .local v1, minute:I
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const v3, 0x7f0600fe

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #calls: Lcom/bv/wifisync/AddSchedule;->formatTime(II)Ljava/lang/String;
    invoke-static {v6, v0, v1}, Lcom/bv/wifisync/AddSchedule;->access$8(Lcom/bv/wifisync/AddSchedule;II)Ljava/lang/String;

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
    .line 175
    new-instance v5, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$1;

    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    invoke-direct {v5, p0, v0}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$1;-><init>(Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;Lcom/bv/wifisync/AddSchedule;)V

    .line 182
    .local v5, timeSetListener:Lcom/bv/wifisync/AddSchedule$TimeSetListener;
    new-instance v0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;

    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    invoke-static {v1}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v3

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/SyncSchedule;->getExactTime()I

    move-result v4

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;-><init>(Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;Lcom/bv/wifisync/AddSchedule;ZILcom/bv/wifisync/AddSchedule$TimeSetListener;)V

    .line 211
    invoke-virtual {v0}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;->show()V

    .line 212
    return-void
.end method
