.class abstract Lcom/bv/wifisync/BrowseActivity;
.super Landroid/app/ListActivity;
.source "BrowseActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;
    }
.end annotation


# static fields
.field private static final DONATE_LINK:Ljava/lang/String; = "DONATE"


# instance fields
.field protected buttonOk:Landroid/widget/Button;

.field private cache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/graphics/drawable/Drawable;",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;"
        }
    .end annotation
.end field

.field private data:Ljava/io/Serializable;

.field private donateBiller:Lcom/bv/wifisync/DonateBiller;

.field private help:I

.field private helpLayout:Landroid/view/View;

.field protected helpTextView:Lcom/bv/wifisync/TextViewEx;

.field private helpVisible:Z

.field private final mLastTouch:Landroid/graphics/Rect;

.field private progressBar:Lcom/bv/wifisync/ProgressbarEx;

.field private progressPanel:Landroid/view/View;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 50
    new-instance v0, Lcom/bv/wifisync/BrowseActivity$1;

    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->Donate:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-direct {v0, p0, p0, v1}, Lcom/bv/wifisync/BrowseActivity$1;-><init>(Lcom/bv/wifisync/BrowseActivity;Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    iput-object v0, p0, Lcom/bv/wifisync/BrowseActivity;->donateBiller:Lcom/bv/wifisync/DonateBiller;

    .line 181
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/BrowseActivity;->mLastTouch:Landroid/graphics/Rect;

    .line 415
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/BrowseActivity;->cache:Ljava/util/HashMap;

    .line 44
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/BrowseActivity;)Z
    .locals 1
    .parameter

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/bv/wifisync/BrowseActivity;->helpVisible:Z

    return v0
.end method

