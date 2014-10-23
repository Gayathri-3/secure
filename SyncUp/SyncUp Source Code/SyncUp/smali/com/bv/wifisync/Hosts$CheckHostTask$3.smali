.class Lcom/bv/wifisync/Hosts$CheckHostTask$3;
.super Ljava/lang/Object;
.source "Hosts.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Hosts$CheckHostTask;->refreshScreen()V
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
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$CheckHostTask$3;->this$1:Lcom/bv/wifisync/Hosts$CheckHostTask;

    .line 952
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 955
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$CheckHostTask$3;->this$1:Lcom/bv/wifisync/Hosts$CheckHostTask;

    #getter for: Lcom/bv/wifisync/Hosts$CheckHostTask;->this$0:Lcom/bv/wifisync/Hosts;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts$CheckHostTask;->access$1(Lcom/bv/wifisync/Hosts$CheckHostTask;)Lcom/bv/wifisync/Hosts;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$14(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$ItemsAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->notifyDataSetChanged()V

    .line 956
    return-void
.end method
