.class public final enum Lcom/bv/sync/ProgressNotification$ProgressAction;
.super Ljava/lang/Enum;
.source "ProgressNotification.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/ProgressNotification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ProgressAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/sync/ProgressNotification$ProgressAction;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Connecting:Lcom/bv/sync/ProgressNotification$ProgressAction;

.field public static final enum Copying:Lcom/bv/sync/ProgressNotification$ProgressAction;

.field public static final enum Deleting:Lcom/bv/sync/ProgressNotification$ProgressAction;

.field private static final synthetic ENUM$VALUES:[Lcom/bv/sync/ProgressNotification$ProgressAction;

.field public static final enum Grouping:Lcom/bv/sync/ProgressNotification$ProgressAction;

.field public static final enum Listing:Lcom/bv/sync/ProgressNotification$ProgressAction;

.field public static final enum Moving:Lcom/bv/sync/ProgressNotification$ProgressAction;

.field public static final enum Saving:Lcom/bv/sync/ProgressNotification$ProgressAction;

.field public static final enum Synchronizing:Lcom/bv/sync/ProgressNotification$ProgressAction;

.field public static final enum TrackingDeletions:Lcom/bv/sync/ProgressNotification$ProgressAction;

.field public static final enum UpdateMediaStore:Lcom/bv/sync/ProgressNotification$ProgressAction;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 5
    new-instance v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-string v1, "Synchronizing"

    invoke-direct {v0, v1, v3}, Lcom/bv/sync/ProgressNotification$ProgressAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->Synchronizing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    .line 6
    new-instance v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-string v1, "Copying"

    invoke-direct {v0, v1, v4}, Lcom/bv/sync/ProgressNotification$ProgressAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->Copying:Lcom/bv/sync/ProgressNotification$ProgressAction;

    .line 7
    new-instance v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-string v1, "Deleting"

    invoke-direct {v0, v1, v5}, Lcom/bv/sync/ProgressNotification$ProgressAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->Deleting:Lcom/bv/sync/ProgressNotification$ProgressAction;

    .line 8
    new-instance v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-string v1, "TrackingDeletions"

    invoke-direct {v0, v1, v6}, Lcom/bv/sync/ProgressNotification$ProgressAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->TrackingDeletions:Lcom/bv/sync/ProgressNotification$ProgressAction;

    .line 9
    new-instance v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-string v1, "Grouping"

    invoke-direct {v0, v1, v7}, Lcom/bv/sync/ProgressNotification$ProgressAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->Grouping:Lcom/bv/sync/ProgressNotification$ProgressAction;

    .line 10
    new-instance v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-string v1, "Moving"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/ProgressNotification$ProgressAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->Moving:Lcom/bv/sync/ProgressNotification$ProgressAction;

    .line 11
    new-instance v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-string v1, "Connecting"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/ProgressNotification$ProgressAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->Connecting:Lcom/bv/sync/ProgressNotification$ProgressAction;

    .line 12
    new-instance v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-string v1, "Saving"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/ProgressNotification$ProgressAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->Saving:Lcom/bv/sync/ProgressNotification$ProgressAction;

    .line 13
    new-instance v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-string v1, "UpdateMediaStore"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/ProgressNotification$ProgressAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->UpdateMediaStore:Lcom/bv/sync/ProgressNotification$ProgressAction;

    .line 14
    new-instance v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-string v1, "Listing"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/ProgressNotification$ProgressAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->Listing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    .line 4
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/bv/sync/ProgressNotification$ProgressAction;

    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Synchronizing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Copying:Lcom/bv/sync/ProgressNotification$ProgressAction;

    aput-object v1, v0, v4

    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Deleting:Lcom/bv/sync/ProgressNotification$ProgressAction;

    aput-object v1, v0, v5

    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->TrackingDeletions:Lcom/bv/sync/ProgressNotification$ProgressAction;

    aput-object v1, v0, v6

    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Grouping:Lcom/bv/sync/ProgressNotification$ProgressAction;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/bv/sync/ProgressNotification$ProgressAction;->Moving:Lcom/bv/sync/ProgressNotification$ProgressAction;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/bv/sync/ProgressNotification$ProgressAction;->Connecting:Lcom/bv/sync/ProgressNotification$ProgressAction;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/bv/sync/ProgressNotification$ProgressAction;->Saving:Lcom/bv/sync/ProgressNotification$ProgressAction;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/bv/sync/ProgressNotification$ProgressAction;->UpdateMediaStore:Lcom/bv/sync/ProgressNotification$ProgressAction;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/bv/sync/ProgressNotification$ProgressAction;->Listing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    aput-object v2, v0, v1

    sput-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->ENUM$VALUES:[Lcom/bv/sync/ProgressNotification$ProgressAction;

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

.method public static valueOf(Ljava/lang/String;)Lcom/bv/sync/ProgressNotification$ProgressAction;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/ProgressNotification$ProgressAction;

    return-object v0
.end method

.method public static values()[Lcom/bv/sync/ProgressNotification$ProgressAction;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->ENUM$VALUES:[Lcom/bv/sync/ProgressNotification$ProgressAction;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
