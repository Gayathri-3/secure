.class Lcom/bv/wifisync/BrowseActivity$3;
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
    iput-object p1, p0, Lcom/bv/wifisync/BrowseActivity$3;->this$0:Lcom/bv/wifisync/BrowseActivity;

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .parameter "v"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 138
    iget-object v4, p0, Lcom/bv/wifisync/BrowseActivity$3;->this$0:Lcom/bv/wifisync/BrowseActivity;

    const-string v5, "app"

    invoke-virtual {v4, v5, v2}, Lcom/bv/wifisync/BrowseActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 139
    .local v1, settings:Landroid/content/SharedPreferences;
    iget-object v4, p0, Lcom/bv/wifisync/BrowseActivity$3;->this$0:Lcom/bv/wifisync/BrowseActivity;

    iget-object v5, p0, Lcom/bv/wifisync/BrowseActivity$3;->this$0:Lcom/bv/wifisync/BrowseActivity;

    #getter for: Lcom/bv/wifisync/BrowseActivity;->helpVisible:Z
    invoke-static {v5}, Lcom/bv/wifisync/BrowseActivity;->access$0(Lcom/bv/wifisync/BrowseActivity;)Z

    move-result v5

    if-eqz v5, :cond_0

    :goto_0
    #setter for: Lcom/bv/wifisync/BrowseActivity;->helpVisible:Z
    invoke-static {v4, v2}, Lcom/bv/wifisync/BrowseActivity;->access$1(Lcom/bv/wifisync/BrowseActivity;Z)V

    .line 140
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 141
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v2, "hintMinimized"

    iget-object v4, p0, Lcom/bv/wifisync/BrowseActivity$3;->this$0:Lcom/bv/wifisync/BrowseActivity;

    #getter for: Lcom/bv/wifisync/BrowseActivity;->helpVisible:Z
    invoke-static {v4}, Lcom/bv/wifisync/BrowseActivity;->access$0(Lcom/bv/wifisync/BrowseActivity;)Z

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 142
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 143
    iget-object v2, p0, Lcom/bv/wifisync/BrowseActivity$3;->this$0:Lcom/bv/wifisync/BrowseActivity;

    iget-object v4, p0, Lcom/bv/wifisync/BrowseActivity$3;->this$0:Lcom/bv/wifisync/BrowseActivity;

    #getter for: Lcom/bv/wifisync/BrowseActivity;->helpVisible:Z
    invoke-static {v4}, Lcom/bv/wifisync/BrowseActivity;->access$0(Lcom/bv/wifisync/BrowseActivity;)Z

    move-result v4

    #calls: Lcom/bv/wifisync/BrowseActivity;->showHelp(ZZ)V
    invoke-static {v2, v4, v3}, Lcom/bv/wifisync/BrowseActivity;->access$2(Lcom/bv/wifisync/BrowseActivity;ZZ)V

    .line 144
    return-void

    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    :cond_0
    move v2, v3

    .line 139
    goto :goto_0
.end method
