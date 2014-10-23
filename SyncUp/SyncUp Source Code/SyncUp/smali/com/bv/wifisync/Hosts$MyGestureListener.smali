.class Lcom/bv/wifisync/Hosts$MyGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "Hosts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Hosts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyGestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Hosts;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/Hosts;)V
    .locals 0
    .parameter

    .prologue
    .line 396
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$MyGestureListener;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/Hosts$MyGestureListener;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 396
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Hosts$MyGestureListener;-><init>(Lcom/bv/wifisync/Hosts;)V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "e"

    .prologue
    .line 399
    const/4 v0, 0x0

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 8
    .parameter "e1"
    .parameter "e2"
    .parameter "velocityX"
    .parameter "velocityY"

    .prologue
    const/4 v4, 0x0

    const/high16 v7, 0x4348

    const/high16 v6, 0x42f0

    .line 404
    const/16 v1, 0x78

    .line 405
    .local v1, SWIPE_MIN_DISTANCE:I
    const/16 v0, 0xfa

    .line 406
    .local v0, SWIPE_MAX_OFF_PATH:I
    const/16 v2, 0xc8

    .line 409
    .local v2, SWIPE_THRESHOLD_VELOCITY:I
    :try_start_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    sub-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v5, 0x437a

    cmpg-float v3, v3, v5

    if-gtz v3, :cond_2

    .line 410
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    sub-float/2addr v3, v5

    cmpl-float v3, v3, v6

    if-lez v3, :cond_0

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v3, v3, v7

    if-gtz v3, :cond_1

    .line 411
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    sub-float/2addr v3, v5

    cmpl-float v3, v3, v6

    if-lez v3, :cond_2

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v3, v3, v7

    if-lez v3, :cond_2

    .line 412
    :cond_1
    iget-object v5, p0, Lcom/bv/wifisync/Hosts$MyGestureListener;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v3, p0, Lcom/bv/wifisync/Hosts$MyGestureListener;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->syncButtonMode:Z
    invoke-static {v3}, Lcom/bv/wifisync/Hosts;->access$19(Lcom/bv/wifisync/Hosts;)Z

    move-result v3

    if-eqz v3, :cond_3

    move v3, v4

    :goto_0
    #setter for: Lcom/bv/wifisync/Hosts;->syncButtonMode:Z
    invoke-static {v5, v3}, Lcom/bv/wifisync/Hosts;->access$20(Lcom/bv/wifisync/Hosts;Z)V

    .line 413
    iget-object v3, p0, Lcom/bv/wifisync/Hosts$MyGestureListener;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v5, p0, Lcom/bv/wifisync/Hosts$MyGestureListener;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->syncButtonMode:Z
    invoke-static {v5}, Lcom/bv/wifisync/Hosts;->access$19(Lcom/bv/wifisync/Hosts;)Z

    move-result v5

    invoke-static {v3, v5}, Lcom/bv/wifisync/Config;->setSyncButtonMode(Landroid/content/Context;Z)V

    .line 414
    iget-object v3, p0, Lcom/bv/wifisync/Hosts$MyGestureListener;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v5, v3, Lcom/bv/wifisync/Hosts;->buttonOk:Landroid/widget/Button;

    iget-object v3, p0, Lcom/bv/wifisync/Hosts$MyGestureListener;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->syncButtonMode:Z
    invoke-static {v3}, Lcom/bv/wifisync/Hosts;->access$19(Lcom/bv/wifisync/Hosts;)Z

    move-result v3

    if-eqz v3, :cond_4

    const v3, 0x7f0601b0

    :goto_1
    invoke-virtual {v5, v3}, Landroid/widget/Button;->setText(I)V

    .line 415
    iget-object v3, p0, Lcom/bv/wifisync/Hosts$MyGestureListener;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v3, v3, Lcom/bv/wifisync/Hosts;->buttonOk:Landroid/widget/Button;

    iget-object v5, p0, Lcom/bv/wifisync/Hosts$MyGestureListener;->this$0:Lcom/bv/wifisync/Hosts;

    const v6, 0x10a0002

    invoke-static {v5, v6}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/Button;->startAnimation(Landroid/view/animation/Animation;)V

    .line 416
    const/4 v3, 0x3

    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->setAction(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 420
    :cond_2
    :goto_2
    return v4

    .line 412
    :cond_3
    const/4 v3, 0x1

    goto :goto_0

    .line 414
    :cond_4
    const v3, 0x7f0600f8

    goto :goto_1

    .line 418
    :catch_0
    move-exception v3

    goto :goto_2
.end method
