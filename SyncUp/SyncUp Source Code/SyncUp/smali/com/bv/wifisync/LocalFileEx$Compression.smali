.class final enum Lcom/bv/wifisync/LocalFileEx$Compression;
.super Ljava/lang/Enum;
.source "LocalFileEx.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/LocalFileEx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Compression"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/wifisync/LocalFileEx$Compression;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Decrypt:Lcom/bv/wifisync/LocalFileEx$Compression;

.field private static final synthetic ENUM$VALUES:[Lcom/bv/wifisync/LocalFileEx$Compression;

.field public static final enum Encrypt:Lcom/bv/wifisync/LocalFileEx$Compression;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 94
    new-instance v0, Lcom/bv/wifisync/LocalFileEx$Compression;

    const-string v1, "Encrypt"

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/LocalFileEx$Compression;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/LocalFileEx$Compression;->Encrypt:Lcom/bv/wifisync/LocalFileEx$Compression;

    new-instance v0, Lcom/bv/wifisync/LocalFileEx$Compression;

    const-string v1, "Decrypt"

    invoke-direct {v0, v1, v3}, Lcom/bv/wifisync/LocalFileEx$Compression;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/LocalFileEx$Compression;->Decrypt:Lcom/bv/wifisync/LocalFileEx$Compression;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/bv/wifisync/LocalFileEx$Compression;

    sget-object v1, Lcom/bv/wifisync/LocalFileEx$Compression;->Encrypt:Lcom/bv/wifisync/LocalFileEx$Compression;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/wifisync/LocalFileEx$Compression;->Decrypt:Lcom/bv/wifisync/LocalFileEx$Compression;

    aput-object v1, v0, v3

    sput-object v0, Lcom/bv/wifisync/LocalFileEx$Compression;->ENUM$VALUES:[Lcom/bv/wifisync/LocalFileEx$Compression;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 94
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/wifisync/LocalFileEx$Compression;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/wifisync/LocalFileEx$Compression;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/LocalFileEx$Compression;

    return-object v0
.end method

.method public static values()[Lcom/bv/wifisync/LocalFileEx$Compression;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/wifisync/LocalFileEx$Compression;->ENUM$VALUES:[Lcom/bv/wifisync/LocalFileEx$Compression;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/wifisync/LocalFileEx$Compression;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
