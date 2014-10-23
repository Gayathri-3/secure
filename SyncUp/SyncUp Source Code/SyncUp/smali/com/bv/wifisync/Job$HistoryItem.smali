.class Lcom/bv/wifisync/Job$HistoryItem;
.super Ljava/lang/Object;
.source "Job.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Job;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "HistoryItem"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7d2c47962722f1feL


# instance fields
.field deletedFilesCount:I

.field final description:Ljava/lang/String;

.field endTime:J

.field error:Ljava/lang/String;

.field isError:Z

.field localFileCount:I

.field reconnects:J

.field remoteFilesCount:I

.field final time:J

.field transferBytes:J

.field transferTime:J

.field workDir:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 2
    .parameter "description"

    .prologue
    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bv/wifisync/Job$HistoryItem;->time:J

    .line 127
    iput-object p1, p0, Lcom/bv/wifisync/Job$HistoryItem;->description:Ljava/lang/String;

    .line 128
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "description"
    .parameter "error"

    .prologue
    .line 131
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Job$HistoryItem;-><init>(Ljava/lang/String;)V

    .line 132
    iput-object p2, p0, Lcom/bv/wifisync/Job$HistoryItem;->error:Ljava/lang/String;

    .line 133
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/wifisync/Job$HistoryItem;->isError:Z

    .line 134
    return-void
.end method


# virtual methods
.method getDeletedFilesPath()Ljava/io/File;
    .locals 3

    .prologue
    .line 147
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/bv/wifisync/Job$HistoryItem;->workDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 148
    .local v0, parent:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v2, "deleted"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method getLocalFilesPath()Ljava/io/File;
    .locals 3

    .prologue
    .line 137
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/bv/wifisync/Job$HistoryItem;->workDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 138
    .local v0, parent:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v2, "local"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method getRemoteFilesPath()Ljava/io/File;
    .locals 3

    .prologue
    .line 142
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/bv/wifisync/Job$HistoryItem;->workDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 143
    .local v0, parent:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v2, "remote"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method remove(Landroid/content/Context;)V
    .locals 2
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    iget-object v1, p0, Lcom/bv/wifisync/Job$HistoryItem;->workDir:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 159
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/bv/wifisync/Job$HistoryItem;->workDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 160
    .local v0, dir:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 161
    invoke-static {p1, v0}, Lcom/bv/wifisync/Utils;->rmdir(Landroid/content/Context;Ljava/io/File;)V

    .line 162
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/bv/wifisync/Job$HistoryItem;->workDir:Ljava/lang/String;

    .line 164
    .end local v0           #dir:Ljava/io/File;
    :cond_1
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SimpleDateFormat"
        }
    .end annotation

    .prologue
    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    new-instance v1, Ljava/text/SimpleDateFormat;

    invoke-direct {v1}, Ljava/text/SimpleDateFormat;-><init>()V

    new-instance v2, Ljava/util/Date;

    iget-wide v3, p0, Lcom/bv/wifisync/Job$HistoryItem;->time:J

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\t "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/Job$HistoryItem;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
