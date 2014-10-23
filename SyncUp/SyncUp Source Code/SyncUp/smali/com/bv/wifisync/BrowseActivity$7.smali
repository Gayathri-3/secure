.class Lcom/bv/wifisync/BrowseActivity$7;
.super Landroid/text/style/URLSpan;
.source "BrowseActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/BrowseActivity;->replaceSpan(Landroid/text/SpannableString;Landroid/text/style/URLSpan;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/BrowseActivity;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/BrowseActivity;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/BrowseActivity$7;->this$0:Lcom/bv/wifisync/BrowseActivity;

    .line 267
    invoke-direct {p0, p2}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "widget"

    .prologue
    .line 270
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity$7;->this$0:Lcom/bv/wifisync/BrowseActivity;

    #calls: Lcom/bv/wifisync/BrowseActivity;->showDonate()V
    invoke-static {v0}, Lcom/bv/wifisync/BrowseActivity;->access$6(Lcom/bv/wifisync/BrowseActivity;)V

    .line 271
    return-void
.end method
