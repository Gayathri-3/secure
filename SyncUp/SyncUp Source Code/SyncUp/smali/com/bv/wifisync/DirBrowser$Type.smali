.class abstract enum Lcom/bv/wifisync/DirBrowser$Type;
.super Ljava/lang/Enum;
.source "DirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x440a
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/bv/wifisync/DirBrowser$Type;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Copy:Lcom/bv/wifisync/DirBrowser$Type;

.field public static final enum Delete:Lcom/bv/wifisync/DirBrowser$Type;

.field private static final synthetic ENUM$VALUES:[Lcom/bv/wifisync/DirBrowser$Type;

.field public static final enum Move:Lcom/bv/wifisync/DirBrowser$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 496
    new-instance v0, Lcom/bv/wifisync/DirBrowser$Type$1;

    const-string v1, "Delete"

    invoke-direct {v0, v1, v2}, Lcom/bv/wifisync/DirBrowser$Type$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/DirBrowser$Type;->Delete:Lcom/bv/wifisync/DirBrowser$Type;

    .line 497
    new-instance v0, Lcom/bv/wifisync/DirBrowser$Type$2;

    const-string v1, "Copy"

    invoke-direct {v0, v1, v3}, Lcom/bv/wifisync/DirBrowser$Type$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/DirBrowser$Type;->Copy:Lcom/bv/wifisync/DirBrowser$Type;

    .line 498
    new-instance v0, Lcom/bv/wifisync/DirBrowser$Type$3;

    const-string v1, "Move"

    invoke-direct {v0, v1, v4}, Lcom/bv/wifisync/DirBrowser$Type$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bv/wifisync/DirBrowser$Type;->Move:Lcom/bv/wifisync/DirBrowser$Type;

    .line 495
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/bv/wifisync/DirBrowser$Type;

    sget-object v1, Lcom/bv/wifisync/DirBrowser$Type;->Delete:Lcom/bv/wifisync/DirBrowser$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bv/wifisync/DirBrowser$Type;->Copy:Lcom/bv/wifisync/DirBrowser$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bv/wifisync/DirBrowser$Type;->Move:Lcom/bv/wifisync/DirBrowser$Type;

    aput-object v1, v0, v4

    sput-object v0, Lcom/bv/wifisync/DirBrowser$Type;->ENUM$VALUES:[Lcom/bv/wifisync/DirBrowser$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 495
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/bv/wifisync/DirBrowser$Type;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 495
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/DirBrowser$Type;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bv/wifisync/DirBrowser$Type;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/bv/wifisync/DirBrowser$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/DirBrowser$Type;

    return-object v0
.end method

.method public static values()[Lcom/bv/wifisync/DirBrowser$Type;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/bv/wifisync/DirBrowser$Type;->ENUM$VALUES:[Lcom/bv/wifisync/DirBrowser$Type;

    array-length v1, v0

    new-array v2, v1, [Lcom/bv/wifisync/DirBrowser$Type;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method abstract getSuccessMessage()I
.end method
