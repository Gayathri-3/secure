.class final enum Lcom/bv/wifisync/Job$ScheduleType;
.super Ljava/lang/Enum;
.source "Job.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Job;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ScheduleType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/wifisync/Job$ScheduleType;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/bv/wifisync/Job$ScheduleType;

.field public static final enum Interval:Lcom/bv/wifisync/Job$ScheduleType;

.field public static final enum Time:Lcom/bv/wifisync/Job$ScheduleType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 81
    new-instance v0, Lcom/bv/wifisync/Job$ScheduleType;

    const-string v1, "Interval"

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/Job$ScheduleType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Job$ScheduleType;->Interval:Lcom/bv/wifisync/Job$ScheduleType;

    new-instance v0, Lcom/bv/wifisync/Job$ScheduleType;

    const-string v1, "Time"

    invoke-direct {v0, v1, v3}, Lcom/bv/wifisync/Job$ScheduleType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Job$ScheduleType;->Time:Lcom/bv/wifisync/Job$ScheduleType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/bv/wifisync/Job$ScheduleType;

    sget-object v1, Lcom/bv/wifisync/Job$ScheduleType;->Interval:Lcom/bv/wifisync/Job$ScheduleType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/wifisync/Job$ScheduleType;->Time:Lcom/bv/wifisync/Job$ScheduleType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/bv/wifisync/Job$ScheduleType;->ENUM$VALUES:[Lcom/bv/wifisync/Job$ScheduleType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/wifisync/Job$ScheduleType;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/wifisync/Job$ScheduleType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Job$ScheduleType;

    return-object v0
.end method

.method public static values()[Lcom/bv/wifisync/Job$ScheduleType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/wifisync/Job$ScheduleType;->ENUM$VALUES:[Lcom/bv/wifisync/Job$ScheduleType;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/wifisync/Job$ScheduleType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
