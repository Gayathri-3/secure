.class Lcom/bv/wifisync/Dialogs$7;
.super Ljava/lang/Object;
.source "Dialogs.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Dialogs;->internalShowInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/widget/EditText;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnOkClickListener;Z)Landroid/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$onClick:Lcom/bv/wifisync/Dialogs$OnOkClickListener;

.field private final synthetic val$result:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Dialogs$OnOkClickListener;Landroid/app/AlertDialog;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Dialogs$7;->val$onClick:Lcom/bv/wifisync/Dialogs$OnOkClickListener;

    iput-object p2, p0, Lcom/bv/wifisync/Dialogs$7;->val$result:Landroid/app/AlertDialog;

    iput-object p3, p0, Lcom/bv/wifisync/Dialogs$7;->val$context:Landroid/content/Context;

    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "view"

    .prologue
    .line 197
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/Dialogs$7;->val$onClick:Lcom/bv/wifisync/Dialogs$OnOkClickListener;

    iget-object v2, p0, Lcom/bv/wifisync/Dialogs$7;->val$result:Landroid/app/AlertDialog;

    invoke-interface {v1, v2}, Lcom/bv/wifisync/Dialogs$OnOkClickListener;->onClick(Landroid/content/DialogInterface;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 198
    iget-object v1, p0, Lcom/bv/wifisync/Dialogs$7;->val$result:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    :cond_0
    :goto_0
    return-void

    .line 199
    :catch_0
    move-exception v0

    .line 200
    .local v0, e:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/bv/wifisync/Dialogs$7;->val$context:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
