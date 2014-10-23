.class Lcom/bv/wifisync/AddSchedule$3;
.super Ljava/lang/Object;
.source "AddSchedule.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddSchedule;->onCreateOptionsMenu(Landroid/view/Menu;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddSchedule;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$3;->this$0:Lcom/bv/wifisync/AddSchedule;

    .line 509
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 512
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$3;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/bv/wifisync/SyncSchedule;->setEnabled(Z)V

    .line 513
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$3;->this$0:Lcom/bv/wifisync/AddSchedule;

    #calls: Lcom/bv/wifisync/AddSchedule;->addRows()V
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$17(Lcom/bv/wifisync/AddSchedule;)V

    .line 514
    return-void
.end method
