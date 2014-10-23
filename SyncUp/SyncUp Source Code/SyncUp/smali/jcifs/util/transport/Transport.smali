.class public abstract Ljcifs/util/transport/Transport;
.super Ljava/lang/Object;
.source "Transport.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field static id:I

.field static log:Ljcifs/util/LogStream;

.field public static readBytes:J

.field public static readTime:J


# instance fields
.field name:Ljava/lang/String;

.field protected readError:Ljava/lang/Exception;

.field protected response_map:Ljava/util/HashMap;

.field state:I

.field te:Ljcifs/util/transport/TransportException;

.field thread:Ljava/lang/Thread;

.field protected timeSendRecv:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const/4 v0, 0x0

    sput v0, Ljcifs/util/transport/Transport;->id:I

    .line 21
    invoke-static {}, Ljcifs/util/LogStream;->getInstance()Ljcifs/util/LogStream;

    move-result-object v0

    sput-object v0, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    .line 23
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Ljcifs/util/transport/Transport;->state:I

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Transport"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Ljcifs/util/transport/Transport;->id:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Ljcifs/util/transport/Transport;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljcifs/util/transport/Transport;->name:Ljava/lang/String;

    .line 57
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Ljcifs/util/transport/Transport;->response_map:Ljava/util/HashMap;

    .line 18
    return-void
.end method

