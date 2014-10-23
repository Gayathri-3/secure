.class Lcom/bv/wifisync/HostBrowser$2;
.super Ljava/lang/Object;
.source "HostBrowser.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnOkClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/HostBrowser;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/HostBrowser;

.field private final synthetic val$edit:Landroid/widget/AutoCompleteTextView;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HostBrowser;Landroid/widget/AutoCompleteTextView;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/HostBrowser$2;->this$0:Lcom/bv/wifisync/HostBrowser;

    iput-object p2, p0, Lcom/bv/wifisync/HostBrowser$2;->val$edit:Landroid/widget/AutoCompleteTextView;

    .line 349
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
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

    .line 352
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$2;->this$0:Lcom/bv/wifisync/HostBrowser;

    invoke-static {v0}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 353
    new-instance v0, Lcom/bv/wifisync/HostBrowser$IpFinder;

    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser$2;->this$0:Lcom/bv/wifisync/HostBrowser;

    invoke-direct {v0, v1}, Lcom/bv/wifisync/HostBrowser$IpFinder;-><init>(Lcom/bv/wifisync/HostBrowser;)V

    new-array v1, v4, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/bv/wifisync/HostBrowser$2;->val$edit:Landroid/widget/AutoCompleteTextView;

    invoke-static {v3}, Lcom/bv/wifisync/Utils;->trimText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/HostBrowser$IpFinder;->run([Ljava/lang/Object;)V

    .line 354
    iget-object v0, p0, Lcom/bv/wifisync/HostBrowser$2;->this$0:Lcom/bv/wifisync/HostBrowser;

    iget-object v1, p0, Lcom/bv/wifisync/HostBrowser$2;->this$0:Lcom/bv/wifisync/HostBrowser;

    const v2, 0x7f060138

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/HostBrowser;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 355
    return v4
.end method
