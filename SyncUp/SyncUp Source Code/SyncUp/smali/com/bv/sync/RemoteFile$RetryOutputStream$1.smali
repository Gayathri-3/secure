.class Lcom/bv/sync/RemoteFile$RetryOutputStream$1;
.super Ljava/lang/Object;
.source "RemoteFile.java"

# interfaces
.implements Lcom/bv/sync/RemoteFile$IORunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/RemoteFile$RetryOutputStream;->write([BII)V
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
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/sync/RemoteFile$RetryOutputStream;

.field private final synthetic val$b:[B

.field private final synthetic val$len:I

.field private final synthetic val$off:I


# direct methods
.method constructor <init>(Lcom/bv/sync/RemoteFile$RetryOutputStream;[BII)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/RemoteFile$RetryOutputStream$1;->this$1:Lcom/bv/sync/RemoteFile$RetryOutputStream;

    iput-object p2, p0, Lcom/bv/sync/RemoteFile$RetryOutputStream$1;->val$b:[B

    iput p3, p0, Lcom/bv/sync/RemoteFile$RetryOutputStream$1;->val$off:I

    iput p4, p0, Lcom/bv/sync/RemoteFile$RetryOutputStream$1;->val$len:I

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile$RetryOutputStream$1;->run()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public run()Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    iget-object v0, p0, Lcom/bv/sync/RemoteFile$RetryOutputStream$1;->this$1:Lcom/bv/sync/RemoteFile$RetryOutputStream;

    iget-object v1, p0, Lcom/bv/sync/RemoteFile$RetryOutputStream$1;->val$b:[B

    iget v2, p0, Lcom/bv/sync/RemoteFile$RetryOutputStream$1;->val$off:I

    iget v3, p0, Lcom/bv/sync/RemoteFile$RetryOutputStream$1;->val$len:I

    #calls: Lcom/bv/sync/RemoteFile$RetryOutputStream;->superWrite([BII)V
    invoke-static {v0, v1, v2, v3}, Lcom/bv/sync/RemoteFile$RetryOutputStream;->access$0(Lcom/bv/sync/RemoteFile$RetryOutputStream;[BII)V

    .line 165
    const/4 v0, 0x0

    return-object v0
.end method
