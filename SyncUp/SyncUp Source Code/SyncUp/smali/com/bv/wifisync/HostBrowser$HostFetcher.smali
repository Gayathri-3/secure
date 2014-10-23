.class Lcom/bv/wifisync/HostBrowser$HostFetcher;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "HostBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/HostBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HostFetcher"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Ljava/lang/Void;",
        "Lcom/bv/wifisync/HostBrowser$ProgressInfo;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private networks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/Utils$NetInfo;",
            ">;"
        }
    .end annotation
.end field

.field private scanner:Lcom/bv/wifisync/ThreadedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bv/wifisync/ThreadedQueue",
            "<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/bv/wifisync/HostBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HostBrowser;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    iput-object p1, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    .line 100
    const-string v0, "HostFetcher"

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 101
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 102
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->getNetInfo(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->networks:Ljava/util/List;

    .line 103
    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/HostBrowser$HostFetcher;Ljava/net/InetAddress;)Lcom/bv/sync/CifsUtils$HostInfo;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bv/wifisync/Utils$ArpTableFullException;
        }
    .end annotation

    .prologue
    .line 202
    invoke-direct {p0, p1}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->getHostInfo(Ljava/net/InetAddress;)Lcom/bv/sync/CifsUtils$HostInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/HostBrowser$HostFetcher;[Ljava/lang/Object;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->publishProgress([Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$5(Lcom/bv/wifisync/HostBrowser$HostFetcher;)Lcom/bv/wifisync/HostBrowser;
    .locals 1
    .parameter

    .prologue
    .line 95
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    return-object v0
.end method

.method private getHostInfo(Ljava/net/InetAddress;)Lcom/bv/sync/CifsUtils$HostInfo;
    .locals 9
    .parameter "address"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bv/wifisync/Utils$ArpTableFullException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 203
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    const/16 v6, 0x78

    if-lt v3, v6, :cond_2

    :cond_0
    :goto_1
    move-object v4, v5

    .line 222
    :cond_1
    :goto_2
    return-object v4

    .line 205
    :cond_2
    :try_start_0
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->smbReachable(Ljava/net/InetAddress;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 206
    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    .line 207
    .local v2, hostIp:Ljava/lang/String;
    invoke-static {v2}, Lcom/bv/sync/CifsUtils;->getNetbiosInfo(Ljava/lang/String;)Lcom/bv/sync/CifsUtils$HostInfo;

    move-result-object v4

    .line 208
    .local v4, result:Lcom/bv/sync/CifsUtils$HostInfo;
    if-nez v4, :cond_1

    .line 209
    new-instance v4, Lcom/bv/sync/CifsUtils$HostInfo;

    .end local v4           #result:Lcom/bv/sync/CifsUtils$HostInfo;
    const/4 v6, 0x0

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    invoke-direct {v4, v2, v2, v6, v7}, Lcom/bv/sync/CifsUtils$HostInfo;-><init>(Ljava/lang/String;Ljava/lang/String;[B[Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/bv/wifisync/Utils$ArpTableFullException; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v4       #result:Lcom/bv/sync/CifsUtils$HostInfo;
    goto :goto_2

    .line 213
    .end local v2           #hostIp:Ljava/lang/String;
    .end local v4           #result:Lcom/bv/sync/CifsUtils$HostInfo;
    :catch_0
    move-exception v0

    .line 215
    .local v0, e:Lcom/bv/wifisync/Utils$ArpTableFullException;
    const-wide/16 v6, 0x7d0

    :try_start_1
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 203
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 216
    :catch_1
    move-exception v1

    .line 217
    .local v1, e1:Ljava/lang/InterruptedException;
    goto :goto_1
.end method

.method private restoreUIState()V
    .locals 2

    .prologue
    .line 236
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    #getter for: Lcom/bv/wifisync/HostBrowser;->hostFetcher:Lcom/bv/wifisync/HostBrowser$HostFetcher;
    invoke-static {v0}, Lcom/bv/wifisync/HostBrowser;->access$4(Lcom/bv/wifisync/HostBrowser;)Lcom/bv/wifisync/HostBrowser$HostFetcher;

    move-result-object v0

    if-ne v0, p0, :cond_0

    .line 237
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/HostBrowser;->setProgressVisible(Z)V

    .line 238
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    const v1, 0x7f060127

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/HostBrowser;->setTitle(I)V

    .line 240
    :cond_0
    return-void
.end method

.method private scan(II)Ljava/lang/Void;
    .locals 9
    .parameter "ip"
    .parameter "mask"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;,
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    const/4 v7, -0x1

    rsub-int/lit8 v8, p2, 0x20

    shl-int v6, v7, v8

    .line 142
    .local v6, netMask:I
    and-int v5, p1, v6

    .line 143
    .local v5, lowest:I
    xor-int/lit8 v7, v6, -0x1

    add-int v2, v5, v7

    .line 144
    .local v2, highest:I
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 184
    .local v1, counter:Ljava/util/concurrent/atomic/AtomicInteger;
    const/16 v7, 0x10

    new-array v0, v7, [Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;

    .line 185
    .local v0, connectors:[Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    array-length v7, v0

    if-lt v4, v7, :cond_1

    .line 188
    new-instance v7, Lcom/bv/wifisync/ThreadedQueue;

    invoke-direct {v7, v0}, Lcom/bv/wifisync/ThreadedQueue;-><init>([Lcom/bv/wifisync/ThreadedQueue$Runner;)V

    iput-object v7, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->scanner:Lcom/bv/wifisync/ThreadedQueue;

    .line 189
    move v4, v5

    :goto_1
    if-ge v4, v2, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->isCancelled()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 195
    :cond_0
    invoke-virtual {p0}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->isCancelled()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 196
    iget-object v7, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->scanner:Lcom/bv/wifisync/ThreadedQueue;

    invoke-virtual {v7}, Lcom/bv/wifisync/ThreadedQueue;->cancel()V

    .line 199
    :goto_2
    const/4 v7, 0x0

    return-object v7

    .line 186
    :cond_1
    new-instance v7, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;

    invoke-direct {v7, p0, v1, v2, v5}, Lcom/bv/wifisync/HostBrowser$HostFetcher$1Connector;-><init>(Lcom/bv/wifisync/HostBrowser$HostFetcher;Ljava/util/concurrent/atomic/AtomicInteger;II)V

    aput-object v7, v0, v4

    .line 185
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 190
    :cond_2
    invoke-static {v4}, Lcom/bv/wifisync/Utils;->makeAddress(I)Ljava/net/InetAddress;

    move-result-object v3

    .line 191
    .local v3, hostAddress:Ljava/net/InetAddress;
    invoke-static {v3}, Lcom/bv/wifisync/Utils;->setHostName(Ljava/net/InetAddress;)V

    .line 192
    iget-object v7, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->scanner:Lcom/bv/wifisync/ThreadedQueue;

    invoke-virtual {v7, v3}, Lcom/bv/wifisync/ThreadedQueue;->add(Ljava/lang/Object;)V

    .line 193
    iget-object v7, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    invoke-static {v7}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 189
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 198
    .end local v3           #hostAddress:Ljava/net/InetAddress;
    :cond_3
    iget-object v7, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->scanner:Lcom/bv/wifisync/ThreadedQueue;

    invoke-virtual {v7}, Lcom/bv/wifisync/ThreadedQueue;->waitFor()V

    goto :goto_2
.end method


# virtual methods
.method protected bridge varargs synthetic atBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->atBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs atBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 4
    .parameter "arg0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->networks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 137
    const/4 v1, 0x0

    return-object v1

    .line 128
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Utils$NetInfo;

    .line 129
    .local v0, netInfo:Lcom/bv/wifisync/Utils$NetInfo;
    iget-object v2, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    new-instance v3, Lcom/bv/wifisync/HostBrowser$HostFetcher$1;

    invoke-direct {v3, p0, v0}, Lcom/bv/wifisync/HostBrowser$HostFetcher$1;-><init>(Lcom/bv/wifisync/HostBrowser$HostFetcher;Lcom/bv/wifisync/Utils$NetInfo;)V

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/HostBrowser;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 135
    iget v2, v0, Lcom/bv/wifisync/Utils$NetInfo;->ip:I

    iget v3, v0, Lcom/bv/wifisync/Utils$NetInfo;->mask:I

    invoke-direct {p0, v2, v3}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->scan(II)Ljava/lang/Void;

    goto :goto_0
.end method

.method cancel()V
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->cancel(Z)Z

    .line 107
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->scanner:Lcom/bv/wifisync/ThreadedQueue;

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->scanner:Lcom/bv/wifisync/ThreadedQueue;

    invoke-virtual {v0}, Lcom/bv/wifisync/ThreadedQueue;->cancel()V

    .line 109
    :cond_0
    return-void
.end method

.method protected onCancelled()V
    .locals 0

    .prologue
    .line 244
    invoke-super {p0}, Lcom/bv/wifisync/Utils$ProgressTask;->onCancelled()V

    .line 245
    invoke-direct {p0}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->restoreUIState()V

    .line 246
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 3
    .parameter "result"

    .prologue
    .line 227
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 228
    invoke-direct {p0}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->restoreUIState()V

    .line 229
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 230
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->error:Ljava/lang/Throwable;

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 233
    :cond_0
    :goto_0
    return-void

    .line 231
    :cond_1
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    #getter for: Lcom/bv/wifisync/HostBrowser;->adapter:Lcom/bv/wifisync/HostBrowser$HostsAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/HostBrowser;->access$3(Lcom/bv/wifisync/HostBrowser;)Lcom/bv/wifisync/HostBrowser$HostsAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/HostBrowser$HostsAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    const v2, 0x7f060137

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/HostBrowser;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/HostBrowser;->setProgressVisible(Z)V

    .line 114
    return-void
.end method

.method protected varargs onProgressUpdate([Lcom/bv/wifisync/HostBrowser$ProgressInfo;)V
    .locals 5
    .parameter "values"

    .prologue
    .line 118
    const/4 v1, 0x0

    aget-object v0, p1, v1

    .line 119
    .local v0, progressInfo:Lcom/bv/wifisync/HostBrowser$ProgressInfo;
    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    iget v2, v0, Lcom/bv/wifisync/HostBrowser$ProgressInfo;->percent:I

    iget-object v3, v0, Lcom/bv/wifisync/HostBrowser$ProgressInfo;->hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;

    iget-object v3, v3, Lcom/bv/sync/CifsUtils$HostInfo;->ip:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/bv/wifisync/HostBrowser;->setProgress(ILjava/lang/String;)V

    .line 120
    iget-object v1, v0, Lcom/bv/wifisync/HostBrowser$ProgressInfo;->hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;

    iget-object v1, v1, Lcom/bv/sync/CifsUtils$HostInfo;->name:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 121
    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    #getter for: Lcom/bv/wifisync/HostBrowser;->adapter:Lcom/bv/wifisync/HostBrowser$HostsAdapter;
    invoke-static {v1}, Lcom/bv/wifisync/HostBrowser;->access$3(Lcom/bv/wifisync/HostBrowser;)Lcom/bv/wifisync/HostBrowser$HostsAdapter;

    move-result-object v1

    new-instance v2, Lcom/bv/wifisync/HostBrowser$HostInfoRow;

    iget-object v3, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    iget-object v4, v0, Lcom/bv/wifisync/HostBrowser$ProgressInfo;->hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;

    invoke-direct {v2, v3, v4}, Lcom/bv/wifisync/HostBrowser$HostInfoRow;-><init>(Lcom/bv/wifisync/HostBrowser;Lcom/bv/sync/CifsUtils$HostInfo;)V

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/HostBrowser$HostsAdapter;->add(Ljava/lang/Object;)V

    .line 122
    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;

    #getter for: Lcom/bv/wifisync/HostBrowser;->adapter:Lcom/bv/wifisync/HostBrowser$HostsAdapter;
    invoke-static {v1}, Lcom/bv/wifisync/HostBrowser;->access$3(Lcom/bv/wifisync/HostBrowser;)Lcom/bv/wifisync/HostBrowser$HostsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/HostBrowser$HostsAdapter;->notifyDataSetChanged()V

    .line 124
    :cond_0
    return-void
.end method

.method protected bridge varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, [Lcom/bv/wifisync/HostBrowser$ProgressInfo;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->onProgressUpdate([Lcom/bv/wifisync/HostBrowser$ProgressInfo;)V

    return-void
.end method
