.class Lcom/bv/wifisync/AddJob$FilterRow;
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
    name = "FilterRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddJob;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddJob;)V
    .locals 2
    .parameter

    .prologue
    .line 421
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    .line 422
    const v0, 0x7f060184

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f020013

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddJob$JobRow;-><init>(Lcom/bv/wifisync/AddJob;Ljava/lang/String;I)V

    .line 423
    return-void
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 5

    .prologue
    const v4, 0x7f060115

    .line 442
    const-string v0, ", "

    .line 443
    .local v0, delimeter:Ljava/lang/String;
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    if-nez v2, :cond_1

    .line 444
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-virtual {v2, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 461
    :cond_0
    :goto_0
    return-object v1

    .line 445
    :cond_1
    const-string v1, ""

    .line 446
    .local v1, result:Ljava/lang/String;
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-boolean v2, v2, Lcom/bv/wifisync/Job$Filter;->ignoreHidden:Z

    if-eqz v2, :cond_2

    .line 447
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v3, 0x7f060187

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 448
    :cond_2
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-boolean v2, v2, Lcom/bv/wifisync/Job$Filter;->ignoreReadProtected:Z

    if-eqz v2, :cond_3

    .line 449
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v3, 0x7f060188

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 450
    :cond_3
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->extensions:Ljava/util/LinkedHashSet;

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->includeExtensions:Ljava/util/LinkedHashSet;

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 451
    :cond_4
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v3, 0x7f0601a1

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 452
    :cond_5
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->localFiles:Ljava/util/LinkedHashSet;

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->includeLocalFiles:Ljava/util/LinkedHashSet;

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 453
    :cond_6
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v3, 0x7f060189

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 454
    :cond_7
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->remoteFiles:Ljava/util/LinkedHashSet;

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_8

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v2, v2, Lcom/bv/wifisync/Job$Filter;->includeRemoteFiles:Ljava/util/LinkedHashSet;

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 455
    :cond_8
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v3, 0x7f06018a

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 456
    :cond_9
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget v2, v2, Lcom/bv/wifisync/Job$Filter;->modifiedDate:I

    if-nez v2, :cond_a

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget v2, v2, Lcom/bv/wifisync/Job$Filter;->includeModifiedDate:I

    if-eqz v2, :cond_b

    .line 457
    :cond_a
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v3, 0x7f0601be

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 459
    :cond_b
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 460
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-virtual {v2, v4}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "view"

    .prologue
    .line 427
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    const-class v2, Lcom/bv/wifisync/AddFilter;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 428
    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v1

    iget-object v1, v1, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    if-nez v1, :cond_0

    .line 429
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v1

    new-instance v2, Lcom/bv/wifisync/Job$Filter;

    invoke-direct {v2}, Lcom/bv/wifisync/Job$Filter;-><init>()V

    iput-object v2, v1, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    .line 430
    :cond_0
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 431
    const-string v1, "RESULT1"

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 432
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v0, v2}, Lcom/bv/wifisync/AddJob;->startActivityForResult(Landroid/content/Intent;I)V

    .line 433
    return-void
.end method

.method update(Ljava/lang/Object;)V
    .locals 2
    .parameter "data"

    .prologue
    .line 437
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$FilterRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    check-cast p1, Lcom/bv/wifisync/Job;

    .end local p1
    iget-object v1, p1, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iput-object v1, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    .line 438
    return-void
.end method
