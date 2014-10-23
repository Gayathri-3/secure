.class Lcom/bv/wifisync/AddJob$GroupMp3Row;
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
    name = "GroupMp3Row"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddJob;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddJob;)V
    .locals 2
    .parameter

    .prologue
    .line 502
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    .line 503
    const v0, 0x7f06010b

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f02001c

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddJob$JobRow;-><init>(Lcom/bv/wifisync/AddJob;Ljava/lang/String;I)V

    .line 504
    return-void
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 5

    .prologue
    .line 513
    const-string v2, ""

    .line 514
    .local v2, result:Ljava/lang/String;
    const-string v0, ", "

    .line 515
    .local v0, delimeter:Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v3}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v3

    iget-object v3, v3, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    instance-of v3, v3, Lcom/bv/wifisync/Mp3Plugin;

    if-eqz v3, :cond_2

    .line 516
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v3}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v3

    iget-object v1, v3, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    check-cast v1, Lcom/bv/wifisync/Mp3Plugin;

    .line 517
    .local v1, plugin:Lcom/bv/wifisync/Mp3Plugin;
    iget-object v3, v1, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    iget-boolean v3, v3, Lcom/bv/sync/Mp3Scanner$Options;->groupByArtist:Z

    if-eqz v3, :cond_0

    .line 518
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    const v4, 0x7f060176

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 519
    :cond_0
    iget-object v3, v1, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    iget-boolean v3, v3, Lcom/bv/sync/Mp3Scanner$Options;->groupByAlbum:Z

    if-eqz v3, :cond_1

    .line 520
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    const v4, 0x7f060177

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 521
    :cond_1
    iget-object v3, v1, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    iget-boolean v3, v3, Lcom/bv/sync/Mp3Scanner$Options;->renameSongs:Z

    if-eqz v3, :cond_2

    .line 522
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    const v4, 0x7f060178

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 524
    .end local v1           #plugin:Lcom/bv/wifisync/Mp3Plugin;
    :cond_2
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    const v4, 0x7f060115

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v2

    .end local v2           #result:Ljava/lang/String;
    :cond_3
    return-object v2
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 529
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    const-class v2, Lcom/bv/wifisync/Mp3Group;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 530
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 531
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v0, v2}, Lcom/bv/wifisync/AddJob;->startActivityForResult(Landroid/content/Intent;I)V

    .line 532
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
    .line 508
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/AddJob$GroupMp3Row;->this$0:Lcom/bv/wifisync/AddJob;

    check-cast p1, Lcom/bv/wifisync/Job;

    .end local p1
    invoke-virtual {v0, v1, p1}, Lcom/bv/wifisync/Job;->update(Landroid/content/Context;Lcom/bv/wifisync/Job;)V

    .line 509
    return-void
.end method
