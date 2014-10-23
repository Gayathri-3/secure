.class abstract Lcom/bv/wifisync/AddSchedule$TimeSetListener;
.super Ljava/lang/Object;
.source "AddSchedule.java"

# interfaces
.implements Landroid/app/TimePickerDialog$OnTimeSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddSchedule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "TimeSetListener"
.end annotation


# instance fields
.field disabled:Z

.field final synthetic this$0:Lcom/bv/wifisync/AddSchedule;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/AddSchedule;)V
    .locals 0
    .parameter

    .prologue
    .line 74
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$TimeSetListener;->this$0:Lcom/bv/wifisync/AddSchedule;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/AddSchedule;Lcom/bv/wifisync/AddSchedule$TimeSetListener;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddSchedule$TimeSetListener;-><init>(Lcom/bv/wifisync/AddSchedule;)V

    return-void
.end method


# virtual methods
.method public onTimeSet(Landroid/widget/TimePicker;II)V
    .locals 3
    .parameter "picker"
    .parameter "hour"
    .parameter "minute"

    .prologue
    .line 79
    iget-boolean v1, p0, Lcom/bv/wifisync/AddSchedule$TimeSetListener;->disabled:Z

    if-nez v1, :cond_0

    .line 80
    mul-int/lit8 v1, p2, 0x3c

    mul-int/lit8 v1, v1, 0x3c

    mul-int/lit8 v2, p3, 0x3c

    add-int v0, v1, v2

    .line 81
    .local v0, timeInterval:I
    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule$TimeSetListener;->timeChanged(I)V

    .line 82
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$TimeSetListener;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v1}, Lcom/bv/wifisync/AddSchedule;->access$4(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 84
    .end local v0           #timeInterval:I
    :cond_0
    return-void
.end method

.method protected abstract timeChanged(I)V
.end method
