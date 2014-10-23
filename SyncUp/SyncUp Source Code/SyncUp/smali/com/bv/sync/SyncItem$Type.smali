.class public final enum Lcom/bv/sync/SyncItem$Type;
.super Ljava/lang/Enum;
.source "SyncItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/SyncItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/sync/SyncItem$Type;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Deleted:Lcom/bv/sync/SyncItem$Type;

.field private static final synthetic ENUM$VALUES:[Lcom/bv/sync/SyncItem$Type;

.field public static final enum LocalFile:Lcom/bv/sync/SyncItem$Type;

.field public static final enum RemoteFile:Lcom/bv/sync/SyncItem$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 5
    new-instance v0, Lcom/bv/sync/SyncItem$Type;

    const-string v1, "LocalFile"

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/SyncItem$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/SyncItem$Type;->LocalFile:Lcom/bv/sync/SyncItem$Type;

    .line 6
    new-instance v0, Lcom/bv/sync/SyncItem$Type;

    const-string v1, "RemoteFile"

    invoke-direct {v0, v1, v3}, Lcom/bv/sync/SyncItem$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/SyncItem$Type;->RemoteFile:Lcom/bv/sync/SyncItem$Type;

    .line 7
    new-instance v0, Lcom/bv/sync/SyncItem$Type;

    const-string v1, "Deleted"

    invoke-direct {v0, v1, v4}, Lcom/bv/sync/SyncItem$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/SyncItem$Type;->Deleted:Lcom/bv/sync/SyncItem$Type;

    .line 4
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/bv/sync/SyncItem$Type;

    sget-object v1, Lcom/bv/sync/SyncItem$Type;->LocalFile:Lcom/bv/sync/SyncItem$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/sync/SyncItem$Type;->RemoteFile:Lcom/bv/sync/SyncItem$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bv/sync/SyncItem$Type;->Deleted:Lcom/bv/sync/SyncItem$Type;

    aput-object v1, v0, v4

    sput-object v0, Lcom/bv/sync/SyncItem$Type;->ENUM$VALUES:[Lcom/bv/sync/SyncItem$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 4
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/sync/SyncItem$Type;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/sync/SyncItem$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/SyncItem$Type;

    return-object v0
.end method

.method public static values()[Lcom/bv/sync/SyncItem$Type;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/sync/SyncItem$Type;->ENUM$VALUES:[Lcom/bv/sync/SyncItem$Type;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/sync/SyncItem$Type;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
