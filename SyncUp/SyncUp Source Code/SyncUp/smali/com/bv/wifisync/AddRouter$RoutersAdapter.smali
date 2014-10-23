.class Lcom/bv/wifisync/AddRouter$RoutersAdapter;
.super Landroid/widget/ArrayAdapter;
.source "AddRouter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddRouter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RoutersAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/bv/wifisync/AddRouter$RouterInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddRouter;


# direct methods
.method public constructor <init>(Lcom/bv/wifisync/AddRouter;)V
    .locals 4
    .parameter

    .prologue
    .line 112
    iput-object p1, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->this$0:Lcom/bv/wifisync/AddRouter;

    .line 113
    const v3, 0x7f0a000a

    invoke-direct {p0, p1, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 114
    const-string v3, "wifi"

    invoke-virtual {p1, v3}, Lcom/bv/wifisync/AddRouter;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    .line 115
    .local v2, wifiManager:Landroid/net/wifi/WifiManager;
    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v1

    .line 116
    .local v1, networks:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    if-nez v1, :cond_0

    .line 117
    new-instance v1, Ljava/util/LinkedList;

    .end local v1           #networks:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 118
    .restart local v1       #networks:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    :cond_0
    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    .line 119
    .local v0, currentConnection:Landroid/net/wifi/WifiInfo;
    invoke-direct {p0, v1, v0}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->sort(Ljava/util/List;Landroid/net/wifi/WifiInfo;)V

    .line 120
    invoke-direct {p0, v1, v0}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->addRouters(Ljava/util/List;Landroid/net/wifi/WifiInfo;)V

    .line 121
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddRouter$RoutersAdapter;Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiInfo;)Z
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 170
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->isCurrent(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiInfo;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1(Lcom/bv/wifisync/AddRouter$RoutersAdapter;)Lcom/bv/wifisync/AddRouter;
    .locals 1
    .parameter

    .prologue
    .line 111
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->this$0:Lcom/bv/wifisync/AddRouter;

    return-object v0
.end method

.method private addRouterItem(Ljava/lang/String;Z)V
    .locals 3
    .parameter "name"
    .parameter "active"

    .prologue
    .line 134
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->stripQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 135
    iget-object v2, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->this$0:Lcom/bv/wifisync/AddRouter;

    #getter for: Lcom/bv/wifisync/AddRouter;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddRouter;->access$5(Lcom/bv/wifisync/AddRouter;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->this$0:Lcom/bv/wifisync/AddRouter;

    #getter for: Lcom/bv/wifisync/AddRouter;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v2}, Lcom/bv/wifisync/AddRouter;->access$5(Lcom/bv/wifisync/AddRouter;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    .line 136
    .local v0, checked:Z
    :goto_0
    new-instance v1, Lcom/bv/wifisync/AddRouter$RouterInfo;

    iget-object v2, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->this$0:Lcom/bv/wifisync/AddRouter;

    invoke-direct {v1, v2, p1, v0}, Lcom/bv/wifisync/AddRouter$RouterInfo;-><init>(Lcom/bv/wifisync/AddRouter;Ljava/lang/String;Z)V

    .line 137
    .local v1, routerInfo:Lcom/bv/wifisync/AddRouter$RouterInfo;
    if-eqz p2, :cond_0

    .line 138
    iput-boolean p2, v1, Lcom/bv/wifisync/AddRouter$RouterInfo;->active:Z

    .line 139
    :cond_0
    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->add(Ljava/lang/Object;)V

    .line 140
    return-void

    .line 135
    .end local v0           #checked:Z
    .end local v1           #routerInfo:Lcom/bv/wifisync/AddRouter$RouterInfo;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private addRouters(Ljava/util/List;Landroid/net/wifi/WifiInfo;)V
    .locals 5
    .parameter
    .parameter "currentConnection"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/net/wifi/WifiConfiguration;",
            ">;",
            "Landroid/net/wifi/WifiInfo;",
            ")V"
        }
    .end annotation

    .prologue
    .line 124
    .local p1, networks:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    invoke-static {}, Lcom/bv/wifisync/Utils;->isEmulator()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 125
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/16 v2, 0x14

    if-lt v0, v2, :cond_2

    .line 128
    .end local v0           #i:I
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_4

    .line 131
    return-void

    .line 126
    .restart local v0       #i:I
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "router"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    if-nez v0, :cond_3

    const/4 v2, 0x1

    :goto_2
    invoke-direct {p0, v3, v2}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->addRouterItem(Ljava/lang/String;Z)V

    .line 125
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 126
    :cond_3
    const/4 v2, 0x0

    goto :goto_2

    .line 128
    .end local v0           #i:I
    :cond_4
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiConfiguration;

    .line 129
    .local v1, network:Landroid/net/wifi/WifiConfiguration;
    if-eqz v1, :cond_1

    iget-object v3, v1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    if-eqz v3, :cond_1

    iget-object v3, v1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    .line 130
    iget-object v3, v1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-direct {p0, v1, p2}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->isCurrent(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiInfo;)Z

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->addRouterItem(Ljava/lang/String;Z)V

    goto :goto_1
