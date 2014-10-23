.class final Lcom/bv/wifisync/Utils$FileNameInputFilter;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Landroid/text/InputFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FileNameInputFilter"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 781
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 2
    .parameter "source"
    .parameter "start"
    .parameter "end"
    .parameter "dest"
    .parameter "dstart"
    .parameter "dend"

    .prologue
    .line 785
    move v0, p2

    .local v0, i:I
    :goto_0
    if-lt v0, p3, :cond_0

    .line 788
    const/4 v1, 0x0

    :goto_1
    return-object v1

    .line 786
    :cond_0
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/Utils$FileNameInputFilter;->isValid(C)Z

    move-result v1

    if-nez v1, :cond_1

    .line 787
    const-string v1, ""

    goto :goto_1

    .line 785
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method isValid(C)Z
    .locals 5
    .parameter "ch"

    .prologue
    const/4 v2, 0x0

    .line 792
    const/16 v3, 0xa

    new-array v1, v3, [C

    fill-array-data v1, :array_0

    .line 793
    .local v1, invalidChars:[C
    array-length v4, v1

    move v3, v2

    :goto_0
    if-lt v3, v4, :cond_1

    .line 796
    const/4 v2, 0x1

    :cond_0
    return v2

    .line 793
    :cond_1
    aget-char v0, v1, v3

    .line 794
    .local v0, c:C
    if-eq p1, v0, :cond_0

    .line 793
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 792
    nop

    :array_0
    .array-data 0x2
        0x2ft 0x0t
        0x5ct 0x0t
        0x2at 0x0t
        0x3ft 0x0t
        0x25t 0x0t
        0x3at 0x0t
        0x7ct 0x0t
        0x22t 0x0t
        0x3et 0x0t
        0x3ct 0x0t
    .end array-data
.end method
