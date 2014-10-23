.class abstract Lcom/bv/sync/RemoteFileTest$IORunnable;
.super Ljava/lang/Object;
.source "RemoteFileTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/RemoteFileTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "IORunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/RemoteFileTest;


# direct methods
.method private constructor <init>(Lcom/bv/sync/RemoteFileTest;)V
    .locals 0
    .parameter

    .prologue
    .line 189
    iput-object p1, p0, Lcom/bv/sync/RemoteFileTest$IORunnable;->this$0:Lcom/bv/sync/RemoteFileTest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/sync/RemoteFileTest;Lcom/bv/sync/RemoteFileTest$IORunnable;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/bv/sync/RemoteFileTest$IORunnable;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    return-void
.end method


# virtual methods
.method abstract run(Lcom/bv/sync/RemoteFile;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
