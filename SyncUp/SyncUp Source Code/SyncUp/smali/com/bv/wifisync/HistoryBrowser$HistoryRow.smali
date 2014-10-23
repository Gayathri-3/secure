.class Lcom/bv/wifisync/HistoryBrowser$HistoryRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "HistoryBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/HistoryBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HistoryRow"
.end annotation


# instance fields
.field private final historyItem:Lcom/bv/wifisync/Job$HistoryItem;

.field final synthetic this$0:Lcom/bv/wifisync/HistoryBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/HistoryBrowser;Lcom/bv/wifisync/Job$HistoryItem;)V
    .locals 1
    .parameter
    .parameter "item"

    .prologue
    .line 32
    iput-object p1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    .line 33
    const v0, 0x7f060162

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/HistoryBrowser;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 34
    iput-object p2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    .line 35
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/HistoryBrowser$HistoryRow;)Lcom/bv/wifisync/Job$HistoryItem;
    .locals 1
    .parameter

    .prologue
    .line 30
    iget-object v0, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    return-object v0
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 12

    .prologue
    const-wide/16 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 39
    iget-object v1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-object v1, v1, Lcom/bv/wifisync/Job$HistoryItem;->description:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 40
    iget-object v1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job$HistoryItem;->toString()Ljava/lang/String;

    move-result-object v0

    .line 59
    :cond_0
    :goto_0
    return-object v0

    .line 41
    :cond_1
    iget-object v1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    const v2, 0x7f060163

    new-array v3, v9, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    iget-object v5, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-wide v5, v5, Lcom/bv/wifisync/Job$HistoryItem;->time:J

    invoke-static {v4, v5, v6}, Lcom/bv/wifisync/Utils;->toDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-virtual {v1, v2, v3}, Lcom/bv/wifisync/HistoryBrowser;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, result:Ljava/lang/String;
    iget-object v1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-wide v1, v1, Lcom/bv/wifisync/Job$HistoryItem;->endTime:J

    cmp-long v1, v1, v10

    if-eqz v1, :cond_2

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    const v3, 0x7f060164

    new-array v4, v9, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    iget-object v6, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-wide v6, v6, Lcom/bv/wifisync/Job$HistoryItem;->endTime:J

    invoke-static {v5, v6, v7}, Lcom/bv/wifisync/Utils;->toDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/HistoryBrowser;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 44
    :cond_2
    iget-object v1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget v1, v1, Lcom/bv/wifisync/Job$HistoryItem;->localFileCount:I

    if-eqz v1, :cond_3

    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    const v3, 0x7f060165

    new-array v4, v9, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget v5, v5, Lcom/bv/wifisync/Job$HistoryItem;->localFileCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/HistoryBrowser;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 46
    :cond_3
    iget-object v1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget v1, v1, Lcom/bv/wifisync/Job$HistoryItem;->remoteFilesCount:I

    if-eqz v1, :cond_4

    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    const v3, 0x7f060166

    new-array v4, v9, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget v5, v5, Lcom/bv/wifisync/Job$HistoryItem;->remoteFilesCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/HistoryBrowser;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 48
    :cond_4
    iget-object v1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget v1, v1, Lcom/bv/wifisync/Job$HistoryItem;->deletedFilesCount:I

    if-eqz v1, :cond_5

    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    const v3, 0x7f060167

    new-array v4, v9, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget v5, v5, Lcom/bv/wifisync/Job$HistoryItem;->deletedFilesCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/HistoryBrowser;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 50
    :cond_5
    iget-object v1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-wide v1, v1, Lcom/bv/wifisync/Job$HistoryItem;->reconnects:J

    cmp-long v1, v1, v10

    if-eqz v1, :cond_6

    .line 51
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "<br/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    const v3, 0x7f0601b8

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/HistoryBrowser;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-wide v2, v2, Lcom/bv/wifisync/Job$HistoryItem;->reconnects:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 52
    :cond_6
    iget-object v1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-wide v1, v1, Lcom/bv/wifisync/Job$HistoryItem;->transferBytes:J

    cmp-long v1, v1, v10

    if-eqz v1, :cond_7

    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "<br/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    const v3, 0x7f0601b9

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/HistoryBrowser;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-wide v2, v2, Lcom/bv/wifisync/Job$HistoryItem;->transferBytes:J

    invoke-static {v2, v3}, Lcom/bv/wifisync/Utils;->humanReadableSize(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 54
    :cond_7
    iget-object v1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-wide v1, v1, Lcom/bv/wifisync/Job$HistoryItem;->transferTime:J

    cmp-long v1, v1, v10

    if-eqz v1, :cond_8

    .line 55
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "<br/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    const v3, 0x7f0601ba

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/HistoryBrowser;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-wide v2, v2, Lcom/bv/wifisync/Job$HistoryItem;->transferBytes:J

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    iget-object v4, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-wide v4, v4, Lcom/bv/wifisync/Job$HistoryItem;->transferTime:J

    div-long/2addr v2, v4

    invoke-static {v2, v3}, Lcom/bv/wifisync/Utils;->humanReadableSize(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 57
    :cond_8
    iget-object v1, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-boolean v1, v1, Lcom/bv/wifisync/Job$HistoryItem;->isError:Z

    if-eqz v1, :cond_0

    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->this$0:Lcom/bv/wifisync/HistoryBrowser;

    const v3, 0x7f060168

    new-array v4, v9, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/bv/wifisync/HistoryBrowser$HistoryRow;->historyItem:Lcom/bv/wifisync/Job$HistoryItem;

    iget-object v5, v5, Lcom/bv/wifisync/Job$HistoryItem;->error:Ljava/lang/String;

    aput-object v5, v4, v8

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/HistoryBrowser;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method
