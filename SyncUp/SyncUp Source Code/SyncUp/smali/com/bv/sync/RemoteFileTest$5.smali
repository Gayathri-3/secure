.class Lcom/bv/sync/RemoteFileTest$5;
.super Lcom/bv/sync/RemoteFileTest$IORunnable;
.source "RemoteFileTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/RemoteFileTest;->testGetOutputStream()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/RemoteFileTest;


# direct methods
.method constructor <init>(Lcom/bv/sync/RemoteFileTest;)V
    .locals 1
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/RemoteFileTest$5;->this$0:Lcom/bv/sync/RemoteFileTest;

    .line 252
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/bv/sync/RemoteFileTest$IORunnable;-><init>(Lcom/bv/sync/RemoteFileTest;Lcom/bv/sync/RemoteFileTest$IORunnable;)V

    return-void
.end method


# virtual methods
.method run(Lcom/bv/sync/RemoteFile;)V
    .locals 0
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    invoke-virtual {p1}, Lcom/bv/sync/RemoteFile;->getOutputStream()Ljava/io/OutputStream;

    .line 256
    return-void
.end method
