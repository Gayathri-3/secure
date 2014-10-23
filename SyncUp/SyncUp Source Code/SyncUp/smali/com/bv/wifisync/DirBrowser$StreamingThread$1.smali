.class Lcom/bv/wifisync/DirBrowser$StreamingThread$1;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser$StreamingThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/DirBrowser$StreamingThread;

.field private final synthetic val$e:Ljava/lang/Exception;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser$StreamingThread;Ljava/lang/Exception;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread$1;->this$1:Lcom/bv/wifisync/DirBrowser$StreamingThread;

    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread$1;->val$e:Ljava/lang/Exception;

    .line 471
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 474
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread$1;->val$e:Ljava/lang/Exception;

    .line 475
    .local v0, exception:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread$1;->val$e:Ljava/lang/Exception;

    instance-of v1, v1, Ljcifs/util/transport/TransportException;

    if-eqz v1, :cond_0

    .line 476
    new-instance v0, Ljava/io/IOException;

    .end local v0           #exception:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread$1;->this$1:Lcom/bv/wifisync/DirBrowser$StreamingThread;

    #getter for: Lcom/bv/wifisync/DirBrowser$StreamingThread;->this$0:Lcom/bv/wifisync/DirBrowser;
    invoke-static {v1}, Lcom/bv/wifisync/DirBrowser$StreamingThread;->access$1(Lcom/bv/wifisync/DirBrowser$StreamingThread;)Lcom/bv/wifisync/DirBrowser;

    move-result-object v1

    const v2, 0x7f0600a0

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 477
    .restart local v0       #exception:Ljava/lang/Exception;
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$StreamingThread$1;->this$1:Lcom/bv/wifisync/DirBrowser$StreamingThread;

    #getter for: Lcom/bv/wifisync/DirBrowser$StreamingThread;->this$0:Lcom/bv/wifisync/DirBrowser;
    invoke-static {v1}, Lcom/bv/wifisync/DirBrowser$StreamingThread;->access$1(Lcom/bv/wifisync/DirBrowser$StreamingThread;)Lcom/bv/wifisync/DirBrowser;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 478
    return-void
.end method
