.class Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;
.super Lcom/bv/wifisync/EnumBrowser$Enumeration;
.source "EnumBrowser.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/EnumBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OverlayedEnumeration"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2982df63aa10421bL


# instance fields
.field private final images:[[I

.field private selectedIndex:I

.field private final title:I

.field private final values:[Ljava/lang/String;


# direct methods
.method constructor <init>(II[Ljava/lang/String;[[II)V
    .locals 0
    .parameter "title"
    .parameter "hint"
    .parameter "values"
    .parameter "imagesIds"
    .parameter "selectedIndex"

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/bv/wifisync/EnumBrowser$Enumeration;-><init>()V

    .line 83
    iput p1, p0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->title:I

    .line 84
    iput-object p3, p0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->values:[Ljava/lang/String;

    .line 85
    iput-object p4, p0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->images:[[I

    .line 86
    iput p2, p0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->hint:I

    .line 87
    iput p5, p0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->selectedIndex:I

    .line 88
    return-void
.end method

.method private overlayImage(Landroid/content/Context;[I)Landroid/graphics/drawable/Drawable;
    .locals 5
    .parameter "context"
    .parameter "ids"

    .prologue
    .line 102
    const/4 v2, 0x0

    .local v2, len:I
    :goto_0
    array-length v3, p2

    if-ge v2, v3, :cond_0

    aget v3, p2, v2

    if-nez v3, :cond_1

    .line 103
    :cond_0
    if-nez v2, :cond_2

    .line 104
    const/4 v3, 0x0

    .line 108
    :goto_1
    return-object v3

    .line 102
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 105
    :cond_2
    new-array v0, v2, [Landroid/graphics/drawable/Drawable;

    .line 106
    .local v0, dr:[Landroid/graphics/drawable/Drawable;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    array-length v3, v0

    if-lt v1, v3, :cond_3

    .line 108
    new-instance v3, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v3, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 107
    :cond_3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    aget v4, p2, v1

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    aput-object v3, v0, v1

    .line 106
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method


# virtual methods
.method public getChecked(Landroid/content/Context;I)Z
    .locals 1
    .parameter "context"
    .parameter "index"

    .prologue
    .line 118
    iget v0, p0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->selectedIndex:I

    if-ne p2, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 2
    .parameter "context"
    .parameter "index"

    .prologue
    .line 95
    iget-object v0, p0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->images:[[I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->images:[[I

    aget-object v0, v0, p2

    const/4 v1, 0x0

    aget v0, v0, v1

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->images:[[I

    aget-object v0, v0, p2

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->overlayImage(Landroid/content/Context;[I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 97
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .parameter "context"

    .prologue
    .line 113
    iget v0, p0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->title:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/bv/wifisync/EnumBrowser$OverlayedEnumeration;->values:[Ljava/lang/String;

    return-object v0
.end method
