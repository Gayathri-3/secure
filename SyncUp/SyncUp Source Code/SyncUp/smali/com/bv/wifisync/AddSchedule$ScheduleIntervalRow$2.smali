.class Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$2;
.super Lcom/bv/wifisync/AddSchedule$TimeDialog;
.source "AddSchedule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;Lcom/bv/wifisync/AddSchedule;ZILcom/bv/wifisync/AddSchedule$TimeSetListener;)V
    .locals 0
    .parameter
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"
    .parameter "$anonymous2"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;

    .line 238
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/bv/wifisync/AddSchedule$TimeDialog;-><init>(Lcom/bv/wifisync/AddSchedule;ZILcom/bv/wifisync/AddSchedule$TimeSetListener;)V

    return-void
.end method


# virtual methods
.method protected formatMessage(II)Ljava/lang/String;
    .locals 5
    .parameter "hour"
    .parameter "minute"

    .prologue
    .line 241
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$2;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v0

    const v1, 0x7f0600fd

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/bv/wifisync/AddSchedule;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 246
    invoke-super {p0, p1}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->onCreate(Landroid/os/Bundle;)V

    .line 247
    const v0, 0x7f060180

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$2;->setTitle(I)V

    .line 248
    const v0, 0x7f020018

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$2;->setIcon(I)V

    .line 249
    return-void
.end method

.method public onTimeChanged(Landroid/widget/TimePicker;II)V
    .locals 1
    .parameter "view"
    .parameter "hourOfDay"
    .parameter "minute"

    .prologue
    .line 252
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->onTimeChanged(Landroid/widget/TimePicker;II)V

    .line 253
    const v0, 0x7f060180

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$2;->setTitle(I)V

    .line 254
    return-void
.end method

.method protected setDefaults()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 258
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1, v1}, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow$2;->onTimeChanged(Landroid/widget/TimePicker;II)V

    .line 259
    return-void
.end method
