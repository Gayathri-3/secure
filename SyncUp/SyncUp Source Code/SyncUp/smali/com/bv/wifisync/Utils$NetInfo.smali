.class Lcom/bv/wifisync/Utils$NetInfo;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NetInfo"
.end annotation


# instance fields
.field final ip:I

.field mask:I

.field final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .parameter "name"
    .parameter "ip"
    .parameter "mask"

    .prologue
    .line 322
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 323
    iput-object p1, p0, Lcom/bv/wifisync/Utils$NetInfo;->name:Ljava/lang/String;

    .line 324
    iput p2, p0, Lcom/bv/wifisync/Utils$NetInfo;->ip:I

    .line 325
    iput p3, p0, Lcom/bv/wifisync/Utils$NetInfo;->mask:I

    .line 326
    return-void
.end method
