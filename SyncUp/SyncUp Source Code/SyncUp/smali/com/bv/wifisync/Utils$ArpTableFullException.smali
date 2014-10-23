.class Lcom/bv/wifisync/Utils$ArpTableFullException;
.super Ljava/net/SocketException;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ArpTableFullException"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x6b27a79abc751542L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 268
    invoke-direct {p0, p1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    .line 269
    return-void
.end method
