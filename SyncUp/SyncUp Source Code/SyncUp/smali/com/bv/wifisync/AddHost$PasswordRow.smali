.class Lcom/bv/wifisync/AddHost$PasswordRow;
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
    name = "PasswordRow"
.end annotation


# instance fields
.field private errorShown:Z

.field final synthetic this$0:Lcom/bv/wifisync/AddHost;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddHost;)V
    .locals 1
    .parameter

    .prologue
    .line 270
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    .line 271
    const v0, 0x7f0600f6

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 272
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddHost$PasswordRow;Landroid/widget/EditText;Z)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 287
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/AddHost$PasswordRow;->onCheck(Landroid/widget/EditText;Z)V

    return-void
.end method

.method static synthetic access$1(Lcom/bv/wifisync/AddHost$PasswordRow;)Lcom/bv/wifisync/AddHost;
    .locals 1
    .parameter

    .prologue
    .line 267
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    return-object v0
.end method

.method private onCheck(Landroid/widget/EditText;Z)V
    .locals 1
    .parameter "edit"
    .parameter "isChecked"

    .prologue
    .line 288
    if-eqz p2, :cond_0

    const/high16 v0, 0x8

    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 289
    if-eqz p2, :cond_1

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 290
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddHost$PasswordRow;->setSelection(Landroid/widget/EditText;)V

    .line 291
    return-void

    .line 288
    :cond_0
    const/16 v0, 0x81

    goto :goto_0

    .line 289
    :cond_1
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v0

    goto :goto_1
.end method

.method private setSelection(Landroid/widget/EditText;)V
    .locals 2
    .parameter "edit"

    .prologue
    .line 330
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 331
    .local v0, text:Landroid/text/Editable;
    if-eqz v0, :cond_0

    .line 332
    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 333
    :cond_0
    return-void
.end method


# virtual methods
.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 337
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddHost;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02001e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 3

    .prologue
    .line 277
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v1}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Host;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v2, 0x7f060115

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 284
    :goto_0
    return-object v1

    .line 277
    :cond_0
    const-string v1, "*******"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 278
    :catch_0
    move-exception v0

    .line 279
    .local v0, e:Ljava/lang/Exception;
    iget-boolean v1, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->errorShown:Z

    if-nez v1, :cond_1

    .line 280
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 281
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->errorShown:Z

    .line 284
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 9
    .parameter "arg0"

    .prologue
    .line 295
    new-instance v6, Landroid/view/ContextThemeWrapper;

    iget-object v7, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v8, 0x7f080002

    invoke-direct {v6, v7, v8}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 296
    .local v6, wrapper:Landroid/view/ContextThemeWrapper;
    const-string v7, "layout_inflater"

    invoke-virtual {v6, v7}, Landroid/view/ContextThemeWrapper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/LayoutInflater;

    .line 297
    .local v4, inflater:Landroid/view/LayoutInflater;
    const v7, 0x7f030005

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 298
    .local v5, view:Landroid/view/View;
    const v7, 0x7f0a000d

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 299
    .local v3, edit:Landroid/widget/EditText;
    const v7, 0x7f0a000e

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 300
    .local v0, checkShowPassword:Landroid/widget/CheckBox;
    new-instance v7, Lcom/bv/wifisync/AddHost$PasswordRow$1;

    invoke-direct {v7, p0, v3}, Lcom/bv/wifisync/AddHost$PasswordRow$1;-><init>(Lcom/bv/wifisync/AddHost$PasswordRow;Landroid/widget/EditText;)V

    invoke-virtual {v0, v7}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 308
    const v7, 0x7f0600f6

    :try_start_0
    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setHint(I)V

    .line 309
    iget-object v7, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->newHost:Z
    invoke-static {v7}, Lcom/bv/wifisync/AddHost;->access$3(Lcom/bv/wifisync/AddHost;)Z

    move-result v7

    invoke-virtual {v0, v7}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 310
    iget-object v7, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v7}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v7

    iget-object v8, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-virtual {v7, v8}, Lcom/bv/wifisync/Host;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 311
    invoke-direct {p0, v3}, Lcom/bv/wifisync/AddHost$PasswordRow;->setSelection(Landroid/widget/EditText;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 315
    :goto_0
    iget-object v7, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    new-instance v8, Lcom/bv/wifisync/AddHost$PasswordRow$2;

    invoke-direct {v8, p0, v3}, Lcom/bv/wifisync/AddHost$PasswordRow$2;-><init>(Lcom/bv/wifisync/AddHost$PasswordRow;Landroid/widget/EditText;)V

    invoke-static {v7, v3, v5, v8}, Lcom/bv/wifisync/Dialogs;->showPasswordDialog(Landroid/content/Context;Landroid/widget/EditText;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnOkClickListener;)Landroid/app/AlertDialog;

    move-result-object v1

    .line 325
    .local v1, dialog:Landroid/app/AlertDialog;
    const v7, 0x7f02001e

    invoke-virtual {v1, v7}, Landroid/app/AlertDialog;->setIcon(I)V

    .line 326
    const/4 v7, 0x0

    invoke-direct {p0, v3, v7}, Lcom/bv/wifisync/AddHost$PasswordRow;->onCheck(Landroid/widget/EditText;Z)V

    .line 327
    return-void

    .line 312
    .end local v1           #dialog:Landroid/app/AlertDialog;
    :catch_0
    move-exception v2

    .line 313
    .local v2, e:Ljava/lang/Exception;
    iget-object v7, p0, Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-static {v7, v2}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
