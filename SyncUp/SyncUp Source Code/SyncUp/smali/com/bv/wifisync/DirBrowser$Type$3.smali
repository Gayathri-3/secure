.class enum Lcom/bv/wifisync/DirBrowser$Type$3;
.super Lcom/bv/wifisync/DirBrowser$Type;
.source "DirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser$Type;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4000
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 498
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/bv/wifisync/DirBrowser$Type;-><init>(Ljava/lang/String;ILcom/bv/wifisync/DirBrowser$Type;)V

    .line 1
    return-void
.end method


# virtual methods
.method getSuccessMessage()I
    .locals 1

    .prologue
    .line 498
    const v0, 0x7f0601a0

    return v0
.end method
