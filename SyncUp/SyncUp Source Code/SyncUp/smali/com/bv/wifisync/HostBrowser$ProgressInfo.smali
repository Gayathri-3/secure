.class Lcom/bv/wifisync/HostBrowser$ProgressInfo;
.super Ljava/lang/Object;
.source "HostBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/HostBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProgressInfo"
.end annotation


# instance fields
.field final hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;

.field final percent:I


# direct methods
.method constructor <init>(ILcom/bv/sync/CifsUtils$HostInfo;)V
    .locals 0
    .parameter "percent"
    .parameter "hostInfo"

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput p1, p0, Lcom/bv/wifisync/HostBrowser$ProgressInfo;->percent:I

    .line 91
    iput-object p2, p0, Lcom/bv/wifisync/HostBrowser$ProgressInfo;->hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;

    .line 92
    return-void
.end method
