.class Lcom/bv/wifisync/BrowseActivity$6;
.super Ljava/lang/Object;
.source "BrowseActivity.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/BrowseActivity;->showAnimation(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/BrowseActivity;

.field private final synthetic val$text:Ljava/lang/String;

.field private final synthetic val$visible:Z


# direct methods
.method constructor <init>(Lcom/bv/wifisync/BrowseActivity;Ljava/lang/String;Z)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/BrowseActivity$6;->this$0:Lcom/bv/wifisync/BrowseActivity;

    iput-object p2, p0, Lcom/bv/wifisync/BrowseActivity$6;->val$text:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/bv/wifisync/BrowseActivity$6;->val$visible:Z

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 242
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity$6;->this$0:Lcom/bv/wifisync/BrowseActivity;

    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity$6;->val$text:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/bv/wifisync/BrowseActivity$6;->val$visible:Z

    #calls: Lcom/bv/wifisync/BrowseActivity;->showHelp(Ljava/lang/String;Z)V
    invoke-static {v0, v1, v2}, Lcom/bv/wifisync/BrowseActivity;->access$5(Lcom/bv/wifisync/BrowseActivity;Ljava/lang/String;Z)V

    .line 243
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .parameter "animation"

    .prologue
    .line 238
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .parameter "animation"

    .prologue
    .line 235
    return-void
.end method
