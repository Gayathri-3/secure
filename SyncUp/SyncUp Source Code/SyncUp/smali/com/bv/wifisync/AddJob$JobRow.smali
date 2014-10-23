.class abstract Lcom/bv/wifisync/AddJob$JobRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "AddJob.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "JobRow"
.end annotation


# instance fields
.field private final imageId:I

.field final synthetic this$0:Lcom/bv/wifisync/AddJob;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddJob;Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter "name"
    .parameter "imageId"

    .prologue
    .line 49
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$JobRow;->this$0:Lcom/bv/wifisync/AddJob;

    .line 50
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 51
    iput p3, p0, Lcom/bv/wifisync/AddJob$JobRow;->imageId:I

    .line 52
    return-void
.end method


# virtual methods
.method cancel()V
    .locals 0

    .prologue
    .line 63
    return-void
.end method

.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 56
    iget v0, p0, Lcom/bv/wifisync/AddJob$JobRow;->imageId:I

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$JobRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddJob;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/bv/wifisync/AddJob$JobRow;->imageId:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 58
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method abstract update(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
