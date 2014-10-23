.class abstract Lcom/bv/wifisync/Hosts$CheckItem;
.super Lcom/bv/wifisync/PropertyRow;
.source "Hosts.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Hosts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "CheckItem"
.end annotation


# instance fields
.field private final padding:I

.field selected:Z

.field final synthetic this$0:Lcom/bv/wifisync/Hosts;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Hosts;Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter "name"
    .parameter "padding"

    .prologue
    .line 84
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$CheckItem;->this$0:Lcom/bv/wifisync/Hosts;

    .line 85
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 86
    iput p3, p0, Lcom/bv/wifisync/Hosts$CheckItem;->padding:I

    .line 87
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/Hosts$CheckItem;)I
    .locals 1
    .parameter

    .prologue
    .line 81
    iget v0, p0, Lcom/bv/wifisync/Hosts$CheckItem;->padding:I

    return v0
.end method

.method private hasSelection()Z
    .locals 2

    .prologue
    .line 116
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$CheckItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;
    invoke-static {v1}, Lcom/bv/wifisync/Hosts;->access$14(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$ItemsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 119
    const/4 v1, 0x0

    :goto_1
    return v1

    .line 117
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$CheckItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;
    invoke-static {v1}, Lcom/bv/wifisync/Hosts;->access$14(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$ItemsAdapter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v1

    iget-boolean v1, v1, Lcom/bv/wifisync/Hosts$CheckItem;->selected:Z

    if-eqz v1, :cond_1

    .line 118
    const/4 v1, 0x1

    goto :goto_1

    .line 116
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method abstract canRun()Z
.end method

.method abstract cancel()V
.end method

.method abstract edit()V
.end method

.method abstract getId()I
.end method

.method protected abstract isRunning()Z
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .parameter "button"
    .parameter "isChecked"

    .prologue
    .line 106
    iget-boolean v0, p0, Lcom/bv/wifisync/Hosts$CheckItem;->selected:Z

    if-eq v0, p2, :cond_1

    .line 107
    iput-boolean p2, p0, Lcom/bv/wifisync/Hosts$CheckItem;->selected:Z

    .line 108
    iget-boolean v0, p0, Lcom/bv/wifisync/Hosts$CheckItem;->selected:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/bv/wifisync/Hosts$CheckItem;->hasSelection()Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckItem;->this$0:Lcom/bv/wifisync/Hosts;

    #calls: Lcom/bv/wifisync/Hosts;->showSelection()V
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$12(Lcom/bv/wifisync/Hosts;)V

    .line 110
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckItem;->this$0:Lcom/bv/wifisync/Hosts;

    #calls: Lcom/bv/wifisync/Hosts;->updateOptionsMenu()V
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$13(Lcom/bv/wifisync/Hosts;)V

    .line 111
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$14(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$ItemsAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->notifyDataSetChanged()V

    .line 113
    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 99
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckItem;->this$0:Lcom/bv/wifisync/Hosts;

    const/4 v1, 0x1

    #setter for: Lcom/bv/wifisync/Hosts;->shortClick:Z
    invoke-static {v0, v1}, Lcom/bv/wifisync/Hosts;->access$10(Lcom/bv/wifisync/Hosts;Z)V

    .line 100
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->shortcutSetupMode:Z
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$11(Lcom/bv/wifisync/Hosts;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckItem;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v0, p1}, Lcom/bv/wifisync/Hosts;->openContextMenu(Landroid/view/View;)V

    .line 102
    :cond_0
    return-void
.end method

.method abstract remove()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method abstract run()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
