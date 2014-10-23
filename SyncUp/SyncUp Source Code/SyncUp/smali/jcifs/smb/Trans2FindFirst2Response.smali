.class Ljcifs/smb/Trans2FindFirst2Response;
.super Ljcifs/smb/SmbComTransactionResponse;
.source "Trans2FindFirst2Response.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;
    }
.end annotation


# static fields
.field static final SMB_FILE_BOTH_DIRECTORY_INFO:I = 0x104

.field static final SMB_FILE_NAMES_INFO:I = 0x103

.field static final SMB_FIND_FILE_DIRECTORY_INFO:I = 0x101

.field static final SMB_FIND_FILE_FULL_DIRECTORY_INFO:I = 0x102

.field static final SMB_INFO_QUERY_EAS_FROM_LIST:I = 0x3

.field static final SMB_INFO_QUERY_EA_SIZE:I = 0x2

.field static final SMB_INFO_STANDARD:I = 0x1


# instance fields
.field eaErrorOffset:I

.field isEndOfSearch:Z

.field lastName:Ljava/lang/String;

.field lastNameBufferIndex:I

.field lastNameOffset:I

.field resumeKey:I

.field sid:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 98
    invoke-direct {p0}, Ljcifs/smb/SmbComTransactionResponse;-><init>()V

    .line 99
    const/16 v0, 0x32

    iput-byte v0, p0, Ljcifs/smb/Trans2FindFirst2Response;->command:B

    .line 100
    const/4 v0, 0x1

    iput-byte v0, p0, Ljcifs/smb/Trans2FindFirst2Response;->subCommand:B

    .line 101
    return-void
.end method


