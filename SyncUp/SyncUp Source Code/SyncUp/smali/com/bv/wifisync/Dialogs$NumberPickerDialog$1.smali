.class Lcom/bv/wifisync/Dialogs$NumberPickerDialog$1;
.super Ljava/lang/Object;
.source "Dialogs.java"

# interfaces
.implements Landroid/widget/NumberPicker$OnValueChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Dialogs$NumberPickerDialog;->addPicker(Landroid/content/Context;I)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialog;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Dialogs$NumberPickerDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialog$1;->this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialog;

    .line 330
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueChange(Landroid/widget/NumberPicker;II)V
    .locals 1
    .parameter "picker"
    .parameter "oldVal"
    .parameter "newVal"

    .prologue
    .line 333
    iget-object v0, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialog$1;->this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialog;

    iput p3, v0, Lcom/bv/wifisync/Dialogs$NumberPickerDialog;->value:I

    .line 334
    iget-object v0, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialog$1;->this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialog;

    invoke-virtual {v0, p3}, Lcom/bv/wifisync/Dialogs$NumberPickerDialog;->onValueChanged(I)V

    .line 335
    return-void
.end method
