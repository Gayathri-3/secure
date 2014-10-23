.class Lcom/bv/wifisync/BrowseActivity$5;
.super Ljava/lang/Object;
.source "BrowseActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/BrowseActivity;->setupHelpWindow()V
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
    iput-object p1, p0, Lcom/bv/wifisync/BrowseActivity$5;->this$0:Lcom/bv/wifisync/BrowseActivity;

    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 166
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity$5;->this$0:Lcom/bv/wifisync/BrowseActivity;

    iget-object v2, p0, Lcom/bv/wifisync/BrowseActivity$5;->this$0:Lcom/bv/wifisync/BrowseActivity;

    iget-object v2, v2, Lcom/bv/wifisync/BrowseActivity;->helpTextView:Lcom/bv/wifisync/TextViewEx;

    #calls: Lcom/bv/wifisync/BrowseActivity;->spanClicked(Landroid/widget/TextView;)V
    invoke-static {v1, v2}, Lcom/bv/wifisync/BrowseActivity;->access$4(Lcom/bv/wifisync/BrowseActivity;Landroid/widget/TextView;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    :goto_0
    return-void

    .line 167
    :catch_0
    move-exception v0

    .line 168
    .local v0, e:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity$5;->this$0:Lcom/bv/wifisync/BrowseActivity;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
