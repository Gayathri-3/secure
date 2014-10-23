.class Lcom/bv/wifisync/AddJob$MediaScanRow;
.super Lcom/bv/wifisync/AddJob$JobRow;
.source "AddJob.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/bv/wifisync/OnCheckedChangeListenerEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MediaScanRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddJob;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddJob;)V
    .locals 2
    .parameter

    .prologue
    .line 390
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$MediaScanRow;->this$0:Lcom/bv/wifisync/AddJob;

    .line 391
    const v0, 0x7f0601b5

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f020027

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddJob$JobRow;-><init>(Lcom/bv/wifisync/AddJob;Ljava/lang/String;I)V

    .line 392
    return-void
.end method


# virtual methods
.method public getBooleanValue()Z
    .locals 1

    .prologue
    .line 416
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$MediaScanRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-boolean v0, v0, Lcom/bv/wifisync/Job;->skipMediaScan:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 396
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$MediaScanRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-boolean v0, v0, Lcom/bv/wifisync/Job;->skipMediaScan:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/AddJob$MediaScanRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v1, 0x7f06011f

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$MediaScanRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v1, 0x7f060120

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .parameter "arg0"
    .parameter "checked"

    .prologue
    .line 407
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$MediaScanRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v1

    if-eqz p2, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v1, Lcom/bv/wifisync/Job;->skipMediaScan:Z

    .line 408
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$MediaScanRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 409
    return-void

    .line 407
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 401
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$MediaScanRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v1

    iget-object v0, p0, Lcom/bv/wifisync/AddJob$MediaScanRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-boolean v0, v0, Lcom/bv/wifisync/Job;->skipMediaScan:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v1, Lcom/bv/wifisync/Job;->skipMediaScan:Z

    .line 402
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$MediaScanRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 403
    return-void

    .line 401
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method update(Ljava/lang/Object;)V
    .locals 0
    .parameter "data"

    .prologue
    .line 412
    return-void
.end method
