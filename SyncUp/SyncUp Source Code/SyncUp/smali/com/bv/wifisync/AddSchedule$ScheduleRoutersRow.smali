.class Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;
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
    name = "ScheduleRoutersRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddSchedule;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule;)V
    .locals 2
    .parameter

    .prologue
    .line 348
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    .line 349
    const v0, 0x7f060100

    const v1, 0x7f020024

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddSchedule$ScheduleRow;-><init>(Lcom/bv/wifisync/AddSchedule;II)V

    .line 350
    return-void
.end method

.method private concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "result"
    .parameter "value"

    .prologue
    .line 367
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .end local p2
    :goto_0
    return-object p2

    .restart local p2
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method

.method private formatRouters()Ljava/lang/String;
    .locals 4

    .prologue
    .line 360
    const-string v0, ""

    .line 361
    .local v0, result:Ljava/lang/String;
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 363
    return-object v0

    .line 361
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 362
    .local v1, router:Ljava/lang/String;
    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 354
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 355
    invoke-direct {p0}, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->formatRouters()Ljava/lang/String;

    move-result-object v0

    .line 356
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const v1, 0x7f060115

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddSchedule;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 372
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const-class v2, Lcom/bv/wifisync/AddRouter;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 373
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 374
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/AddSchedule;->access$4(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v0, v2}, Lcom/bv/wifisync/AddSchedule;->startActivityForResult(Landroid/content/Intent;I)V

    .line 375
    return-void
.end method

.method update(Ljava/lang/Object;)V
    .locals 2
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 379
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    check-cast p1, Lcom/bv/wifisync/SyncSchedule;

    .end local p1
    iget-object v1, p1, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    iput-object v1, v0, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    .line 380
    return-void
.end method
