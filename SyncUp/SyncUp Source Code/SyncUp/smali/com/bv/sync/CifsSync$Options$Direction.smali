.class public final enum Lcom/bv/sync/CifsSync$Options$Direction;
.super Ljava/lang/Enum;
.source "CifsSync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/CifsSync$Options;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Direction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/sync/CifsSync$Options$Direction;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Both:Lcom/bv/sync/CifsSync$Options$Direction;

.field private static final synthetic ENUM$VALUES:[Lcom/bv/sync/CifsSync$Options$Direction;

.field public static final enum moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

.field public static final enum moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

.field public static final enum toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

.field public static final enum toRemote:Lcom/bv/sync/CifsSync$Options$Direction;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 85
    new-instance v0, Lcom/bv/sync/CifsSync$Options$Direction;

    const-string v1, "Both"

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/CifsSync$Options$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    new-instance v0, Lcom/bv/sync/CifsSync$Options$Direction;

    const-string v1, "toRemote"

    invoke-direct {v0, v1, v3}, Lcom/bv/sync/CifsSync$Options$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    new-instance v0, Lcom/bv/sync/CifsSync$Options$Direction;

    const-string v1, "toLocal"

    invoke-direct {v0, v1, v4}, Lcom/bv/sync/CifsSync$Options$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    new-instance v0, Lcom/bv/sync/CifsSync$Options$Direction;

    const-string v1, "moveToRemote"

    invoke-direct {v0, v1, v5}, Lcom/bv/sync/CifsSync$Options$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    new-instance v0, Lcom/bv/sync/CifsSync$Options$Direction;

    const-string v1, "moveToLocal"

    invoke-direct {v0, v1, v6}, Lcom/bv/sync/CifsSync$Options$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    aput-object v1, v0, v4

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    aput-object v1, v0, v5

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    aput-object v1, v0, v6

    sput-object v0, Lcom/bv/sync/CifsSync$Options$Direction;->ENUM$VALUES:[Lcom/bv/sync/CifsSync$Options$Direction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 85
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/sync/CifsSync$Options$Direction;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/CifsSync$Options$Direction;

    return-object v0
.end method

.method public static values()[Lcom/bv/sync/CifsSync$Options$Direction;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/sync/CifsSync$Options$Direction;->ENUM$VALUES:[Lcom/bv/sync/CifsSync$Options$Direction;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
