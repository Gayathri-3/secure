.class Lcom/bv/wifisync/AddJob$TrackDeletionsRow;
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
    name = "TrackDeletionsRow"
.end annotation


# instance fields
.field private final images:[[I

.field final synthetic this$0:Lcom/bv/wifisync/AddJob;

.field private final values:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddJob;)V
    .locals 7
    .parameter

    .prologue
    const v6, 0x7f020030

    const/4 v2, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 366
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    .line 367
    const v0, 0x7f060109

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0, v6}, Lcom/bv/wifisync/AddJob$JobRow;-><init>(Lcom/bv/wifisync/AddJob;Ljava/lang/String;I)V

    .line 359
    new-array v0, v2, [Ljava/lang/String;

    const v1, 0x7f060120

    invoke-virtual {p1, v1}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    const v1, 0x7f06011f

    invoke-virtual {p1, v1}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    const v1, 0x7f0601b7

    invoke-virtual {p1, v1}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    iput-object v0, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->values:[Ljava/lang/String;

    .line 360
    new-array v0, v2, [[I

    .line 361
    new-array v1, v4, [I

    const v2, 0x7f020022

    aput v2, v1, v3

    aput-object v1, v0, v3

    .line 362
    new-array v1, v4, [I

    aput v6, v1, v3

    aput-object v1, v0, v4

    .line 363
    new-array v1, v5, [I

    fill-array-data v1, :array_0

    aput-object v1, v0, v5

    iput-object v0, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->images:[[I

    .line 368
    return-void

    .line 363
    nop

    :array_0
    .array-data 0x4
        0x30t 0x0t 0x2t 0x7ft
        0x19t 0x0t 0x2t 0x7ft
    .end array-data
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 372
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-boolean v0, v0, Lcom/bv/wifisync/Job;->trackDeletions:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->mirror:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v1, 0x7f0601b7

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v1, 0x7f06011f

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v1, 0x7f060120

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .parameter "v"

    .prologue
    .line 377
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-boolean v0, v0, Lcom/bv/wifisync/Job;->trackDeletions:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->mirror:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v6, 0x2

    .line 378
    .local v6, index:I
    :goto_0
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v1, 0x7f060109

    const v2, 0x7f0600ee

    iget-object v3, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v3}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v3

    iget-object v4, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->values:[Ljava/lang/String;

    iget-object v5, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->images:[[I

    #calls: Lcom/bv/wifisync/AddJob;->showEnumBrowser(III[Ljava/lang/String;[[II)V
    invoke-static/range {v0 .. v6}, Lcom/bv/wifisync/AddJob;->access$4(Lcom/bv/wifisync/AddJob;III[Ljava/lang/String;[[II)V

    .line 379
    return-void

    .line 377
    .end local v6           #index:I
    :cond_0
    const/4 v6, 0x1

    goto :goto_0

    :cond_1
    const/4 v6, 0x0

    goto :goto_0
.end method

.method update(Ljava/lang/Object;)V
    .locals 6
    .parameter "data"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 383
    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    .line 384
    .local v0, mode:Ljava/lang/Integer;
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    iput-boolean v1, v4, Lcom/bv/wifisync/Job;->trackDeletions:Z

    .line 385
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$TrackDeletionsRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_1

    :goto_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lcom/bv/wifisync/Job;->mirror:Ljava/lang/Boolean;

    .line 386
    return-void

    :cond_0
    move v1, v3

    .line 384
    goto :goto_0

    :cond_1
    move v2, v3

    .line 385
    goto :goto_1
.end method
