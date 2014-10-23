.class Ljcifs/smb/SmbFile$WriterThread;
.super Ljava/lang/Thread;
.source "SmbFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljcifs/smb/SmbFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WriterThread"
.end annotation


# instance fields
.field b:[B

.field dest:Ljcifs/smb/SmbFile;

.field e:Ljcifs/smb/SmbException;

.field n:I

.field off:J

.field ready:Z

.field req:Ljcifs/smb/SmbComWrite;

.field reqx:Ljcifs/smb/SmbComWriteAndX;

.field resp:Ljcifs/smb/ServerMessageBlock;

.field final synthetic this$0:Ljcifs/smb/SmbFile;

.field useNTSmbs:Z


# direct methods
.method constructor <init>(Ljcifs/smb/SmbFile;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2091
    iput-object p1, p0, Ljcifs/smb/SmbFile$WriterThread;->this$0:Ljcifs/smb/SmbFile;

    .line 2092
    const-string v0, "JCIFS-WriterThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 2085
    const/4 v0, 0x0

    iput-object v0, p0, Ljcifs/smb/SmbFile$WriterThread;->e:Ljcifs/smb/SmbException;

    .line 2093
    iget-object v0, p1, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v0, v0, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v0, v0, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Ljcifs/smb/SmbTransport;->hasCapability(I)Z

    move-result v0

    iput-boolean v0, p0, Ljcifs/smb/SmbFile$WriterThread;->useNTSmbs:Z

    .line 2094
    iget-boolean v0, p0, Ljcifs/smb/SmbFile$WriterThread;->useNTSmbs:Z

    if-eqz v0, :cond_0

    .line 2095
    new-instance v0, Ljcifs/smb/SmbComWriteAndX;

    invoke-direct {v0}, Ljcifs/smb/SmbComWriteAndX;-><init>()V

    iput-object v0, p0, Ljcifs/smb/SmbFile$WriterThread;->reqx:Ljcifs/smb/SmbComWriteAndX;

    .line 2096
    new-instance v0, Ljcifs/smb/SmbComWriteAndXResponse;

    invoke-direct {v0}, Ljcifs/smb/SmbComWriteAndXResponse;-><init>()V

    iput-object v0, p0, Ljcifs/smb/SmbFile$WriterThread;->resp:Ljcifs/smb/ServerMessageBlock;

    .line 2101
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Ljcifs/smb/SmbFile$WriterThread;->ready:Z

    .line 2102
    return-void

    .line 2098
    :cond_0
    new-instance v0, Ljcifs/smb/SmbComWrite;

    invoke-direct {v0}, Ljcifs/smb/SmbComWrite;-><init>()V

    iput-object v0, p0, Ljcifs/smb/SmbFile$WriterThread;->req:Ljcifs/smb/SmbComWrite;

    .line 2099
    new-instance v0, Ljcifs/smb/SmbComWriteResponse;

    invoke-direct {v0}, Ljcifs/smb/SmbComWriteResponse;-><init>()V

    iput-object v0, p0, Ljcifs/smb/SmbFile$WriterThread;->resp:Ljcifs/smb/ServerMessageBlock;

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 2114
    monitor-enter p0

    .line 2117
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 2118
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljcifs/smb/SmbFile$WriterThread;->ready:Z

    .line 2119
    :goto_1
    iget-boolean v0, p0, Ljcifs/smb/SmbFile$WriterThread;->ready:Z

    if-nez v0, :cond_0

    .line 2122
    iget v0, p0, Ljcifs/smb/SmbFile$WriterThread;->n:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 2123
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2140
    :goto_2
    return-void

    .line 2120
    :cond_0
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljcifs/smb/SmbException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 2133
    :catch_0
    move-exception v8

    .line 2134
    .local v8, e:Ljcifs/smb/SmbException;
    :try_start_3
    iput-object v8, p0, Ljcifs/smb/SmbFile$WriterThread;->e:Ljcifs/smb/SmbException;

    .line 2138
    .end local v8           #e:Ljcifs/smb/SmbException;
    :goto_3
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 2114
    monitor-exit p0

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    .line 2125
    :cond_1
    :try_start_4
    iget-boolean v0, p0, Ljcifs/smb/SmbFile$WriterThread;->useNTSmbs:Z

    if-eqz v0, :cond_2

    .line 2126
    iget-object v0, p0, Ljcifs/smb/SmbFile$WriterThread;->reqx:Ljcifs/smb/SmbComWriteAndX;

    iget-object v1, p0, Ljcifs/smb/SmbFile$WriterThread;->dest:Ljcifs/smb/SmbFile;

    iget v1, v1, Ljcifs/smb/SmbFile;->fid:I

    iget-wide v2, p0, Ljcifs/smb/SmbFile$WriterThread;->off:J

    iget v4, p0, Ljcifs/smb/SmbFile$WriterThread;->n:I

    iget-object v5, p0, Ljcifs/smb/SmbFile$WriterThread;->b:[B

    const/4 v6, 0x0

    iget v7, p0, Ljcifs/smb/SmbFile$WriterThread;->n:I

    invoke-virtual/range {v0 .. v7}, Ljcifs/smb/SmbComWriteAndX;->setParam(IJI[BII)V

    .line 2127
    iget-object v0, p0, Ljcifs/smb/SmbFile$WriterThread;->dest:Ljcifs/smb/SmbFile;

    iget-object v1, p0, Ljcifs/smb/SmbFile$WriterThread;->reqx:Ljcifs/smb/SmbComWriteAndX;

    iget-object v2, p0, Ljcifs/smb/SmbFile$WriterThread;->resp:Ljcifs/smb/ServerMessageBlock;

    invoke-virtual {v0, v1, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljcifs/smb/SmbException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 2135
    :catch_1
    move-exception v9

    .line 2136
    .local v9, x:Ljava/lang/Exception;
    :try_start_5
    new-instance v0, Ljcifs/smb/SmbException;

    const-string v1, "WriterThread"

    invoke-direct {v0, v1, v9}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-object v0, p0, Ljcifs/smb/SmbFile$WriterThread;->e:Ljcifs/smb/SmbException;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_3

    .line 2129
    .end local v9           #x:Ljava/lang/Exception;
    :cond_2
    :try_start_6
    iget-object v0, p0, Ljcifs/smb/SmbFile$WriterThread;->req:Ljcifs/smb/SmbComWrite;

    iget-object v1, p0, Ljcifs/smb/SmbFile$WriterThread;->dest:Ljcifs/smb/SmbFile;

    iget v1, v1, Ljcifs/smb/SmbFile;->fid:I

    iget-wide v2, p0, Ljcifs/smb/SmbFile$WriterThread;->off:J

    iget v4, p0, Ljcifs/smb/SmbFile$WriterThread;->n:I

    iget-object v5, p0, Ljcifs/smb/SmbFile$WriterThread;->b:[B

    const/4 v6, 0x0

    iget v7, p0, Ljcifs/smb/SmbFile$WriterThread;->n:I

    invoke-virtual/range {v0 .. v7}, Ljcifs/smb/SmbComWrite;->setParam(IJI[BII)V

    .line 2130
    iget-object v0, p0, Ljcifs/smb/SmbFile$WriterThread;->dest:Ljcifs/smb/SmbFile;

    iget-object v1, p0, Ljcifs/smb/SmbFile$WriterThread;->req:Ljcifs/smb/SmbComWrite;

    iget-object v2, p0, Ljcifs/smb/SmbFile$WriterThread;->resp:Ljcifs/smb/ServerMessageBlock;

    invoke-virtual {v0, v1, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljcifs/smb/SmbException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_0
.end method

.method declared-synchronized write([BILjcifs/smb/SmbFile;J)V
    .locals 1
    .parameter "b"
    .parameter "n"
    .parameter "dest"
    .parameter "off"

    .prologue
    .line 2105
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Ljcifs/smb/SmbFile$WriterThread;->b:[B

    .line 2106
    iput p2, p0, Ljcifs/smb/SmbFile$WriterThread;->n:I

    .line 2107
    iput-object p3, p0, Ljcifs/smb/SmbFile$WriterThread;->dest:Ljcifs/smb/SmbFile;

    .line 2108
    iput-wide p4, p0, Ljcifs/smb/SmbFile$WriterThread;->off:J

    .line 2109
    const/4 v0, 0x0

    iput-boolean v0, p0, Ljcifs/smb/SmbFile$WriterThread;->ready:Z

    .line 2110
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2111
    monitor-exit p0

    return-void

    .line 2105
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
