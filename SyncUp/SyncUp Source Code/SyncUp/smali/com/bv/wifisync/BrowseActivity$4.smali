.class Lcom/bv/wifisync/BrowseActivity$4;
.super Ljava/lang/Object;
.source "BrowseActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


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
    iput-object p1, p0, Lcom/bv/wifisync/BrowseActivity$4;->this$0:Lcom/bv/wifisync/BrowseActivity;

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "v"
    .parameter "event"

    .prologue
    .line 154
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 155
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity$4;->this$0:Lcom/bv/wifisync/BrowseActivity;

    #getter for: Lcom/bv/wifisync/BrowseActivity;->mLastTouch:Landroid/graphics/Rect;
    invoke-static {v0}, Lcom/bv/wifisync/BrowseActivity;->access$3(Lcom/bv/wifisync/BrowseActivity;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 156
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity$4;->this$0:Lcom/bv/wifisync/BrowseActivity;

    #getter for: Lcom/bv/wifisync/BrowseActivity;->mLastTouch:Landroid/graphics/Rect;
    invoke-static {v0}, Lcom/bv/wifisync/BrowseActivity;->access$3(Lcom/bv/wifisync/BrowseActivity;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 158
    :cond_0
    const/4 v0, 0x0

    return v0
.end method
