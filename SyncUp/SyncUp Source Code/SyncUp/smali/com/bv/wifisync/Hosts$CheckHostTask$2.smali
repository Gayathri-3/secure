.class Lcom/bv/wifisync/Hosts$CheckHostTask$2;
.super Ljava/lang/Object;
.source "Hosts.java"

# interfaces
.implements Lcom/bv/wifisync/HostList$ChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Hosts$CheckHostTask;->checkHostConnected()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/Hosts$CheckHostTask;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Hosts$CheckHostTask;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$CheckHostTask$2;->this$1:Lcom/bv/wifisync/Hosts$CheckHostTask;

    .line 935
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/Hosts$CheckHostTask$2;)Lcom/bv/wifisync/Hosts$CheckHostTask;
    .locals 1
    .parameter

    .prologue
    .line 935
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckHostTask$2;->this$1:Lcom/bv/wifisync/Hosts$CheckHostTask;

    return-object v0
.end method


# virtual methods
.method public onChanged()V
    .locals 2

    .prologue
    .line 938
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckHostTask$2;->this$1:Lcom/bv/wifisync/Hosts$CheckHostTask;

    #getter for: Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts$CheckHostTask;->access$1(Lcom/bv/wifisync/Hosts$CheckHostTask;)Lcom/bv/wifisync/Hosts;

    move-result-object v0

    new-instance v1, Lcom/bv/wifisync/Hosts$CheckHostTask$2$1;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/Hosts$CheckHostTask$2$1;-><init>(Lcom/bv/wifisync/Hosts$CheckHostTask$2;)V

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Hosts;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 944
    return-void
.end method
