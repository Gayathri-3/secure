.class Lcom/bv/wifisync/AddJob$DirectionRow;
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
    name = "DirectionRow"
.end annotation


# instance fields
.field private final directions:[Ljava/lang/String;

.field final synthetic this$0:Lcom/bv/wifisync/AddJob;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddJob;)V
    .locals 2
    .parameter

    .prologue
    .line 206
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$DirectionRow;->this$0:Lcom/bv/wifisync/AddJob;

    .line 207
    const v0, 0x7f06010c

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f020006

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddJob$JobRow;-><init>(Lcom/bv/wifisync/AddJob;Ljava/lang/String;I)V

    .line 204
    invoke-virtual {p1}, Lcom/bv/wifisync/AddJob;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f07

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/wifisync/AddJob$DirectionRow;->directions:[Ljava/lang/String;

    .line 208
    return-void
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 212
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$DirectionRow;->directions:[Ljava/lang/String;

    iget-object v1, p0, Lcom/bv/wifisync/AddJob$DirectionRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v1

    iget-object v1, v1, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-virtual {v1}, Lcom/bv/sync/CifsSync$Options$Direction;->ordinal()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .parameter "v"

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x2

    .line 217
    const/4 v0, 0x5

    new-array v5, v0, [[I

    const/4 v0, 0x0

    .line 218
    new-array v1, v3, [I

    fill-array-data v1, :array_0

    aput-object v1, v5, v0

    const/4 v0, 0x1

    .line 219
    new-array v1, v2, [I

    fill-array-data v1, :array_1

    aput-object v1, v5, v0

    .line 220
    new-array v0, v2, [I

    fill-array-data v0, :array_2

    aput-object v0, v5, v2

    .line 221
    new-array v0, v2, [I

    fill-array-data v0, :array_3

    aput-object v0, v5, v3

    const/4 v0, 0x4

    .line 222
    new-array v1, v2, [I

    fill-array-data v1, :array_4

    aput-object v1, v5, v0

    .line 225
    .local v5, images:[[I
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$DirectionRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v1, 0x7f06010c

    const v2, 0x7f0600d9

    iget-object v3, p0, Lcom/bv/wifisync/AddJob$DirectionRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v3}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v3

    iget-object v4, p0, Lcom/bv/wifisync/AddJob$DirectionRow;->directions:[Ljava/lang/String;

    iget-object v6, p0, Lcom/bv/wifisync/AddJob$DirectionRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v6}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v6

    iget-object v6, v6, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-virtual {v6}, Lcom/bv/sync/CifsSync$Options$Direction;->ordinal()I

    move-result v6

    #calls: Lcom/bv/wifisync/AddJob;->showEnumBrowser(III[Ljava/lang/String;[[II)V
    invoke-static/range {v0 .. v6}, Lcom/bv/wifisync/AddJob;->access$4(Lcom/bv/wifisync/AddJob;III[Ljava/lang/String;[[II)V

    .line 226
    return-void

    .line 218
    nop

    :array_0
    .array-data 0x4
        0x4t 0x0t 0x2t 0x7ft
        0x1ft 0x0t 0x2t 0x7ft
        0x9t 0x0t 0x2t 0x7ft
    .end array-data

    .line 219
    :array_1
    .array-data 0x4
        0x4t 0x0t 0x2t 0x7ft
        0x9t 0x0t 0x2t 0x7ft
    .end array-data

    .line 220
    :array_2
    .array-data 0x4
        0x1ft 0x0t 0x2t 0x7ft
        0x9t 0x0t 0x2t 0x7ft
    .end array-data

    .line 221
    :array_3
    .array-data 0x4
        0x4t 0x0t 0x2t 0x7ft
        0x9t 0x0t 0x2t 0x7ft
    .end array-data

    .line 222
    :array_4
    .array-data 0x4
        0x1ft 0x0t 0x2t 0x7ft
        0x9t 0x0t 0x2t 0x7ft
    .end array-data
.end method

.method update(Ljava/lang/Object;)V
    .locals 3
    .parameter "data"

    .prologue
    .line 230
    invoke-static {}, Lcom/bv/sync/CifsSync$Options$Direction;->values()[Lcom/bv/sync/CifsSync$Options$Direction;

    move-result-object v1

    check-cast p1, Ljava/lang/Integer;

    .end local p1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v0, v1, v2

    .line 231
    .local v0, newDirection:Lcom/bv/sync/CifsSync$Options$Direction;
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$DirectionRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v1

    iget-object v1, v1, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v0, v1, :cond_0

    .line 232
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$DirectionRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v1

    iput-object v0, v1, Lcom/bv/wifisync/Job;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    .line 233
    :cond_0
    return-void
.end method
