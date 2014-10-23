.class final enum Lcom/bv/wifisync/Job$SyncType;
.super Ljava/lang/Enum;
.source "Job.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Job;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "SyncType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/wifisync/Job$SyncType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Downloads:Lcom/bv/wifisync/Job$SyncType;

.field private static final synthetic ENUM$VALUES:[Lcom/bv/wifisync/Job$SyncType;

.field public static final enum Folder:Lcom/bv/wifisync/Job$SyncType;

.field public static final enum Movies:Lcom/bv/wifisync/Job$SyncType;

.field public static final enum Music:Lcom/bv/wifisync/Job$SyncType;

.field public static final enum Pictures:Lcom/bv/wifisync/Job$SyncType;

.field public static final enum Root:Lcom/bv/wifisync/Job$SyncType;

.field public static final enum SDCard:Lcom/bv/wifisync/Job$SyncType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 86
    new-instance v0, Lcom/bv/wifisync/Job$SyncType;

    const-string v1, "Folder"

    invoke-direct {v0, v1, v3}, Lcom/bv/wifisync/Job$SyncType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Job$SyncType;->Folder:Lcom/bv/wifisync/Job$SyncType;

    new-instance v0, Lcom/bv/wifisync/Job$SyncType;

    const-string v1, "Music"

    invoke-direct {v0, v1, v4}, Lcom/bv/wifisync/Job$SyncType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Job$SyncType;->Music:Lcom/bv/wifisync/Job$SyncType;

    new-instance v0, Lcom/bv/wifisync/Job$SyncType;

    const-string v1, "Pictures"

    invoke-direct {v0, v1, v5}, Lcom/bv/wifisync/Job$SyncType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Job$SyncType;->Pictures:Lcom/bv/wifisync/Job$SyncType;

    new-instance v0, Lcom/bv/wifisync/Job$SyncType;

    const-string v1, "Movies"

    invoke-direct {v0, v1, v6}, Lcom/bv/wifisync/Job$SyncType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Job$SyncType;->Movies:Lcom/bv/wifisync/Job$SyncType;

    new-instance v0, Lcom/bv/wifisync/Job$SyncType;

    const-string v1, "SDCard"

    invoke-direct {v0, v1, v7}, Lcom/bv/wifisync/Job$SyncType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Job$SyncType;->SDCard:Lcom/bv/wifisync/Job$SyncType;

    new-instance v0, Lcom/bv/wifisync/Job$SyncType;

    const-string v1, "Root"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/Job$SyncType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Job$SyncType;->Root:Lcom/bv/wifisync/Job$SyncType;

    new-instance v0, Lcom/bv/wifisync/Job$SyncType;

    const-string v1, "Downloads"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/Job$SyncType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Job$SyncType;->Downloads:Lcom/bv/wifisync/Job$SyncType;

    const/4 v0, 0x7

    new-array v0, v0, [Lcom/bv/wifisync/Job$SyncType;

    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Folder:Lcom/bv/wifisync/Job$SyncType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Music:Lcom/bv/wifisync/Job$SyncType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Pictures:Lcom/bv/wifisync/Job$SyncType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Movies:Lcom/bv/wifisync/Job$SyncType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->SDCard:Lcom/bv/wifisync/Job$SyncType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/bv/wifisync/Job$SyncType;->Root:Lcom/bv/wifisync/Job$SyncType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/bv/wifisync/Job$SyncType;->Downloads:Lcom/bv/wifisync/Job$SyncType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/bv/wifisync/Job$SyncType;->ENUM$VALUES:[Lcom/bv/wifisync/Job$SyncType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 86
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/wifisync/Job$SyncType;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/wifisync/Job$SyncType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Job$SyncType;

    return-object v0
.end method

.method public static values()[Lcom/bv/wifisync/Job$SyncType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/wifisync/Job$SyncType;->ENUM$VALUES:[Lcom/bv/wifisync/Job$SyncType;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/wifisync/Job$SyncType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
