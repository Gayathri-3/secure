.class public Lcom/bv/sync/SyncItem;
.super Ljava/lang/Object;
.source "SyncItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/SyncItem$Type;
    }
.end annotation


# instance fields
.field public final absolutePath:Ljava/lang/String;

.field public final isFolder:Z

.field public final lastModified:J

.field public final size:J

.field public final type:Lcom/bv/sync/SyncItem$Type;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JZ)V
    .locals 0
    .parameter "absolutePath"
    .parameter "lastModified"
    .parameter "type"
    .parameter "size"
    .parameter "isFolder"

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/bv/sync/SyncItem;->absolutePath:Ljava/lang/String;

    .line 18
    iput-wide p2, p0, Lcom/bv/sync/SyncItem;->lastModified:J

    .line 19
    iput-object p4, p0, Lcom/bv/sync/SyncItem;->type:Lcom/bv/sync/SyncItem$Type;

    .line 20
    iput-wide p5, p0, Lcom/bv/sync/SyncItem;->size:J

    .line 21
    iput-boolean p7, p0, Lcom/bv/sync/SyncItem;->isFolder:Z

    .line 22
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bv/sync/SyncItem;->absolutePath:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/sync/SyncItem;->type:Lcom/bv/sync/SyncItem$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
