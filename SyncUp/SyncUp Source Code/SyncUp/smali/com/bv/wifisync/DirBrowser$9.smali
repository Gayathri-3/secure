.class Lcom/bv/wifisync/DirBrowser$9;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser;->onPaste()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$9;->this$0:Lcom/bv/wifisync/DirBrowser;

    .line 1166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1169
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$9;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v0, v0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->refresh()V

    .line 1170
    return-void
.end method
