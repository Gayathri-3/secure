.class Lcom/bv/wifisync/Hosts$3;
.super Ljava/lang/Object;
.source "Hosts.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnConfirmListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Hosts;->removeSelectedItem(Lcom/bv/wifisync/Hosts$CheckItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Hosts;

.field private final synthetic val$selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/Hosts$CheckItem;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$3;->this$0:Lcom/bv/wifisync/Hosts;

    iput-object p2, p0, Lcom/bv/wifisync/Hosts$3;->val$selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;

    .line 605
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfirm()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 608
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$3;->val$selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/bv/wifisync/Hosts$CheckItem;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V

    .line 609
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$3;->val$selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;

    invoke-virtual {v0}, Lcom/bv/wifisync/Hosts$CheckItem;->remove()V

    .line 610
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$3;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$3(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/SyncService;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 611
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$3;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$3(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/SyncService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/SyncService;->update()V

    .line 612
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$3;->this$0:Lcom/bv/wifisync/Hosts;

    #calls: Lcom/bv/wifisync/Hosts;->readData()V
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$5(Lcom/bv/wifisync/Hosts;)V

    .line 613
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$3;->this$0:Lcom/bv/wifisync/Hosts;

    #calls: Lcom/bv/wifisync/Hosts;->setHelpText()V
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$21(Lcom/bv/wifisync/Hosts;)V

    .line 614
    return-void
.end method
