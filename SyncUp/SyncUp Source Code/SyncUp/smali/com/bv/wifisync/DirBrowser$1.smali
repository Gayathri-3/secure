.class Lcom/bv/wifisync/DirBrowser$1;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser;->setupSpinner(Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;

.field private final synthetic val$actionBarAdapter:Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$1;->this$0:Lcom/bv/wifisync/DirBrowser;

    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$1;->val$actionBarAdapter:Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;

    .line 217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 220
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$1;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 221
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$1;->val$actionBarAdapter:Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;

    new-instance v3, Lcom/bv/wifisync/DirBrowser$1$1;

    iget-object v4, p0, Lcom/bv/wifisync/DirBrowser$1;->val$actionBarAdapter:Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;

    invoke-direct {v3, p0, v4}, Lcom/bv/wifisync/DirBrowser$1$1;-><init>(Lcom/bv/wifisync/DirBrowser$1;Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 227
    const v2, 0x7f0601a5

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 228
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 229
    .local v1, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/16 v3, 0x33

    invoke-virtual {v2, v3}, Landroid/view/Window;->setGravity(I)V

    .line 230
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 231
    return-void
.end method
