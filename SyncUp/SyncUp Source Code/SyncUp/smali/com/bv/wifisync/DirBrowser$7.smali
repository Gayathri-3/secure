.class Lcom/bv/wifisync/DirBrowser$7;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnOkClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser;->createNewFolder()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;

.field private final synthetic val$inputName:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$7;->this$0:Lcom/bv/wifisync/DirBrowser;

    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$7;->val$inputName:Landroid/widget/EditText;

    .line 804
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/DirBrowser$7;)Lcom/bv/wifisync/DirBrowser;
    .locals 1
    .parameter

    .prologue
    .line 804
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$7;->this$0:Lcom/bv/wifisync/DirBrowser;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;)Z
    .locals 5
    .parameter "dialog"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 807
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$7;->val$inputName:Landroid/widget/EditText;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->trimText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v0

    .line 808
    .local v0, name:Ljava/lang/String;
    new-instance v1, Lcom/bv/wifisync/DirBrowser$7$1;

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$7;->this$0:Lcom/bv/wifisync/DirBrowser;

    const-string v3, "Mkdir"

    invoke-direct {v1, p0, v2, v3}, Lcom/bv/wifisync/DirBrowser$7$1;-><init>(Lcom/bv/wifisync/DirBrowser$7;Landroid/app/Activity;Ljava/lang/String;)V

    new-array v2, v4, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 821
    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/DirBrowser$7$1;->run([Ljava/lang/Object;)V

    .line 822
    return v4
.end method
