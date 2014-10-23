.class Lcom/bv/wifisync/HostBrowser$1;
.super Landroid/widget/AutoCompleteTextView;
.source "HostBrowser.java"


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


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HostBrowser;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/HostBrowser$1;->this$0:Lcom/bv/wifisync/HostBrowser;

    .line 334
    invoke-direct {p0, p2}, Landroid/widget/AutoCompleteTextView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public enoughToFilter()Z
    .locals 1

    .prologue
    .line 337
    const/4 v0, 0x1

    return v0
.end method
