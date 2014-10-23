.class Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$1;
.super Ljava/lang/Object;
.source "Dialogs.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;II)V
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
    iput-object p1, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$1;->this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;

    .line 276
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 279
    iget-object v0, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$1;->this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;

    iget-object v1, p0, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase$1;->this$1:Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;

    iget v1, v1, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->value:I

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;->onButtonOK(I)V

    .line 280
    return-void
.end method
