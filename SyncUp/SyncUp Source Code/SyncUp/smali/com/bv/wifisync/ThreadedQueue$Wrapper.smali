.class Lcom/bv/wifisync/ThreadedQueue$Wrapper;
.super Ljava/lang/Object;
.source "ThreadedQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/ThreadedQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Wrapper"
.end annotation


# instance fields
.field t:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/bv/wifisync/ThreadedQueue;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/ThreadedQueue;Ljava/lang/Object;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 15
    .local p2, t:Ljava/lang/Object;,"TT;"
    iput-object p1, p0, Lcom/bv/wifisync/ThreadedQueue$Wrapper;->this$0:Lcom/bv/wifisync/ThreadedQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p2, p0, Lcom/bv/wifisync/ThreadedQueue$Wrapper;->t:Ljava/lang/Object;

    .line 17
    return-void
.end method
