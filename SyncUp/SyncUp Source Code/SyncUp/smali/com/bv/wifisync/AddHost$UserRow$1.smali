.class Lcom/bv/wifisync/AddHost$UserRow$1;
.super Ljava/lang/Object;
.source "AddHost.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnOkClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddHost$UserRow;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddHost$UserRow;

.field private final synthetic val$editText:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddHost$UserRow;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$UserRow$1;->this$1:Lcom/bv/wifisync/AddHost$UserRow;

    iput-object p2, p0, Lcom/bv/wifisync/AddHost$UserRow$1;->val$editText:Landroid/widget/EditText;

    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;)Z
    .locals 2
    .parameter "dialog"

    .prologue
    .line 253
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$UserRow$1;->this$1:Lcom/bv/wifisync/AddHost$UserRow;

    #getter for: Lcom/bv/wifisync/AddHost$UserRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost$UserRow;->access$0(Lcom/bv/wifisync/AddHost$UserRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/AddHost$UserRow$1;->val$editText:Landroid/widget/EditText;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->trimText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    .line 254
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$UserRow$1;->this$1:Lcom/bv/wifisync/AddHost$UserRow;

    #getter for: Lcom/bv/wifisync/AddHost$UserRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost$UserRow;->access$0(Lcom/bv/wifisync/AddHost$UserRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v0

    #calls: Lcom/bv/wifisync/AddHost;->enableButtons()V
    invoke-static {v0}, Lcom/bv/wifisync/AddHost;->access$8(Lcom/bv/wifisync/AddHost;)V

    .line 255
    const/4 v0, 0x1

    return v0
.end method
