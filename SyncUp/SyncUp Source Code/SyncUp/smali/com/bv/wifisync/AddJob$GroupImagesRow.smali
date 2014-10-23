.class Lcom/bv/wifisync/AddJob$GroupImagesRow;
.super Lcom/bv/wifisync/AddJob$JobRow;
.source "AddJob.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GroupImagesRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddJob;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddJob;)V
    .locals 2
    .parameter

    .prologue
    .line 466
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    .line 467
    const v0, 0x7f06010a

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f020020

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddJob$JobRow;-><init>(Lcom/bv/wifisync/AddJob;Ljava/lang/String;I)V

    .line 468
    return-void
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 5

    .prologue
    .line 477
    const-string v0, ", "

    .line 478
    .local v0, delimeter:Ljava/lang/String;
    const-string v2, ""

    .line 479
    .local v2, result:Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v3}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v3

    iget-object v3, v3, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    instance-of v3, v3, Lcom/bv/wifisync/ImagePlugin;

    if-eqz v3, :cond_3

    .line 480
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v3}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v3

    iget-object v1, v3, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    check-cast v1, Lcom/bv/wifisync/ImagePlugin;

    .line 481
    .local v1, plugin:Lcom/bv/wifisync/ImagePlugin;
    iget-object v3, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v3, v3, Lcom/bv/sync/ImageScanner$Options;->groupByYear:Z

    if-eqz v3, :cond_0

    .line 482
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v4, 0x7f06016f

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 483
    :cond_0
    iget-object v3, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v3, v3, Lcom/bv/sync/ImageScanner$Options;->groupByMonth:Z

    if-eqz v3, :cond_1

    .line 484
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v4, 0x7f060170

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 485
    :cond_1
    iget-object v3, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v3, v3, Lcom/bv/sync/ImageScanner$Options;->groupByDay:Z

    if-eqz v3, :cond_2

    .line 486
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v4, 0x7f060171

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 487
    :cond_2
    iget-object v3, v1, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v3, v3, Lcom/bv/sync/ImageScanner$Options;->groupByAddress:Z

    if-eqz v3, :cond_3

    .line 488
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v4, 0x7f060172

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 490
    .end local v1           #plugin:Lcom/bv/wifisync/ImagePlugin;
    :cond_3
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_4

    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v4, 0x7f060115

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v2

    .end local v2           #result:Ljava/lang/String;
    :cond_4
    return-object v2
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "paramView"

    .prologue
    .line 495
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    const-class v2, Lcom/bv/wifisync/ImageGroup;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 496
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 497
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v0, v2}, Lcom/bv/wifisync/AddJob;->startActivityForResult(Landroid/content/Intent;I)V

    .line 498
    return-void
.end method

.method update(Ljava/lang/Object;)V
    .locals 2
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 472
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/AddJob$GroupImagesRow;->this$0:Lcom/bv/wifisync/AddJob;

    check-cast p1, Lcom/bv/wifisync/Job;

    .end local p1
    invoke-virtual {v0, v1, p1}, Lcom/bv/wifisync/Job;->update(Landroid/content/Context;Lcom/bv/wifisync/Job;)V

    .line 473
    return-void
.end method
