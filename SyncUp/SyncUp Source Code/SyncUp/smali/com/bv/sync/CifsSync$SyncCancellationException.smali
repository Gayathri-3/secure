.class public Lcom/bv/sync/CifsSync$SyncCancellationException;
.super Ljava/util/concurrent/CancellationException;
.source "CifsSync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/CifsSync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SyncCancellationException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field public final transient syncResult:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 79
    .local p1, syncResult:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    invoke-direct {p0}, Ljava/util/concurrent/CancellationException;-><init>()V

    .line 80
    iput-object p1, p0, Lcom/bv/sync/CifsSync$SyncCancellationException;->syncResult:Ljava/util/List;

    .line 81
    return-void
.end method
