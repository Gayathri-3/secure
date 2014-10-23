.class Lcom/bv/wifisync/DirBrowser$5;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnOkClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser;->gotoDir()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;

.field private final synthetic val$edit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$5;->this$0:Lcom/bv/wifisync/DirBrowser;

    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$5;->val$edit:Landroid/widget/EditText;

    .line 702
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/DirBrowser$5;)Lcom/bv/wifisync/DirBrowser;
    .locals 1
    .parameter

    .prologue
    .line 702
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$5;->this$0:Lcom/bv/wifisync/DirBrowser;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;)Z
    .locals 5
    .parameter "dialogInterface"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 705
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$5;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 706
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$5;->val$edit:Landroid/widget/EditText;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->trimText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v0

    .line 707
    .local v0, path:Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 708
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 709
    :cond_0
    new-instance v1, Lcom/bv/wifisync/DirBrowser$5$1;

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$5;->this$0:Lcom/bv/wifisync/DirBrowser;

    const-string v3, "Goto"

    invoke-direct {v1, p0, v2, v3, p1}, Lcom/bv/wifisync/DirBrowser$5$1;-><init>(Lcom/bv/wifisync/DirBrowser$5;Landroid/app/Activity;Ljava/lang/String;Landroid/content/DialogInterface;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    .line 725
    aput-object v0, v2, v4

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/DirBrowser$5$1;->run([Ljava/lang/Object;)V

    .line 726
    return v4
.end method
