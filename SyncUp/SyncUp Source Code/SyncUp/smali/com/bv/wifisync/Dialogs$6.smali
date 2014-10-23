.class Lcom/bv/wifisync/Dialogs$6;
.super Ljava/lang/Object;
.source "Dialogs.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Dialogs;->internalShowInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/widget/EditText;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnOkClickListener;Z)Landroid/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$result:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Landroid/app/AlertDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Dialogs$6;->val$result:Landroid/app/AlertDialog;

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .parameter "v"
    .parameter "hasFocus"

    .prologue
    .line 182
    if-eqz p2, :cond_0

    .line 183
    iget-object v0, p0, Lcom/bv/wifisync/Dialogs$6;->val$result:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 184
    :cond_0
    return-void
.end method
