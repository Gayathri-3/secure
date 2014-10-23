.class public Ljcifs/smb/SmbFileInputStream;
.super Ljava/io/InputStream;
.source "SmbFileInputStream.java"


# instance fields
.field private access:I

.field file:Ljcifs/smb/SmbFile;

.field private fp:J

.field private openFlags:I

.field private readSize:I

.field private readSizeFile:I

.field private tmp:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;,
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 52
    new-instance v0, Ljcifs/smb/SmbFile;

    invoke-direct {v0, p1}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Ljcifs/smb/SmbFileInputStream;-><init>(Ljcifs/smb/SmbFile;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljcifs/smb/SmbFile;)V
    .locals 1
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;,
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 65
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Ljcifs/smb/SmbFileInputStream;-><init>(Ljcifs/smb/SmbFile;I)V

    .line 66
    return-void
.end method

.method constructor <init>(Ljcifs/smb/SmbFile;I)V
    .locals 4
    .parameter "file"
    .parameter "openFlags"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;,
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    const v3, 0xffff

    .line 68
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 38
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Ljcifs/smb/SmbFileInputStream;->tmp:[B

    .line 69
    iput-object p1, p0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    .line 70
    and-int v0, p2, v3

    iput v0, p0, Ljcifs/smb/SmbFileInputStream;->openFlags:I

    .line 71
    ushr-int/lit8 v0, p2, 0x10

    and-int/2addr v0, v3

    iput v0, p0, Ljcifs/smb/SmbFileInputStream;->access:I

    .line 72
    iget v0, p1, Ljcifs/smb/SmbFile;->type:I

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    .line 73
    iget v0, p0, Ljcifs/smb/SmbFileInputStream;->access:I

    const/16 v1, 0x80

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v0, v1, v2}, Ljcifs/smb/SmbFile;->open(IIII)V

    .line 74
    iget v0, p0, Ljcifs/smb/SmbFileInputStream;->openFlags:I

    and-int/lit8 v0, v0, -0x51

    iput v0, p0, Ljcifs/smb/SmbFileInputStream;->openFlags:I

    .line 78
    :goto_0
    iget-object v0, p1, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v0, v0, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v0, v0, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    iget v0, v0, Ljcifs/smb/SmbTransport;->rcv_buf_size:I

    add-int/lit8 v0, v0, -0x46

    .line 79
    iget-object v1, p1, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v1, v1, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v1, v1, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    iget-object v1, v1, Ljcifs/smb/SmbTransport;->server:Ljcifs/smb/SmbTransport$ServerData;

    iget v1, v1, Ljcifs/smb/SmbTransport$ServerData;->maxBufferSize:I

    add-int/lit8 v1, v1, -0x46

    .line 78
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Ljcifs/smb/SmbFileInputStream;->readSize:I

    .line 80
    iget-object v0, p1, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v0, v0, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v0, v0, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    iget-object v0, v0, Ljcifs/smb/SmbTransport;->server:Ljcifs/smb/SmbTransport$ServerData;

    iget v0, v0, Ljcifs/smb/SmbTransport$ServerData;->capabilities:I

    and-int/lit16 v0, v0, 0x4000

    const/16 v1, 0x4000

    if-ne v0, v1, :cond_1

    iget-object v0, p1, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v0, v0, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v0, v0, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    iget-object v0, v0, Ljcifs/smb/SmbTransport;->server:Ljcifs/smb/SmbTransport$ServerData;

    iget-boolean v0, v0, Ljcifs/smb/SmbTransport$ServerData;->signaturesRequired:Z

    if-nez v0, :cond_1

    .line 81
    sget v0, Ljcifs/smb/SmbConstants;->RCV_BUF_SIZE:I

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Ljcifs/smb/SmbFileInputStream;->readSizeFile:I

    .line 85
    :goto_1
    return-void

    .line 76
    :cond_0
    invoke-virtual {p1}, Ljcifs/smb/SmbFile;->connect0()V

    goto :goto_0

    .line 83
    :cond_1
    iget v0, p0, Ljcifs/smb/SmbFileInputStream;->readSize:I

    iput v0, p0, Ljcifs/smb/SmbFileInputStream;->readSizeFile:I

    goto :goto_1
.end method


