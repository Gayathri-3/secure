.class final enum Lcom/bv/wifisync/Config$DontShowDialogs;
.super Ljava/lang/Enum;
.source "Config.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Config;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "DontShowDialogs"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/wifisync/Config$DontShowDialogs;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/bv/wifisync/Config$DontShowDialogs;

.field public static final enum MirrorMode:Lcom/bv/wifisync/Config$DontShowDialogs;

.field public static final enum ModifiedTimeWarning:Lcom/bv/wifisync/Config$DontShowDialogs;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 125
    new-instance v0, Lcom/bv/wifisync/Config$DontShowDialogs;

    const-string v1, "ModifiedTimeWarning"

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/Config$DontShowDialogs;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Config$DontShowDialogs;->ModifiedTimeWarning:Lcom/bv/wifisync/Config$DontShowDialogs;

    .line 126
    new-instance v0, Lcom/bv/wifisync/Config$DontShowDialogs;

    const-string v1, "MirrorMode"

    invoke-direct {v0, v1, v3}, Lcom/bv/wifisync/Config$DontShowDialogs;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/Config$DontShowDialogs;->MirrorMode:Lcom/bv/wifisync/Config$DontShowDialogs;

    .line 124
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/bv/wifisync/Config$DontShowDialogs;

    sget-object v1, Lcom/bv/wifisync/Config$DontShowDialogs;->ModifiedTimeWarning:Lcom/bv/wifisync/Config$DontShowDialogs;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/wifisync/Config$DontShowDialogs;->MirrorMode:Lcom/bv/wifisync/Config$DontShowDialogs;

    aput-object v1, v0, v3

    sput-object v0, Lcom/bv/wifisync/Config$DontShowDialogs;->ENUM$VALUES:[Lcom/bv/wifisync/Config$DontShowDialogs;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 124
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/wifisync/Config$DontShowDialogs;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/wifisync/Config$DontShowDialogs;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Config$DontShowDialogs;

    return-object v0
.end method

.method public static values()[Lcom/bv/wifisync/Config$DontShowDialogs;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/wifisync/Config$DontShowDialogs;->ENUM$VALUES:[Lcom/bv/wifisync/Config$DontShowDialogs;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/wifisync/Config$DontShowDialogs;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
