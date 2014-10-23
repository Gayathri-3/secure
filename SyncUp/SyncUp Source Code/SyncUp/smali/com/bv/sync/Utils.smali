.class Lcom/bv/sync/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/Utils$FileComparator;
    }
.end annotation


# static fields
.field private static final invalidChars:[C

.field static isWindows:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 6
    const/16 v0, 0xa

    new-array v0, v0, [C

    const/4 v1, 0x0

    const/16 v2, 0x5c

    aput-char v2, v0, v1

    const/4 v1, 0x1

    const/16 v2, 0x2f

    aput-char v2, v0, v1

    const/4 v1, 0x2

    const/16 v2, 0x3a

    aput-char v2, v0, v1

    const/4 v1, 0x3

    const/16 v2, 0x2a

    aput-char v2, v0, v1

    const/4 v1, 0x4

    const/16 v2, 0x3f

    aput-char v2, v0, v1

    const/4 v1, 0x5

    const/16 v2, 0x22

    aput-char v2, v0, v1

    const/4 v1, 0x6

    const/16 v2, 0x3c

    aput-char v2, v0, v1

    const/4 v1, 0x7

    const/16 v2, 0x3e

    aput-char v2, v0, v1

    const/16 v1, 0x8

    const/16 v2, 0x7c

    aput-char v2, v0, v1

    sput-object v0, Lcom/bv/sync/Utils;->invalidChars:[C

    .line 18
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static isValidFileName(Ljava/lang/String;)Z
    .locals 5
    .parameter "path"

    .prologue
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 15
    :cond_0
    :goto_0
    return v2

    .line 11
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v0, v3, :cond_2

    .line 15
    const/4 v2, 0x1

    goto :goto_0

    .line 12
    :cond_2
    const/4 v1, 0x0

    .local v1, j:I
    :goto_2
    sget-object v3, Lcom/bv/sync/Utils;->invalidChars:[C

    array-length v3, v3

    if-lt v1, v3, :cond_3

    .line 11
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 13
    :cond_3
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sget-object v4, Lcom/bv/sync/Utils;->invalidChars:[C

    aget-char v4, v4, v1

    if-eq v3, v4, :cond_0

    .line 12
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method static isWindows()Z
    .locals 2

    .prologue
    .line 21
    sget-object v0, Lcom/bv/sync/Utils;->isWindows:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 22
    const-string v0, "os.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Windows"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/bv/sync/Utils;->isWindows:Ljava/lang/Boolean;

    .line 23
    :cond_0
    sget-object v0, Lcom/bv/sync/Utils;->isWindows:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method
