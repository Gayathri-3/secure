.class Lcom/bv/wifisync/FilesView$1;
.super Lcom/bv/wifisync/PropertiesAdapter;
.source "FilesView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/FilesView;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/PropertiesAdapter",
        "<",
        "Lcom/bv/wifisync/FilesView$ItemRow;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/FilesView;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/FilesView;Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter

    .prologue
    .line 1
    .local p3, $anonymous1:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/FilesView$ItemRow;>;"
    iput-object p1, p0, Lcom/bv/wifisync/FilesView$1;->this$0:Lcom/bv/wifisync/FilesView;

    .line 62
    invoke-direct {p0, p2, p3}, Lcom/bv/wifisync/PropertiesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 64
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/PropertiesAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 65
    .local v1, result:Landroid/view/View;
    const v2, 0x7f0a0004

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 66
    .local v0, imageView:Landroid/widget/ImageView;
    invoke-virtual {v0}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v2

    const/4 v3, 0x2

    invoke-virtual {v0}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result v4

    invoke-virtual {v0}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 67
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 68
    iget-object v2, p0, Lcom/bv/wifisync/FilesView$1;->this$0:Lcom/bv/wifisync/FilesView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/FilesView;->scaleListImage(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 69
    return-object v1
.end method

.method public isEnabled(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 74
    const/4 v0, 0x0

    return v0
.end method
