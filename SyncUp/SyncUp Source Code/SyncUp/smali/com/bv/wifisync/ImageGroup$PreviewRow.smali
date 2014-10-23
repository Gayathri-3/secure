.class Lcom/bv/wifisync/ImageGroup$PreviewRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "ImageGroup.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/ImageGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PreviewRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/ImageGroup;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/ImageGroup;)V
    .locals 1
    .parameter

    .prologue
    .line 198
    iput-object p1, p0, Lcom/bv/wifisync/ImageGroup$PreviewRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    .line 199
    const v0, 0x7f060179

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;I)V

    .line 200
    return-void
.end method


# virtual methods
.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 204
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$PreviewRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    invoke-virtual {v0}, Lcom/bv/wifisync/ImageGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020025

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 218
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$PreviewRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v1, 0x7f06017a

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/ImageGroup;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    const/4 v3, 0x0

    .line 209
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$PreviewRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/ImagePlugin;->isRunnable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 210
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$PreviewRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #setter for: Lcom/bv/wifisync/ImageGroup;->canceled:Z
    invoke-static {v0, v3}, Lcom/bv/wifisync/ImageGroup;->access$8(Lcom/bv/wifisync/ImageGroup;Z)V

    .line 211
    new-instance v0, Lcom/bv/wifisync/ImageGroup$PreviewTask;

    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup$PreviewRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    invoke-direct {v0, v1}, Lcom/bv/wifisync/ImageGroup$PreviewTask;-><init>(Lcom/bv/wifisync/ImageGroup;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Void;

    const/4 v2, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/ImageGroup$PreviewTask;->run([Ljava/lang/Object;)V

    .line 212
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$PreviewRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup$PreviewRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v2, 0x7f06017b

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/ImageGroup;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 214
    :cond_0
    return-void
.end method
