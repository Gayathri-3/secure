.class public Lcom/bv/sync/CifsSync$SyncStats;
.super Ljava/lang/Object;
.source "CifsSync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/CifsSync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SyncStats"
.end annotation


# instance fields
.field public readBytes:J

.field public readTime:J

.field public reconnects:J

.field public final timeZoneConflicts:[I

.field public writeBytes:J

.field public writeTime:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const/16 v0, 0x19

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/bv/sync/CifsSync$SyncStats;->timeZoneConflicts:[I

    .line 48
    return-void
.end method
