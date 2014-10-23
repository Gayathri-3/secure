.class Lcom/bv/wifisync/DirBrowser$1$1;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/DirBrowser$1;

.field private final synthetic val$actionBarAdapter:Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser$1;Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$1$1;->this$1:Lcom/bv/wifisync/DirBrowser$1;

    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$1$1;->val$actionBarAdapter:Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;

    .line 221
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "position"

    .prologue
    .line 224
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$1$1;->val$actionBarAdapter:Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;

    invoke-virtual {v0, p2}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->onClick(I)Z

    .line 225
    return-void
.end method
