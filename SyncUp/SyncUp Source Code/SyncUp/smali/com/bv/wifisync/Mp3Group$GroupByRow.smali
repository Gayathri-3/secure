.class Lcom/bv/wifisync/Mp3Group$GroupByRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "Mp3Group.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/bv/wifisync/OnCheckedChangeListenerEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Mp3Group;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GroupByRow"
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$bv$wifisync$Mp3Group$RowType:[I


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Mp3Group;

.field private final type:Lcom/bv/wifisync/Mp3Group$RowType;


# direct methods
.method static synthetic $SWITCH_TABLE$com$bv$wifisync$Mp3Group$RowType()[I
    .locals 3

    .prologue
    .line 30
    sget-object v0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->$SWITCH_TABLE$com$bv$wifisync$Mp3Group$RowType:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/bv/wifisync/Mp3Group$RowType;->values()[Lcom/bv/wifisync/Mp3Group$RowType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/bv/wifisync/Mp3Group$RowType;->GroupByAlbum:Lcom/bv/wifisync/Mp3Group$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Mp3Group$RowType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_1
    :try_start_1
    sget-object v1, Lcom/bv/wifisync/Mp3Group$RowType;->GroupByArtist:Lcom/bv/wifisync/Mp3Group$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Mp3Group$RowType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_2
    :try_start_2
    sget-object v1, Lcom/bv/wifisync/Mp3Group$RowType;->Rename:Lcom/bv/wifisync/Mp3Group$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Mp3Group$RowType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_3
    sput-object v0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->$SWITCH_TABLE$com$bv$wifisync$Mp3Group$RowType:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1
.end method

.method constructor <init>(Lcom/bv/wifisync/Mp3Group;Lcom/bv/wifisync/Mp3Group$RowType;)V
    .locals 2
    .parameter
    .parameter "type"

    .prologue
    .line 33
    iput-object p1, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    .line 34
    #getter for: Lcom/bv/wifisync/Mp3Group;->names:[I
    invoke-static {p1}, Lcom/bv/wifisync/Mp3Group;->access$3(Lcom/bv/wifisync/Mp3Group;)[I

    move-result-object v0

    invoke-virtual {p2}, Lcom/bv/wifisync/Mp3Group$RowType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;I)V

    .line 35
    iput-object p2, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->type:Lcom/bv/wifisync/Mp3Group$RowType;

    .line 36
    return-void
.end method

.method private getValues()[Z
    .locals 4

    .prologue
    .line 50
    iget-object v2, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->plugin:Lcom/bv/wifisync/Mp3Plugin;
    invoke-static {v2}, Lcom/bv/wifisync/Mp3Group;->access$4(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/Mp3Plugin;

    move-result-object v2

    iget-object v0, v2, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    .line 51
    .local v0, options:Lcom/bv/sync/Mp3Scanner$Options;
    const/4 v2, 0x3

    new-array v1, v2, [Z

    const/4 v2, 0x0

    iget-boolean v3, v0, Lcom/bv/sync/Mp3Scanner$Options;->groupByArtist:Z

    aput-boolean v3, v1, v2

    const/4 v2, 0x1

    iget-boolean v3, v0, Lcom/bv/sync/Mp3Scanner$Options;->groupByAlbum:Z

    aput-boolean v3, v1, v2

    const/4 v2, 0x2

    iget-boolean v3, v0, Lcom/bv/sync/Mp3Scanner$Options;->renameSongs:Z

    aput-boolean v3, v1, v2

    .line 52
    .local v1, values:[Z
    return-object v1
.end method


# virtual methods
.method public getBooleanValue()Z
    .locals 2

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/bv/wifisync/Mp3Group$GroupByRow;->getValues()[Z

    move-result-object v0

    .line 58
    .local v0, values:[Z
    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->type:Lcom/bv/wifisync/Mp3Group$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Mp3Group$RowType;->ordinal()I

    move-result v1

    aget-boolean v1, v0, v1

    return v1
.end method

.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    invoke-virtual {v0}, Lcom/bv/wifisync/Mp3Group;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02001c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 3

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/bv/wifisync/Mp3Group$GroupByRow;->getValues()[Z

    move-result-object v0

    .line 46
    .local v0, values:[Z
    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->type:Lcom/bv/wifisync/Mp3Group$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Mp3Group$RowType;->ordinal()I

    move-result v1

    aget-boolean v1, v0, v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    const v2, 0x7f06011f

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Mp3Group;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    const v2, 0x7f060120

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Mp3Group;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .parameter "paramCompoundButton"
    .parameter "checked"

    .prologue
    .line 63
    invoke-static {}, Lcom/bv/wifisync/Mp3Group$GroupByRow;->$SWITCH_TABLE$com$bv$wifisync$Mp3Group$RowType()[I

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->type:Lcom/bv/wifisync/Mp3Group$RowType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Mp3Group$RowType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 74
    :goto_0
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/Mp3Group;->access$5(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 75
    return-void

    .line 65
    :pswitch_0
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->plugin:Lcom/bv/wifisync/Mp3Plugin;
    invoke-static {v0}, Lcom/bv/wifisync/Mp3Group;->access$4(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/Mp3Plugin;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    iput-boolean p2, v0, Lcom/bv/sync/Mp3Scanner$Options;->groupByArtist:Z

    goto :goto_0

    .line 68
    :pswitch_1
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->plugin:Lcom/bv/wifisync/Mp3Plugin;
    invoke-static {v0}, Lcom/bv/wifisync/Mp3Group;->access$4(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/Mp3Plugin;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    iput-boolean p2, v0, Lcom/bv/sync/Mp3Scanner$Options;->groupByAlbum:Z

    goto :goto_0

    .line 71
    :pswitch_2
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->plugin:Lcom/bv/wifisync/Mp3Plugin;
    invoke-static {v0}, Lcom/bv/wifisync/Mp3Group;->access$4(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/Mp3Plugin;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    iput-boolean p2, v0, Lcom/bv/sync/Mp3Scanner$Options;->renameSongs:Z

    goto :goto_0

    .line 63
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 79
    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/bv/wifisync/Mp3Group$GroupByRow;->getBooleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/bv/wifisync/Mp3Group$GroupByRow;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V

    .line 80
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$GroupByRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/Mp3Group;->access$5(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 81
    return-void

    .line 79
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
