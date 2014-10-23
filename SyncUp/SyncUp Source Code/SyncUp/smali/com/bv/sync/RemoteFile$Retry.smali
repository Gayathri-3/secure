.class Lcom/bv/sync/RemoteFile$Retry;
.super Ljava/lang/Object;
.source "RemoteFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/RemoteFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Retry"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static handleRetry(Ljcifs/smb/SmbException;)V
    .locals 2
    .parameter "e"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-virtual {p0}, Ljcifs/smb/SmbException;->getRootCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 136
    .local v0, cause:Ljava/lang/Throwable;
    if-nez v0, :cond_0

    .line 137
    throw p0

    .line 138
    :cond_0
    instance-of v1, v0, Ljcifs/util/transport/TransportException;

    if-eqz v1, :cond_2

    .line 139
    check-cast v0, Ljcifs/util/transport/TransportException;

    .end local v0           #cause:Ljava/lang/Throwable;
    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->handleRetry(Ljcifs/util/transport/TransportException;)V

    .line 142
    :cond_1
    return-void

    .line 140
    .restart local v0       #cause:Ljava/lang/Throwable;
    :cond_2
    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->isRetryException(Ljava/lang/Throwable;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 141
    throw p0
.end method

.method private static handleRetry(Ljcifs/util/transport/TransportException;)V
    .locals 2
    .parameter "t"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    invoke-virtual {p0}, Ljcifs/util/transport/TransportException;->getRootCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 126
    .local v0, cause:Ljava/lang/Throwable;
    if-eqz v0, :cond_0

    .line 127
    instance-of v1, v0, Ljcifs/util/transport/TransportException;

    if-eqz v1, :cond_1

    .line 128
    check-cast v0, Ljcifs/util/transport/TransportException;

    .end local v0           #cause:Ljava/lang/Throwable;
    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->handleRetry(Ljcifs/util/transport/TransportException;)V

    .line 132
    :cond_0
    return-void

    .line 129
    .restart local v0       #cause:Ljava/lang/Throwable;
    :cond_1
    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->isRetryException(Ljava/lang/Throwable;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 130
    throw p0
.end method

.method private static isRetryException(Ljava/lang/Throwable;)Z
    .locals 2
    .parameter "t"

    .prologue
    .line 145
    instance-of v0, p0, Ljava/net/SocketTimeoutException;

    if-nez v0, :cond_1

    .line 146
    instance-of v0, p0, Ljava/net/SocketException;

    if-eqz v0, :cond_0

    const-string v0, "Socket closed"

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 145
    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static run(Lcom/bv/sync/RemoteFile$IORunnable;)Ljava/lang/Object;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bv/sync/RemoteFile$IORunnable",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    .local p0, runnable:Lcom/bv/sync/RemoteFile$IORunnable;,"Lcom/bv/sync/RemoteFile$IORunnable<TT;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-static {}, Lcom/bv/sync/RemoteFile;->access$0()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-lt v1, v2, :cond_0

    .line 121
    invoke-interface {p0}, Lcom/bv/sync/RemoteFile$IORunnable;->run()Ljava/lang/Object;

    move-result-object v2

    :goto_1
    return-object v2

    .line 107
    :cond_0
    if-lez v1, :cond_1

    .line 108
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Retry "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 110
    :cond_1
    :try_start_0
    invoke-interface {p0}, Lcom/bv/sync/RemoteFile$IORunnable;->run()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_1

    .line 111
    :catch_0
    move-exception v0

    .line 112
    .local v0, e:Ljava/io/IOException;
    instance-of v2, v0, Ljcifs/smb/SmbException;

    if-eqz v2, :cond_3

    .line 113
    check-cast v0, Ljcifs/smb/SmbException;

    .end local v0           #e:Ljava/io/IOException;
    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->handleRetry(Ljcifs/smb/SmbException;)V

    .line 118
    :cond_2
    :goto_2
    sget v2, Lcom/bv/sync/RemoteFile;->totalRetryCount:I

    add-int/lit8 v2, v2, 0x1

    sput v2, Lcom/bv/sync/RemoteFile;->totalRetryCount:I

    .line 106
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 114
    .restart local v0       #e:Ljava/io/IOException;
    :cond_3
    instance-of v2, v0, Ljcifs/util/transport/TransportException;

    if-eqz v2, :cond_4

    .line 115
    check-cast v0, Ljcifs/util/transport/TransportException;

    .end local v0           #e:Ljava/io/IOException;
    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->handleRetry(Ljcifs/util/transport/TransportException;)V

    goto :goto_2

    .line 116
    .restart local v0       #e:Ljava/io/IOException;
    :cond_4
    invoke-static {v0}, Lcom/bv/sync/RemoteFile$Retry;->isRetryException(Ljava/lang/Throwable;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 117
    throw v0
.end method
