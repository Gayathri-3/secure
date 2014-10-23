.class public final enum Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;
.super Ljava/lang/Enum;
.source "CifsSync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/CifsSync$Options;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "VerifyTimeZone"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum All:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

.field private static final synthetic ENUM$VALUES:[Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

.field public static final enum None:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

.field public static final enum OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 89
    new-instance v0, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const-string v1, "None"

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->None:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    new-instance v0, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const-string v1, "OneHour"

    invoke-direct {v0, v1, v3}, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    new-instance v0, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const-string v1, "All"

    invoke-direct {v0, v1, v4}, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->All:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->None:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->All:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    aput-object v1, v0, v4

    sput-object v0, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->ENUM$VALUES:[Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 89
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    return-object v0
.end method

.method public static values()[Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->ENUM$VALUES:[Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
