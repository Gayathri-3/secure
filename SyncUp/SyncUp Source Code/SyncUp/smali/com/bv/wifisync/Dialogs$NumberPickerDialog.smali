.class Lcom/bv/wifisync/Dialogs$NumberPickerDialog;
.super Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;
.source "Dialogs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Dialogs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NumberPickerDialog"
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0
    .parameter "context"
    .parameter "title"
    .parameter "message"
    .parameter "value"
    .parameter "maxValue"

    .prologue
    .line 316
    invoke-direct/range {p0 .. p5}, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;II)V

    .line 317
    return-void
.end method


# virtual methods
.method protected addPicker(Landroid/content/Context;I)Landroid/view/View;
    .locals 4
    .parameter "context"
    .parameter "maxValue"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v3, -0x2

    .line 322
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-ge v1, v2, :cond_0

    .line 323
    invoke-super {p0, p1, p2}, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->addPicker(Landroid/content/Context;I)Landroid/view/View;

    move-result-object v0

    .line 339
    :goto_0
    return-object v0

    .line 325
    :cond_0
    new-instance v0, Landroid/widget/NumberPicker;

    invoke-direct {v0, p1}, Landroid/widget/NumberPicker;-><init>(Landroid/content/Context;)V

    .line 326
    .local v0, picker:Landroid/widget/NumberPicker;
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/NumberPicker;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 327
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/NumberPicker;->setGravity(I)V

    .line 328
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 329
    invoke-virtual {v0, p2}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 330
    new-instance v1, Lcom/bv/wifisync/Dialogs$NumberPickerDialog$1;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/Dialogs$NumberPickerDialog$1;-><init>(Lcom/bv/wifisync/Dialogs$NumberPickerDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/NumberPicker;->setOnValueChangedListener(Landroid/widget/NumberPicker$OnValueChangeListener;)V

    .line 338
    iget v1, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialog;->value:I

    invoke-virtual {v0, v1}, Landroid/widget/NumberPicker;->setValue(I)V

    goto :goto_0
.end method
