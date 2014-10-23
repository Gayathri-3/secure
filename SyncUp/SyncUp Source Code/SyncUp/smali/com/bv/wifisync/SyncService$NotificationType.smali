.class final enum Lcom/bv/wifisync/SyncService$NotificationType;
.super Ljava/lang/Enum;
.source "SyncService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/SyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "NotificationType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/wifisync/SyncService$NotificationType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/bv/wifisync/SyncService$NotificationType;

.field public static final enum Error:Lcom/bv/wifisync/SyncService$NotificationType;

.field public static final enum JobError:Lcom/bv/wifisync/SyncService$NotificationType;

.field public static final enum Progress:Lcom/bv/wifisync/SyncService$NotificationType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 60
    new-instance v0, Lcom/bv/wifisync/SyncService$NotificationType;

    const-string v1, "Error"

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/SyncService$NotificationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/SyncService$NotificationType;->Error:Lcom/bv/wifisync/SyncService$NotificationType;

    .line 61
    new-instance v0, Lcom/bv/wifisync/SyncService$NotificationType;

    const-string v1, "JobError"

    invoke-direct {v0, v1, v3}, Lcom/bv/wifisync/SyncService$NotificationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/SyncService$NotificationType;->JobError:Lcom/bv/wifisync/SyncService$NotificationType;

    .line 62
    new-instance v0, Lcom/bv/wifisync/SyncService$NotificationType;

    const-string v1, "Progress"

    invoke-direct {v0, v1, v4}, Lcom/bv/wifisync/SyncService$NotificationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/SyncService$NotificationType;->Progress:Lcom/bv/wifisync/SyncService$NotificationType;

    .line 59
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/bv/wifisync/SyncService$NotificationType;

    sget-object v1, Lcom/bv/wifisync/SyncService$NotificationType;->Error:Lcom/bv/wifisync/SyncService$NotificationType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/wifisync/SyncService$NotificationType;->JobError:Lcom/bv/wifisync/SyncService$NotificationType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bv/wifisync/SyncService$NotificationType;->Progress:Lcom/bv/wifisync/SyncService$NotificationType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/bv/wifisync/SyncService$NotificationType;->ENUM$VALUES:[Lcom/bv/wifisync/SyncService$NotificationType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 59
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/wifisync/SyncService$NotificationType;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/SyncService$NotificationType;

    return-object v0
.end method

.method public static values()[Lcom/bv/wifisync/SyncService$NotificationType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/wifisync/SyncService$NotificationType;->ENUM$VALUES:[Lcom/bv/wifisync/SyncService$NotificationType;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/wifisync/SyncService$NotificationType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