.method static synthetic access$1(Lcom/bv/wifisync/BrowseActivity;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/bv/wifisync/BrowseActivity;->helpVisible:Z

    return-void
.end method

.method static synthetic access$2(Lcom/bv/wifisync/BrowseActivity;ZZ)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 222
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/BrowseActivity;->showHelp(ZZ)V

    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/BrowseActivity;)Landroid/graphics/Rect;
    .locals 1
    .parameter

    .prologue
    .line 181
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity;->mLastTouch:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/BrowseActivity;Landroid/widget/TextView;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 183
    invoke-direct {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->spanClicked(Landroid/widget/TextView;)V

    return-void
.end method

.method static synthetic access$5(Lcom/bv/wifisync/BrowseActivity;Ljava/lang/String;Z)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 248
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/BrowseActivity;->showHelp(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$6(Lcom/bv/wifisync/BrowseActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 206
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;->showDonate()V

    return-void
.end method

.method private doSetSubtitle(Ljava/lang/String;)V
    .locals 1
    .parameter "subtitle"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 118
    return-void
.end method

.method private replaceSpan(Landroid/text/SpannableString;Landroid/text/style/URLSpan;)V
    .locals 5
    .parameter "html"
    .parameter "span"

    .prologue
    .line 263
    invoke-virtual {p1, p2}, Landroid/text/SpannableString;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    .line 264
    .local v3, start:I
    invoke-virtual {p1, p2}, Landroid/text/SpannableString;->getSpanEnd(Ljava/lang/Object;)I

    move-result v0

    .line 265
    .local v0, end:I
    invoke-virtual {p1, p2}, Landroid/text/SpannableString;->getSpanFlags(Ljava/lang/Object;)I

    move-result v1

    .line 266
    .local v1, flags:I
    invoke-virtual {p1, p2}, Landroid/text/SpannableString;->removeSpan(Ljava/lang/Object;)V

    .line 267
    new-instance v2, Lcom/bv/wifisync/BrowseActivity$7;

    invoke-virtual {p2}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, p0, v4}, Lcom/bv/wifisync/BrowseActivity$7;-><init>(Lcom/bv/wifisync/BrowseActivity;Ljava/lang/String;)V

    .line 273
    .end local p2
    .local v2, span:Landroid/text/style/URLSpan;
    invoke-virtual {p1, v2, v3, v0, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 274
    return-void
.end method

.method private setupHelpWindow()V
    .locals 7

    .prologue
    .line 132
    const v4, 0x7f0a0002

    invoke-virtual {p0, v4}, Lcom/bv/wifisync/BrowseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/bv/wifisync/BrowseActivity;->helpLayout:Landroid/view/View;

    .line 133
    const v4, 0x7f0a0009

    invoke-virtual {p0, v4}, Lcom/bv/wifisync/BrowseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 134
    .local v1, helpTitle:Landroid/widget/TextView;
    const-string v4, "?"

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    new-instance v4, Lcom/bv/wifisync/BrowseActivity$3;

    invoke-direct {v4, p0}, Lcom/bv/wifisync/BrowseActivity$3;-><init>(Lcom/bv/wifisync/BrowseActivity;)V

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    const v4, 0x7f0a0008

    invoke-virtual {p0, v4}, Lcom/bv/wifisync/BrowseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/bv/wifisync/TextViewEx;

    iput-object v4, p0, Lcom/bv/wifisync/BrowseActivity;->helpTextView:Lcom/bv/wifisync/TextViewEx;

    .line 148
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-ge v4, v5, :cond_0

    .line 149
    iget-object v4, p0, Lcom/bv/wifisync/BrowseActivity;->helpTextView:Lcom/bv/wifisync/TextViewEx;

    new-instance v5, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v6

    invoke-direct {v5, p0, v6}, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;-><init>(Lcom/bv/wifisync/BrowseActivity;Landroid/text/method/MovementMethod;)V

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/TextViewEx;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 173
    :goto_0
    iget-object v5, p0, Lcom/bv/wifisync/BrowseActivity;->helpLayout:Landroid/view/View;

    invoke-static {p0}, Lcom/bv/wifisync/Config;->getAssistantVisible(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    .line 174
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 175
    .local v0, dm:Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 176
    iget v3, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 177
    .local v3, screenHeight:I
    div-int/lit8 v2, v3, 0x3

    .line 178
    .local v2, maxHeight:I
    iget-object v4, p0, Lcom/bv/wifisync/BrowseActivity;->helpTextView:Lcom/bv/wifisync/TextViewEx;

    invoke-virtual {v4, v2}, Lcom/bv/wifisync/TextViewEx;->setMaxHeight(I)V

    .line 179
    return-void

    .line 151
    .end local v0           #dm:Landroid/util/DisplayMetrics;
    .end local v2           #maxHeight:I
    .end local v3           #screenHeight:I
    :cond_0
    iget-object v4, p0, Lcom/bv/wifisync/BrowseActivity;->helpTextView:Lcom/bv/wifisync/TextViewEx;

    new-instance v5, Lcom/bv/wifisync/BrowseActivity$4;

    invoke-direct {v5, p0}, Lcom/bv/wifisync/BrowseActivity$4;-><init>(Lcom/bv/wifisync/BrowseActivity;)V

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/TextViewEx;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 162
    iget-object v4, p0, Lcom/bv/wifisync/BrowseActivity;->helpTextView:Lcom/bv/wifisync/TextViewEx;

    new-instance v5, Lcom/bv/wifisync/BrowseActivity$5;

    invoke-direct {v5, p0}, Lcom/bv/wifisync/BrowseActivity$5;-><init>(Lcom/bv/wifisync/BrowseActivity;)V

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/TextViewEx;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 173
    :cond_1
    const/16 v4, 0x8

    goto :goto_1
.end method

.method private showAnimation(Ljava/lang/String;Z)V
    .locals 2
    .parameter "text"
    .parameter "visible"

    .prologue
    .line 232
    invoke-static {p0, p2}, Landroid/view/animation/AnimationUtils;->makeOutAnimation(Landroid/content/Context;Z)Landroid/view/animation/Animation;

    move-result-object v0

    .line 233
    .local v0, animation:Landroid/view/animation/Animation;
    new-instance v1, Lcom/bv/wifisync/BrowseActivity$6;

    invoke-direct {v1, p0, p1, p2}, Lcom/bv/wifisync/BrowseActivity$6;-><init>(Lcom/bv/wifisync/BrowseActivity;Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 245
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->helpLayout:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 246
    return-void
.end method

.method private showDonate()V
    .locals 1

    .prologue
    .line 208
    :try_start_0
    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->donate()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    :goto_0
    return-void

    .line 209
    :catch_0
    move-exception v0

    .line 210
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private showHelp(Ljava/lang/String;Z)V
    .locals 11
    .parameter "text"
    .parameter "visible"

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 249
    new-instance v1, Landroid/text/SpannableString;

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-direct {v1, v7}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 250
    .local v1, html:Landroid/text/SpannableString;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    const-class v8, Landroid/text/style/URLSpan;

    invoke-virtual {v1, v5, v7, v8}, Landroid/text/SpannableString;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Landroid/text/style/URLSpan;

    .line 251
    .local v3, spans:[Landroid/text/style/URLSpan;
    array-length v8, v3

    move v7, v5

    :goto_0
    if-lt v7, v8, :cond_0

    .line 254
    iget-object v7, p0, Lcom/bv/wifisync/BrowseActivity;->helpTextView:Lcom/bv/wifisync/TextViewEx;

    invoke-virtual {v7, v1}, Lcom/bv/wifisync/TextViewEx;->setText(Ljava/lang/CharSequence;)V

    .line 255
    const v7, 0x7f0a0009

    invoke-virtual {p0, v7}, Lcom/bv/wifisync/BrowseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 256
    .local v4, title:Landroid/widget/TextView;
    iget-object v7, p0, Lcom/bv/wifisync/BrowseActivity;->helpTextView:Lcom/bv/wifisync/TextViewEx;

    if-eqz p2, :cond_2

    :goto_1
    invoke-virtual {v7, v5}, Lcom/bv/wifisync/TextViewEx;->setVisibility(I)V

    .line 257
    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz p2, :cond_3

    const v5, 0x7f020011

    :goto_2
    invoke-virtual {v7, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 258
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v4, v6, v6, v0, v6}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 259
    if-eqz p2, :cond_4

    move-object v5, v6

    :goto_3
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 260
    return-void

    .line 251
    .end local v0           #drawable:Landroid/graphics/drawable/Drawable;
    .end local v4           #title:Landroid/widget/TextView;
    :cond_0
    aget-object v2, v3, v7

    .line 252
    .local v2, span:Landroid/text/style/URLSpan;
    const-string v9, "DONATE"

    invoke-virtual {v2}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 253
    invoke-direct {p0, v1, v2}, Lcom/bv/wifisync/BrowseActivity;->replaceSpan(Landroid/text/SpannableString;Landroid/text/style/URLSpan;)V

    .line 251
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 256
    .end local v2           #span:Landroid/text/style/URLSpan;
    .restart local v4       #title:Landroid/widget/TextView;
    :cond_2
    const/16 v5, 0x8

    goto :goto_1

    .line 257
    :cond_3
    const v5, 0x7f020010

    goto :goto_2

    .line 259
    .restart local v0       #drawable:Landroid/graphics/drawable/Drawable;
    :cond_4
    const-string v5, "?"

    goto :goto_3
.end method

.method private showHelp(ZZ)V
    .locals 4
    .parameter "visible"
    .parameter "animate"

    .prologue
    .line 223
    iget v2, p0, Lcom/bv/wifisync/BrowseActivity;->help:I

    if-eqz v2, :cond_0

    if-nez p1, :cond_1

    :cond_0
    const-string v0, ""

    .line 224
    .local v0, helpText:Ljava/lang/String;
    :goto_0
    if-eqz p1, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f0600d0

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/BrowseActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 225
    .local v1, text:Ljava/lang/String;
    :goto_1
    if-eqz p2, :cond_3

    .line 226
    invoke-direct {p0, v1, p1}, Lcom/bv/wifisync/BrowseActivity;->showAnimation(Ljava/lang/String;Z)V

    .line 229
    :goto_2
    return-void

    .line 223
    .end local v0           #helpText:Ljava/lang/String;
    .end local v1           #text:Ljava/lang/String;
    :cond_1
    iget v2, p0, Lcom/bv/wifisync/BrowseActivity;->help:I

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/BrowseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 224
    .restart local v0       #helpText:Ljava/lang/String;
    :cond_2
    const-string v1, ""

    goto :goto_1

    .line 228
    .restart local v1       #text:Ljava/lang/String;
    :cond_3
    invoke-direct {p0, v1, p1}, Lcom/bv/wifisync/BrowseActivity;->showHelp(Ljava/lang/String;Z)V

    goto :goto_2
.end method

.method private showHelp()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 277
    const-string v2, "app"

    invoke-virtual {p0, v2, v4}, Lcom/bv/wifisync/BrowseActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 278
    .local v1, settings:Landroid/content/SharedPreferences;
    const-string v2, "hintMinimized"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 279
    .local v0, result:Z
    invoke-direct {p0, v0, v4}, Lcom/bv/wifisync/BrowseActivity;->showHelp(ZZ)V

    .line 280
    return v0
.end method

.method private spanClicked(Landroid/widget/TextView;)V
    .locals 9
    .parameter "textView"

    .prologue
    .line 184
    iget-object v8, p0, Lcom/bv/wifisync/BrowseActivity;->mLastTouch:Landroid/graphics/Rect;

    iget v6, v8, Landroid/graphics/Rect;->right:I

    .line 185
    .local v6, x:I
    iget-object v8, p0, Lcom/bv/wifisync/BrowseActivity;->mLastTouch:Landroid/graphics/Rect;

    iget v7, v8, Landroid/graphics/Rect;->bottom:I

    .line 187
    .local v7, y:I
    invoke-virtual {p1}, Landroid/widget/TextView;->getTotalPaddingLeft()I

    move-result v8

    sub-int/2addr v6, v8

    .line 188
    invoke-virtual {p1}, Landroid/widget/TextView;->getTotalPaddingTop()I

    move-result v8

    sub-int/2addr v7, v8

    .line 189
    invoke-virtual {p1}, Landroid/widget/TextView;->getScrollX()I

    move-result v8

    add-int/2addr v6, v8

    .line 190
    invoke-virtual {p1}, Landroid/widget/TextView;->getScrollY()I

    move-result v8

    add-int/2addr v7, v8

    .line 192
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v1

    .line 193
    .local v1, layout:Landroid/text/Layout;
    invoke-virtual {v1, v7}, Landroid/text/Layout;->getLineForVertical(I)I

    move-result v2

    .line 194
    .local v2, line:I
    int-to-float v8, v6

    invoke-virtual {v1, v2, v8}, Landroid/text/Layout;->getOffsetForHorizontal(IF)I

    move-result v4

    .line 196
    .local v4, off:I
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    .line 197
    .local v5, text:Ljava/lang/CharSequence;
    instance-of v8, v5, Landroid/text/SpannableString;

    if-eqz v8, :cond_0

    move-object v0, v5

    .line 198
    check-cast v0, Landroid/text/SpannableString;

    .line 199
    .local v0, buffer:Landroid/text/SpannableString;
    const-class v8, Landroid/text/style/ClickableSpan;

    invoke-virtual {v0, v4, v4, v8}, Landroid/text/SpannableString;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Landroid/text/style/ClickableSpan;

    .line 201
    .local v3, link:[Landroid/text/style/ClickableSpan;
    array-length v8, v3

    if-eqz v8, :cond_0

    .line 202
    const/4 v8, 0x0

    aget-object v8, v3, v8

    invoke-virtual {v8, p1}, Landroid/text/style/ClickableSpan;->onClick(Landroid/view/View;)V

    .line 204
    .end local v0           #buffer:Landroid/text/SpannableString;
    .end local v3           #link:[Landroid/text/style/ClickableSpan;
    :cond_0
    return-void
.end method


# virtual methods
.method protected dispatchEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "event"
    .parameter "name"

    .prologue
    .line 304
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 305
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getLocalClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, p2, v2}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 306
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->dispatch()Z

    .line 308
    :cond_0
    return-void
.end method

.method protected dispatchEvent(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 3
    .parameter "event"
    .parameter "name"
    .parameter "count"

    .prologue
    .line 311
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 312
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getLocalClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 313
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->dispatch()Z

    .line 315
    :cond_0
    return-void
.end method

.method protected donate()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 396
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity;->donateBiller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->isPurchased()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 397
    const v0, 0x7f060197

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/BrowseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 400
    :goto_0
    return-void

    .line 399
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity;->donateBiller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->charge()V

    goto :goto_0
.end method

.method protected getData()Ljava/io/Serializable;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity;->data:Ljava/io/Serializable;

    return-object v0
.end method

.method protected abstract onButtonClick(Landroid/view/View;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .parameter "arg0"

    .prologue
    const/4 v5, 0x1

    .line 319
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 320
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getLocalClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/wifisync/BrowseActivity;->buttonOk:Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Click"

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 322
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onButtonClick(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 328
    :goto_0
    return-void

    .line 323
    :catch_0
    move-exception v0

    .line 324
    .local v0, e:Ljava/lang/Throwable;
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 325
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getLocalClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/wifisync/BrowseActivity;->buttonOk:Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Fail"

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 326
    :cond_1
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x0

    .line 67
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 68
    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/BrowseActivity;->requestWindowFeature(I)Z

    .line 69
    const/high16 v1, 0x7f03

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/BrowseActivity;->setContentView(I)V

    .line 70
    invoke-virtual {p0, v3}, Lcom/bv/wifisync/BrowseActivity;->setProgressBarIndeterminateVisibility(Z)V

    .line 71
    invoke-virtual {p0, v3}, Lcom/bv/wifisync/BrowseActivity;->setProgressBarVisibility(Z)V

    .line 72
    const-string v1, "app"

    invoke-virtual {p0, v1, v3}, Lcom/bv/wifisync/BrowseActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 73
    .local v0, settings:Landroid/content/SharedPreferences;
    const-string v1, "hintMinimized"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/bv/wifisync/BrowseActivity;->helpVisible:Z

    .line 74
    const v1, 0x7f0a0003

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/BrowseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->buttonOk:Landroid/widget/Button;

    .line 75
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->buttonOk:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->buttonOk:Landroid/widget/Button;

    const v2, 0x104000a

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(I)V

    .line 77
    const/high16 v1, 0x7f0a

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/BrowseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->progressPanel:Landroid/view/View;

    .line 78
    const v1, 0x7f0a0010

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/BrowseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/bv/wifisync/BrowseActivity$2;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/BrowseActivity$2;-><init>(Lcom/bv/wifisync/BrowseActivity;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    const v1, 0x7f0a000f

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/BrowseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/ProgressbarEx;

    iput-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->progressBar:Lcom/bv/wifisync/ProgressbarEx;

    .line 89
    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 90
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;->setupHelpWindow()V

    .line 91
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/os/Bundle;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 92
    :cond_0
    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "RESULT"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    iput-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->data:Ljava/io/Serializable;

    .line 96
    :goto_0
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 97
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getLocalClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackPageView(Ljava/lang/String;)V

    .line 98
    :cond_1
    return-void

    .line 94
    :cond_2
    const-string v1, "RESULT"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    iput-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->data:Ljava/io/Serializable;

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 292
    invoke-super {p0}, Landroid/app/ListActivity;->onDestroy()V

    .line 293
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 294
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->dispatch()Z

    .line 295
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity;->donateBiller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->close()V

    .line 296
    return-void
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 3
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 216
    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getListAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    .line 218
    .local v0, adapter:Landroid/widget/ListAdapter;
    if-eqz v0, :cond_0

    invoke-interface {v0, p3}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    .local v1, selectedItem:Ljava/lang/Object;
    if-eqz v1, :cond_0

    instance-of v2, v1, Landroid/view/View$OnClickListener;

    if-eqz v2, :cond_0

    .line 219
    check-cast v1, Landroid/view/View$OnClickListener;

    .end local v1           #selectedItem:Ljava/lang/Object;
    invoke-interface {v1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 220
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 104
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 105
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 106
    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->onBackPressed()V

    .line 107
    :cond_0
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method protected onProgressCancelClick(Landroid/view/View;)V
    .locals 3
    .parameter "view"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity;->progressBar:Lcom/bv/wifisync/ProgressbarEx;

    const/4 v1, 0x0

    const v2, 0x7f06010e

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/BrowseActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/bv/wifisync/ProgressbarEx;->setProgress(ILjava/lang/String;)V

    .line 63
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 126
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 127
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity;->data:Ljava/io/Serializable;

    if-eqz v0, :cond_0

    .line 128
    const-string v0, "RESULT"

    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->data:Ljava/io/Serializable;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 129
    :cond_0
    return-void
.end method

.method protected scaleListImage(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 12
    .parameter "drawable"

    .prologue
    const/4 v1, 0x0

    .line 418
    const/4 v7, 0x0

    .line 419
    .local v7, result:Landroid/graphics/drawable/BitmapDrawable;
    if-eqz p1, :cond_0

    iget-object v2, p0, Lcom/bv/wifisync/BrowseActivity;->cache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .end local v7           #result:Landroid/graphics/drawable/BitmapDrawable;
    check-cast v7, Landroid/graphics/drawable/BitmapDrawable;

    .restart local v7       #result:Landroid/graphics/drawable/BitmapDrawable;
    if-nez v7, :cond_0

    .line 420
    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v6, 0x7f020012

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    .local v10, template:Landroid/graphics/drawable/Drawable;
    move-object v2, p1

    .line 421
    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 422
    .local v0, bitmap:Landroid/graphics/Bitmap;
    check-cast v10, Landroid/graphics/drawable/BitmapDrawable;

    .end local v10           #template:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v10}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v11

    .line 423
    .local v11, templateBitmap:Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 424
    .local v3, width:I
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 425
    .local v4, height:I
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 426
    .local v5, matrix:Landroid/graphics/Matrix;
    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    int-to-float v6, v3

    div-float v8, v2, v6

    .line 427
    .local v8, scale:F
    invoke-virtual {v5, v8, v8}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 428
    const/4 v6, 0x1

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 429
    .local v9, scaledBitmap:Landroid/graphics/Bitmap;
    new-instance v7, Landroid/graphics/drawable/BitmapDrawable;

    .end local v7           #result:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v7, v1, v9}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 430
    .restart local v7       #result:Landroid/graphics/drawable/BitmapDrawable;
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->cache:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    .end local v3           #width:I
    .end local v4           #height:I
    .end local v5           #matrix:Landroid/graphics/Matrix;
    .end local v8           #scale:F
    .end local v9           #scaledBitmap:Landroid/graphics/Bitmap;
    .end local v11           #templateBitmap:Landroid/graphics/Bitmap;
    :cond_0
    return-object v7
.end method

.method protected setHelp(I)V
    .locals 1
    .parameter "hint"

    .prologue
    .line 284
    iget v0, p0, Lcom/bv/wifisync/BrowseActivity;->help:I

    if-eq v0, p1, :cond_0

    .line 285
    iput p1, p0, Lcom/bv/wifisync/BrowseActivity;->help:I

    .line 286
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;->showHelp()Z

    .line 288
    :cond_0
    return-void
.end method

.method public setProgress(ILjava/lang/String;)V
    .locals 1
    .parameter "progress"
    .parameter "text"

    .prologue
    .line 412
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity;->progressBar:Lcom/bv/wifisync/ProgressbarEx;

    invoke-virtual {v0, p1, p2}, Lcom/bv/wifisync/ProgressbarEx;->setProgress(ILjava/lang/String;)V

    .line 413
    return-void
.end method

.method setProgressVisible(Z)V
    .locals 4
    .parameter "visible"

    .prologue
    const/4 v2, 0x0

    .line 403
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->progressPanel:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1

    const/4 v0, 0x1

    .line 404
    .local v0, progressVisible:Z
    :goto_0
    if-eq v0, p1, :cond_0

    .line 405
    iget-object v3, p0, Lcom/bv/wifisync/BrowseActivity;->progressPanel:Landroid/view/View;

    if-eqz p1, :cond_2

    move v1, v2

    :goto_1
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 406
    if-nez p1, :cond_0

    .line 407
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity;->progressBar:Lcom/bv/wifisync/ProgressbarEx;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/bv/wifisync/ProgressbarEx;->setProgress(ILjava/lang/String;)V

    .line 409
    :cond_0
    return-void

    .end local v0           #progressVisible:Z
    :cond_1
    move v0, v2

    .line 403
    goto :goto_0

    .line 405
    .restart local v0       #progressVisible:Z
    :cond_2
    const/16 v1, 0x8

    goto :goto_1
.end method

.method protected setSubtitle(Ljava/lang/String;)V
    .locals 2
    .parameter "subtitle"

    .prologue
    .line 111
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 112
    invoke-direct {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->doSetSubtitle(Ljava/lang/String;)V

    .line 113
    :cond_0
    return-void
.end method

.method protected trackEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "event"
    .parameter "name"

    .prologue
    .line 299
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 300
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/bv/wifisync/BrowseActivity;->getLocalClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, p2, v2}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 301
    :cond_0
    return-void
.end method
