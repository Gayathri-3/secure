.class abstract Lcom/bv/wifisync/AddFilter$DateRow;
.super Lcom/bv/wifisync/AddFilter$FilterRow;
.source "AddFilter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "DateRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;)V
    .locals 1
    .parameter

    .prologue
    .line 382
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$DateRow;->this$0:Lcom/bv/wifisync/AddFilter;

    .line 383
    const v0, 0x7f0601be

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/AddFilter$FilterRow;-><init>(Lcom/bv/wifisync/AddFilter;I)V

    .line 384
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddFilter$DateRow;I)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 398
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddFilter$DateRow;->getMessage(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/bv/wifisync/AddFilter$DateRow;)Lcom/bv/wifisync/AddFilter;
    .locals 1
    .parameter

    .prologue
    .line 378
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$DateRow;->this$0:Lcom/bv/wifisync/AddFilter;

    return-object v0
.end method

.method private getMessage(I)Ljava/lang/String;
    .locals 5
    .parameter "value"

    .prologue
    .line 399
    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$DateRow;->this$0:Lcom/bv/wifisync/AddFilter;

    const v1, 0x7f060115

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddFilter;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$DateRow;->this$0:Lcom/bv/wifisync/AddFilter;

    const v1, 0x7f0601bf

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/bv/wifisync/AddFilter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 395
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$DateRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddFilter;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020034

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getModified()I
.end method

.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 388
    invoke-virtual {p0}, Lcom/bv/wifisync/AddFilter$DateRow;->getModified()I

    move-result v0

    if-nez v0, :cond_0

    .line 389
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$DateRow;->this$0:Lcom/bv/wifisync/AddFilter;

    const v1, 0x7f060115

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddFilter;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 390
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/bv/wifisync/AddFilter$DateRow;->getModified()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/bv/wifisync/AddFilter$DateRow;->getMessage(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .parameter "v"

    .prologue
    .line 404
    new-instance v0, Lcom/bv/wifisync/AddFilter$DateRow$1;

    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$DateRow;->this$0:Lcom/bv/wifisync/AddFilter;

    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$DateRow;->this$0:Lcom/bv/wifisync/AddFilter;

    const v3, 0x7f0601be

    invoke-virtual {v1, v3}, Lcom/bv/wifisync/AddFilter;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 405
    invoke-virtual {p0}, Lcom/bv/wifisync/AddFilter$DateRow;->getModified()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/bv/wifisync/AddFilter$DateRow;->getMessage(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/bv/wifisync/AddFilter$DateRow;->getModified()I

    move-result v5

    const/16 v6, 0x16d

    move-object v1, p0

    .line 404
    invoke-direct/range {v0 .. v6}, Lcom/bv/wifisync/AddFilter$DateRow$1;-><init>(Lcom/bv/wifisync/AddFilter$DateRow;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;II)V

    .line 416
    invoke-virtual {v0}, Lcom/bv/wifisync/AddFilter$DateRow$1;->show()V

    .line 417
    return-void
.end method

.method protected abstract setModified(I)V
.end method
