.class public Lcom/mpatric/mp3agic/MutableInteger;
.super Ljava/lang/Object;
.source "MutableInteger.java"


# instance fields
.field private value:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .parameter "value"

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput p1, p0, Lcom/mpatric/mp3agic/MutableInteger;->value:I

    .line 9
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 24
    instance-of v3, p1, Lcom/mpatric/mp3agic/MutableInteger;

    if-nez v3, :cond_1

    .line 28
    :cond_0
    :goto_0
    return v1

    .line 25
    :cond_1
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 26
    check-cast v0, Lcom/mpatric/mp3agic/MutableInteger;

    .line 27
    .local v0, other:Lcom/mpatric/mp3agic/MutableInteger;
    iget v3, p0, Lcom/mpatric/mp3agic/MutableInteger;->value:I

    iget v4, v0, Lcom/mpatric/mp3agic/MutableInteger;->value:I

    if-ne v3, v4, :cond_0

    move v1, v2

    .line 28
    goto :goto_0
.end method

.method public getValue()I
    .locals 1

    .prologue
    .line 16
    iget v0, p0, Lcom/mpatric/mp3agic/MutableInteger;->value:I

    return v0
.end method

.method public increment()V
    .locals 1

    .prologue
    .line 12
    iget v0, p0, Lcom/mpatric/mp3agic/MutableInteger;->value:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mpatric/mp3agic/MutableInteger;->value:I

    .line 13
    return-void
.end method

.method public setValue(I)V
    .locals 0
    .parameter "value"

    .prologue
    .line 20
    iput p1, p0, Lcom/mpatric/mp3agic/MutableInteger;->value:I

    .line 21
    return-void
.end method
