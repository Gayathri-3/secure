.class Ljcifs/smb/SmbComDeleteDirectory;
.super Ljcifs/smb/ServerMessageBlock;
.source "SmbComDeleteDirectory.java"


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "directoryName"

    .prologue
    .line 23
    invoke-direct {p0}, Ljcifs/smb/ServerMessageBlock;-><init>()V

    .line 24
    iput-object p1, p0, Ljcifs/smb/SmbComDeleteDirectory;->path:Ljava/lang/String;

    .line 25
    const/4 v0, 0x1

    iput-byte v0, p0, Ljcifs/smb/SmbComDeleteDirectory;->command:B

    .line 26
    return-void
.end method


# virtual methods
.method readBytesWireFormat([BI)I
    .locals 1
    .parameter "buffer"
    .parameter "bufferIndex"

    .prologue
    .line 43
    const/4 v0, 0x0

    return v0
.end method

.method readParameterWordsWireFormat([BI)I
    .locals 1
    .parameter "buffer"
    .parameter "bufferIndex"

    .prologue
    .line 40
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 46
    new-instance v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SmbComDeleteDirectory["

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    invoke-super {p0}, Ljcifs/smb/ServerMessageBlock;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 48
    const-string v2, ",directoryName="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Ljcifs/smb/SmbComDeleteDirectory;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 46
    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method writeBytesWireFormat([BI)I
    .locals 3
    .parameter "dst"
    .parameter "dstIndex"

    .prologue
    .line 32
    move v1, p2

    .line 34
    .local v1, start:I
    add-int/lit8 v0, p2, 0x1

    .end local p2
    .local v0, dstIndex:I
    const/4 v2, 0x4

    aput-byte v2, p1, p2

    .line 35
    iget-object v2, p0, Ljcifs/smb/SmbComDeleteDirectory;->path:Ljava/lang/String;

    invoke-virtual {p0, v2, p1, v0}, Ljcifs/smb/SmbComDeleteDirectory;->writeString(Ljava/lang/String;[BI)I

    move-result v2

    add-int p2, v0, v2

    .line 37
    .end local v0           #dstIndex:I
    .restart local p2
    sub-int v2, p2, v1

    return v2
.end method

.method writeParameterWordsWireFormat([BI)I
    .locals 1
    .parameter "dst"
    .parameter "dstIndex"

    .prologue
    .line 29
    const/4 v0, 0x0

    return v0
.end method
