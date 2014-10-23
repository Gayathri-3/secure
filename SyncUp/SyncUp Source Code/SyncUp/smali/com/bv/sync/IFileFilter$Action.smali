.class public final enum Lcom/bv/sync/IFileFilter$Action;
.super Ljava/lang/Enum;
.source "IFileFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/IFileFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Action"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/sync/IFileFilter$Action;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/bv/sync/IFileFilter$Action;

.field public static final enum Exclude:Lcom/bv/sync/IFileFilter$Action;

.field public static final enum Include:Lcom/bv/sync/IFileFilter$Action;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/bv/sync/IFileFilter$Action;

    const-string v1, "Include"

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/IFileFilter$Action;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    new-instance v0, Lcom/bv/sync/IFileFilter$Action;

    const-string v1, "Exclude"

    invoke-direct {v0, v1, v3}, Lcom/bv/sync/IFileFilter$Action;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/bv/sync/IFileFilter$Action;

    sget-object v1, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    aput-object v1, v0, v3

    sput-object v0, Lcom/bv/sync/IFileFilter$Action;->ENUM$VALUES:[Lcom/bv/sync/IFileFilter$Action;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 7
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/sync/IFileFilter$Action;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/sync/IFileFilter$Action;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/IFileFilter$Action;

    return-object v0
.end method

.method public static values()[Lcom/bv/sync/IFileFilter$Action;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/sync/IFileFilter$Action;->ENUM$VALUES:[Lcom/bv/sync/IFileFilter$Action;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/sync/IFileFilter$Action;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
