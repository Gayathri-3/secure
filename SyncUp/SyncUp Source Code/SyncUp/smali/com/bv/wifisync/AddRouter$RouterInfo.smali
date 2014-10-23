.class Lcom/bv/wifisync/AddRouter$RouterInfo;
.super Ljava/lang/Object;
.source "AddRouter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/bv/wifisync/OnCheckedChangeListenerEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddRouter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RouterInfo"
.end annotation


# instance fields
.field active:Z

.field checked:Z

.field final name:Ljava/lang/String;

.field final synthetic this$0:Lcom/bv/wifisync/AddRouter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddRouter;Ljava/lang/String;Z)V
    .locals 0
    .parameter
    .parameter "name"
    .parameter "checked"

    .prologue
    .line 88
    iput-object p1, p0, Lcom/bv/wifisync/AddRouter$RouterInfo;->this$0:Lcom/bv/wifisync/AddRouter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p2, p0, Lcom/bv/wifisync/AddRouter$RouterInfo;->name:Ljava/lang/String;

    .line 90
    iput-boolean p3, p0, Lcom/bv/wifisync/AddRouter$RouterInfo;->checked:Z

    .line 91
    return-void
.end method


# virtual methods
.method public getBooleanValue()Z
    .locals 1

    .prologue
    .line 101
    iget-boolean v0, p0, Lcom/bv/wifisync/AddRouter$RouterInfo;->checked:Z

    return v0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 106
    iput-boolean p2, p0, Lcom/bv/wifisync/AddRouter$RouterInfo;->checked:Z

    .line 107
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter$RouterInfo;->this$0:Lcom/bv/wifisync/AddRouter;

    #getter for: Lcom/bv/wifisync/AddRouter;->adapter:Lcom/bv/wifisync/AddRouter$RoutersAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddRouter;->access$4(Lcom/bv/wifisync/AddRouter;)Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->notifyDataSetChanged()V

    .line 108
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 95
    iget-boolean v0, p0, Lcom/bv/wifisync/AddRouter$RouterInfo;->checked:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/bv/wifisync/AddRouter$RouterInfo;->checked:Z

    .line 96
    iget-object v0, p0, Lcom/bv/wifisync/AddRouter$RouterInfo;->this$0:Lcom/bv/wifisync/AddRouter;

    #getter for: Lcom/bv/wifisync/AddRouter;->adapter:Lcom/bv/wifisync/AddRouter$RoutersAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddRouter;->access$4(Lcom/bv/wifisync/AddRouter;)Lcom/bv/wifisync/AddRouter$RoutersAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/AddRouter$RoutersAdapter;->notifyDataSetChanged()V

    .line 97
    return-void

    .line 95
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
