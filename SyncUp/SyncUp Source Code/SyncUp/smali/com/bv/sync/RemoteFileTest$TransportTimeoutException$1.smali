.class Lcom/bv/sync/RemoteFileTest$TransportTimeoutException$1;
.super Ljcifs/util/transport/TransportException;
.source "RemoteFileTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/RemoteFileTest$TransportTimeoutException;->getRootCause()Ljava/lang/Throwable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/sync/RemoteFileTest$TransportTimeoutException;


# direct methods
.method constructor <init>(Lcom/bv/sync/RemoteFileTest$TransportTimeoutException;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/RemoteFileTest$TransportTimeoutException$1;->this$1:Lcom/bv/sync/RemoteFileTest$TransportTimeoutException;

    .line 47
    invoke-direct {p0}, Ljcifs/util/transport/TransportException;-><init>()V

    return-void
.end method


# virtual methods
.method public getRootCause()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 50
    new-instance v0, Ljava/net/SocketTimeoutException;

    invoke-direct {v0}, Ljava/net/SocketTimeoutException;-><init>()V

    return-object v0
.end method
