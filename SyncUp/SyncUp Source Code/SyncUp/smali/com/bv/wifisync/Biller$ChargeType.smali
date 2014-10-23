.class abstract enum Lcom/bv/wifisync/Biller$ChargeType;
.super Ljava/lang/Enum;
.source "Biller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Biller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4408
    name = "ChargeType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/wifisync/Biller$ChargeType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AddDirExclude:Lcom/bv/wifisync/Biller$ChargeType;

.field public static final enum AddRouter:Lcom/bv/wifisync/Biller$ChargeType;

.field public static final enum AddWakeupSchedule:Lcom/bv/wifisync/Biller$ChargeType;

.field public static final enum AddWeeklySchedule:Lcom/bv/wifisync/Biller$ChargeType;

.field public static final enum Donate:Lcom/bv/wifisync/Biller$ChargeType;

.field private static final synthetic ENUM$VALUES:[Lcom/bv/wifisync/Biller$ChargeType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 35
    new-instance v0, Lcom/bv/wifisync/Biller$ChargeType$1;

    const-string v1, "Donate"

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/Biller$ChargeType$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Biller$ChargeType;->Donate:Lcom/bv/wifisync/Biller$ChargeType;

    .line 36
    new-instance v0, Lcom/bv/wifisync/Biller$ChargeType$2;

    const-string v1, "AddRouter"

    invoke-direct {v0, v1, v3}, Lcom/bv/wifisync/Biller$ChargeType$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Biller$ChargeType;->AddRouter:Lcom/bv/wifisync/Biller$ChargeType;

    .line 37
    new-instance v0, Lcom/bv/wifisync/Biller$ChargeType$3;

    const-string v1, "AddDirExclude"

    invoke-direct {v0, v1, v4}, Lcom/bv/wifisync/Biller$ChargeType$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Biller$ChargeType;->AddDirExclude:Lcom/bv/wifisync/Biller$ChargeType;

    .line 38
    new-instance v0, Lcom/bv/wifisync/Biller$ChargeType$4;

    const-string v1, "AddWeeklySchedule"

    invoke-direct {v0, v1, v5}, Lcom/bv/wifisync/Biller$ChargeType$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Biller$ChargeType;->AddWeeklySchedule:Lcom/bv/wifisync/Biller$ChargeType;

    .line 39
    new-instance v0, Lcom/bv/wifisync/Biller$ChargeType$5;

    const-string v1, "AddWakeupSchedule"

    invoke-direct {v0, v1, v6}, Lcom/bv/wifisync/Biller$ChargeType$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Biller$ChargeType;->AddWakeupSchedule:Lcom/bv/wifisync/Biller$ChargeType;

    .line 34
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/bv/wifisync/Biller$ChargeType;

    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->Donate:Lcom/bv/wifisync/Biller$ChargeType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->AddRouter:Lcom/bv/wifisync/Biller$ChargeType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->AddDirExclude:Lcom/bv/wifisync/Biller$ChargeType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->AddWeeklySchedule:Lcom/bv/wifisync/Biller$ChargeType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->AddWakeupSchedule:Lcom/bv/wifisync/Biller$ChargeType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/bv/wifisync/Biller$ChargeType;->ENUM$VALUES:[Lcom/bv/wifisync/Biller$ChargeType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/bv/wifisync/Biller$ChargeType;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/Biller$ChargeType;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/wifisync/Biller$ChargeType;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/wifisync/Biller$ChargeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Biller$ChargeType;

    return-object v0
.end method

.method public static values()[Lcom/bv/wifisync/Biller$ChargeType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/wifisync/Biller$ChargeType;->ENUM$VALUES:[Lcom/bv/wifisync/Biller$ChargeType;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/wifisync/Biller$ChargeType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method protected abstract getPurchaseString()Ljava/lang/String;
.end method
