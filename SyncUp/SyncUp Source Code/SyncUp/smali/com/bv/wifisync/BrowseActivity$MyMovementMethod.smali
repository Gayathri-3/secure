.class Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;
.super Ljava/lang/Object;
.source "BrowseActivity.java"

# interfaces
.implements Landroid/text/method/MovementMethod;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/BrowseActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyMovementMethod"
.end annotation


# instance fields
.field private method:Landroid/text/method/MovementMethod;

.field final synthetic this$0:Lcom/bv/wifisync/BrowseActivity;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/BrowseActivity;Landroid/text/method/MovementMethod;)V
    .locals 0
    .parameter
    .parameter "instance"

    .prologue
    .line 333
    iput-object p1, p0, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;->this$0:Lcom/bv/wifisync/BrowseActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 334
    iput-object p2, p0, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;->method:Landroid/text/method/MovementMethod;

    .line 335
    return-void
.end method


# virtual methods
.method public canSelectArbitrarily()Z
    .locals 2

    .prologue
    .line 339
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 340
    const/4 v0, 0x1

    .line 341
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;->method:Landroid/text/method/MovementMethod;

    invoke-interface {v0}, Landroid/text/method/MovementMethod;->canSelectArbitrarily()Z

    move-result v0

    goto :goto_0
.end method

.method public initialize(Landroid/widget/TextView;Landroid/text/Spannable;)V
    .locals 1
    .parameter "widget"
    .parameter "text"

    .prologue
    .line 346
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;->method:Landroid/text/method/MovementMethod;

    invoke-interface {v0, p1, p2}, Landroid/text/method/MovementMethod;->initialize(Landroid/widget/TextView;Landroid/text/Spannable;)V

    .line 347
    return-void
.end method

.method public onGenericMotionEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "arg0"
    .parameter "arg1"
    .parameter "arg2"

    .prologue
    .line 391
    const/4 v0, 0x0

    return v0
.end method

.method public onKeyDown(Landroid/widget/TextView;Landroid/text/Spannable;ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "widget"
    .parameter "text"
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 353
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;->method:Landroid/text/method/MovementMethod;

    invoke-interface {v1, p1, p2, p3, p4}, Landroid/text/method/MovementMethod;->onKeyDown(Landroid/widget/TextView;Landroid/text/Spannable;ILandroid/view/KeyEvent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 354
    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public onKeyOther(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "view"
    .parameter "text"
    .parameter "event"

    .prologue
    .line 359
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;->method:Landroid/text/method/MovementMethod;

    invoke-interface {v0, p1, p2, p3}, Landroid/text/method/MovementMethod;->onKeyOther(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyUp(Landroid/widget/TextView;Landroid/text/Spannable;ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "widget"
    .parameter "text"
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 366
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;->method:Landroid/text/method/MovementMethod;

    invoke-interface {v1, p1, p2, p3, p4}, Landroid/text/method/MovementMethod;->onKeyUp(Landroid/widget/TextView;Landroid/text/Spannable;ILandroid/view/KeyEvent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 367
    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public onTakeFocus(Landroid/widget/TextView;Landroid/text/Spannable;I)V
    .locals 1
    .parameter "widget"
    .parameter "text"
    .parameter "direction"

    .prologue
    .line 372
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;->method:Landroid/text/method/MovementMethod;

    invoke-interface {v0, p1, p2, p3}, Landroid/text/method/MovementMethod;->onTakeFocus(Landroid/widget/TextView;Landroid/text/Spannable;I)V

    .line 373
    return-void
.end method

.method public onTouchEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "widget"
    .parameter "text"
    .parameter "event"

    .prologue
    .line 379
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;->method:Landroid/text/method/MovementMethod;

    invoke-interface {v1, p1, p2, p3}, Landroid/text/method/MovementMethod;->onTouchEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 380
    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public onTrackballEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "widget"
    .parameter "text"
    .parameter "event"

    .prologue
    .line 386
    iget-object v0, p0, Lcom/bv/wifisync/BrowseActivity$MyMovementMethod;->method:Landroid/text/method/MovementMethod;

    invoke-interface {v0, p1, p2, p3}, Landroid/text/method/MovementMethod;->onTrackballEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
