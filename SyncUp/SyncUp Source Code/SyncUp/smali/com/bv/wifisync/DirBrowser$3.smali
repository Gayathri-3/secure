.class Lcom/bv/wifisync/DirBrowser$3;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnOkClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser;->renameSelectedItem(Lcom/bv/wifisync/DirBrowser$FileInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;

.field private final synthetic val$inputName:Landroid/widget/EditText;

.field private final synthetic val$selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser;Landroid/widget/EditText;Lcom/bv/wifisync/DirBrowser$FileInfo;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$3;->this$0:Lcom/bv/wifisync/DirBrowser;

    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$3;->val$inputName:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/bv/wifisync/DirBrowser$3;->val$selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;

    .line 360
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/DirBrowser$3;)Lcom/bv/wifisync/DirBrowser;
    .locals 1
    .parameter

    .prologue
    .line 360
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$3;->this$0:Lcom/bv/wifisync/DirBrowser;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;)Z
    .locals 6
    .parameter "dialog"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 363
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$3;->val$inputName:Landroid/widget/EditText;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->trimText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v0

    .line 364
    .local v0, name:Ljava/lang/String;
    new-instance v1, Lcom/bv/wifisync/DirBrowser$3$1;

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$3;->this$0:Lcom/bv/wifisync/DirBrowser;

    const-string v3, "Rename"

    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$3;->val$selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;

    invoke-direct {v1, p0, v2, v3, v4}, Lcom/bv/wifisync/DirBrowser$3$1;-><init>(Lcom/bv/wifisync/DirBrowser$3;Landroid/app/Activity;Ljava/lang/String;Lcom/bv/wifisync/DirBrowser$FileInfo;)V

    new-array v2, v5, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 381
    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/DirBrowser$3$1;->run([Ljava/lang/Object;)V

    .line 382
    return v5
.end method
