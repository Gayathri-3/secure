.class Lcom/bv/wifisync/HistoryBrowser$ClickableHistoryRow;
.super Lcom/bv/wifisync/HistoryBrowser$HistoryRow;
.source "HistoryBrowser.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/HistoryBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClickableHistoryRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/HistoryBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HistoryBrowser;Lcom/bv/wifisync/Job$HistoryItem;)V
    .locals 0
    .parameter
    .parameter "item"

    .prologue
    .line 64
    iput-object p1, p0, Lcom/bv/wifisync/HistoryBrowser$ClickableHistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    .line 65
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;-><init>(Lcom/bv/wifisync/HistoryBrowser;Lcom/bv/wifisync/Job$HistoryItem;)V

    .line 66
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/bv/wifisync/HistoryBrowser$ClickableHistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    invoke-virtual {v0, p1}, Lcom/bv/wifisync/HistoryBrowser;->openContextMenu(Landroid/view/View;)V

    .line 71
    return-void
.end method