# virtual methods
.method readDataWireFormat([BII)I
    .locals 5
    .parameter "buffer"
    .parameter "bufferIndex"
    .parameter "len"

    .prologue
    .line 168
    move v2, p2

    .line 171
    .local v2, start:I
    iget v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->lastNameOffset:I

    add-int/2addr v3, p2

    iput v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->lastNameBufferIndex:I

    .line 173
    iget v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->numEntries:I

    new-array v3, v3, [Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;

    iput-object v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->results:[Ljcifs/smb/FileEntry;

    .line 174
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->numEntries:I

    if-lt v1, v3, :cond_0

    .line 219
    iget v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->dataCount:I

    return v3

    .line 175
    :cond_0
    iget-object v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->results:[Ljcifs/smb/FileEntry;

    new-instance v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;

    invoke-direct {v0, p0}, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;-><init>(Ljcifs/smb/Trans2FindFirst2Response;)V

    .local v0, e:Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;
    aput-object v0, v3, v1

    .line 177
    invoke-static {p1, p2}, Ljcifs/smb/Trans2FindFirst2Response;->readInt4([BI)I

    move-result v3

    iput v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->nextEntryOffset:I

    .line 178
    add-int/lit8 v3, p2, 0x4

    invoke-static {p1, v3}, Ljcifs/smb/Trans2FindFirst2Response;->readInt4([BI)I

    move-result v3

    iput v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->fileIndex:I

    .line 179
    add-int/lit8 v3, p2, 0x8

    invoke-static {p1, v3}, Ljcifs/smb/Trans2FindFirst2Response;->readTime([BI)J

    move-result-wide v3

    iput-wide v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->creationTime:J

    .line 181
    add-int/lit8 v3, p2, 0x18

    invoke-static {p1, v3}, Ljcifs/smb/Trans2FindFirst2Response;->readTime([BI)J

    move-result-wide v3

    iput-wide v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->lastWriteTime:J

    .line 183
    add-int/lit8 v3, p2, 0x28

    invoke-static {p1, v3}, Ljcifs/smb/Trans2FindFirst2Response;->readInt8([BI)J

    move-result-wide v3

    iput-wide v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->endOfFile:J

    .line 185
    add-int/lit8 v3, p2, 0x38

    invoke-static {p1, v3}, Ljcifs/smb/Trans2FindFirst2Response;->readInt4([BI)I

    move-result v3

    iput v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->extFileAttributes:I

    .line 186
    add-int/lit8 v3, p2, 0x3c

    invoke-static {p1, v3}, Ljcifs/smb/Trans2FindFirst2Response;->readInt4([BI)I

    move-result v3

    iput v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->fileNameLength:I

    .line 194
    add-int/lit8 v3, p2, 0x5e

    iget v4, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->fileNameLength:I

    invoke-virtual {p0, p1, v3, v4}, Ljcifs/smb/Trans2FindFirst2Response;->readString([BII)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->filename:Ljava/lang/String;

    .line 204
    iget v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->lastNameBufferIndex:I

    if-lt v3, p2, :cond_2

    iget v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->nextEntryOffset:I

    if-eqz v3, :cond_1

    .line 205
    iget v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->lastNameBufferIndex:I

    iget v4, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->nextEntryOffset:I

    add-int/2addr v4, p2

    if-ge v3, v4, :cond_2

    .line 206
    :cond_1
    iget-object v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->filename:Ljava/lang/String;

    iput-object v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->lastName:Ljava/lang/String;

    .line 207
    iget v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->fileIndex:I

    iput v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->resumeKey:I

    .line 210
    :cond_2
    iget v3, v0, Ljcifs/smb/Trans2FindFirst2Response$SmbFindFileBothDirectoryInfo;->nextEntryOffset:I

    add-int/2addr p2, v3

    .line 174
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method readParametersWireFormat([BII)I
    .locals 3
    .parameter "buffer"
    .parameter "bufferIndex"
    .parameter "len"

    .prologue
    const/4 v1, 0x1

    .line 150
    move v0, p2

    .line 152
    .local v0, start:I
    iget-byte v2, p0, Ljcifs/smb/Trans2FindFirst2Response;->subCommand:B

    if-ne v2, v1, :cond_0

    .line 153
    invoke-static {p1, p2}, Ljcifs/smb/Trans2FindFirst2Response;->readInt2([BI)I

    move-result v2

    iput v2, p0, Ljcifs/smb/Trans2FindFirst2Response;->sid:I

    .line 154
    add-int/lit8 p2, p2, 0x2

    .line 156
    :cond_0
    invoke-static {p1, p2}, Ljcifs/smb/Trans2FindFirst2Response;->readInt2([BI)I

    move-result v2

    iput v2, p0, Ljcifs/smb/Trans2FindFirst2Response;->numEntries:I

    .line 157
    add-int/lit8 p2, p2, 0x2

    .line 158
    aget-byte v2, p1, p2

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v1, :cond_1

    :goto_0
    iput-boolean v1, p0, Ljcifs/smb/Trans2FindFirst2Response;->isEndOfSearch:Z

    .line 159
    add-int/lit8 p2, p2, 0x2

    .line 160
    invoke-static {p1, p2}, Ljcifs/smb/Trans2FindFirst2Response;->readInt2([BI)I

    move-result v1

    iput v1, p0, Ljcifs/smb/Trans2FindFirst2Response;->eaErrorOffset:I

    .line 161
    add-int/lit8 p2, p2, 0x2

    .line 162
    invoke-static {p1, p2}, Ljcifs/smb/Trans2FindFirst2Response;->readInt2([BI)I

    move-result v1

    iput v1, p0, Ljcifs/smb/Trans2FindFirst2Response;->lastNameOffset:I

    .line 163
    add-int/lit8 p2, p2, 0x2

    .line 165
    sub-int v1, p2, v0

    return v1

    .line 158
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method readSetupWireFormat([BII)I
    .locals 1
    .parameter "buffer"
    .parameter "bufferIndex"
    .parameter "len"

    .prologue
    .line 147
    const/4 v0, 0x0

    return v0
.end method

.method readString([BII)Ljava/lang/String;
    .locals 4
    .parameter "src"
    .parameter "srcIndex"
    .parameter "len"

    .prologue
    const/4 v3, 0x1

    .line 104
    const/4 v0, 0x0

    .line 106
    .local v0, str:Ljava/lang/String;
    :try_start_0
    iget-boolean v2, p0, Ljcifs/smb/Trans2FindFirst2Response;->useUnicode:Z

    if-eqz v2, :cond_1

    .line 108
    if-le p3, v3, :cond_0

    add-int v2, p2, p3

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, p1, v2

    if-nez v2, :cond_0

    add-int v2, p2, p3

    add-int/lit8 v2, v2, -0x2

    aget-byte v2, p1, v2

    if-nez v2, :cond_0

    .line 109
    add-int/lit8 p3, p3, -0x2

    .line 110
    :cond_0
    new-instance v0, Ljava/lang/String;

    .end local v0           #str:Ljava/lang/String;
    const-string v2, "UTF-16LE"

    invoke-direct {v0, p1, p2, p3, v2}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 135
    .restart local v0       #str:Ljava/lang/String;
    :goto_0
    return-object v0

    .line 125
    :cond_1
    if-lez p3, :cond_2

    add-int v2, p2, p3

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, p1, v2

    if-nez v2, :cond_2

    .line 126
    add-int/lit8 p3, p3, -0x1

    .line 128
    :cond_2
    new-instance v0, Ljava/lang/String;

    .end local v0           #str:Ljava/lang/String;
    sget-object v2, Ljcifs/smb/ServerMessageBlock;->OEM_ENCODING:Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3, v2}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v0       #str:Ljava/lang/String;
    goto :goto_0

    .line 130
    .end local v0           #str:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 131
    .local v1, uee:Ljava/io/UnsupportedEncodingException;
    sget-object v2, Ljcifs/smb/Trans2FindFirst2Response;->log:Ljcifs/util/LogStream;

    sget v2, Ljcifs/util/LogStream;->level:I

    if-le v2, v3, :cond_3

    .line 132
    sget-object v2, Ljcifs/smb/Trans2FindFirst2Response;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v2}, Ljava/io/UnsupportedEncodingException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 133
    :cond_3
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 223
    iget-byte v1, p0, Ljcifs/smb/Trans2FindFirst2Response;->subCommand:B

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 224
    const-string v0, "Trans2FindFirst2Response["

    .line 228
    .local v0, c:Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-super {p0}, Ljcifs/smb/SmbComTransactionResponse;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 229
    const-string v3, ",sid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->sid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 230
    const-string v3, ",searchCount="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->numEntries:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 231
    const-string v3, ",isEndOfSearch="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->isEndOfSearch:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 232
    const-string v3, ",eaErrorOffset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->eaErrorOffset:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 233
    const-string v3, ",lastNameOffset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->lastNameOffset:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 234
    const-string v3, ",lastName="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Ljcifs/smb/Trans2FindFirst2Response;->lastName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 228
    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    return-object v1

    .line 226
    .end local v0           #c:Ljava/lang/String;
    :cond_0
    const-string v0, "Trans2FindNext2Response["

    .restart local v0       #c:Ljava/lang/String;
    goto :goto_0
.end method

.method writeDataWireFormat([BI)I
    .locals 1
    .parameter "dst"
    .parameter "dstIndex"

    .prologue
    .line 144
    const/4 v0, 0x0

    return v0
.end method

.method writeParametersWireFormat([BI)I
    .locals 1
    .parameter "dst"
    .parameter "dstIndex"

    .prologue
    .line 141
    const/4 v0, 0x0

    return v0
.end method

.method writeSetupWireFormat([BI)I
    .locals 1
    .parameter "dst"
    .parameter "dstIndex"

    .prologue
    .line 138
    const/4 v0, 0x0

    return v0
.end method
