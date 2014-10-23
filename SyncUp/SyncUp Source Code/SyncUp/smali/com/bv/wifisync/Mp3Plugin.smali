.class public Lcom/bv/wifisync/Mp3Plugin;
.super Ljava/lang/Object;
.source "Mp3Plugin.java"

# interfaces
.implements Lcom/bv/wifisync/Job$Plugin;


# static fields
.field private static final serialVersionUID:J = 0x2ffe82d6d72230cfL


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

.field final options:Lcom/bv/sync/Mp3Scanner$Options;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Lcom/bv/sync/Mp3Scanner$Options;

    invoke-direct {v0}, Lcom/bv/sync/Mp3Scanner$Options;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    .line 15
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bv/wifisync/Mp3Plugin;->changed:Ljava/util/Collection;

    .line 46
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
    .line 40
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Plugin;->changed:Ljava/util/Collection;

    return-object v0
.end method

.method isRunnable()Z
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    iget-boolean v0, v0, Lcom/bv/sync/Mp3Scanner$Options;->groupByAlbum:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    iget-boolean v0, v0, Lcom/bv/sync/Mp3Scanner$Options;->groupByArtist:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    iget-boolean v0, v0, Lcom/bv/sync/Mp3Scanner$Options;->renameSongs:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public run(Lcom/bv/wifisync/Job;Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V
    .locals 3
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
    invoke-virtual {p0}, Lcom/bv/wifisync/Mp3Plugin;->isRunnable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 23
    new-instance v0, Lcom/bv/sync/Mp3Scanner;

    invoke-direct {v0}, Lcom/bv/sync/Mp3Scanner;-><init>()V

    .line 25
    .local v0, scanner:Lcom/bv/sync/Mp3Scanner;
    :try_start_0
    new-instance v1, Lcom/bv/sync/LocalFile;

    invoke-virtual {p1}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/bv/sync/LocalFile;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/Mp3Plugin;->options:Lcom/bv/sync/Mp3Scanner$Options;

    invoke-virtual {v0, v1, v2, p3}, Lcom/bv/sync/Mp3Scanner;->run(Lcom/bv/sync/IFile;Lcom/bv/sync/Mp3Scanner$Options;Lcom/bv/sync/ProgressNotification;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    invoke-virtual {v0}, Lcom/bv/sync/Mp3Scanner;->getChanged()Ljava/util/Collection;

    move-result-object v1

    iput-object v1, p0, Lcom/bv/wifisync/Mp3Plugin;->changed:Ljava/util/Collection;

    .line 32
    .end local v0           #scanner:Lcom/bv/sync/Mp3Scanner;
    :cond_0
    return-void

    .line 26
    .restart local v0       #scanner:Lcom/bv/sync/Mp3Scanner;
    :catchall_0
    move-exception v1

    .line 27
    invoke-virtual {v0}, Lcom/bv/sync/Mp3Scanner;->getChanged()Ljava/util/Collection;

    move-result-object v2

    iput-object v2, p0, Lcom/bv/wifisync/Mp3Plugin;->changed:Ljava/util/Collection;

    .line 28
    throw v1
.end method