.method private loop()V
    .locals 9

    .prologue
    const/4 v7, 0x1

    .line 102
    :goto_0
    iget-object v6, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    if-eq v6, v8, :cond_0

    .line 138
    return-void

    .line 104
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljcifs/util/transport/Transport;->peekKey()Ljcifs/util/transport/Request;

    move-result-object v3

    .line 105
    .local v3, key:Ljcifs/util/transport/Request;
    if-nez v3, :cond_2

    .line 106
    new-instance v6, Ljava/io/IOException;

    const-string v8, "end of stream"

    invoke-direct {v6, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .end local v3           #key:Ljcifs/util/transport/Request;
    :catch_0
    move-exception v0

    .line 120
    .local v0, ex:Ljava/lang/Exception;
    iput-object v0, p0, Ljcifs/util/transport/Transport;->readError:Ljava/lang/Exception;

    .line 123
    instance-of v5, v0, Ljava/net/SocketTimeoutException;

    .line 126
    .local v5, timeout:Z
    if-eqz v5, :cond_5

    const/4 v1, 0x0

    .line 128
    .local v1, hard:Z
    :goto_1
    if-nez v5, :cond_1

    sget v6, Ljcifs/util/LogStream;->level:I

    const/4 v8, 0x3

    if-lt v6, v8, :cond_1

    .line 129
    sget-object v6, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    invoke-virtual {v0, v6}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 132
    :cond_1
    :try_start_1
    invoke-virtual {p0, v1}, Ljcifs/util/transport/Transport;->disconnect(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 133
    :catch_1
    move-exception v2

    .line 134
    .local v2, ioe:Ljava/lang/Exception;
    sget-object v6, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    invoke-virtual {v2, v6}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0

    .line 107
    .end local v0           #ex:Ljava/lang/Exception;
    .end local v1           #hard:Z
    .end local v2           #ioe:Ljava/lang/Exception;
    .end local v5           #timeout:Z
    .restart local v3       #key:Ljcifs/util/transport/Request;
    :cond_2
    :try_start_2
    monitor-enter p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 108
    :try_start_3
    iget-object v6, p0, Ljcifs/util/transport/Transport;->response_map:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljcifs/util/transport/Response;

    .line 109
    .local v4, response:Ljcifs/util/transport/Response;
    if-nez v4, :cond_4

    .line 110
    sget v6, Ljcifs/util/LogStream;->level:I

    const/4 v8, 0x4

    if-lt v6, v8, :cond_3

    .line 111
    sget-object v6, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    const-string v8, "Invalid key, skipping message"

    invoke-virtual {v6, v8}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 112
    :cond_3
    invoke-virtual {p0}, Ljcifs/util/transport/Transport;->doSkip()V

    .line 107
    :goto_2
    monitor-exit p0

    goto :goto_0

    .end local v4           #response:Ljcifs/util/transport/Response;
    :catchall_0
    move-exception v6

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v6
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 114
    .restart local v4       #response:Ljcifs/util/transport/Response;
    :cond_4
    :try_start_5
    invoke-virtual {p0, v4}, Ljcifs/util/transport/Transport;->doRecv(Ljcifs/util/transport/Response;)V

    .line 115
    const/4 v6, 0x1

    iput-boolean v6, v4, Ljcifs/util/transport/Response;->isReceived:Z

    .line 116
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    .end local v3           #key:Ljcifs/util/transport/Request;
    .end local v4           #response:Ljcifs/util/transport/Response;
    .restart local v0       #ex:Ljava/lang/Exception;
    .restart local v5       #timeout:Z
    :cond_5
    move v1, v7

    .line 126
    goto :goto_1
.end method

.method public static readn(Ljava/io/InputStream;[BII)I
    .locals 8
    .parameter "in"
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    const/4 v0, 0x0

    .local v0, i:I
    const/4 v1, -0x5

    .line 31
    .local v1, n:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 32
    .local v2, start:J
    :goto_0
    if-lt v0, p3, :cond_1

    .line 39
    :cond_0
    sget-wide v4, Ljcifs/util/transport/Transport;->readBytes:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    sput-wide v4, Ljcifs/util/transport/Transport;->readBytes:J

    .line 40
    sget-wide v4, Ljcifs/util/transport/Transport;->readTime:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    add-long/2addr v4, v6

    sput-wide v4, Ljcifs/util/transport/Transport;->readTime:J

    .line 41
    return v0

    .line 33
    :cond_1
    add-int v4, p2, v0

    sub-int v5, p3, v0

    invoke-virtual {p0, p1, v4, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 34
    if-lez v1, :cond_0

    .line 37
    add-int/2addr v0, v1

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized connect(J)V
    .locals 9
    .parameter "timeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/util/transport/TransportException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x1

    .line 156
    monitor-enter p0

    const/4 v2, 0x0

    :try_start_0
    iput-object v2, p0, Ljcifs/util/transport/Transport;->readError:Ljava/lang/Exception;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 158
    :try_start_1
    iget v2, p0, Ljcifs/util/transport/Transport;->state:I

    packed-switch v2, :pswitch_data_0

    .line 167
    :pswitch_0
    new-instance v1, Ljcifs/util/transport/TransportException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid state: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Ljcifs/util/transport/Transport;->state:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljcifs/util/transport/TransportException;-><init>(Ljava/lang/String;)V

    .line 168
    .local v1, te:Ljcifs/util/transport/TransportException;
    const/4 v2, 0x0

    iput v2, p0, Ljcifs/util/transport/Transport;->state:I

    .line 169
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 196
    .end local v1           #te:Ljcifs/util/transport/TransportException;
    :catch_0
    move-exception v0

    .line 197
    .local v0, ie:Ljava/lang/InterruptedException;
    const/4 v2, 0x0

    :try_start_2
    iput v2, p0, Ljcifs/util/transport/Transport;->state:I

    .line 198
    const/4 v2, 0x0

    iput-object v2, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    .line 199
    new-instance v2, Ljcifs/util/transport/TransportException;

    invoke-direct {v2, v0}, Ljcifs/util/transport/TransportException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 200
    .end local v0           #ie:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v2

    .line 203
    :try_start_3
    iget v3, p0, Ljcifs/util/transport/Transport;->state:I

    if-eqz v3, :cond_1

    iget v3, p0, Ljcifs/util/transport/Transport;->state:I

    if-eq v3, v7, :cond_1

    iget v3, p0, Ljcifs/util/transport/Transport;->state:I

    if-eq v3, v8, :cond_1

    .line 204
    sget v3, Ljcifs/util/LogStream;->level:I

    if-lt v3, v6, :cond_0

    .line 205
    sget-object v3, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Invalid state: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p0, Ljcifs/util/transport/Transport;->state:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 206
    :cond_0
    const/4 v3, 0x0

    iput v3, p0, Ljcifs/util/transport/Transport;->state:I

    .line 207
    const/4 v3, 0x0

    iput-object v3, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    .line 209
    :cond_1
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 156
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2

    .line 192
    :cond_2
    const/4 v2, 0x3

    :try_start_4
    iput v2, p0, Ljcifs/util/transport/Transport;->state:I

    .line 193
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 203
    :pswitch_1
    :try_start_5
    iget v2, p0, Ljcifs/util/transport/Transport;->state:I

    if-eqz v2, :cond_4

    iget v2, p0, Ljcifs/util/transport/Transport;->state:I

    if-eq v2, v7, :cond_4

    iget v2, p0, Ljcifs/util/transport/Transport;->state:I

    if-eq v2, v8, :cond_4

    .line 204
    sget v2, Ljcifs/util/LogStream;->level:I

    if-lt v2, v6, :cond_3

    .line 205
    sget-object v2, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Invalid state: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Ljcifs/util/transport/Transport;->state:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 206
    :cond_3
    const/4 v2, 0x0

    iput v2, p0, Ljcifs/util/transport/Transport;->state:I

    .line 207
    const/4 v2, 0x0

    iput-object v2, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 210
    :cond_4
    :goto_0
    monitor-exit p0

    return-void

    .line 164
    :pswitch_2
    const/4 v2, 0x0

    :try_start_6
    iput v2, p0, Ljcifs/util/transport/Transport;->state:I

    .line 165
    new-instance v2, Ljcifs/util/transport/TransportException;

    const-string v3, "Connection in error"

    iget-object v4, p0, Ljcifs/util/transport/Transport;->te:Ljcifs/util/transport/TransportException;

    invoke-direct {v2, v3, v4}, Ljcifs/util/transport/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 172
    :pswitch_3
    const/4 v2, 0x1

    iput v2, p0, Ljcifs/util/transport/Transport;->state:I

    .line 173
    const/4 v2, 0x0

    iput-object v2, p0, Ljcifs/util/transport/Transport;->te:Ljcifs/util/transport/TransportException;

    .line 174
    new-instance v2, Ljava/lang/Thread;

    iget-object v3, p0, Ljcifs/util/transport/Transport;->name:Ljava/lang/String;

    invoke-direct {v2, p0, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v2, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    .line 175
    iget-object v2, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 177
    iget-object v3, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    monitor-enter v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_0

    .line 178
    :try_start_7
    iget-object v2, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 179
    iget-object v2, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    invoke-virtual {v2, p1, p2}, Ljava/lang/Object;->wait(J)V

    .line 181
    iget v2, p0, Ljcifs/util/transport/Transport;->state:I

    packed-switch v2, :pswitch_data_1

    .line 177
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 203
    :try_start_8
    iget v2, p0, Ljcifs/util/transport/Transport;->state:I

    if-eqz v2, :cond_4

    iget v2, p0, Ljcifs/util/transport/Transport;->state:I

    if-eq v2, v7, :cond_4

    iget v2, p0, Ljcifs/util/transport/Transport;->state:I

    if-eq v2, v8, :cond_4

    .line 204
    sget v2, Ljcifs/util/LogStream;->level:I

    if-lt v2, v6, :cond_5

    .line 205
    sget-object v2, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Invalid state: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Ljcifs/util/transport/Transport;->state:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 206
    :cond_5
    const/4 v2, 0x0

    iput v2, p0, Ljcifs/util/transport/Transport;->state:I

    .line 207
    const/4 v2, 0x0

    iput-object v2, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_0

    .line 183
    :pswitch_4
    const/4 v2, 0x0

    :try_start_9
    iput v2, p0, Ljcifs/util/transport/Transport;->state:I

    .line 184
    const/4 v2, 0x0

    iput-object v2, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    .line 185
    new-instance v2, Ljcifs/util/transport/TransportException;

    const-string v4, "Connection timeout"

    iget-object v5, p0, Ljcifs/util/transport/Transport;->readError:Ljava/lang/Exception;

    invoke-direct {v2, v4, v5}, Ljcifs/util/transport/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 177
    :catchall_2
    move-exception v2

    monitor-exit v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :try_start_a
    throw v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_0

    .line 187
    :pswitch_5
    :try_start_b
    iget-object v2, p0, Ljcifs/util/transport/Transport;->te:Ljcifs/util/transport/TransportException;

    if-eqz v2, :cond_2

    .line 188
    const/4 v2, 0x4

    iput v2, p0, Ljcifs/util/transport/Transport;->state:I

    .line 189
    const/4 v2, 0x0

    iput-object v2, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    .line 190
    iget-object v2, p0, Ljcifs/util/transport/Transport;->te:Ljcifs/util/transport/TransportException;

    throw v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 158
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 181
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public declared-synchronized disconnect(Z)V
    .locals 5
    .parameter "hard"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 212
    monitor-enter p0

    const/4 v0, 0x0

    .line 214
    .local v0, ioe:Ljava/io/IOException;
    :try_start_0
    iget v2, p0, Ljcifs/util/transport/Transport;->state:I

    packed-switch v2, :pswitch_data_0

    .line 233
    :pswitch_0
    sget v2, Ljcifs/util/LogStream;->level:I

    const/4 v3, 0x1

    if-lt v2, v3, :cond_0

    .line 234
    sget-object v2, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Invalid state: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Ljcifs/util/transport/Transport;->state:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 235
    :cond_0
    const/4 v2, 0x0

    iput-object v2, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    .line 236
    const/4 v2, 0x0

    iput v2, p0, Ljcifs/util/transport/Transport;->state:I

    .line 240
    :cond_1
    :goto_0
    if-eqz v0, :cond_3

    .line 241
    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 212
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 218
    :pswitch_1
    const/4 p1, 0x1

    .line 220
    :pswitch_2
    :try_start_1
    iget-object v2, p0, Ljcifs/util/transport/Transport;->response_map:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    if-eqz v2, :cond_2

    if-eqz p1, :cond_1

    .line 224
    :cond_2
    :try_start_2
    invoke-virtual {p0, p1}, Ljcifs/util/transport/Transport;->doDisconnect(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 229
    :goto_1
    :pswitch_3
    const/4 v2, 0x0

    :try_start_3
    iput-object v2, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    .line 230
    const/4 v2, 0x0

    iput v2, p0, Ljcifs/util/transport/Transport;->state:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 225
    :catch_0
    move-exception v1

    .line 226
    .local v1, ioe0:Ljava/io/IOException;
    move-object v0, v1

    goto :goto_1

    .line 242
    .end local v1           #ioe0:Ljava/io/IOException;
    :cond_3
    :pswitch_4
    monitor-exit p0

    return-void

    .line 214
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected abstract doConnect()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected abstract doDisconnect(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract doRecv(Ljcifs/util/transport/Response;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract doSend(Ljcifs/util/transport/Request;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract doSkip()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract makeKey(Ljcifs/util/transport/Request;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract peekKey()Ljcifs/util/transport/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    .line 244
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    .line 245
    .local v2, run_thread:Ljava/lang/Thread;
    const/4 v1, 0x0

    .line 252
    .local v1, ex0:Ljava/lang/Exception;
    :try_start_0
    invoke-virtual {p0}, Ljcifs/util/transport/Transport;->doConnect()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 257
    monitor-enter v2

    .line 258
    :try_start_1
    iget-object v3, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    if-eq v2, v3, :cond_7

    .line 262
    if-eqz v1, :cond_0

    .line 263
    sget v3, Ljcifs/util/LogStream;->level:I

    if-lt v3, v5, :cond_0

    .line 264
    sget-object v3, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v3}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 266
    :cond_0
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 279
    :goto_0
    return-void

    .line 253
    :catch_0
    move-exception v0

    .line 254
    .local v0, ex:Ljava/lang/Exception;
    move-object v1, v0

    .line 257
    monitor-enter v2

    .line 258
    :try_start_2
    iget-object v3, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    if-eq v2, v3, :cond_2

    .line 262
    if-eqz v1, :cond_1

    .line 263
    sget v3, Ljcifs/util/LogStream;->level:I

    if-lt v3, v5, :cond_1

    .line 264
    sget-object v3, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v3}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 266
    :cond_1
    monitor-exit v2

    goto :goto_0

    .line 257
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 268
    :cond_2
    if-eqz v1, :cond_3

    .line 269
    :try_start_3
    new-instance v3, Ljcifs/util/transport/TransportException;

    invoke-direct {v3, v1}, Ljcifs/util/transport/TransportException;-><init>(Ljava/lang/Throwable;)V

    iput-object v3, p0, Ljcifs/util/transport/Transport;->te:Ljcifs/util/transport/TransportException;

    .line 271
    :cond_3
    const/4 v3, 0x2

    iput v3, p0, Ljcifs/util/transport/Transport;->state:I

    .line 272
    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 257
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 256
    .end local v0           #ex:Ljava/lang/Exception;
    :catchall_1
    move-exception v3

    .line 257
    monitor-enter v2

    .line 258
    :try_start_4
    iget-object v4, p0, Ljcifs/util/transport/Transport;->thread:Ljava/lang/Thread;

    if-eq v2, v4, :cond_5

    .line 262
    if-eqz v1, :cond_4

    .line 263
    sget v3, Ljcifs/util/LogStream;->level:I

    if-lt v3, v5, :cond_4

    .line 264
    sget-object v3, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v3}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 266
    :cond_4
    monitor-exit v2

    goto :goto_0

    .line 257
    :catchall_2
    move-exception v3

    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v3

    .line 268
    :cond_5
    if-eqz v1, :cond_6

    .line 269
    :try_start_5
    new-instance v4, Ljcifs/util/transport/TransportException;

    invoke-direct {v4, v1}, Ljcifs/util/transport/TransportException;-><init>(Ljava/lang/Throwable;)V

    iput-object v4, p0, Ljcifs/util/transport/Transport;->te:Ljcifs/util/transport/TransportException;

    .line 271
    :cond_6
    const/4 v4, 0x2

    iput v4, p0, Ljcifs/util/transport/Transport;->state:I

    .line 272
    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 257
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 274
    throw v3

    .line 268
    :cond_7
    if-eqz v1, :cond_8

    .line 269
    :try_start_6
    new-instance v3, Ljcifs/util/transport/TransportException;

    invoke-direct {v3, v1}, Ljcifs/util/transport/TransportException;-><init>(Ljava/lang/Throwable;)V

    iput-object v3, p0, Ljcifs/util/transport/Transport;->te:Ljcifs/util/transport/TransportException;

    .line 271
    :cond_8
    const/4 v3, 0x2

    iput v3, p0, Ljcifs/util/transport/Transport;->state:I

    .line 272
    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 257
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 278
    invoke-direct {p0}, Ljcifs/util/transport/Transport;->loop()V

    goto :goto_0

    .line 257
    :catchall_3
    move-exception v3

    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw v3
.end method

.method public declared-synchronized sendrecv(Ljcifs/util/transport/Request;Ljcifs/util/transport/Response;J)V
    .locals 9
    .parameter "request"
    .parameter "response"
    .parameter "timeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    monitor-enter p0

    const/4 v5, 0x0

    :try_start_0
    iput-object v5, p0, Ljcifs/util/transport/Transport;->readError:Ljava/lang/Exception;

    .line 71
    invoke-virtual {p0, p1}, Ljcifs/util/transport/Transport;->makeKey(Ljcifs/util/transport/Request;)V

    .line 72
    const/4 v5, 0x0

    iput-boolean v5, p2, Ljcifs/util/transport/Response;->isReceived:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 74
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 75
    .local v3, start:J
    iget-object v5, p0, Ljcifs/util/transport/Transport;->response_map:Ljava/util/HashMap;

    invoke-virtual {v5, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    invoke-virtual {p0, p1}, Ljcifs/util/transport/Transport;->doSend(Ljcifs/util/transport/Request;)V

    .line 77
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    add-long/2addr v5, p3

    iput-wide v5, p2, Ljcifs/util/transport/Response;->expiration:J

    .line 78
    :cond_0
    iget-boolean v5, p2, Ljcifs/util/transport/Response;->isReceived:Z

    if-eqz v5, :cond_1

    .line 85
    iget-wide v5, p0, Ljcifs/util/transport/Transport;->timeSendRecv:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v3

    add-long/2addr v5, v7

    iput-wide v5, p0, Ljcifs/util/transport/Transport;->timeSendRecv:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2

    .line 98
    :try_start_2
    iget-object v5, p0, Ljcifs/util/transport/Transport;->response_map:Ljava/util/HashMap;

    invoke-virtual {v5, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 100
    monitor-exit p0

    return-void

    .line 79
    :cond_1
    :try_start_3
    invoke-virtual {p0, p3, p4}, Ljava/lang/Object;->wait(J)V

    .line 80
    iget-wide v5, p2, Ljcifs/util/transport/Response;->expiration:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long p3, v5, v7

    .line 81
    const-wide/16 v5, 0x0

    cmp-long v5, p3, v5

    if-gtz v5, :cond_0

    .line 82
    new-instance v5, Ljcifs/util/transport/TransportException;

    const-string v6, "Timeout waiting for response from computer"

    iget-object v7, p0, Ljcifs/util/transport/Transport;->readError:Ljava/lang/Exception;

    invoke-direct {v5, v6, v7}, Ljcifs/util/transport/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2

    .line 86
    .end local v3           #start:J
    :catch_0
    move-exception v1

    .line 87
    .local v1, ioe:Ljava/io/IOException;
    :try_start_4
    sget v5, Ljcifs/util/LogStream;->level:I

    const/4 v6, 0x2

    if-le v5, v6, :cond_2

    .line 88
    sget-object v5, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v5}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 90
    :cond_2
    const/4 v5, 0x1

    :try_start_5
    invoke-virtual {p0, v5}, Ljcifs/util/transport/Transport;->disconnect(Z)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 94
    :goto_0
    :try_start_6
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 97
    .end local v1           #ioe:Ljava/io/IOException;
    :catchall_0
    move-exception v5

    .line 98
    :try_start_7
    iget-object v6, p0, Ljcifs/util/transport/Transport;->response_map:Ljava/util/HashMap;

    invoke-virtual {v6, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    throw v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 70
    :catchall_1
    move-exception v5

    monitor-exit p0

    throw v5

    .line 91
    .restart local v1       #ioe:Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 92
    .local v2, ioe2:Ljava/io/IOException;
    :try_start_8
    sget-object v5, Ljcifs/util/transport/Transport;->log:Ljcifs/util/LogStream;

    invoke-virtual {v2, v5}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0

    .line 95
    .end local v1           #ioe:Ljava/io/IOException;
    .end local v2           #ioe2:Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 96
    .local v0, ie:Ljava/lang/InterruptedException;
    new-instance v5, Ljcifs/util/transport/TransportException;

    invoke-direct {v5, v0}, Ljcifs/util/transport/TransportException;-><init>(Ljava/lang/Throwable;)V

    throw v5
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 282
    iget-object v0, p0, Ljcifs/util/transport/Transport;->name:Ljava/lang/String;

    return-object v0
.end method
