.class Ljcifs/smb/SmbComQueryInformationResponse;
.super Ljcifs/smb/ServerMessageBlock;
.source "SmbComQueryInformationResponse.java"

# interfaces
.implements Ljcifs/smb/Info;


# instance fields
.field private fileAttributes:I

.field private fileSize:I

.field private lastWriteTime:J

.field private serverTimeZoneOffset:J


# direct methods
.method constructor <init>(J)V
    .locals 3
    .parameter "serverTimeZoneOffset"

    .prologue
    const/4 v2, 0x0

    .line 32
    invoke-direct {p0}, Ljcifs/smb/ServerMessageBlock;-><init>()V

    .line 27
    iput v2, p0, Ljcifs/smb/SmbComQueryInformationResponse;->fileAttributes:I

    .line 28
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Ljcifs/smb/SmbComQueryInformationResponse;->lastWriteTime:J

    .line 30
    iput v2, p0, Ljcifs/smb/SmbComQueryInformationResponse;->fileSize:I

    .line 33
    iput-wide p1, p0, Ljcifs/smb/SmbComQueryInformationResponse;->serverTimeZoneOffset:J

    .line 34
    const/16 v0, 0x8

    iput-byte v0, p0, Ljcifs/smb/SmbComQueryInformationResponse;->command:B

    .line 35
    return-void
.end method


# virtual methods
.method public getAttributes()I
    .locals 1

    .prologue
    .line 38
    iget v0, p0, Ljcifs/smb/SmbComQueryInformationResponse;->fileAttributes:I

    return v0
.end method

.method public getCreateTime()J
    .locals 4

    .prologue
    .line 41
    iget-wide v0, p0, Ljcifs/smb/SmbComQueryInformationResponse;->lastWriteTime:J

    iget-wide v2, p0, Ljcifs/smb/SmbComQueryInformationResponse;->serverTimeZoneOffset:J

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public getLastWriteTime()J
    .locals 4

    .prologue
    .line 44
    iget-wide v0, p0, Ljcifs/smb/SmbComQueryInformationResponse;->lastWriteTime:J

    iget-wide v2, p0, Ljcifs/smb/SmbComQueryInformationResponse;->serverTimeZoneOffset:J

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 47
    iget v0, p0, Ljcifs/smb/SmbComQueryInformationResponse;->fileSize:I

    int-to-long v0, v0

    return-wide v0
.end method

.method readBytesWireFormat([BI)I
    .locals 1
    .parameter "buffer"
    .parameter "bufferIndex"

    .prologue
    .line 67
    const/4 v0, 0x0

    return v0
.end method

.method readParameterWordsWireFormat([BI)I
    .locals 2
    .parameter "buffer"
    .parameter "bufferIndex"

    .prologue
    .line 56
    iget v0, p0, Ljcifs/smb/SmbComQueryInformationResponse;->wordCount:I

    if-nez v0, :cond_0

    .line 57
    const/4 v0, 0x0

    .line 64
    :goto_0
    return v0

    .line 59
    :cond_0
    invoke-static {p1, p2}, Ljcifs/smb/SmbComQueryInformationResponse;->readInt2([BI)I

    move-result v0

    iput v0, p0, Ljcifs/smb/SmbComQueryInformationResponse;->fileAttributes:I

    .line 60
    add-int/lit8 p2, p2, 0x2

    .line 61
    invoke-static {p1, p2}, Ljcifs/smb/SmbComQueryInformationResponse;->readUTime([BI)J

    move-result-wide v0

    iput-wide v0, p0, Ljcifs/smb/SmbComQueryInformationResponse;->lastWriteTime:J

    .line 62
    add-int/lit8 p2, p2, 0x4

    .line 63
    invoke-static {p1, p2}, Ljcifs/smb/SmbComQueryInformationResponse;->readInt4([BI)I

    move-result v0

    iput v0, p0, Ljcifs/smb/SmbComQueryInformationResponse;->fileSize:I

    .line 64
    const/16 v0, 0x14

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 70
    new-instance v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SmbComQueryInformationResponse["

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    invoke-super {p0}, Ljcifs/smb/ServerMessageBlock;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 72
    const-string v2, ",fileAttributes=0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Ljcifs/smb/SmbComQueryInformationResponse;->fileAttributes:I

    const/4 v3, 0x4

    invoke-static {v2, v3}, Ljcifs/util/Hexdump;->toHexString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 73
    const-string v2, ",lastWriteTime="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    iget-wide v3, p0, Ljcifs/smb/SmbComQueryInformationResponse;->lastWriteTime:J

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 74
    const-string v2, ",fileSize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Ljcifs/smb/SmbComQueryInformationResponse;->fileSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 70
    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method writeBytesWireFormat([BI)I
    .locals 1
    .parameter "dst"
    .parameter "dstIndex"

    .prologue
    .line 53
    const/4 v0, 0x0

    return v0
.end method

.method writeParameterWordsWireFormat([BI)I
    .locals 1
    .parameter "dst"
    .parameter "dstIndex"

    .prologue
    .line 50
    const/4 v0, 0x0

    return v0
.end method
