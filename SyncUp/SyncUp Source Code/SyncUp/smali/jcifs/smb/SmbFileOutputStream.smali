.class public Ljcifs/smb/SmbFileOutputStream;
.super Ljava/io/OutputStream;
.source "SmbFileOutputStream.java"


# instance fields
.field private access:I

.field private append:Z

.field private file:Ljcifs/smb/SmbFile;

.field private fp:J

.field private modified:Z

.field private openFlags:I

.field private req:Ljcifs/smb/SmbComWrite;

.field private reqx:Ljcifs/smb/SmbComWriteAndX;

.field private rsp:Ljcifs/smb/SmbComWriteResponse;

.field private rspx:Ljcifs/smb/SmbComWriteAndXResponse;

.field private tmp:[B

.field private useNTSmbs:Z

.field private writeSize:I

.field private writeSizeFile:I


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
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ljcifs/smb/SmbFileOutputStream;-><init>(Ljava/lang/String;Z)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 3
    .parameter "url"
    .parameter "shareAccess"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;,
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 121
    new-instance v0, Ljcifs/smb/SmbFile;

    const-string v1, ""

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2, p2}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;I)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Ljcifs/smb/SmbFileOutputStream;-><init>(Ljcifs/smb/SmbFile;Z)V

    .line 122
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .parameter "url"
    .parameter "append"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;,
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 83
    new-instance v0, Ljcifs/smb/SmbFile;

    invoke-direct {v0, p1}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Ljcifs/smb/SmbFileOutputStream;-><init>(Ljcifs/smb/SmbFile;Z)V

    .line 84
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
    .line 68
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ljcifs/smb/SmbFileOutputStream;-><init>(Ljcifs/smb/SmbFile;Z)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljcifs/smb/SmbFile;Z)V
    .locals 1
    .parameter "file"
    .parameter "append"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;,
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 98
    if-eqz p2, :cond_0

    const/16 v0, 0x16

    .line 99
    :goto_0
    invoke-direct {p0, p1, p2, v0}, Ljcifs/smb/SmbFileOutputStream;-><init>(Ljcifs/smb/SmbFile;ZI)V

    .line 100
    return-void

    .line 99
    :cond_0
    const/16 v0, 0x52

    goto :goto_0
.end method

