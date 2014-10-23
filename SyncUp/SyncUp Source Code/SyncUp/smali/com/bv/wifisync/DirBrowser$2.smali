.class Lcom/bv/wifisync/DirBrowser$2;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Landroid/app/ActionBar$OnNavigationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser;->setupActionBar(Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;)V
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
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$2;->this$0:Lcom/bv/wifisync/DirBrowser;

    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$2;->val$actionBarAdapter:Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;

    .line 240
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNavigationItemSelected(IJ)Z
    .locals 1
    .parameter "itemPosition"
    .parameter "itemId"

    .prologue
    .line 243
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$2;->val$actionBarAdapter:Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;

    invoke-virtual {v0, p1}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->onClick(I)Z

    .line 244
    const/4 v0, 0x1

    return v0
.end method
