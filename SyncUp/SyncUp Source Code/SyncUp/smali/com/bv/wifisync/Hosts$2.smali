.class Lcom/bv/wifisync/Hosts$2;
.super Ljava/lang/Object;
.source "Hosts.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Hosts;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Hosts;

.field private final synthetic val$gestureDetector:Landroid/view/GestureDetector;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Hosts;Landroid/view/GestureDetector;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$2;->this$0:Lcom/bv/wifisync/Hosts;

    iput-object p2, p0, Lcom/bv/wifisync/Hosts$2;->val$gestureDetector:Landroid/view/GestureDetector;

    .line 456
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "event"

    .prologue
    .line 459
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$2;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->shortcutSetupMode:Z
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$11(Lcom/bv/wifisync/Hosts;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 460
    const/4 v0, 0x0

    .line 461
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$2;->val$gestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method