.method constructor <init>(Ljcifs/smb/SmbFile;ZI)V
    .locals 7
    .parameter "file"
    .parameter "append"
    .parameter "openFlags"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;,
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    const v6, 0xffff

    const v5, 0x8000

    .line 124
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 38
    const/4 v2, 0x1

    new-array v2, v2, [B

    iput-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->tmp:[B

    .line 125
    iput-object p1, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    .line 126
    iput-boolean p2, p0, Ljcifs/smb/SmbFileOutputStream;->append:Z

    .line 127
    iput p3, p0, Ljcifs/smb/SmbFileOutputStream;->openFlags:I

    .line 128
    ushr-int/lit8 v2, p3, 0x10

    and-int/2addr v2, v6

    iput v2, p0, Ljcifs/smb/SmbFileOutputStream;->access:I

    .line 129
    if-eqz p2, :cond_0

    .line 131
    :try_start_0
    invoke-virtual {p1}, Ljcifs/smb/SmbFile;->length()J

    move-result-wide v2

    iput-wide v2, p0, Ljcifs/smb/SmbFileOutputStream;->fp:J
    :try_end_0
    .catch Ljcifs/smb/SmbAuthException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_1

    .line 138
    :cond_0
    :goto_0
    instance-of v2, p1, Ljcifs/smb/SmbNamedPipe;

    if-eqz v2, :cond_1

    iget-object v2, p1, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    const-string v3, "\\pipe\\"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 139
    iget-object v2, p1, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    .line 140
    new-instance v2, Ljcifs/smb/TransWaitNamedPipe;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\\pipe"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p1, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljcifs/smb/TransWaitNamedPipe;-><init>(Ljava/lang/String;)V

    .line 141
    new-instance v3, Ljcifs/smb/TransWaitNamedPipeResponse;

    invoke-direct {v3}, Ljcifs/smb/TransWaitNamedPipeResponse;-><init>()V

    .line 140
    invoke-virtual {p1, v2, v3}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 143
    :cond_1
    iget v2, p0, Ljcifs/smb/SmbFileOutputStream;->access:I

    or-int/lit8 v2, v2, 0x2

    const/16 v3, 0x80

    const/4 v4, 0x0

    invoke-virtual {p1, p3, v2, v3, v4}, Ljcifs/smb/SmbFile;->open(IIII)V

    .line 144
    iget v2, p0, Ljcifs/smb/SmbFileOutputStream;->openFlags:I

    and-int/lit8 v2, v2, -0x51

    iput v2, p0, Ljcifs/smb/SmbFileOutputStream;->openFlags:I

    .line 145
    iget-object v2, p1, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v2, v2, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v2, v2, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    iget v2, v2, Ljcifs/smb/SmbTransport;->snd_buf_size:I

    add-int/lit8 v2, v2, -0x46

    iput v2, p0, Ljcifs/smb/SmbFileOutputStream;->writeSize:I

    .line 146
    iget-object v2, p1, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v2, v2, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v2, v2, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    iget-object v2, v2, Ljcifs/smb/SmbTransport;->server:Ljcifs/smb/SmbTransport$ServerData;

    iget v2, v2, Ljcifs/smb/SmbTransport$ServerData;->capabilities:I

    and-int/2addr v2, v5

    if-ne v2, v5, :cond_2

    iget-object v2, p1, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v2, v2, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v2, v2, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    iget-object v2, v2, Ljcifs/smb/SmbTransport;->server:Ljcifs/smb/SmbTransport$ServerData;

    iget-boolean v2, v2, Ljcifs/smb/SmbTransport$ServerData;->signaturesRequired:Z

    if-nez v2, :cond_2

    .line 147
    sget v2, Ljcifs/smb/SmbConstants;->RCV_BUF_SIZE:I

    invoke-static {v2, v6}, Ljava/lang/Math;->min(II)I

    move-result v2

    iput v2, p0, Ljcifs/smb/SmbFileOutputStream;->writeSizeFile:I

    .line 151
    :goto_1
    iget-object v2, p1, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v2, v2, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v2, v2, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Ljcifs/smb/SmbTransport;->hasCapability(I)Z

    move-result v2

    iput-boolean v2, p0, Ljcifs/smb/SmbFileOutputStream;->useNTSmbs:Z

    .line 152
    iget-boolean v2, p0, Ljcifs/smb/SmbFileOutputStream;->useNTSmbs:Z

    if-eqz v2, :cond_3

    .line 153
    new-instance v2, Ljcifs/smb/SmbComWriteAndX;

    invoke-direct {v2}, Ljcifs/smb/SmbComWriteAndX;-><init>()V

    iput-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->reqx:Ljcifs/smb/SmbComWriteAndX;

    .line 154
    new-instance v2, Ljcifs/smb/SmbComWriteAndXResponse;

    invoke-direct {v2}, Ljcifs/smb/SmbComWriteAndXResponse;-><init>()V

    iput-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->rspx:Ljcifs/smb/SmbComWriteAndXResponse;

    .line 159
    :goto_2
    return-void

    .line 132
    :catch_0
    move-exception v0

    .line 133
    .local v0, sae:Ljcifs/smb/SmbAuthException;
    throw v0

    .line 134
    .end local v0           #sae:Ljcifs/smb/SmbAuthException;
    :catch_1
    move-exception v1

    .line 135
    .local v1, se:Ljcifs/smb/SmbException;
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Ljcifs/smb/SmbFileOutputStream;->fp:J

    goto/16 :goto_0

    .line 149
    .end local v1           #se:Ljcifs/smb/SmbException;
    :cond_2
    iget v2, p0, Ljcifs/smb/SmbFileOutputStream;->writeSize:I

    iput v2, p0, Ljcifs/smb/SmbFileOutputStream;->writeSizeFile:I

    goto :goto_1

    .line 156
    :cond_3
    new-instance v2, Ljcifs/smb/SmbComWrite;

    invoke-direct {v2}, Ljcifs/smb/SmbComWrite;-><init>()V

    iput-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->req:Ljcifs/smb/SmbComWrite;

    .line 157
    new-instance v2, Ljcifs/smb/SmbComWriteResponse;

    invoke-direct {v2}, Ljcifs/smb/SmbComWriteResponse;-><init>()V

    iput-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->rsp:Ljcifs/smb/SmbComWriteResponse;

    goto :goto_2
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 169
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->close()V

    .line 170
    iget-boolean v0, p0, Ljcifs/smb/SmbFileOutputStream;->modified:Z

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->refresh()V

    .line 172
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->tmp:[B

    .line 173
    return-void
.end method

.method ensureOpen()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 203
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 204
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    iget v1, p0, Ljcifs/smb/SmbFileOutputStream;->openFlags:I

    iget v2, p0, Ljcifs/smb/SmbFileOutputStream;->access:I

    or-int/lit8 v2, v2, 0x2

    const/16 v3, 0x80

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Ljcifs/smb/SmbFile;->open(IIII)V

    .line 205
    iget-boolean v0, p0, Ljcifs/smb/SmbFileOutputStream;->append:Z

    if-eqz v0, :cond_0

    .line 206
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->length()J

    move-result-wide v0

    iput-wide v0, p0, Ljcifs/smb/SmbFileOutputStream;->fp:J

    .line 209
    :cond_0
    return-void
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->isOpen()Z

    move-result v0

    return v0
.end method

.method public write(I)V
    .locals 3
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 182
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->tmp:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 183
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->tmp:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Ljcifs/smb/SmbFileOutputStream;->write([BII)V

    .line 184
    return-void
.end method

.method public write([B)V
    .locals 2
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 194
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Ljcifs/smb/SmbFileOutputStream;->write([BII)V

    .line 195
    return-void
.end method

.method public write([BII)V
    .locals 4
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    instance-of v0, v0, Ljcifs/smb/SmbNamedPipe;

    if-eqz v0, :cond_0

    .line 220
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    new-instance v1, Ljcifs/smb/TransWaitNamedPipe;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\\pipe"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    iget-object v3, v3, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljcifs/smb/TransWaitNamedPipe;-><init>(Ljava/lang/String;)V

    .line 221
    new-instance v2, Ljcifs/smb/TransWaitNamedPipeResponse;

    invoke-direct {v2}, Ljcifs/smb/TransWaitNamedPipeResponse;-><init>()V

    .line 220
    invoke-virtual {v0, v1, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 223
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Ljcifs/smb/SmbFileOutputStream;->writeDirect([BIII)V

    .line 224
    return-void
.end method

.method public writeDirect([BIII)V
    .locals 10
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .parameter "flags"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 229
    if-gtz p3, :cond_0

    .line 266
    :goto_0
    return-void

    .line 233
    :cond_0
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->tmp:[B

    if-nez v0, :cond_1

    .line 234
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Bad file descriptor"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 236
    :cond_1
    invoke-virtual {p0}, Ljcifs/smb/SmbFileOutputStream;->ensureOpen()V

    .line 238
    sget-object v0, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    sget v0, Ljcifs/util/LogStream;->level:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_2

    .line 239
    sget-object v0, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "write: fid="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    iget v2, v2, Ljcifs/smb/SmbFile;->fid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",off="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 240
    :cond_2
    iput-boolean v9, p0, Ljcifs/smb/SmbFileOutputStream;->modified:Z

    .line 243
    :cond_3
    iget v0, p0, Ljcifs/smb/SmbFileOutputStream;->writeSize:I

    if-le p3, v0, :cond_4

    iget v7, p0, Ljcifs/smb/SmbFileOutputStream;->writeSize:I

    .line 244
    .local v7, w:I
    :goto_1
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->getType()I

    move-result v0

    if-ne v0, v9, :cond_5

    iget v8, p0, Ljcifs/smb/SmbFileOutputStream;->writeSizeFile:I

    .line 245
    .local v8, blockSize:I
    :goto_2
    if-le p3, v8, :cond_6

    move v7, v8

    .line 246
    :goto_3
    iget-boolean v0, p0, Ljcifs/smb/SmbFileOutputStream;->useNTSmbs:Z

    if-eqz v0, :cond_8

    .line 247
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->reqx:Ljcifs/smb/SmbComWriteAndX;

    iget-object v1, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    iget v1, v1, Ljcifs/smb/SmbFile;->fid:I

    iget-wide v2, p0, Ljcifs/smb/SmbFileOutputStream;->fp:J

    sub-int v4, p3, v7

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v7}, Ljcifs/smb/SmbComWriteAndX;->setParam(IJI[BII)V

    .line 248
    and-int/lit8 v0, p4, 0x1

    if-eqz v0, :cond_7

    .line 249
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->reqx:Ljcifs/smb/SmbComWriteAndX;

    iget-object v1, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    iget v1, v1, Ljcifs/smb/SmbFile;->fid:I

    iget-wide v2, p0, Ljcifs/smb/SmbFileOutputStream;->fp:J

    move v4, p3

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v7}, Ljcifs/smb/SmbComWriteAndX;->setParam(IJI[BII)V

    .line 250
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->reqx:Ljcifs/smb/SmbComWriteAndX;

    const/16 v1, 0x8

    iput v1, v0, Ljcifs/smb/SmbComWriteAndX;->writeMode:I

    .line 254
    :goto_4
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    iget-object v1, p0, Ljcifs/smb/SmbFileOutputStream;->reqx:Ljcifs/smb/SmbComWriteAndX;

    iget-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->rspx:Ljcifs/smb/SmbComWriteAndXResponse;

    invoke-virtual {v0, v1, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 255
    iget-wide v0, p0, Ljcifs/smb/SmbFileOutputStream;->fp:J

    iget-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->rspx:Ljcifs/smb/SmbComWriteAndXResponse;

    iget-wide v2, v2, Ljcifs/smb/SmbComWriteAndXResponse;->count:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Ljcifs/smb/SmbFileOutputStream;->fp:J

    .line 256
    int-to-long v0, p3

    iget-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->rspx:Ljcifs/smb/SmbComWriteAndXResponse;

    iget-wide v2, v2, Ljcifs/smb/SmbComWriteAndXResponse;->count:J

    sub-long/2addr v0, v2

    long-to-int p3, v0

    .line 257
    int-to-long v0, p2

    iget-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->rspx:Ljcifs/smb/SmbComWriteAndXResponse;

    iget-wide v2, v2, Ljcifs/smb/SmbComWriteAndXResponse;->count:J

    add-long/2addr v0, v2

    long-to-int p2, v0

    .line 242
    :goto_5
    if-gtz p3, :cond_3

    goto/16 :goto_0

    .end local v7           #w:I
    .end local v8           #blockSize:I
    :cond_4
    move v7, p3

    .line 243
    goto :goto_1

    .line 244
    .restart local v7       #w:I
    :cond_5
    iget v8, p0, Ljcifs/smb/SmbFileOutputStream;->writeSize:I

    goto :goto_2

    .restart local v8       #blockSize:I
    :cond_6
    move v7, p3

    .line 245
    goto :goto_3

    .line 252
    :cond_7
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->reqx:Ljcifs/smb/SmbComWriteAndX;

    const/4 v1, 0x0

    iput v1, v0, Ljcifs/smb/SmbComWriteAndX;->writeMode:I

    goto :goto_4

    .line 259
    :cond_8
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->req:Ljcifs/smb/SmbComWrite;

    iget-object v1, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    iget v1, v1, Ljcifs/smb/SmbFile;->fid:I

    iget-wide v2, p0, Ljcifs/smb/SmbFileOutputStream;->fp:J

    sub-int v4, p3, v7

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v7}, Ljcifs/smb/SmbComWrite;->setParam(IJI[BII)V

    .line 260
    iget-wide v0, p0, Ljcifs/smb/SmbFileOutputStream;->fp:J

    iget-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->rsp:Ljcifs/smb/SmbComWriteResponse;

    iget-wide v2, v2, Ljcifs/smb/SmbComWriteResponse;->count:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Ljcifs/smb/SmbFileOutputStream;->fp:J

    .line 261
    int-to-long v0, p3

    iget-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->rsp:Ljcifs/smb/SmbComWriteResponse;

    iget-wide v2, v2, Ljcifs/smb/SmbComWriteResponse;->count:J

    sub-long/2addr v0, v2

    long-to-int p3, v0

    .line 262
    int-to-long v0, p2

    iget-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->rsp:Ljcifs/smb/SmbComWriteResponse;

    iget-wide v2, v2, Ljcifs/smb/SmbComWriteResponse;->count:J

    add-long/2addr v0, v2

    long-to-int p2, v0

    .line 263
    iget-object v0, p0, Ljcifs/smb/SmbFileOutputStream;->file:Ljcifs/smb/SmbFile;

    iget-object v1, p0, Ljcifs/smb/SmbFileOutputStream;->req:Ljcifs/smb/SmbComWrite;

    iget-object v2, p0, Ljcifs/smb/SmbFileOutputStream;->rsp:Ljcifs/smb/SmbComWriteResponse;

    invoke-virtual {v0, v1, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    goto :goto_5
.end method
