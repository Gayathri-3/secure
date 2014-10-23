.class Lcom/bv/wifisync/Hosts$JobItem;
.super Lcom/bv/wifisync/Hosts$CheckItem;
.source "Hosts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Hosts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "JobItem"
.end annotation


# instance fields
.field private final job:Lcom/bv/wifisync/Job;

.field final synthetic this$0:Lcom/bv/wifisync/Hosts;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/Job;)V
    .locals 2
    .parameter
    .parameter "job"

    .prologue
    .line 204
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    .line 205
    invoke-virtual {p2}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x32

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/Hosts$CheckItem;-><init>(Lcom/bv/wifisync/Hosts;Ljava/lang/String;I)V

    .line 206
    iput-object p2, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    .line 207
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/Hosts$JobItem;)Lcom/bv/wifisync/Job;
    .locals 1
    .parameter

    .prologue
    .line 202
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    return-object v0
.end method

.method private formatLastRunResults(Lcom/bv/wifisync/Job$HistoryItem;)Ljava/lang/String;
    .locals 4
    .parameter "last"

    .prologue
    .line 254
    iget v1, p1, Lcom/bv/wifisync/Job$HistoryItem;->localFileCount:I

    const-string v2, "blue"

    const-string v3, ""

    invoke-direct {p0, v1, v2, v3}, Lcom/bv/wifisync/Hosts$JobItem;->formatLine(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 255
    .local v0, result:Ljava/lang/String;
    iget v1, p1, Lcom/bv/wifisync/Job$HistoryItem;->remoteFilesCount:I

    const-string v2, "blue"

    invoke-direct {p0, v1, v2, v0}, Lcom/bv/wifisync/Hosts$JobItem;->formatLine(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 256
    iget v1, p1, Lcom/bv/wifisync/Job$HistoryItem;->deletedFilesCount:I

    const-string v2, "red"

    invoke-direct {p0, v1, v2, v0}, Lcom/bv/wifisync/Hosts$JobItem;->formatLine(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 257
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 258
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, " ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 259
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private formatLine(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "count"
    .parameter "color"
    .parameter "result"

    .prologue
    .line 263
    if-eqz p1, :cond_1

    .line 264
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 265
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 266
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "<font color=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</font>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 268
    :cond_1
    return-object p3
.end method

.method private getLastRunResults()Ljava/lang/String;
    .locals 2

    .prologue
    .line 247
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->getHistory()Ljava/util/List;

    move-result-object v0

    .line 248
    .local v0, history:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Job$HistoryItem;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 249
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job$HistoryItem;

    invoke-direct {p0, v1}, Lcom/bv/wifisync/Hosts$JobItem;->formatLastRunResults(Lcom/bv/wifisync/Job$HistoryItem;)Ljava/lang/String;

    move-result-object v1

    .line 250
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method canRun()Z
    .locals 1

    .prologue
    .line 296
    const/4 v0, 0x1

    return v0
.end method

.method cancel()V
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->cancel()V

    .line 227
    return-void
.end method

.method public edit()V
    .locals 6

    .prologue
    .line 291
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    const-class v1, Lcom/bv/wifisync/AddJob;

    iget-object v2, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts;->access$14(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$ItemsAdapter;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/io/Serializable;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    iget-object v5, v5, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    aput-object v5, v3, v4

    #calls: Lcom/bv/wifisync/Hosts;->showProps(Ljava/lang/Class;I[Ljava/io/Serializable;)V
    invoke-static {v0, v1, v2, v3}, Lcom/bv/wifisync/Hosts;->access$16(Lcom/bv/wifisync/Hosts;Ljava/lang/Class;I[Ljava/io/Serializable;)V

    .line 292
    return-void
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 309
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    iget v0, v0, Lcom/bv/wifisync/Job;->id:I

    return v0
.end method

.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 211
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Job;->getDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getRelativeTime()Ljava/lang/CharSequence;
    .locals 9

    .prologue
    .line 273
    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    iget-wide v1, v1, Lcom/bv/wifisync/Job;->lastRun:J

    const-wide/32 v3, 0xea60

    const-wide/32 v5, 0x240c8400

    const/4 v7, 0x0

    invoke-static/range {v0 .. v7}, Landroid/text/format/DateUtils;->getRelativeDateTimeString(Landroid/content/Context;JJJI)Ljava/lang/CharSequence;
    :try_end_0
    .catch Ljava/util/UnknownFormatConversionException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 275
    :goto_0
    return-object v0

    .line 274
    :catch_0
    move-exception v8

    .line 275
    .local v8, e:Ljava/util/UnknownFormatConversionException;
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    iget-wide v1, v1, Lcom/bv/wifisync/Job;->lastRun:J

    invoke-static {v0, v1, v2}, Lcom/bv/wifisync/Utils;->toDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 6

    .prologue
    .line 237
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    iget-wide v2, v2, Lcom/bv/wifisync/Job;->lastRun:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    .line 238
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    const v3, 0x7f060114

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 243
    :cond_0
    :goto_0
    return-object v1

    .line 239
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    const v4, 0x7f060116

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts$JobItem;->getRelativeTime()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 240
    .local v1, result:Ljava/lang/String;
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts$JobItem;->getLastRunResults()Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, lastRunResults:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 242
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected isRunning()Z
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    iget-boolean v0, v0, Lcom/bv/wifisync/Job;->running:Z

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 301
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->shortcutSetupMode:Z
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$11(Lcom/bv/wifisync/Hosts;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 302
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    iget v1, v1, Lcom/bv/wifisync/Job;->id:I

    iget-object v2, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v2}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v3}, Lcom/bv/wifisync/Job;->getIconId()I

    move-result v3

    #calls: Lcom/bv/wifisync/Hosts;->addShortcut(ILjava/lang/String;I)V
    invoke-static {v0, v1, v2, v3}, Lcom/bv/wifisync/Hosts;->access$17(Lcom/bv/wifisync/Hosts;ILjava/lang/String;I)V

    .line 305
    :goto_0
    return-void

    .line 304
    :cond_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/Hosts$CheckItem;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method

.method remove()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 231
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts$JobItem;->cancel()V

    .line 232
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Job;->remove(Landroid/content/Context;)V

    .line 233
    return-void
.end method

.method run()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 281
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    const-string v1, "Menu"

    const-string v2, "Run job"

    invoke-virtual {v0, v1, v2}, Lcom/bv/wifisync/Hosts;->dispatchEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-static {v0}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 283
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    #getter for: Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;
    invoke-static {v0}, Lcom/bv/wifisync/Hosts;->access$3(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/SyncService;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/SyncService;->runNow(Lcom/bv/wifisync/Job;)V

    .line 284
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    const-class v3, Lcom/bv/wifisync/SyncService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/Hosts;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 285
    iget-object v0, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    .line 286
    iget-object v1, p0, Lcom/bv/wifisync/Hosts$JobItem;->this$0:Lcom/bv/wifisync/Hosts;

    const v2, 0x7f06012f

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 285
    invoke-static {v0, v1}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 287
    return-void
.end method
