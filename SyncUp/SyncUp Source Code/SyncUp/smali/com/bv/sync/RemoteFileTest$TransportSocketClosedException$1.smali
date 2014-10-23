.class Lcom/bv/sync/RemoteFileTest$TransportSocketClosedException$1;
.super Ljcifs/util/transport/TransportException;
.source "RemoteFileTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/RemoteFileTest$TransportSocketClosedException;->getRootCause()Ljava/lang/Throwable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/sync/RemoteFileTest$TransportSocketClosedException;


# direct methods
.method constructor <init>(Lcom/bv/sync/RemoteFileTest$TransportSocketClosedException;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/RemoteFileTest$TransportSocketClosedException$1;->this$1:Lcom/bv/sync/RemoteFileTest$TransportSocketClosedException;

    .line 59
    invoke-direct {p0}, Ljcifs/util/transport/TransportException;-><init>()V

    return-void
.end method


# virtual methods
.method public getRootCause()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 62
    new-instance v0, Ljava/net/SocketException;

    const-string v1, "Socket closed"

    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
