.class Lcom/bv/wifisync/Dialogs$1;
.super Ljava/lang/Object;
.source "Dialogs.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Dialogs;->showConfirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnConfirmListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$listener:Lcom/bv/wifisync/Dialogs$OnConfirmListener;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Dialogs$OnConfirmListener;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Dialogs$1;->val$listener:Lcom/bv/wifisync/Dialogs$OnConfirmListener;

    iput-object p2, p0, Lcom/bv/wifisync/Dialogs$1;->val$context:Landroid/content/Context;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 71
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/Dialogs$1;->val$listener:Lcom/bv/wifisync/Dialogs$OnConfirmListener;

    invoke-interface {v1}, Lcom/bv/wifisync/Dialogs$OnConfirmListener;->onConfirm()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    :goto_0
    return-void

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/bv/wifisync/Dialogs$1;->val$context:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
