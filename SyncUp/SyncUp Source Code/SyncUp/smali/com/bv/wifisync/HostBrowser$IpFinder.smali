.class Lcom/bv/wifisync/HostBrowser$IpFinder;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "HostBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/HostBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IpFinder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Lcom/bv/sync/CifsUtils$HostInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/HostBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HostBrowser;)V
    .locals 1
    .parameter

    .prologue
    .line 303
    iput-object p1, p0, Lcom/bv/wifisync/HostBrowser$IpFinder;->this$0:Lcom/bv/wifisync/HostBrowser;

    .line 304
    const-string v0, "IpFinder"

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 305
    return-void
.end method


# virtual methods
.method protected varargs atBackground([Ljava/lang/String;)Lcom/bv/sync/CifsUtils$HostInfo;
    .locals 7
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 309
    aget-object v2, p1, v6

    .line 310
    .local v2, hostName:Ljava/lang/String;
    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 311
    .local v0, address:Ljava/net/InetAddress;
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    .line 312
    .local v3, ip:Ljava/lang/String;
    invoke-static {v3}, Lcom/bv/sync/CifsUtils;->getNetbiosInfo(Ljava/lang/String;)Lcom/bv/sync/CifsUtils$HostInfo;

    move-result-object v1

    .line 313
    .local v1, hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    if-nez v1, :cond_1

    .line 314
    invoke-static {v0}, Lcom/bv/wifisync/Utils;->smbReachable(Ljava/net/InetAddress;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 315
    new-instance v4, Ljava/io/IOException;

    iget-object v5, p0, Lcom/bv/wifisync/HostBrowser$IpFinder;->this$0:Lcom/bv/wifisync/HostBrowser;

    const v6, 0x7f0600a6

    invoke-virtual {v5, v6}, Lcom/bv/wifisync/HostBrowser;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 316
    :cond_0
    new-instance v1, Lcom/bv/sync/CifsUtils$HostInfo;

    .end local v1           #hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    aput-object v3, v5, v6

    invoke-direct {v1, v3, v3, v4, v5}, Lcom/bv/sync/CifsUtils$HostInfo;-><init>(Ljava/lang/String;Ljava/lang/String;[B[Ljava/lang/String;)V

    .line 318
    .restart local v1       #hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    :cond_1
    return-object v1
.end method

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
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HostBrowser$IpFinder;->atBackground([Ljava/lang/String;)Lcom/bv/sync/CifsUtils$HostInfo;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/bv/sync/CifsUtils$HostInfo;)V
    .locals 1
    .parameter "result"

    .prologue
    .line 323
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 324
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$IpFinder;->error:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/HostBrowser$IpFinder;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 325
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$IpFinder;->this$0:Lcom/bv/wifisync/HostBrowser;

    #calls: Lcom/bv/wifisync/HostBrowser;->finish(Lcom/bv/sync/CifsUtils$HostInfo;)V
    invoke-static {v0, p1}, Lcom/bv/wifisync/HostBrowser;->access$2(Lcom/bv/wifisync/HostBrowser;Lcom/bv/sync/CifsUtils$HostInfo;)V

    .line 326
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/sync/CifsUtils$HostInfo;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HostBrowser$IpFinder;->onPostExecute(Lcom/bv/sync/CifsUtils$HostInfo;)V

    return-void
.end method
