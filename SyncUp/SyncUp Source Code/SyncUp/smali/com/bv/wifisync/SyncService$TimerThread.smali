.class Lcom/bv/wifisync/SyncService$TimerThread;
.super Ljava/lang/Thread;
.source "SyncService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/SyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TimerThread"
.end annotation


# instance fields
.field private ui:Lcom/bv/wifisync/SyncService$Notify;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;Lcom/bv/wifisync/SyncService$Notify;)V
    .locals 1
    .parameter "runnable"
    .parameter "ui"

    .prologue
    .line 52
    const-string v0, "TimerThread"

    invoke-direct {p0, p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 53
    iput-object p2, p0, Lcom/bv/wifisync/SyncService$TimerThread;->ui:Lcom/bv/wifisync/SyncService$Notify;

    .line 54
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/SyncService$TimerThread;)Lcom/bv/wifisync/SyncService$Notify;
    .locals 1
    .parameter

    .prologue
    .line 56
    iget-object v0, p0, Lcom/bv/wifisync/SyncService$TimerThread;->ui:Lcom/bv/wifisync/SyncService$Notify;

    return-object v0
.end method

.method static synthetic access$1(Lcom/bv/wifisync/SyncService$TimerThread;Lcom/bv/wifisync/SyncService$Notify;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 56
    iput-object p1, p0, Lcom/bv/wifisync/SyncService$TimerThread;->ui:Lcom/bv/wifisync/SyncService$Notify;

    return-void
.end method
