.class Lcom/bv/wifisync/SyncService$ServiceBinder;
.super Landroid/os/Binder;
.source "SyncService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/SyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ServiceBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/SyncService;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/SyncService;)V
    .locals 0
    .parameter

    .prologue
    .line 511
    iput-object p1, p0, Lcom/bv/wifisync/SyncService$ServiceBinder;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method getService()Lcom/bv/wifisync/SyncService;
    .locals 1

    .prologue
    .line 513
    iget-object v0, p0, Lcom/bv/wifisync/SyncService$ServiceBinder;->this$0:Lcom/bv/wifisync/SyncService;

    return-object v0
.end method
