.class final Lcom/bv/sync/RemoteFileTest$TimeoutSmbException;
.super Lcom/bv/sync/RemoteFileTest$RetryException;
.source "RemoteFileTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/RemoteFileTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "TimeoutSmbException"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/RemoteFileTest;


# direct methods
.method private constructor <init>(Lcom/bv/sync/RemoteFileTest;)V
    .locals 1
    .parameter

    .prologue
    .line 30
    iput-object p1, p0, Lcom/bv/sync/RemoteFileTest$TimeoutSmbException;->this$0:Lcom/bv/sync/RemoteFileTest;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/bv/sync/RemoteFileTest$RetryException;-><init>(Lcom/bv/sync/RemoteFileTest;Lcom/bv/sync/RemoteFileTest$RetryException;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/sync/RemoteFileTest;Lcom/bv/sync/RemoteFileTest$TimeoutSmbException;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/bv/sync/RemoteFileTest$TimeoutSmbException;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    return-void
.end method


# virtual methods
.method public getRootCause()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 33
    new-instance v0, Ljava/net/SocketTimeoutException;

    invoke-direct {v0}, Ljava/net/SocketTimeoutException;-><init>()V

    return-object v0
.end method
