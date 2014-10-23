.class Lcom/bv/wifisync/Dialogs$8;
.super Ljava/lang/Object;
.source "Dialogs.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Dialogs;->internalShowInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/widget/EditText;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnOkClickListener;Z)Landroid/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$editText:Landroid/widget/EditText;

.field private final synthetic val$okButton:Landroid/widget/Button;

.field private final synthetic val$required:Z


# direct methods
.method constructor <init>(ZLandroid/widget/Button;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-boolean p1, p0, Lcom/bv/wifisync/Dialogs$8;->val$required:Z

    iput-object p2, p0, Lcom/bv/wifisync/Dialogs$8;->val$okButton:Landroid/widget/Button;

    iput-object p3, p0, Lcom/bv/wifisync/Dialogs$8;->val$editText:Landroid/widget/EditText;

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .parameter "edit"

    .prologue
    .line 217
    iget-boolean v0, p0, Lcom/bv/wifisync/Dialogs$8;->val$required:Z

    if-eqz v0, :cond_0

    .line 218
    iget-object v1, p0, Lcom/bv/wifisync/Dialogs$8;->val$okButton:Landroid/widget/Button;

    iget-object v0, p0, Lcom/bv/wifisync/Dialogs$8;->val$editText:Landroid/widget/EditText;

    invoke-static {v0}, Lcom/bv/wifisync/Utils;->trimText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 219
    :cond_0
    return-void

    .line 218
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"
    .parameter "arg2"
    .parameter "arg3"

    .prologue
    .line 213
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"
    .parameter "arg2"
    .parameter "arg3"

    .prologue
    .line 210
    return-void
.end method
