.class abstract enum Lcom/bv/sync/Mp3Scanner$FieldType;
.super Ljava/lang/Enum;
.source "Mp3Scanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/Mp3Scanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4408
    name = "FieldType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/sync/Mp3Scanner$FieldType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Album:Lcom/bv/sync/Mp3Scanner$FieldType;

.field public static final enum Artist:Lcom/bv/sync/Mp3Scanner$FieldType;

.field private static final synthetic ENUM$VALUES:[Lcom/bv/sync/Mp3Scanner$FieldType;

.field public static final enum Title:Lcom/bv/sync/Mp3Scanner$FieldType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 170
    new-instance v0, Lcom/bv/sync/Mp3Scanner$FieldType$1;

    const-string v1, "Artist"

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/Mp3Scanner$FieldType$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/Mp3Scanner$FieldType;->Artist:Lcom/bv/sync/Mp3Scanner$FieldType;

    .line 171
    new-instance v0, Lcom/bv/sync/Mp3Scanner$FieldType$2;

    const-string v1, "Album"

    invoke-direct {v0, v1, v3}, Lcom/bv/sync/Mp3Scanner$FieldType$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/Mp3Scanner$FieldType;->Album:Lcom/bv/sync/Mp3Scanner$FieldType;

    .line 172
    new-instance v0, Lcom/bv/sync/Mp3Scanner$FieldType$3;

    const-string v1, "Title"

    invoke-direct {v0, v1, v4}, Lcom/bv/sync/Mp3Scanner$FieldType$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/sync/Mp3Scanner$FieldType;->Title:Lcom/bv/sync/Mp3Scanner$FieldType;

    .line 169
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/bv/sync/Mp3Scanner$FieldType;

    sget-object v1, Lcom/bv/sync/Mp3Scanner$FieldType;->Artist:Lcom/bv/sync/Mp3Scanner$FieldType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/sync/Mp3Scanner$FieldType;->Album:Lcom/bv/sync/Mp3Scanner$FieldType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bv/sync/Mp3Scanner$FieldType;->Title:Lcom/bv/sync/Mp3Scanner$FieldType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/bv/sync/Mp3Scanner$FieldType;->ENUM$VALUES:[Lcom/bv/sync/Mp3Scanner$FieldType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 169
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/bv/sync/Mp3Scanner$FieldType;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 169
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/Mp3Scanner$FieldType;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/sync/Mp3Scanner$FieldType;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/sync/Mp3Scanner$FieldType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/Mp3Scanner$FieldType;

    return-object v0
.end method

.method public static values()[Lcom/bv/sync/Mp3Scanner$FieldType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/sync/Mp3Scanner$FieldType;->ENUM$VALUES:[Lcom/bv/sync/Mp3Scanner$FieldType;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/sync/Mp3Scanner$FieldType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method abstract getValue(Lcom/mpatric/mp3agic/ID3v1;)Ljava/lang/String;
.end method
