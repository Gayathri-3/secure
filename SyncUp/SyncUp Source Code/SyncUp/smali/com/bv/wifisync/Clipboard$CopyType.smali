.class final enum Lcom/bv/wifisync/Clipboard$CopyType;
.super Ljava/lang/Enum;
.source "Clipboard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Clipboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "CopyType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/wifisync/Clipboard$CopyType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Copy:Lcom/bv/wifisync/Clipboard$CopyType;

.field public static final enum Cut:Lcom/bv/wifisync/Clipboard$CopyType;

.field private static final synthetic ENUM$VALUES:[Lcom/bv/wifisync/Clipboard$CopyType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 23
    new-instance v0, Lcom/bv/wifisync/Clipboard$CopyType;

    const-string v1, "Copy"

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/Clipboard$CopyType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Clipboard$CopyType;->Copy:Lcom/bv/wifisync/Clipboard$CopyType;

    new-instance v0, Lcom/bv/wifisync/Clipboard$CopyType;

    const-string v1, "Cut"

    invoke-direct {v0, v1, v3}, Lcom/bv/wifisync/Clipboard$CopyType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Clipboard$CopyType;->Cut:Lcom/bv/wifisync/Clipboard$CopyType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/bv/wifisync/Clipboard$CopyType;

    sget-object v1, Lcom/bv/wifisync/Clipboard$CopyType;->Copy:Lcom/bv/wifisync/Clipboard$CopyType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/wifisync/Clipboard$CopyType;->Cut:Lcom/bv/wifisync/Clipboard$CopyType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/bv/wifisync/Clipboard$CopyType;->ENUM$VALUES:[Lcom/bv/wifisync/Clipboard$CopyType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/wifisync/Clipboard$CopyType;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/wifisync/Clipboard$CopyType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Clipboard$CopyType;

    return-object v0
.end method

.method public static values()[Lcom/bv/wifisync/Clipboard$CopyType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/wifisync/Clipboard$CopyType;->ENUM$VALUES:[Lcom/bv/wifisync/Clipboard$CopyType;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/wifisync/Clipboard$CopyType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
