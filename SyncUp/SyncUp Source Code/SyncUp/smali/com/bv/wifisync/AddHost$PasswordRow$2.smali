.class Lcom/bv/wifisync/AddHost$PasswordRow$2;
.super Ljava/lang/Object;
.source "AddHost.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnOkClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddHost$PasswordRow;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddHost$PasswordRow;

.field private final synthetic val$edit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddHost$PasswordRow;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$PasswordRow$2;->this$1:Lcom/bv/wifisync/AddHost$PasswordRow;

    iput-object p2, p0, Lcom/bv/wifisync/AddHost$PasswordRow$2;->val$edit:Landroid/widget/EditText;

    .line 315
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;)Z
    .locals 3
    .parameter "dialog"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 318
    iget-object v2, p0, Lcom/bv/wifisync/AddHost$PasswordRow$2;->val$edit:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    .line 319
    .local v1, text:Ljava/lang/CharSequence;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 320
    .local v0, password:Ljava/lang/String;
    :goto_0
    iget-object v2, p0, Lcom/bv/wifisync/AddHost$PasswordRow$2;->this$1:Lcom/bv/wifisync/AddHost$PasswordRow;

    #getter for: Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v2}, Lcom/bv/wifisync/AddHost$PasswordRow;->access$1(Lcom/bv/wifisync/AddHost$PasswordRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v2

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v2}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/Host;->setPassword(Ljava/lang/String;)V

    .line 321
    iget-object v2, p0, Lcom/bv/wifisync/AddHost$PasswordRow$2;->this$1:Lcom/bv/wifisync/AddHost$PasswordRow;

    #getter for: Lcom/bv/wifisync/AddHost$PasswordRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v2}, Lcom/bv/wifisync/AddHost$PasswordRow;->access$1(Lcom/bv/wifisync/AddHost$PasswordRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v2

    #calls: Lcom/bv/wifisync/AddHost;->enableButtons()V
    invoke-static {v2}, Lcom/bv/wifisync/AddHost;->access$8(Lcom/bv/wifisync/AddHost;)V

    .line 322
    const/4 v2, 0x1

    return v2

    .line 319
    .end local v0           #password:Ljava/lang/String;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
