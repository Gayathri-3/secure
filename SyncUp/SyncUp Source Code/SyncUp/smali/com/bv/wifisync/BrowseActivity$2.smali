.class Lcom/bv/wifisync/BrowseActivity$2;
.super Ljava/lang/Object;
.source "BrowseActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/BrowseActivity;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/BrowseActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/BrowseActivity$2;->this$0:Lcom/bv/wifisync/BrowseActivity;

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 82
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity$2;->this$0:Lcom/bv/wifisync/BrowseActivity;

    invoke-virtual {v1, p1}, Lcom/bv/wifisync/BrowseActivity;->onProgressCancelClick(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    :goto_0
    return-void

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity$2;->this$0:Lcom/bv/wifisync/BrowseActivity;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