# virtual methods
.method public available()I
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 216
    iget-object v5, p0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    iget v5, v5, Ljcifs/smb/SmbFile;->type:I

    const/16 v6, 0x10

    if-eq v5, v6, :cond_0

    .line 233
    :goto_0
    return v4

    .line 221
    :cond_0
    :try_start_0
    iget-object v0, p0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    check-cast v0, Ljcifs/smb/SmbNamedPipe;

    .line 222
    .local v0, pipe:Ljcifs/smb/SmbNamedPipe;
    iget-object v5, p0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    const/16 v6, 0x20

    iget v7, v0, Ljcifs/smb/SmbNamedPipe;->pipeType:I

    const/high16 v8, 0xff

    and-int/2addr v7, v8

    const/16 v8, 0x80

    const/4 v9, 0x0

    invoke-virtual {v5, v6, v7, v8, v9}, Ljcifs/smb/SmbFile;->open(IIII)V

    .line 224
    new-instance v1, Ljcifs/smb/TransPeekNamedPipe;

    iget-object v5, p0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    iget-object v5, v5, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    iget-object v6, p0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    iget v6, v6, Ljcifs/smb/SmbFile;->fid:I

    invoke-direct {v1, v5, v6}, Ljcifs/smb/TransPeekNamedPipe;-><init>(Ljava/lang/String;I)V

    .line 225
    .local v1, req:Ljcifs/smb/TransPeekNamedPipe;
    new-instance v2, Ljcifs/smb/TransPeekNamedPipeResponse;

    invoke-direct {v2, v0}, Ljcifs/smb/TransPeekNamedPipeResponse;-><init>(Ljcifs/smb/SmbNamedPipe;)V

    .line 227
    .local v2, resp:Ljcifs/smb/TransPeekNamedPipeResponse;
    invoke-virtual {v0, v1, v2}, Ljcifs/smb/SmbNamedPipe;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 228
    iget v5, v2, Ljcifs/smb/TransPeekNamedPipeResponse;->status:I

    const/4 v6, 0x1

    if-eq v5, v6, :cond_1

    .line 229
    iget v5, v2, Ljcifs/smb/TransPeekNamedPipeResponse;->status:I

    const/4 v6, 0x4

    if-ne v5, v6, :cond_2

    .line 230
    :cond_1
    iget-object v5, p0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    const/4 v6, 0x0

    iput-boolean v6, v5, Ljcifs/smb/SmbFile;->opened:Z
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 234
    .end local v0           #pipe:Ljcifs/smb/SmbNamedPipe;
    .end local v1           #req:Ljcifs/smb/TransPeekNamedPipe;
    .end local v2           #resp:Ljcifs/smb/TransPeekNamedPipeResponse;
    :catch_0
    move-exception v3

    .line 235
    .local v3, se:Ljcifs/smb/SmbException;
    invoke-virtual {p0, v3}, Ljcifs/smb/SmbFileInputStream;->seToIoe(Ljcifs/smb/SmbException;)Ljava/io/IOException;

    move-result-object v4

    throw v4

    .line 233
    .end local v3           #se:Ljcifs/smb/SmbException;
    .restart local v0       #pipe:Ljcifs/smb/SmbNamedPipe;
    .restart local v1       #req:Ljcifs/smb/TransPeekNamedPipe;
    .restart local v2       #resp:Ljcifs/smb/TransPeekNamedPipeResponse;
    :cond_2
    :try_start_1
    iget v4, v2, Ljcifs/smb/TransPeekNamedPipeResponse;->available:I
    :try_end_1
    .catch Ljcifs/smb/SmbException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    :try_start_0
    iget-object v1, p0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v1}, Ljcifs/smb/SmbFile;->close()V

    .line 110
    const/4 v1, 0x0

    iput-object v1, p0, Ljcifs/smb/SmbFileInputStream;->tmp:[B
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    return-void

    .line 111
    :catch_0
    move-exception v0

    .line 112
    .local v0, se:Ljcifs/smb/SmbException;
    invoke-virtual {p0, v0}, Ljcifs/smb/SmbFileInputStream;->seToIoe(Ljcifs/smb/SmbException;)Ljava/io/IOException;

    move-result-object v1

    throw v1
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v0, -0x1

    .line 124
    iget-object v1, p0, Ljcifs/smb/SmbFileInputStream;->tmp:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Ljcifs/smb/SmbFileInputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 127
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Ljcifs/smb/SmbFileInputStream;->tmp:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

    goto :goto_0
.end method

.method public read([B)I
    .locals 2
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Ljcifs/smb/SmbFileInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 1
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    invoke-virtual {p0, p1, p2, p3}, Ljcifs/smb/SmbFileInputStream;->readDirect([BII)I

    move-result v0

    return v0
.end method

.method public readDirect([BII)I
    .locals 16
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    if-gtz p3, :cond_0

    .line 151
    const/4 v3, 0x0

    .line 202
    :goto_0
    return v3

    .line 153
    :cond_0
    move-object/from16 v0, p0

    iget-wide v12, v0, Ljcifs/smb/SmbFileInputStream;->fp:J

    .line 155
    .local v12, start:J
    move-object/from16 v0, p0

    iget-object v3, v0, Ljcifs/smb/SmbFileInputStream;->tmp:[B

    if-nez v3, :cond_1

    .line 156
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Bad file descriptor"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 159
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    move-object/from16 v0, p0

    iget v4, v0, Ljcifs/smb/SmbFileInputStream;->openFlags:I

    move-object/from16 v0, p0

    iget v5, v0, Ljcifs/smb/SmbFileInputStream;->access:I

    const/16 v7, 0x80

    const/4 v14, 0x0

    invoke-virtual {v3, v4, v5, v7, v14}, Ljcifs/smb/SmbFile;->open(IIII)V

    .line 165
    sget-object v3, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    sget v3, Ljcifs/util/LogStream;->level:I

    const/4 v4, 0x4

    if-lt v3, v4, :cond_2

    .line 166
    sget-object v3, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "read: fid="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    iget v5, v5, Ljcifs/smb/SmbFile;->fid:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",off="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",len="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 168
    :cond_2
    new-instance v10, Ljcifs/smb/SmbComReadAndXResponse;

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-direct {v10, v0, v1}, Ljcifs/smb/SmbComReadAndXResponse;-><init>([BI)V

    .line 170
    .local v10, response:Ljcifs/smb/SmbComReadAndXResponse;
    move-object/from16 v0, p0

    iget-object v3, v0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    iget v3, v3, Ljcifs/smb/SmbFile;->type:I

    const/16 v4, 0x10

    if-ne v3, v4, :cond_3

    .line 171
    const-wide/16 v3, 0x0

    iput-wide v3, v10, Ljcifs/smb/SmbComReadAndXResponse;->responseTimeout:J

    .line 176
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v3}, Ljcifs/smb/SmbFile;->getType()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_6

    move-object/from16 v0, p0

    iget v8, v0, Ljcifs/smb/SmbFileInputStream;->readSizeFile:I

    .line 177
    .local v8, blockSize:I
    :goto_1
    move/from16 v0, p3

    if-le v0, v8, :cond_7

    move v6, v8

    .line 178
    .local v6, r:I
    :goto_2
    sget-object v3, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    sget v3, Ljcifs/util/LogStream;->level:I

    const/4 v4, 0x4

    if-lt v3, v4, :cond_4

    .line 179
    sget-object v3, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "read: len="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",r="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",fp="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-wide v14, v0, Ljcifs/smb/SmbFileInputStream;->fp:J

    invoke-virtual {v4, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 182
    :cond_4
    :try_start_0
    new-instance v2, Ljcifs/smb/SmbComReadAndX;

    move-object/from16 v0, p0

    iget-object v3, v0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    iget v3, v3, Ljcifs/smb/SmbFile;->fid:I

    move-object/from16 v0, p0

    iget-wide v4, v0, Ljcifs/smb/SmbFileInputStream;->fp:J

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Ljcifs/smb/SmbComReadAndX;-><init>(IJILjcifs/smb/ServerMessageBlock;)V

    .line 183
    .local v2, request:Ljcifs/smb/SmbComReadAndX;
    move-object/from16 v0, p0

    iget-object v3, v0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    iget v3, v3, Ljcifs/smb/SmbFile;->type:I

    const/16 v4, 0x10

    if-ne v3, v4, :cond_5

    .line 184
    const/16 v3, 0x400

    iput v3, v2, Ljcifs/smb/SmbComReadAndX;->remaining:I

    iput v3, v2, Ljcifs/smb/SmbComReadAndX;->maxCount:I

    iput v3, v2, Ljcifs/smb/SmbComReadAndX;->minCount:I

    .line 186
    :cond_5
    move-object/from16 v0, p0

    iget-object v3, v0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v3, v2, v10}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    iget v9, v10, Ljcifs/smb/SmbComReadAndXResponse;->dataLength:I

    .local v9, n:I
    if-gtz v9, :cond_a

    .line 195
    move-object/from16 v0, p0

    iget-wide v3, v0, Ljcifs/smb/SmbFileInputStream;->fp:J

    sub-long/2addr v3, v12

    const-wide/16 v14, 0x0

    cmp-long v3, v3, v14

    if-lez v3, :cond_9

    move-object/from16 v0, p0

    iget-wide v3, v0, Ljcifs/smb/SmbFileInputStream;->fp:J

    sub-long/2addr v3, v12

    :goto_3
    long-to-int v3, v3

    goto/16 :goto_0

    .line 176
    .end local v2           #request:Ljcifs/smb/SmbComReadAndX;
    .end local v6           #r:I
    .end local v8           #blockSize:I
    .end local v9           #n:I
    :cond_6
    move-object/from16 v0, p0

    iget v8, v0, Ljcifs/smb/SmbFileInputStream;->readSize:I

    goto :goto_1

    .restart local v8       #blockSize:I
    :cond_7
    move/from16 v6, p3

    .line 177
    goto :goto_2

    .line 187
    .restart local v6       #r:I
    :catch_0
    move-exception v11

    .line 188
    .local v11, se:Ljcifs/smb/SmbException;
    move-object/from16 v0, p0

    iget-object v3, v0, Ljcifs/smb/SmbFileInputStream;->file:Ljcifs/smb/SmbFile;

    iget v3, v3, Ljcifs/smb/SmbFile;->type:I

    const/16 v4, 0x10

    if-ne v3, v4, :cond_8

    .line 189
    invoke-virtual {v11}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v3

    const v4, -0x3ffffeb5

    if-ne v3, v4, :cond_8

    .line 190
    const/4 v3, -0x1

    goto/16 :goto_0

    .line 192
    :cond_8
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Ljcifs/smb/SmbFileInputStream;->seToIoe(Ljcifs/smb/SmbException;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 195
    .end local v11           #se:Ljcifs/smb/SmbException;
    .restart local v2       #request:Ljcifs/smb/SmbComReadAndX;
    .restart local v9       #n:I
    :cond_9
    const-wide/16 v3, -0x1

    goto :goto_3

    .line 197
    :cond_a
    move-object/from16 v0, p0

    iget-wide v3, v0, Ljcifs/smb/SmbFileInputStream;->fp:J

    int-to-long v14, v9

    add-long/2addr v3, v14

    move-object/from16 v0, p0

    iput-wide v3, v0, Ljcifs/smb/SmbFileInputStream;->fp:J

    .line 198
    sub-int p3, p3, v9

    .line 199
    iget v3, v10, Ljcifs/smb/SmbComReadAndXResponse;->off:I

    add-int/2addr v3, v9

    iput v3, v10, Ljcifs/smb/SmbComReadAndXResponse;->off:I

    .line 200
    if-lez p3, :cond_b

    if-eq v9, v6, :cond_3

    .line 202
    :cond_b
    move-object/from16 v0, p0

    iget-wide v3, v0, Ljcifs/smb/SmbFileInputStream;->fp:J

    sub-long/2addr v3, v12

    long-to-int v3, v3

    goto/16 :goto_0
.end method

.method protected seToIoe(Ljcifs/smb/SmbException;)Ljava/io/IOException;
    .locals 3
    .parameter "se"

    .prologue
    .line 88
    move-object v0, p1

    .line 89
    .local v0, ioe:Ljava/io/IOException;
    invoke-virtual {p1}, Ljcifs/smb/SmbException;->getRootCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 90
    .local v1, root:Ljava/lang/Throwable;
    instance-of v2, v1, Ljcifs/util/transport/TransportException;

    if-eqz v2, :cond_0

    move-object v0, v1

    .line 91
    check-cast v0, Ljcifs/util/transport/TransportException;

    move-object v2, v0

    .line 92
    check-cast v2, Ljcifs/util/transport/TransportException;

    invoke-virtual {v2}, Ljcifs/util/transport/TransportException;->getRootCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 94
    :cond_0
    instance-of v2, v1, Ljava/lang/InterruptedException;

    if-eqz v2, :cond_1

    .line 95
    new-instance v0, Ljava/io/InterruptedIOException;

    .end local v0           #ioe:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 96
    .restart local v0       #ioe:Ljava/io/IOException;
    invoke-virtual {v0, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 98
    :cond_1
    return-object v0
.end method

.method public skip(J)J
    .locals 3
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v0, 0x0

    .line 245
    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    .line 246
    iget-wide v0, p0, Ljcifs/smb/SmbFileInputStream;->fp:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Ljcifs/smb/SmbFileInputStream;->fp:J

    .line 249
    .end local p1
    :goto_0
    return-wide p1

    .restart local p1
    :cond_0
    move-wide p1, v0

    goto :goto_0
.end method
