.class Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;
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
    name = "SimpleEnumeration"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7ed8439295c806cbL


# instance fields
.field private final imageId:[I

.field private final title:I

.field private final values:[Ljava/lang/String;


# direct methods
.method constructor <init>(II[Ljava/lang/String;[I)V
    .locals 0
    .parameter "title"
    .parameter "hint"
    .parameter "values"
    .parameter "imageId"

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/bv/wifisync/EnumBrowser$Enumeration;-><init>()V

    .line 51
    iput p1, p0, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;->title:I

    .line 52
    iput p2, p0, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;->hint:I

    .line 53
    iput-object p3, p0, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;->values:[Ljava/lang/String;

    .line 54
    iput-object p4, p0, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;->imageId:[I

    .line 55
    return-void
.end method


# virtual methods
.method getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 2
    .parameter "context"
    .parameter "index"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;->imageId:[I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;->imageId:[I

    array-length v0, v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;->imageId:[I

    aget v0, v0, p2

    if-eqz v0, :cond_0

    .line 65
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;->imageId:[I

    aget v1, v1, p2

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 66
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
    .line 71
    iget v0, p0, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;->title:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;->values:[Ljava/lang/String;

    return-object v0
.end method
