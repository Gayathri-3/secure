.class abstract Lcom/bv/wifisync/EnumBrowser$Enumeration;
.super Ljava/lang/Object;
.source "EnumBrowser.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/EnumBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Enumeration"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4bd2609f8f764e8bL


# instance fields
.field protected hint:I


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getChecked(Landroid/content/Context;I)Z
    .locals 1
    .parameter "context"
    .parameter "index"

    .prologue
    .line 40
    const/4 v0, 0x0

    return v0
.end method

.method getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 1
    .parameter "context"
    .parameter "index"

    .prologue
    .line 32
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .parameter "context"

    .prologue
    .line 36
    const/4 v0, 0x0

    return-object v0
.end method

.method abstract getValues()[Ljava/lang/String;
.end method
