.class Lcom/bv/wifisync/AddSchedule$1;
.super Lcom/bv/wifisync/DonateBiller;
.source "AddSchedule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddSchedule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddSchedule;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule;Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$1;->this$0:Lcom/bv/wifisync/AddSchedule;

    .line 43
    invoke-direct {p0, p2, p3}, Lcom/bv/wifisync/DonateBiller;-><init>(Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    return-void
.end method


# virtual methods
.method onPurchase()V
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$1;->this$0:Lcom/bv/wifisync/AddSchedule;

    #calls: Lcom/bv/wifisync/AddSchedule;->closeWeeklyDialog()V
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$2(Lcom/bv/wifisync/AddSchedule;)V

    .line 47
    return-void
.end method
