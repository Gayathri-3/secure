.class Lcom/bv/wifisync/HostBrowser$HostFetcher$1;
.super Ljava/lang/Object;
.source "HostBrowser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/HostBrowser$HostFetcher;->atBackground([Ljava/lang/Void;)Ljava/lang/Void;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/HostBrowser$HostFetcher;

.field private final synthetic val$netInfo:Lcom/bv/wifisync/Utils$NetInfo;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HostBrowser$HostFetcher;Lcom/bv/wifisync/Utils$NetInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1;->this$1:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    iput-object p2, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1;->val$netInfo:Lcom/bv/wifisync/Utils$NetInfo;

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 132
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1;->this$1:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    #getter for: Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;
    invoke-static {v0}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->access$5(Lcom/bv/wifisync/HostBrowser$HostFetcher;)Lcom/bv/wifisync/HostBrowser;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1;->this$1:Lcom/bv/wifisync/HostBrowser$HostFetcher;

    #getter for: Lcom/bv/wifisync/HostBrowser$HostFetcher;->this$0:Lcom/bv/wifisync/HostBrowser;
    invoke-static {v2}, Lcom/bv/wifisync/HostBrowser$HostFetcher;->access$5(Lcom/bv/wifisync/HostBrowser$HostFetcher;)Lcom/bv/wifisync/HostBrowser;

    move-result-object v2

    const v3, 0x7f060127

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/HostBrowser;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/HostBrowser$HostFetcher$1;->val$netInfo:Lcom/bv/wifisync/Utils$NetInfo;

    iget-object v2, v2, Lcom/bv/wifisync/Utils$NetInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/HostBrowser;->setTitle(Ljava/lang/CharSequence;)V

    .line 133
    return-void
.end method
