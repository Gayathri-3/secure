.class Lcom/bv/wifisync/Hosts$ItemsAdapter;
.super Lcom/bv/wifisync/PropertiesAdapter;
.source "Hosts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Hosts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ItemsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/PropertiesAdapter",
        "<",
        "Lcom/bv/wifisync/Hosts$CheckItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Hosts;


# direct methods
.method public constructor <init>(Lcom/bv/wifisync/Hosts;)V
    .locals 1
    .parameter

    .prologue
    .line 314
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$ItemsAdapter;->this$0:Lcom/bv/wifisync/Hosts;

    .line 315
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertiesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 316
    return-void
.end method


# virtual methods
.method public declared-synchronized getCount()I
    .locals 1

    .prologue
    .line 320
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lcom/bv/wifisync/PropertiesAdapter;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;
    .locals 1
    .parameter "position"

    .prologue
    .line 325
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Hosts$CheckItem;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v8, 0x0

    .line 330
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/PropertiesAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 331
    .local v3, result:Landroid/view/View;
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v2

    .line 332
    .local v2, item:Lcom/bv/wifisync/Hosts$CheckItem;
    #getter for: Lcom/bv/wifisync/Hosts$CheckItem;->padding:I
    invoke-static {v2}, Lcom/bv/wifisync/Hosts$CheckItem;->access$0(Lcom/bv/wifisync/Hosts$CheckItem;)I

    move-result v4

    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    .line 333
    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    .line 332
    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 334
    const v4, 0x7f0a0004

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 335
    .local v1, imageView:Landroid/widget/ImageView;
    instance-of v4, v2, Lcom/bv/wifisync/Hosts$JobItem;

    if-eqz v4, :cond_1

    move-object v4, v2

    check-cast v4, Lcom/bv/wifisync/Hosts$JobItem;

    #getter for: Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;
    invoke-static {v4}, Lcom/bv/wifisync/Hosts$JobItem;->access$0(Lcom/bv/wifisync/Hosts$JobItem;)Lcom/bv/wifisync/Job;

    move-result-object v4

    iget-boolean v4, v4, Lcom/bv/wifisync/Job;->running:Z

    if-eqz v4, :cond_1

    .line 336
    invoke-static {v1}, Lcom/bv/wifisync/Utils;->animate(Landroid/view/View;)V

    .line 339
    :goto_0
    invoke-virtual {v1}, Landroid/widget/ImageView;->clearColorFilter()V

    .line 340
    instance-of v4, v2, Lcom/bv/wifisync/Hosts$HostItem;

    if-eqz v4, :cond_0

    move-object v4, v2

    check-cast v4, Lcom/bv/wifisync/Hosts$HostItem;

    #getter for: Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;
    invoke-static {v4}, Lcom/bv/wifisync/Hosts$HostItem;->access$0(Lcom/bv/wifisync/Hosts$HostItem;)Lcom/bv/wifisync/Host;

    move-result-object v4

    invoke-virtual {v4}, Lcom/bv/wifisync/Host;->getConnected()Z

    move-result v4

    if-nez v4, :cond_0

    .line 341
    const v4, -0x777778

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v4, v5}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 343
    :cond_0
    const v4, 0x7f0a0006

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 344
    .local v0, checkBox:Landroid/widget/CheckBox;
    iget-object v4, p0, Lcom/bv/wifisync/Hosts$ItemsAdapter;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->selection:Z
    invoke-static {v4}, Lcom/bv/wifisync/Hosts;->access$18(Lcom/bv/wifisync/Hosts;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 345
    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 346
    iget-boolean v4, v2, Lcom/bv/wifisync/Hosts$CheckItem;->selected:Z

    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 347
    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 348
    iget-object v4, p0, Lcom/bv/wifisync/Hosts$ItemsAdapter;->this$0:Lcom/bv/wifisync/Hosts;

    #calls: Lcom/bv/wifisync/Hosts;->updateOptionsMenu()V
    invoke-static {v4}, Lcom/bv/wifisync/Hosts;->access$13(Lcom/bv/wifisync/Hosts;)V

    .line 349
    return-object v3

    .line 338
    .end local v0           #checkBox:Landroid/widget/CheckBox;
    :cond_1
    invoke-virtual {v1, v8}, Landroid/widget/ImageView;->setAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    .line 344
    .restart local v0       #checkBox:Landroid/widget/CheckBox;
    :cond_2
    const/16 v4, 0x8

    goto :goto_1
.end method
