.class Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$3;
.super Ljava/lang/Object;
.source "AddSchedule.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$3;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;

    .line 306
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getSelectionCount()I
    .locals 5

    .prologue
    .line 320
    const/4 v0, 0x0

    .line 321
    .local v0, result:I
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$3;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v2

    #getter for: Lcom/bv/wifisync/AddSchedule;->selections:[Z
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$10(Lcom/bv/wifisync/AddSchedule;)[Z

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_0

    .line 324
    return v0

    .line 321
    :cond_0
    aget-boolean v1, v3, v2

    .line 322
    .local v1, value:Z
    if-eqz v1, :cond_1

    .line 323
    add-int/lit8 v0, v0, 0x1

    .line 321
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 310
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$3;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    #getter for: Lcom/bv/wifisync/AddSchedule;->weeklyBiller:Lcom/bv/wifisync/DonateBiller;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule;->access$13(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/DonateBiller;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/DonateBiller;->isPurchased()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$3;->getSelectionCount()I

    move-result v1

    if-nez v1, :cond_1

    .line 311
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$3;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    #calls: Lcom/bv/wifisync/AddSchedule;->closeWeeklyDialog()V
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule;->access$2(Lcom/bv/wifisync/AddSchedule;)V

    .line 317
    :goto_0
    return-void

    .line 313
    :cond_1
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$3;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    #getter for: Lcom/bv/wifisync/AddSchedule;->weeklyBiller:Lcom/bv/wifisync/DonateBiller;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule;->access$13(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/DonateBiller;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/DonateBiller;->purchase()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 314
    :catch_0
    move-exception v0

    .line 315
    .local v0, e:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$3;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
