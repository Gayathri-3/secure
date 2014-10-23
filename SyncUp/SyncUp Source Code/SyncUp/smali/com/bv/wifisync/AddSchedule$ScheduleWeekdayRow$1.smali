.class Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$1;
.super Ljava/lang/Object;
.source "AddSchedule.java"

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


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
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$1;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;

    .line 293
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .locals 1
    .parameter "dialog"
    .parameter "which"
    .parameter "isChecked"

    .prologue
    .line 296
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$1;->this$1:Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;

    #getter for: Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;)Lcom/bv/wifisync/AddSchedule;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/AddSchedule;->selections:[Z
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$10(Lcom/bv/wifisync/AddSchedule;)[Z

    move-result-object v0

    aput-boolean p3, v0, p2

    .line 297
    return-void
.end method
