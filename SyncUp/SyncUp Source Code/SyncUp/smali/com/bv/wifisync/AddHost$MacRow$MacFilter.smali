.class Lcom/bv/wifisync/AddHost$MacRow$MacFilter;
.super Ljava/lang/Object;
.source "AddHost.java"

# interfaces
.implements Landroid/text/InputFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddHost$MacRow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MacFilter"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddHost$MacRow;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/AddHost$MacRow;)V
    .locals 0
    .parameter

    .prologue
    .line 407
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$MacRow$MacFilter;->this$1:Lcom/bv/wifisync/AddHost$MacRow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/AddHost$MacRow;Lcom/bv/wifisync/AddHost$MacRow$MacFilter;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 407
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddHost$MacRow$MacFilter;-><init>(Lcom/bv/wifisync/AddHost$MacRow;)V

    return-void
.end method

.method private isValidDigit(Ljava/lang/String;)Z
    .locals 3
    .parameter "split"

    .prologue
    const/4 v0, 0x0

    .line 432
    const/16 v1, 0x10

    :try_start_0
    invoke-static {p1, v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    const/16 v2, 0xff

    if-gt v1, v2, :cond_0

    const/4 v0, 0x1

    .line 434
    :cond_0
    :goto_0
    return v0

    .line 433
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private isValidMac(Ljava/lang/String;)Z
    .locals 6
    .parameter "text"

    .prologue
    const/4 v1, 0x0

    .line 421
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const-string v3, "00:00:00:00:00:00"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-gt v2, v3, :cond_0

    .line 422
    const-string v2, ":"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    move v2, v1

    :goto_0
    if-lt v2, v4, :cond_1

    .line 425
    const/4 v1, 0x1

    .line 427
    :cond_0
    return v1

    .line 422
    :cond_1
    aget-object v0, v3, v2

    .line 423
    .local v0, split:Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/bv/wifisync/AddHost$MacRow$MacFilter;->isValidDigit(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 422
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 4
    .parameter "source"
    .parameter "start"
    .parameter "end"
    .parameter "dest"
    .parameter "dstart"
    .parameter "dend"

    .prologue
    .line 411
    if-le p3, p2, :cond_0

    .line 412
    invoke-interface {p4}, Landroid/text/Spanned;->toString()Ljava/lang/String;

    move-result-object v0

    .line 413
    .local v0, destTxt:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, p5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0, p6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 414
    .local v1, resultingTxt:Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/bv/wifisync/AddHost$MacRow$MacFilter;->isValidMac(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 415
    const-string v2, ""

    .line 417
    .end local v0           #destTxt:Ljava/lang/String;
    .end local v1           #resultingTxt:Ljava/lang/String;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
