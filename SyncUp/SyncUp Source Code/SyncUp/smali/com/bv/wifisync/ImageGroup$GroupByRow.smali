.class Lcom/bv/wifisync/ImageGroup$GroupByRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "ImageGroup.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/bv/wifisync/OnCheckedChangeListenerEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/ImageGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GroupByRow"
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$bv$wifisync$ImageGroup$RowType:[I


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/ImageGroup;

.field private final type:Lcom/bv/wifisync/ImageGroup$RowType;


# direct methods
.method static synthetic $SWITCH_TABLE$com$bv$wifisync$ImageGroup$RowType()[I
    .locals 3

    .prologue
    .line 34
    sget-object v0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->$SWITCH_TABLE$com$bv$wifisync$ImageGroup$RowType:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/bv/wifisync/ImageGroup$RowType;->values()[Lcom/bv/wifisync/ImageGroup$RowType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/bv/wifisync/ImageGroup$RowType;->GroupByAddress:Lcom/bv/wifisync/ImageGroup$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/ImageGroup$RowType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_1
    :try_start_1
    sget-object v1, Lcom/bv/wifisync/ImageGroup$RowType;->GroupByDay:Lcom/bv/wifisync/ImageGroup$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/ImageGroup$RowType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_2
    :try_start_2
    sget-object v1, Lcom/bv/wifisync/ImageGroup$RowType;->GroupByMonth:Lcom/bv/wifisync/ImageGroup$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/ImageGroup$RowType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_3
    :try_start_3
    sget-object v1, Lcom/bv/wifisync/ImageGroup$RowType;->GroupByYear:Lcom/bv/wifisync/ImageGroup$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/ImageGroup$RowType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_4
    sput-object v0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->$SWITCH_TABLE$com$bv$wifisync$ImageGroup$RowType:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1
.end method

.method constructor <init>(Lcom/bv/wifisync/ImageGroup;Lcom/bv/wifisync/ImageGroup$RowType;)V
    .locals 2
    .parameter
    .parameter "type"

    .prologue
    .line 37
    iput-object p1, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    .line 38
    #getter for: Lcom/bv/wifisync/ImageGroup;->names:[I
    invoke-static {p1}, Lcom/bv/wifisync/ImageGroup;->access$3(Lcom/bv/wifisync/ImageGroup;)[I

    move-result-object v0

    invoke-virtual {p2}, Lcom/bv/wifisync/ImageGroup$RowType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;I)V

    .line 39
    iput-object p2, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->type:Lcom/bv/wifisync/ImageGroup$RowType;

    .line 40
    return-void
.end method

.method private getValues()[Z
    .locals 4

    .prologue
    .line 56
    iget-object v2, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v2}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v2

    iget-object v0, v2, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    .line 57
    .local v0, options:Lcom/bv/sync/ImageScanner$Options;
    const/4 v2, 0x4

    new-array v1, v2, [Z

    const/4 v2, 0x0

    iget-boolean v3, v0, Lcom/bv/sync/ImageScanner$Options;->groupByYear:Z

    aput-boolean v3, v1, v2

    const/4 v2, 0x1

    iget-boolean v3, v0, Lcom/bv/sync/ImageScanner$Options;->groupByMonth:Z

    aput-boolean v3, v1, v2

    const/4 v2, 0x2

    iget-boolean v3, v0, Lcom/bv/sync/ImageScanner$Options;->groupByDay:Z

    aput-boolean v3, v1, v2

    const/4 v2, 0x3

    iget-boolean v3, v0, Lcom/bv/sync/ImageScanner$Options;->groupByAddress:Z

    aput-boolean v3, v1, v2

    .line 58
    .local v1, values:[Z
    return-object v1
.end method


# virtual methods
.method public getBooleanValue()Z
    .locals 2

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/bv/wifisync/ImageGroup$GroupByRow;->getValues()[Z

    move-result-object v0

    .line 64
    .local v0, values:[Z
    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->type:Lcom/bv/wifisync/ImageGroup$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/ImageGroup$RowType;->ordinal()I

    move-result v1

    aget-boolean v1, v0, v1

    return v1
.end method

.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->type:Lcom/bv/wifisync/ImageGroup$RowType;

    sget-object v1, Lcom/bv/wifisync/ImageGroup$RowType;->GroupByAddress:Lcom/bv/wifisync/ImageGroup$RowType;

    if-ne v0, v1, :cond_0

    .line 45
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    invoke-virtual {v0}, Lcom/bv/wifisync/ImageGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f02

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 46
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    invoke-virtual {v0}, Lcom/bv/wifisync/ImageGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020020

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 3

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/bv/wifisync/ImageGroup$GroupByRow;->getValues()[Z

    move-result-object v0

    .line 52
    .local v0, values:[Z
    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->type:Lcom/bv/wifisync/ImageGroup$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/ImageGroup$RowType;->ordinal()I

    move-result v1

    aget-boolean v1, v0, v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v2, 0x7f06011f

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/ImageGroup;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v2, 0x7f060120

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/ImageGroup;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .parameter "paramCompoundButton"
    .parameter "checked"

    .prologue
    .line 69
    invoke-static {}, Lcom/bv/wifisync/ImageGroup$GroupByRow;->$SWITCH_TABLE$com$bv$wifisync$ImageGroup$RowType()[I

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->type:Lcom/bv/wifisync/ImageGroup$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/ImageGroup$RowType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 83
    :goto_0
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup;->access$5(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 84
    return-void

    .line 71
    :pswitch_0
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iput-boolean p2, v0, Lcom/bv/sync/ImageScanner$Options;->groupByYear:Z

    goto :goto_0

    .line 74
    :pswitch_1
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iput-boolean p2, v0, Lcom/bv/sync/ImageScanner$Options;->groupByMonth:Z

    goto :goto_0

    .line 77
    :pswitch_2
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iput-boolean p2, v0, Lcom/bv/sync/ImageScanner$Options;->groupByDay:Z

    goto :goto_0

    .line 80
    :pswitch_3
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iput-boolean p2, v0, Lcom/bv/sync/ImageScanner$Options;->groupByAddress:Z

    goto :goto_0

    .line 69
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 88
    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/bv/wifisync/ImageGroup$GroupByRow;->getBooleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/bv/wifisync/ImageGroup$GroupByRow;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V

    .line 89
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$GroupByRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup;->access$5(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 90
    return-void

    .line 88
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
