.class Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$2;
.super Ljava/lang/Object;
.source "Dialogs.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->addPicker(Landroid/content/Context;I)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$2;->this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;

    .line 288
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2
    .parameter "seekBar"
    .parameter "progress"
    .parameter "fromUser"

    .prologue
    .line 296
    iget-object v0, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$2;->this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;

    div-int/lit8 v1, p2, 0x64

    iput v1, v0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->value:I

    .line 297
    iget-object v0, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$2;->this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;

    iget-object v1, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$2;->this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;

    iget v1, v1, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->value:I

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->onValueChanged(I)V

    .line 298
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .parameter "seekBar"

    .prologue
    .line 292
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .parameter "seekBar"

    .prologue
    .line 290
    return-void
.end method
