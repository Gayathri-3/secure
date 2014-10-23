.class Lcom/bv/wifisync/AddExtensions$AddDialog$1;
.super Ljava/lang/Object;
.source "AddExtensions.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnOkClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddExtensions$AddDialog;-><init>(Lcom/bv/wifisync/AddExtensions;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddExtensions$AddDialog;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddExtensions$AddDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddExtensions$AddDialog$1;->this$1:Lcom/bv/wifisync/AddExtensions$AddDialog;

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;)Z
    .locals 2
    .parameter "dialog"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$AddDialog$1;->this$1:Lcom/bv/wifisync/AddExtensions$AddDialog;

    #getter for: Lcom/bv/wifisync/AddExtensions$AddDialog;->this$0:Lcom/bv/wifisync/AddExtensions;
    invoke-static {v1}, Lcom/bv/wifisync/AddExtensions$AddDialog;->access$0(Lcom/bv/wifisync/AddExtensions$AddDialog;)Lcom/bv/wifisync/AddExtensions;

    move-result-object v1

    #getter for: Lcom/bv/wifisync/AddExtensions;->addExtensionBiller:Lcom/bv/wifisync/DonateBiller;
    invoke-static {v1}, Lcom/bv/wifisync/AddExtensions;->access$3(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/DonateBiller;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/DonateBiller;->isPurchased()Z

    move-result v0

    .line 131
    .local v0, result:Z
    if-eqz v0, :cond_0

    .line 132
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$AddDialog$1;->this$1:Lcom/bv/wifisync/AddExtensions$AddDialog;

    invoke-virtual {v1}, Lcom/bv/wifisync/AddExtensions$AddDialog;->close()V

    .line 135
    :goto_0
    return v0

    .line 134
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$AddDialog$1;->this$1:Lcom/bv/wifisync/AddExtensions$AddDialog;

    #getter for: Lcom/bv/wifisync/AddExtensions$AddDialog;->this$0:Lcom/bv/wifisync/AddExtensions;
    invoke-static {v1}, Lcom/bv/wifisync/AddExtensions$AddDialog;->access$0(Lcom/bv/wifisync/AddExtensions$AddDialog;)Lcom/bv/wifisync/AddExtensions;

    move-result-object v1

    #getter for: Lcom/bv/wifisync/AddExtensions;->addExtensionBiller:Lcom/bv/wifisync/DonateBiller;
    invoke-static {v1}, Lcom/bv/wifisync/AddExtensions;->access$3(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/DonateBiller;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/DonateBiller;->purchase()V

    goto :goto_0
.end method
