.class Lcom/bv/wifisync/AddHost$UserRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "AddHost.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddHost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UserRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddHost;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddHost;)V
    .locals 1
    .parameter

    .prologue
    .line 234
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$UserRow;->this$0:Lcom/bv/wifisync/AddHost;

    .line 235
    const v0, 0x7f0600f5

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 236
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddHost$UserRow;)Lcom/bv/wifisync/AddHost;
    .locals 1
    .parameter

    .prologue
    .line 233
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$UserRow;->this$0:Lcom/bv/wifisync/AddHost;

    return-object v0
.end method


# virtual methods
.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 263
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$UserRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddHost;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020031

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$UserRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .parameter "arg0"

    .prologue
    .line 245
    new-instance v1, Landroid/widget/EditText;

    new-instance v2, Landroid/view/ContextThemeWrapper;

    iget-object v3, p0, Lcom/bv/wifisync/AddHost$UserRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v4, 0x7f080002

    invoke-direct {v2, v3, v4}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 246
    .local v1, editText:Landroid/widget/EditText;
    const/high16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 247
    iget-object v2, p0, Lcom/bv/wifisync/AddHost$UserRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v2}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 248
    const v2, 0x7f0600f5

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(I)V

    .line 249
    iget-object v2, p0, Lcom/bv/wifisync/AddHost$UserRow;->this$0:Lcom/bv/wifisync/AddHost;

    iget-object v3, p0, Lcom/bv/wifisync/AddHost$UserRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v4, 0x7f060121

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/bv/wifisync/AddHost$UserRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v5, 0x7f0600e5

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 250
    new-instance v5, Lcom/bv/wifisync/AddHost$UserRow$1;

    invoke-direct {v5, p0, v1}, Lcom/bv/wifisync/AddHost$UserRow$1;-><init>(Lcom/bv/wifisync/AddHost$UserRow;Landroid/widget/EditText;)V

    .line 249
    invoke-static {v2, v3, v4, v1, v5}, Lcom/bv/wifisync/Dialogs;->showInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Lcom/bv/wifisync/Dialogs$OnOkClickListener;)Landroid/app/AlertDialog;

    move-result-object v0

    .line 258
    .local v0, dialog:Landroid/app/AlertDialog;
    const v2, 0x7f020031

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setIcon(I)V

    .line 259
    return-void
.end method
