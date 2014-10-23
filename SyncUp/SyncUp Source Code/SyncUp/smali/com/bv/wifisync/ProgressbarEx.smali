.class public Lcom/bv/wifisync/ProgressbarEx;
.super Landroid/widget/ProgressBar;
.source "ProgressbarEx.java"


# instance fields
.field private final bounds:Landroid/graphics/Rect;

.field private final span:Landroid/text/style/TextAppearanceSpan;

.field private text:Ljava/lang/String;

.field private final textPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 42
    invoke-direct {p0, p1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    .line 14
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/ProgressbarEx;->textPaint:Landroid/graphics/Paint;

    .line 15
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/ProgressbarEx;->bounds:Landroid/graphics/Rect;

    .line 43
    new-instance v0, Landroid/text/style/TextAppearanceSpan;

    const v1, 0x1030046

    invoke-direct {v0, p1, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/bv/wifisync/ProgressbarEx;->span:Landroid/text/style/TextAppearanceSpan;

    .line 44
    invoke-direct {p0, p1}, Lcom/bv/wifisync/ProgressbarEx;->setTextSize(Landroid/content/Context;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/ProgressbarEx;->textPaint:Landroid/graphics/Paint;

    .line 15
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/ProgressbarEx;->bounds:Landroid/graphics/Rect;

    .line 37
    new-instance v0, Landroid/text/style/TextAppearanceSpan;

    const v1, 0x1030046

    invoke-direct {v0, p1, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/bv/wifisync/ProgressbarEx;->span:Landroid/text/style/TextAppearanceSpan;

    .line 38
    invoke-direct {p0, p1}, Lcom/bv/wifisync/ProgressbarEx;->setTextSize(Landroid/content/Context;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 19
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/ProgressbarEx;->textPaint:Landroid/graphics/Paint;

    .line 15
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/ProgressbarEx;->bounds:Landroid/graphics/Rect;

    .line 20
    new-instance v0, Landroid/text/style/TextAppearanceSpan;

    const v1, 0x1030046

    invoke-direct {v0, p1, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/bv/wifisync/ProgressbarEx;->span:Landroid/text/style/TextAppearanceSpan;

    .line 21
    invoke-direct {p0, p1}, Lcom/bv/wifisync/ProgressbarEx;->setTextSize(Landroid/content/Context;)V

    .line 22
    return-void
.end method

.method private setTextSize(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    .line 26
    iget-object v2, p0, Lcom/bv/wifisync/ProgressbarEx;->span:Landroid/text/style/TextAppearanceSpan;

    invoke-virtual {v2}, Landroid/text/style/TextAppearanceSpan;->getTextSize()I

    move-result v1

    .line 27
    .local v1, textSize:I
    iget-object v2, p0, Lcom/bv/wifisync/ProgressbarEx;->textPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 28
    iget-object v2, p0, Lcom/bv/wifisync/ProgressbarEx;->textPaint:Landroid/graphics/Paint;

    int-to-float v3, v1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 29
    iget-object v2, p0, Lcom/bv/wifisync/ProgressbarEx;->textPaint:Landroid/graphics/Paint;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 31
    const-string v0, "abcABC$&"

    .line 32
    .local v0, s:Ljava/lang/String;
    iget-object v2, p0, Lcom/bv/wifisync/ProgressbarEx;->textPaint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    iget-object v5, p0, Lcom/bv/wifisync/ProgressbarEx;->bounds:Landroid/graphics/Rect;

    invoke-virtual {v2, v0, v3, v4, v5}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 33
    return-void
.end method


# virtual methods
.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .parameter "canvas"

    .prologue
    .line 55
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->onDraw(Landroid/graphics/Canvas;)V

    .line 56
    invoke-virtual {p0}, Lcom/bv/wifisync/ProgressbarEx;->getLeftPaddingOffset()I

    move-result v3

    add-int/lit8 v1, v3, 0x5

    .line 57
    .local v1, x:I
    invoke-virtual {p0}, Lcom/bv/wifisync/ProgressbarEx;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    iget-object v4, p0, Lcom/bv/wifisync/ProgressbarEx;->bounds:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v4

    sub-float/2addr v3, v4

    float-to-int v2, v3

    .line 58
    .local v2, y:I
    iget-object v3, p0, Lcom/bv/wifisync/ProgressbarEx;->text:Ljava/lang/String;

    if-nez v3, :cond_0

    const-string v0, ""

    .line 59
    .local v0, s:Ljava/lang/String;
    :goto_0
    int-to-float v3, v1

    int-to-float v4, v2

    iget-object v5, p0, Lcom/bv/wifisync/ProgressbarEx;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    monitor-exit p0

    return-void

    .line 58
    .end local v0           #s:Ljava/lang/String;
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/bv/wifisync/ProgressbarEx;->text:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 55
    .end local v1           #x:I
    .end local v2           #y:I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized setProgress(ILjava/lang/String;)V
    .locals 1
    .parameter "progress"
    .parameter "text"

    .prologue
    .line 48
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/ProgressbarEx;->setProgress(I)V

    .line 49
    iput-object p2, p0, Lcom/bv/wifisync/ProgressbarEx;->text:Ljava/lang/String;

    .line 50
    invoke-virtual {p0}, Lcom/bv/wifisync/ProgressbarEx;->postInvalidate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    monitor-exit p0

    return-void

    .line 48
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
