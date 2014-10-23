.class Lcom/bv/sync/ImageScanner$Point;
.super Ljava/lang/Object;
.source "ImageScanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/ImageScanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Point"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/ImageScanner;

.field x:D

.field y:D


# direct methods
.method constructor <init>(Lcom/bv/sync/ImageScanner;DD)V
    .locals 0
    .parameter
    .parameter "x"
    .parameter "y"

    .prologue
    .line 207
    iput-object p1, p0, Lcom/bv/sync/ImageScanner$Point;->this$0:Lcom/bv/sync/ImageScanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 208
    iput-wide p2, p0, Lcom/bv/sync/ImageScanner$Point;->x:D

    .line 209
    iput-wide p4, p0, Lcom/bv/sync/ImageScanner$Point;->y:D

    .line 210
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 219
    if-ne p1, p0, :cond_1

    .line 225
    :cond_0
    :goto_0
    return v1

    .line 221
    :cond_1
    instance-of v3, p1, Lcom/bv/sync/ImageScanner$Point;

    if-eqz v3, :cond_3

    move-object v0, p1

    .line 222
    check-cast v0, Lcom/bv/sync/ImageScanner$Point;

    .line 223
    .local v0, another:Lcom/bv/sync/ImageScanner$Point;
    iget-wide v3, v0, Lcom/bv/sync/ImageScanner$Point;->x:D

    iget-wide v5, p0, Lcom/bv/sync/ImageScanner$Point;->x:D

    cmpl-double v3, v3, v5

    if-nez v3, :cond_2

    iget-wide v3, v0, Lcom/bv/sync/ImageScanner$Point;->y:D

    iget-wide v5, p0, Lcom/bv/sync/ImageScanner$Point;->y:D

    cmpl-double v3, v3, v5

    if-eqz v3, :cond_0

    :cond_2
    move v1, v2

    goto :goto_0

    .end local v0           #another:Lcom/bv/sync/ImageScanner$Point;
    :cond_3
    move v1, v2

    .line 225
    goto :goto_0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 214
    new-instance v0, Ljava/lang/Double;

    iget-wide v1, p0, Lcom/bv/sync/ImageScanner$Point;->x:D

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {v0}, Ljava/lang/Double;->hashCode()I

    move-result v0

    new-instance v1, Ljava/lang/Double;

    iget-wide v2, p0, Lcom/bv/sync/ImageScanner$Point;->y:D

    invoke-direct {v1, v2, v3}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {v1}, Ljava/lang/Double;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
