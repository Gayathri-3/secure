.class public Lcom/bv/sync/CifsSync$SyncException;
.super Ljava/io/IOException;
.source "CifsSync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/CifsSync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SyncException"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x77a974158e1cfa17L


# instance fields
.field public final destPath:Ljava/lang/String;

.field public final transient result:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;"
        }
    .end annotation
.end field

.field public final sourcePath:Ljava/lang/String;

.field public final syncResult:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/io/IOException;)V
    .locals 1
    .parameter "sourcePath"
    .parameter "destPath"
    .parameter
    .parameter "cause"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;",
            "Ljava/io/IOException;",
            ")V"
        }
    .end annotation

    .prologue
    .line 66
    .local p3, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    invoke-virtual {p4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p0, p4}, Lcom/bv/sync/CifsSync$SyncException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 68
    iput-object p1, p0, Lcom/bv/sync/CifsSync$SyncException;->sourcePath:Ljava/lang/String;

    .line 69
    iput-object p2, p0, Lcom/bv/sync/CifsSync$SyncException;->destPath:Ljava/lang/String;

    .line 70
    iput-object p3, p0, Lcom/bv/sync/CifsSync$SyncException;->result:Ljava/util/List;

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bv/sync/CifsSync$SyncException;->syncResult:Ljava/util/List;

    .line 72
    return-void
.end method
