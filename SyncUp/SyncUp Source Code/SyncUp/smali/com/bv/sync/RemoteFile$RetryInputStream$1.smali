.class Lcom/bv/sync/RemoteFile$RetryInputStream$1;
.super Ljava/lang/Object;
.source "RemoteFile.java"

# interfaces
.implements Lcom/bv/sync/RemoteFile$IORunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/RemoteFile$RetryInputStream;->read([B)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bv/sync/RemoteFile$IORunnable",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/sync/RemoteFile$RetryInputStream;

.field private final synthetic val$buffer:[B


# direct methods
.method constructor <init>(Lcom/bv/sync/RemoteFile$RetryInputStream;[B)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/RemoteFile$RetryInputStream$1;->this$1:Lcom/bv/sync/RemoteFile$RetryInputStream;

    iput-object p2, p0, Lcom/bv/sync/RemoteFile$RetryInputStream$1;->val$buffer:[B

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Integer;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    iget-object v0, p0, Lcom/bv/sync/RemoteFile$RetryInputStream$1;->this$1:Lcom/bv/sync/RemoteFile$RetryInputStream;

    iget-object v1, p0, Lcom/bv/sync/RemoteFile$RetryInputStream$1;->val$buffer:[B

    #calls: Lcom/bv/sync/RemoteFile$RetryInputStream;->superRead([B)I
    invoke-static {v0, v1}, Lcom/bv/sync/RemoteFile$RetryInputStream;->access$0(Lcom/bv/sync/RemoteFile$RetryInputStream;[B)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile$RetryInputStream$1;->run()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