.end method

.method private isCurrent(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiInfo;)Z
    .locals 2
    .parameter "config"
    .parameter "currentConnection"

    .prologue
    .line 171
    iget v0, p1, Landroid/net/wifi/WifiConfiguration;->status:I

    if-eqz v0, :cond_1

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    move-result v0

    iget v1, p1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    if-eq v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private sort(Ljava/util/List;Landroid/net/wifi/WifiInfo;)V
    .locals 3
    .parameter
    .parameter "currentConnection"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/net/wifi/WifiConfiguration;",
            ">;",
            "Landroid/net/wifi/WifiInfo;",
            ")V"
        }
    .end annotation

    .prologue
    .line 143
    .local p1, networks:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 144
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Landroid/net/wifi/WifiConfiguration;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 148
    new-instance v1, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;

    invoke-direct {v1, p0, p2}, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;-><init>(Lcom/bv/wifisync/AddRouter$RoutersAdapter;Landroid/net/wifi/WifiInfo;)V

    invoke-static {p1, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 168
    return-void

    .line 145
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiConfiguration;

    iget v1, v1, Landroid/net/wifi/WifiConfiguration;->status:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 146
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v9, 0x0

    .line 176
    move-object v3, p2

    .line 177
    .local v3, result:Landroid/view/View;
    if-nez v3, :cond_0

    .line 178
    iget-object v7, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->this$0:Lcom/bv/wifisync/AddRouter;

    const-string v8, "layout_inflater"

    invoke-virtual {v7, v8}, Lcom/bv/wifisync/AddRouter;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/LayoutInflater;

    .line 179
    .local v6, vi:Landroid/view/LayoutInflater;
    const v7, 0x7f030003

    invoke-virtual {v6, v7, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 181
    .end local v6           #vi:Landroid/view/LayoutInflater;
    :cond_0
    const v7, 0x7f0a000a

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 182
    .local v5, textView:Landroid/widget/TextView;
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/AddRouter$RouterInfo;

    .line 183
    .local v2, item:Lcom/bv/wifisync/AddRouter$RouterInfo;
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "<big>"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, v2, Lcom/bv/wifisync/AddRouter$RouterInfo;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</big>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 184
    .local v4, text:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    iget-boolean v7, v2, Lcom/bv/wifisync/AddRouter$RouterInfo;->checked:Z

    if-eqz v7, :cond_1

    sget-object v7, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    :goto_0
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 186
    const v7, 0x7f0a0004

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 187
    .local v1, imageView:Landroid/widget/ImageView;
    iget-boolean v7, v2, Lcom/bv/wifisync/AddRouter$RouterInfo;->active:Z

    if-eqz v7, :cond_2

    const v7, 0x7f020024

    :goto_1
    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 188
    const v7, 0x7f0a0006

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 189
    .local v0, checkBox:Landroid/widget/CheckBox;
    invoke-virtual {v0, v9}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 190
    iget-boolean v7, v2, Lcom/bv/wifisync/AddRouter$RouterInfo;->checked:Z

    invoke-virtual {v0, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 191
    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 192
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 193
    return-object v3

    .line 185
    .end local v0           #checkBox:Landroid/widget/CheckBox;
    .end local v1           #imageView:Landroid/widget/ImageView;
    :cond_1
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    goto :goto_0

    .line 187
    .restart local v1       #imageView:Landroid/widget/ImageView;
    :cond_2
    const v7, 0x7f020023

    goto :goto_1
.end method
