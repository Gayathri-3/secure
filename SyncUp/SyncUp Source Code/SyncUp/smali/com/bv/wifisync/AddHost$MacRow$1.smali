.class Lcom/bv/wifisync/AddHost$MacRow$1;
.super Ljava/lang/Object;
.source "AddHost.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnOkClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddHost$MacRow;->showMacAddress()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddHost$MacRow;

.field private final synthetic val$editText:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddHost$MacRow;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$MacRow$1;->this$1:Lcom/bv/wifisync/AddHost$MacRow;

    iput-object p2, p0, Lcom/bv/wifisync/AddHost$MacRow$1;->val$editText:Landroid/widget/EditText;

    .line 373
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;)Z
    .locals 3
    .parameter "dialog"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 376
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$MacRow$1;->this$1:Lcom/bv/wifisync/AddHost$MacRow;

    #getter for: Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost$MacRow;->access$1(Lcom/bv/wifisync/AddHost$MacRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/AddHost$MacRow$1;->this$1:Lcom/bv/wifisync/AddHost$MacRow;

    iget-object v2, p0, Lcom/bv/wifisync/AddHost$MacRow$1;->val$editText:Landroid/widget/EditText;

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->trimText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/bv/wifisync/AddHost$MacRow;->toBytes(Ljava/lang/String;)[B
    invoke-static {v1, v2}, Lcom/bv/wifisync/AddHost$MacRow;->access$0(Lcom/bv/wifisync/AddHost$MacRow;Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Host;->setMac([B)V

    .line 377
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$MacRow$1;->this$1:Lcom/bv/wifisync/AddHost$MacRow;

    #getter for: Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost$MacRow;->access$1(Lcom/bv/wifisync/AddHost$MacRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v0

    #calls: Lcom/bv/wifisync/AddHost;->enableButtons()V
    invoke-static {v0}, Lcom/bv/wifisync/AddHost;->access$8(Lcom/bv/wifisync/AddHost;)V

    .line 378
    const/4 v0, 0x1

    return v0
.end method
