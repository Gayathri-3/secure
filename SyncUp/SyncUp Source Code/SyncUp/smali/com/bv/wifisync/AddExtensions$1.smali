.class Lcom/bv/wifisync/AddExtensions$1;
.super Lcom/bv/wifisync/DonateBiller;
.source "AddExtensions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddExtensions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddExtensions;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddExtensions;Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddExtensions$1;->this$0:Lcom/bv/wifisync/AddExtensions;

    .line 49
    invoke-direct {p0, p2, p3}, Lcom/bv/wifisync/DonateBiller;-><init>(Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    return-void
.end method


# virtual methods
.method onPurchase()V
    .locals 2

    .prologue
    .line 53
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$1;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->addDialog:Lcom/bv/wifisync/AddExtensions$AddDialog;
    invoke-static {v1}, Lcom/bv/wifisync/AddExtensions;->access$2(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$AddDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 54
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$1;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->addDialog:Lcom/bv/wifisync/AddExtensions$AddDialog;
    invoke-static {v1}, Lcom/bv/wifisync/AddExtensions;->access$2(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$AddDialog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/AddExtensions$AddDialog;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :cond_0
    :goto_0
    return-void

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, e:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$1;->this$0:Lcom/bv/wifisync/AddExtensions;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
