.class Lcom/bv/wifisync/EnumBrowser$2;
.super Ljava/lang/Object;
.source "EnumBrowser.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/EnumBrowser;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/EnumBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/EnumBrowser;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/EnumBrowser$2;->this$0:Lcom/bv/wifisync/EnumBrowser;

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "arg3"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 156
    .local p1, arg0:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 157
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "RESULT"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 158
    iget-object v1, p0, Lcom/bv/wifisync/EnumBrowser$2;->this$0:Lcom/bv/wifisync/EnumBrowser;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Lcom/bv/wifisync/EnumBrowser;->setResult(ILandroid/content/Intent;)V

    .line 159
    iget-object v1, p0, Lcom/bv/wifisync/EnumBrowser$2;->this$0:Lcom/bv/wifisync/EnumBrowser;

    invoke-virtual {v1}, Lcom/bv/wifisync/EnumBrowser;->finish()V

    .line 160
    return-void
.end method
