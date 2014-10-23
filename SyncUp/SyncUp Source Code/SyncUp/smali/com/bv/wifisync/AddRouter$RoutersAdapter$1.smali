.class Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;
.super Ljava/lang/Object;
.source "AddRouter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddRouter$RoutersAdapter;->sort(Ljava/util/List;Landroid/net/wifi/WifiInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Landroid/net/wifi/WifiConfiguration;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

.field private final synthetic val$currentConnection:Landroid/net/wifi/WifiInfo;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddRouter$RoutersAdapter;Landroid/net/wifi/WifiInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->this$1:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    iput-object p2, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->val$currentConnection:Landroid/net/wifi/WifiInfo;

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private isSelected(Landroid/net/wifi/WifiConfiguration;)Z
    .locals 2
    .parameter "network"

    .prologue
    .line 165
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->this$1:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    #getter for: Lcom/bv/wifisync/AddRouter$RoutersAdapter;->this$0:Lcom/bv/wifisync/AddRouter;
    invoke-static {v0}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->access$1(Lcom/bv/wifisync/AddRouter$RoutersAdapter;)Lcom/bv/wifisync/AddRouter;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/AddRouter;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddRouter;->access$5(Lcom/bv/wifisync/AddRouter;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->this$1:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    #getter for: Lcom/bv/wifisync/AddRouter$RoutersAdapter;->this$0:Lcom/bv/wifisync/AddRouter;
    invoke-static {v0}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->access$1(Lcom/bv/wifisync/AddRouter$RoutersAdapter;)Lcom/bv/wifisync/AddRouter;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/AddRouter;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v0}, Lcom/bv/wifisync/AddRouter;->access$5(Lcom/bv/wifisync/AddRouter;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    iget-object v1, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->stripQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public compare(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiConfiguration;)I
    .locals 2
    .parameter "config1"
    .parameter "config2"

    .prologue
    .line 151
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->this$1:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    iget-object v1, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->val$currentConnection:Landroid/net/wifi/WifiInfo;

    #calls: Lcom/bv/wifisync/AddRouter$RoutersAdapter;->isCurrent(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiInfo;)Z
    invoke-static {v0, p2, v1}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->access$0(Lcom/bv/wifisync/AddRouter$RoutersAdapter;Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiInfo;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    const v0, 0x7fffffff

    .line 161
    :goto_0
    return v0

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->this$1:Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    iget-object v1, p0, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->val$currentConnection:Landroid/net/wifi/WifiInfo;

    #calls: Lcom/bv/wifisync/AddRouter$RoutersAdapter;->isCurrent(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiInfo;)Z
    invoke-static {v0, p1, v1}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->access$0(Lcom/bv/wifisync/AddRouter$RoutersAdapter;Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiInfo;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 154
    const v0, -0x7fffffff

    goto :goto_0

    .line 155
    :cond_1
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->isSelected(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0, p2}, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->isSelected(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 156
    const/4 v0, 0x0

    goto :goto_0

    .line 157
    :cond_2
    invoke-direct {p0, p2}, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->isSelected(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 158
    const v0, 0x7ffffffe

    goto :goto_0

    .line 159
    :cond_3
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->isSelected(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 160
    const v0, -0x7ffffffe

    goto :goto_0

    .line 161
    :cond_4
    iget v0, p2, Landroid/net/wifi/WifiConfiguration;->priority:I

    iget v1, p1, Landroid/net/wifi/WifiConfiguration;->priority:I

    sub-int/2addr v0, v1

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Landroid/net/wifi/WifiConfiguration;

    check-cast p2, Landroid/net/wifi/WifiConfiguration;

    invoke-virtual {p0, p1, p2}, Lcom/bv/wifisync/AddRouter$RoutersAdapter$1;->compare(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiConfiguration;)I

    move-result v0

    return v0
.end method
