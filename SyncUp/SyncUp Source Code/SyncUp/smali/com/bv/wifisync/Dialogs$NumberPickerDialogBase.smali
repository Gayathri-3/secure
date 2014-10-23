.class Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;
.super Ljava/lang/Object;
.source "Dialogs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Dialogs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NumberPickerDialogBase"
.end annotation


# instance fields
.field private final dialog:Landroid/app/AlertDialog;

.field protected value:I


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 5
    .parameter "context"
    .parameter "title"
    .parameter "message"
    .parameter "value"
    .parameter "maxValue"

    .prologue
    const/4 v2, -0x2

    .line 262
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 263
    iput p4, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->value:I

    .line 264
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 265
    .local v0, layout:Landroid/widget/LinearLayout;
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 266
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 267
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 268
    invoke-virtual {v1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 269
    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 270
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 271
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 272
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 267
    iput-object v1, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->dialog:Landroid/app/AlertDialog;

    .line 274
    invoke-virtual {p0, p1, p5}, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->addPicker(Landroid/content/Context;I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 275
    iget-object v1, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v1, p3}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 276
    iget-object v1, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->dialog:Landroid/app/AlertDialog;

    const/4 v2, -0x1

    iget-object v3, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x104000a

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$1;

    invoke-direct {v4, p0}, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$1;-><init>(Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;)V

    invoke-virtual {v1, v2, v3, v4}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 282
    return-void
.end method


# virtual methods
.method protected addPicker(Landroid/content/Context;I)Landroid/view/View;
    .locals 4
    .parameter "context"
    .parameter "maxValue"

    .prologue
    .line 285
    new-instance v0, Landroid/widget/SeekBar;

    invoke-direct {v0, p1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 286
    .local v0, picker:Landroid/widget/SeekBar;
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 287
    mul-int/lit8 v1, p2, 0x64

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 288
    new-instance v1, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$2;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$2;-><init>(Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;)V

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 301
    iget v1, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->value:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 302
    return-object v0
.end method

.method protected onButtonOK(I)V
    .locals 0
    .parameter "value"

    .prologue
    .line 260
    return-void
.end method

.method protected onValueChanged(I)V
    .locals 0
    .parameter "value"

    .prologue
    .line 259
    return-void
.end method

.method setMessage(Ljava/lang/String;)V
    .locals 1
    .parameter "message"

    .prologue
    .line 306
    iget-object v0, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 307
    return-void
.end method

.method show()V
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 311
    return-void
.end method
