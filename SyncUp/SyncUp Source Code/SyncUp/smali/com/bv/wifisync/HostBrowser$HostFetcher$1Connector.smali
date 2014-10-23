.class Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;
.super Ljava/lang/Object;
.source "HostBrowser.java"

# interfaces
.implements Lcom/bv/wifisync/ThreadedQueue$Runner;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/HostBrowser$HostFetcher;->scan(II)Ljava/lang/Void;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Connector"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bv/wifisync/ThreadedQueue$Runner",
        "<",
        "Ljava/net/InetAddress;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/HostBrowser$HostFetcher;

.field private final synthetic val$counter:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final synthetic val$highest:I

.field private final synthetic val$lowest:I


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HostBrowser$HostFetcher;Ljava/util/concurrent/atomic/AtomicInteger;II)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 146
    iput-object p1, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;->this$1:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    iput-object p2, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;->val$counter:Ljava/util/concurrent/atomic/AtomicInteger;

    iput p3, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;->val$highest:I

    iput p4, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;->val$lowest:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private clearArpTable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 180
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public bridge synthetic run(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/net/InetAddress;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;->run(Ljava/net/InetAddress;)V

    return-void
.end method

.method public run(Ljava/net/InetAddress;)V
    .locals 9
    .parameter "t"

    .prologue
    const/4 v8, 0x0

    .line 149
    const/4 v2, 0x0

    .line 150
    .local v2, hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    const/16 v5, 0x78

    if-lt v3, v5, :cond_1

    .line 163
    :goto_1
    iget-object v5, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;->val$counter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v5

    int-to-float v5, v5

    iget v6, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;->val$highest:I

    iget v7, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;->val$lowest:I

    sub-int/2addr v6, v7

    int-to-float v6, v6

    div-float/2addr v5, v6

    const/high16 v6, 0x42c8

    mul-float/2addr v5, v6

    float-to-int v4, v5

    .line 164
    .local v4, progress:I
    if-nez v2, :cond_0

    .line 165
    new-instance v2, Lcom/bv/sync/CifsUtils$HostInfo;

    .end local v2           #hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5, v8, v8, v8}, Lcom/bv/sync/CifsUtils$HostInfo;-><init>(Ljava/lang/String;Ljava/lang/String;[B[Ljava/lang/String;)V

    .line 166
    .restart local v2       #hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    :cond_0
    iget-object v5, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;->this$1:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    const/4 v6, 0x1

    new-array v6, v6, [Lcom/bv/wifisync/HostBrowser$ProgressInfo;

    const/4 v7, 0x0

    new-instance v8, Lcom/bv/wifisync/HostBrowser$ProgressInfo;

    invoke-direct {v8, v4, v2}, Lcom/bv/wifisync/HostBrowser$ProgressInfo;-><init>(ILcom/bv/sync/CifsUtils$HostInfo;)V

    aput-object v8, v6, v7

    #calls: Lcom/bv/wifisync/HostBrowser$HostFetcher;->publishProgress([Ljava/lang/Object;)V
    invoke-static {v5, v6}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->access$4(Lcom/bv/wifisync/HostBrowser$HostFetcher;[Ljava/lang/Object;)V

    .line 167
    return-void

    .line 152
    .end local v4           #progress:I
    :cond_1
    :try_start_0
    iget-object v5, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;->this$1:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    #calls: Lcom/bv/wifisync/HostBrowser$HostFetcher;->getHostInfo(Ljava/net/InetAddress;)Lcom/bv/sync/CifsUtils$HostInfo;
    invoke-static {v5, p1}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->access$3(Lcom/bv/wifisync/HostBrowser$HostFetcher;Ljava/net/InetAddress;)Lcom/bv/sync/CifsUtils$HostInfo;
    :try_end_0
    .catch Lcom/bv/wifisync/Utils$ArpTableFullException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_1

    .line 154
    :catch_0
    move-exception v0

    .line 156
    .local v0, e:Lcom/bv/wifisync/Utils$ArpTableFullException;
    :try_start_1
    invoke-direct {p0}, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;->clearArpTable()Z

    move-result v5

    if-nez v5, :cond_2

    .line 157
    const-wide/16 v5, 0x7d0

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 150
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 158
    :catch_1
    move-exception v1

    .line 159
    .local v1, e1:Ljava/lang/InterruptedException;
    goto :goto_1
.end method
