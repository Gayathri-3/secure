.class final Lcom/bv/sync/RemoteFileTest$SocketClosedException;
.super Lcom/bv/sync/RemoteFileTest$RetryException;
.source "RemoteFileTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/RemoteFileTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SocketClosedException"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/RemoteFileTest;


# direct methods
.method private constructor <init>(Lcom/bv/sync/RemoteFileTest;)V
    .locals 1
    .parameter

    .prologue
    .line 37
    iput-object p1, p0, Lcom/bv/sync/RemoteFileTest$SocketClosedException;->this$0:Lcom/bv/sync/RemoteFileTest;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/bv/sync/RemoteFileTest$RetryException;-><init>(Lcom/bv/sync/RemoteFileTest;Lcom/bv/sync/RemoteFileTest$RetryException;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/sync/RemoteFileTest;Lcom/bv/sync/RemoteFileTest$SocketClosedException;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/bv/sync/RemoteFileTest$SocketClosedException;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    return-void
.end method


# virtual methods
.method public getRootCause()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 40
    new-instance v0, Ljava/net/SocketException;

    const-string v1, "Socket closed"

    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
