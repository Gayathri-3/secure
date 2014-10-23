.class Lcom/bv/wifisync/ImagePlugin;
.super Ljava/lang/Object;
.source "ImagePlugin.java"

# interfaces
.implements Lcom/bv/wifisync/Job$Plugin;


# static fields
.field private static final serialVersionUID:J = 0x6700809ede66640cL


# instance fields
.field private transient changed:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/MovedItem;",
            ">;"
        }
    .end annotation
.end field

.field final options:Lcom/bv/sync/ImageScanner$Options;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Lcom/bv/sync/ImageScanner$Options;

    invoke-direct {v0}, Lcom/bv/sync/ImageScanner$Options;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    .line 15
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bv/wifisync/ImagePlugin;->changed:Ljava/util/Collection;

    .line 45
    return-void
.end method

.method public getChangedItems()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/MovedItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lcom/bv/wifisync/ImagePlugin;->changed:Ljava/util/Collection;

    return-object v0
.end method

.method isRunnable()Z
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v0, v0, Lcom/bv/sync/ImageScanner$Options;->groupByYear:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v0, v0, Lcom/bv/sync/ImageScanner$Options;->groupByMonth:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v0, v0, Lcom/bv/sync/ImageScanner$Options;->groupByDay:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v0, v0, Lcom/bv/sync/ImageScanner$Options;->groupByAddress:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public run(Lcom/bv/wifisync/Job;Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V
    .locals 4
    .parameter "job"
    .parameter "context"
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-virtual {p0}, Lcom/bv/wifisync/ImagePlugin;->isRunnable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 23
    new-instance v0, Lcom/bv/wifisync/JpegParser;

    invoke-direct {v0, p2}, Lcom/bv/wifisync/JpegParser;-><init>(Landroid/content/Context;)V

    .line 24
    .local v0, parser:Lcom/bv/sync/ImageScanner$Parser;
    new-instance v1, Lcom/bv/sync/ImageScanner;

    invoke-direct {v1, v0}, Lcom/bv/sync/ImageScanner;-><init>(Lcom/bv/sync/ImageScanner$Parser;)V

    .line 26
    .local v1, scanner:Lcom/bv/sync/ImageScanner;
    :try_start_0
    new-instance v2, Lcom/bv/sync/LocalFile;

    invoke-virtual {p1}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/bv/sync/LocalFile;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    invoke-virtual {v1, v2, v3, p3}, Lcom/bv/sync/ImageScanner;->run(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;Lcom/bv/sync/ProgressNotification;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    invoke-virtual {v1}, Lcom/bv/sync/ImageScanner;->getChanged()Ljava/util/Collection;

    move-result-object v2

    iput-object v2, p0, Lcom/bv/wifisync/ImagePlugin;->changed:Ljava/util/Collection;

    .line 31
    .end local v0           #parser:Lcom/bv/sync/ImageScanner$Parser;
    .end local v1           #scanner:Lcom/bv/sync/ImageScanner;
    :cond_0
    return-void

    .line 27
    .restart local v0       #parser:Lcom/bv/sync/ImageScanner$Parser;
    .restart local v1       #scanner:Lcom/bv/sync/ImageScanner;
    :catchall_0
    move-exception v2

    .line 28
    invoke-virtual {v1}, Lcom/bv/sync/ImageScanner;->getChanged()Ljava/util/Collection;

    move-result-object v3

    iput-object v3, p0, Lcom/bv/wifisync/ImagePlugin;->changed:Ljava/util/Collection;

    .line 29
    throw v2
.end method
