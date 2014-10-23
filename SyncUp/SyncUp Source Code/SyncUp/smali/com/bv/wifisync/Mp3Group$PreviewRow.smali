.class Lcom/bv/wifisync/Mp3Group$PreviewRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "Mp3Group.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Mp3Group;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PreviewRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Mp3Group;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Mp3Group;)V
    .locals 1
    .parameter

    .prologue
    .line 153
    iput-object p1, p0, Lcom/bv/wifisync/Mp3Group$PreviewRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    .line 154
    const v0, 0x7f060179

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;I)V

    .line 155
    return-void
.end method


# virtual methods
.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$PreviewRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    invoke-virtual {v0}, Lcom/bv/wifisync/Mp3Group;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020025

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 173
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$PreviewRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    const v1, 0x7f06017a

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Mp3Group;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    const/4 v3, 0x0

    .line 164
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$PreviewRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    #getter for: Lcom/bv/wifisync/Mp3Group;->plugin:Lcom/bv/wifisync/Mp3Plugin;
    invoke-static {v0}, Lcom/bv/wifisync/Mp3Group;->access$4(Lcom/bv/wifisync/Mp3Group;)Lcom/bv/wifisync/Mp3Plugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Mp3Plugin;->isRunnable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$PreviewRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    #setter for: Lcom/bv/wifisync/Mp3Group;->canceled:Z
    invoke-static {v0, v3}, Lcom/bv/wifisync/Mp3Group;->access$8(Lcom/bv/wifisync/Mp3Group;Z)V

    .line 166
    new-instance v0, Lcom/bv/wifisync/Mp3Group$PreviewTask;

    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$PreviewRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    invoke-direct {v0, v1}, Lcom/bv/wifisync/Mp3Group$PreviewTask;-><init>(Lcom/bv/wifisync/Mp3Group;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Void;

    const/4 v2, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Mp3Group$PreviewTask;->run([Ljava/lang/Object;)V

    .line 167
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$PreviewRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    iget-object v1, p0, Lcom/bv/wifisync/Mp3Group$PreviewRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    const v2, 0x7f06017b

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Mp3Group;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 169
    :cond_0
    return-void
.end method
