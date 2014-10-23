.class Lcom/bv/wifisync/SyncService$SyncQueue;
.super Ljava/util/LinkedList;
.source "SyncService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/SyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SyncQueue"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedList",
        "<",
        "Lcom/bv/wifisync/SyncService$SyncTask;",
        ">;"
    }
.end annotation


# instance fields
.field private volatile modified:Z

.field final synthetic this$0:Lcom/bv/wifisync/SyncService;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/SyncService;)V
    .locals 0
    .parameter

    .prologue
    .line 74
    iput-object p1, p0, Lcom/bv/wifisync/SyncService$SyncQueue;->this$0:Lcom/bv/wifisync/SyncService;

    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/SyncService$SyncQueue;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/bv/wifisync/SyncService$SyncQueue;-><init>(Lcom/bv/wifisync/SyncService;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized add(Lcom/bv/wifisync/SyncService$SyncTask;)Z
    .locals 1
    .parameter "object"

    .prologue
    .line 78
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/bv/wifisync/SyncService$SyncQueue;->modified:Z

    .line 79
    invoke-super {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 78
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/wifisync/SyncService$SyncTask;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/SyncService$SyncQueue;->add(Lcom/bv/wifisync/SyncService$SyncTask;)Z

    move-result v0

    return v0
.end method

.method isModified()Z
    .locals 1

    .prologue
    .line 95
    iget-boolean v0, p0, Lcom/bv/wifisync/SyncService$SyncQueue;->modified:Z

    return v0
.end method

.method public declared-synchronized peek()Lcom/bv/wifisync/SyncService$SyncTask;
    .locals 3

    .prologue
    .line 90
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/bv/wifisync/SyncService$TaskComparator;

    iget-object v1, p0, Lcom/bv/wifisync/SyncService$SyncQueue;->this$0:Lcom/bv/wifisync/SyncService;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/SyncService$TaskComparator;-><init>(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/SyncService$TaskComparator;)V

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 91
    invoke-super {p0}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/SyncService$SyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 90
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public bridge synthetic peek()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/bv/wifisync/SyncService$SyncQueue;->peek()Lcom/bv/wifisync/SyncService$SyncTask;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized poll()Lcom/bv/wifisync/SyncService$SyncTask;
    .locals 4

    .prologue
    .line 83
    monitor-enter p0

    :try_start_0
    new-instance v1, Lcom/bv/wifisync/SyncService$TaskComparator;

    iget-object v2, p0, Lcom/bv/wifisync/SyncService$SyncQueue;->this$0:Lcom/bv/wifisync/SyncService;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/bv/wifisync/SyncService$TaskComparator;-><init>(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/SyncService$TaskComparator;)V

    invoke-static {p0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 84
    invoke-super {p0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/SyncService$SyncTask;

    .line 85
    .local v0, result:Lcom/bv/wifisync/SyncService$SyncTask;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/bv/wifisync/SyncService$SyncQueue;->modified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    monitor-exit p0

    return-object v0

    .line 83
    .end local v0           #result:Lcom/bv/wifisync/SyncService$SyncTask;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public bridge synthetic poll()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/bv/wifisync/SyncService$SyncQueue;->poll()Lcom/bv/wifisync/SyncService$SyncTask;

    move-result-object v0

    return-object v0
.end method
