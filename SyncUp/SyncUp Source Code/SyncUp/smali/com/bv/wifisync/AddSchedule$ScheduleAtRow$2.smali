.class Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;
.super Lcom/bv/wifisync/AddSchedule$TimeDialog;
.source "AddSchedule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;Lcom/bv/wifisync/AddSchedule;ZILcom/bv/wifisync/AddSchedule$TimeSetListener;)V
    .locals 0
    .parameter
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"
    .parameter "$anonymous2"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;

    .line 182
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/bv/wifisync/AddSchedule$TimeDialog;-><init>(Lcom/bv/wifisync/AddSchedule;ZILcom/bv/wifisync/AddSchedule$TimeSetListener;)V

    return-void
.end method


# virtual methods
.method protected formatMessage(II)Ljava/lang/String;
    .locals 7
    .parameter "hour"
    .parameter "minute"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 185
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    const v2, 0x7f0600fe

    new-array v3, v5, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v4}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v4

    #calls: Lcom/bv/wifisync/AddSchedule;->formatTime(II)Ljava/lang/String;
    invoke-static {v4, p1, p2}, Lcom/bv/wifisync/AddSchedule;->access$8(Lcom/bv/wifisync/AddSchedule;II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Lcom/bv/wifisync/AddSchedule;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 186
    .local v0, result:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v2

    const v3, 0x7f0600ff

    new-array v4, v5, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v5}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v5

    #calls: Lcom/bv/wifisync/AddSchedule;->formatTime(II)Ljava/lang/String;
    invoke-static {v5, v6, v6}, Lcom/bv/wifisync/AddSchedule;->access$8(Lcom/bv/wifisync/AddSchedule;II)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/AddSchedule;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 187
    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 192
    invoke-super {p0, p1}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->onCreate(Landroid/os/Bundle;)V

    .line 193
    const v0, 0x7f06017f

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;->setTitle(I)V

    .line 194
    const v0, 0x7f02000f

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;->setIcon(I)V

    .line 195
    return-void
.end method

.method public onTimeChanged(Landroid/widget/TimePicker;II)V
    .locals 1
    .parameter "view"
    .parameter "hourOfDay"
    .parameter "minute"

    .prologue
    .line 199
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->onTimeChanged(Landroid/widget/TimePicker;II)V

    .line 200
    const v0, 0x7f06017f

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;->setTitle(I)V

    .line 201
    return-void
.end method

.method protected setDefaults()V
    .locals 4

    .prologue
    .line 205
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 206
    .local v0, calendar:Ljava/util/Calendar;
    const/16 v3, 0xb

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 207
    .local v1, hours:I
    const/16 v3, 0xc

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 208
    .local v2, minutes:I
    invoke-virtual {p0, v1, v2}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;->updateTime(II)V

    .line 209
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v1, v2}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow$2;->onTimeChanged(Landroid/widget/TimePicker;II)V

    .line 210
    return-void
.end method
