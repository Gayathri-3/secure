.class final enum Lcom/bv/wifisync/Mp3Group$RowType;
.super Ljava/lang/Enum;
.source "Mp3Group.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Mp3Group;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "RowType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/wifisync/Mp3Group$RowType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/bv/wifisync/Mp3Group$RowType;

.field public static final enum GroupByAlbum:Lcom/bv/wifisync/Mp3Group$RowType;

.field public static final enum GroupByArtist:Lcom/bv/wifisync/Mp3Group$RowType;

.field public static final enum Rename:Lcom/bv/wifisync/Mp3Group$RowType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 25
    new-instance v0, Lcom/bv/wifisync/Mp3Group$RowType;

    const-string v1, "GroupByArtist"

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/Mp3Group$RowType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Mp3Group$RowType;->GroupByArtist:Lcom/bv/wifisync/Mp3Group$RowType;

    new-instance v0, Lcom/bv/wifisync/Mp3Group$RowType;

    const-string v1, "GroupByAlbum"

    invoke-direct {v0, v1, v3}, Lcom/bv/wifisync/Mp3Group$RowType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Mp3Group$RowType;->GroupByAlbum:Lcom/bv/wifisync/Mp3Group$RowType;

    new-instance v0, Lcom/bv/wifisync/Mp3Group$RowType;

    const-string v1, "Rename"

    invoke-direct {v0, v1, v4}, Lcom/bv/wifisync/Mp3Group$RowType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Mp3Group$RowType;->Rename:Lcom/bv/wifisync/Mp3Group$RowType;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/bv/wifisync/Mp3Group$RowType;

    sget-object v1, Lcom/bv/wifisync/Mp3Group$RowType;->GroupByArtist:Lcom/bv/wifisync/Mp3Group$RowType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/wifisync/Mp3Group$RowType;->GroupByAlbum:Lcom/bv/wifisync/Mp3Group$RowType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bv/wifisync/Mp3Group$RowType;->Rename:Lcom/bv/wifisync/Mp3Group$RowType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/bv/wifisync/Mp3Group$RowType;->ENUM$VALUES:[Lcom/bv/wifisync/Mp3Group$RowType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/wifisync/Mp3Group$RowType;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/wifisync/Mp3Group$RowType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Mp3Group$RowType;

    return-object v0
.end method

.method public static values()[Lcom/bv/wifisync/Mp3Group$RowType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/wifisync/Mp3Group$RowType;->ENUM$VALUES:[Lcom/bv/wifisync/Mp3Group$RowType;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/wifisync/Mp3Group$RowType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
