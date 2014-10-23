.class public Lcom/mpatric/mp3agic/ID3v2Frame;
.super Ljava/lang/Object;
.source "ID3v2Frame.java"


# static fields
.field private static final COMPRESSION_BIT:I = 0x3

.field private static final DATA_LENGTH_INDICATOR_BIT:I = 0x0

.field protected static final DATA_LENGTH_OFFSET:I = 0x4

.field private static final ENCRYPTION_BIT:I = 0x2

.field private static final FLAGS1_OFFSET:I = 0x8

.field private static final FLAGS2_OFFSET:I = 0x9

.field private static final GROUP_BIT:I = 0x6

.field private static final HEADER_LENGTH:I = 0xa

.field private static final ID_LENGTH:I = 0x4

.field private static final ID_OFFSET:I = 0x0

.field private static final PRESERVE_FILE_BIT:I = 0x5

.field private static final PRESERVE_TAG_BIT:I = 0x6

.field private static final READ_ONLY_BIT:I = 0x4

.field private static final UNSYNCHRONISATION_BIT:I = 0x1


# instance fields
.field private compression:Z

.field protected data:[B

.field protected dataLength:I

.field private dataLengthIndicator:Z

.field private encryption:Z

.field private group:Z

.field protected id:Ljava/lang/String;

.field private preserveFile:Z

.field private preserveTag:Z

.field private readOnly:Z

.field private unsynchronisation:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 2
    .parameter "id"
    .parameter "data"

    .prologue
    const/4 v1, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    .line 25
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveTag:Z

    .line 26
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveFile:Z

    .line 27
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->readOnly:Z

    .line 28
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->group:Z

    .line 29
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->compression:Z

    .line 30
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->encryption:Z

    .line 31
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->unsynchronisation:Z

    .line 32
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLengthIndicator:Z

    .line 39
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    .line 40
    iput-object p2, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    .line 41
    array-length v0, p2

    iput v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    .line 42
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 2
    .parameter "buffer"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    .line 25
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveTag:Z

    .line 26
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveFile:Z

    .line 27
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->readOnly:Z

    .line 28
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->group:Z

    .line 29
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->compression:Z

    .line 30
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->encryption:Z

    .line 31
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->unsynchronisation:Z

    .line 32
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLengthIndicator:Z

    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2Frame;->unpackFrame([BI)V

    .line 36
    return-void
.end method

.method private packFlags()[B
    .locals 8

    .prologue
    const/4 v7, 0x6

    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 106
    new-array v0, v6, [B

    .line 107
    .local v0, bytes:[B
    aget-byte v1, v0, v5

    iget-boolean v2, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveTag:Z

    invoke-static {v1, v7, v2}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, v0, v5

    .line 108
    aget-byte v1, v0, v5

    const/4 v2, 0x5

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveFile:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, v0, v5

    .line 109
    aget-byte v1, v0, v5

    const/4 v2, 0x4

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->readOnly:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, v0, v5

    .line 110
    aget-byte v1, v0, v4

    iget-boolean v2, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->group:Z

    invoke-static {v1, v7, v2}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, v0, v4

    .line 111
    aget-byte v1, v0, v4

    const/4 v2, 0x3

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->compression:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, v0, v4

    .line 112
    aget-byte v1, v0, v4

    iget-boolean v2, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->encryption:Z

    invoke-static {v1, v6, v2}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, v0, v4

    .line 113
    aget-byte v1, v0, v4

    iget-boolean v2, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->unsynchronisation:Z

    invoke-static {v1, v4, v2}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, v0, v4

    .line 114
    aget-byte v1, v0, v4

    iget-boolean v2, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLengthIndicator:Z

    invoke-static {v1, v5, v2}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, v0, v4

    .line 115
    return-object v0
.end method

.method private packHeader([BI)V
    .locals 4
    .parameter "bytes"
    .parameter "i"

    .prologue
    const/4 v2, 0x4

    const/4 v3, 0x0

    .line 96
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v0, v3, v1, p1, v3}, Lcom/mpatric/mp3agic/BufferTools;->stringIntoByteBuffer(Ljava/lang/String;II[BI)V

    .line 97
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/ID3v2Frame;->packDataLength()[B

    move-result-object v0

    invoke-static {v0, v3, v2, p1, v2}, Lcom/mpatric/mp3agic/BufferTools;->copyIntoByteBuffer([BII[BI)V

    .line 98
    invoke-direct {p0}, Lcom/mpatric/mp3agic/ID3v2Frame;->packFlags()[B

    move-result-object v0

    const/4 v1, 0x2

    const/16 v2, 0x8

    invoke-static {v0, v3, v1, p1, v2}, Lcom/mpatric/mp3agic/BufferTools;->copyIntoByteBuffer([BII[BI)V

    .line 99
    return-void
.end method

.method private unpackFlags([BI)V
    .locals 3
    .parameter "buffer"
    .parameter "offset"

    .prologue
    const/4 v2, 0x6

    .line 62
    add-int/lit8 v0, p2, 0x8

    aget-byte v0, p1, v0

    invoke-static {v0, v2}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveTag:Z

    .line 63
    add-int/lit8 v0, p2, 0x8

    aget-byte v0, p1, v0

    const/4 v1, 0x5

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveFile:Z

    .line 64
    add-int/lit8 v0, p2, 0x8

    aget-byte v0, p1, v0

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->readOnly:Z

    .line 65
    add-int/lit8 v0, p2, 0x9

    aget-byte v0, p1, v0

    invoke-static {v0, v2}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->group:Z

    .line 66
    add-int/lit8 v0, p2, 0x9

    aget-byte v0, p1, v0

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->compression:Z

    .line 67
    add-int/lit8 v0, p2, 0x9

    aget-byte v0, p1, v0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->encryption:Z

    .line 68
    add-int/lit8 v0, p2, 0x9

    aget-byte v0, p1, v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->unsynchronisation:Z

    .line 69
    add-int/lit8 v0, p2, 0x9

    aget-byte v0, p1, v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLengthIndicator:Z

    .line 70
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 173
    instance-of v3, p1, Lcom/mpatric/mp3agic/ID3v2Frame;

    if-nez v3, :cond_1

    .line 193
    :cond_0
    :goto_0
    return v1

    .line 174
    :cond_1
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 175
    check-cast v0, Lcom/mpatric/mp3agic/ID3v2Frame;

    .line 176
    .local v0, other:Lcom/mpatric/mp3agic/ID3v2Frame;
    iget v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    iget v4, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    if-ne v3, v4, :cond_0

    .line 177
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveTag:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveTag:Z

    if-ne v3, v4, :cond_0

    .line 178
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveFile:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveFile:Z

    if-ne v3, v4, :cond_0

    .line 179
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->readOnly:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->readOnly:Z

    if-ne v3, v4, :cond_0

    .line 180
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->group:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->group:Z

    if-ne v3, v4, :cond_0

    .line 181
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->compression:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->compression:Z

    if-ne v3, v4, :cond_0

    .line 182
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->encryption:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->encryption:Z

    if-ne v3, v4, :cond_0

    .line 183
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->unsynchronisation:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->encryption:Z

    if-ne v3, v4, :cond_0

    .line 184
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLengthIndicator:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLengthIndicator:Z

    if-ne v3, v4, :cond_0

    .line 185
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    if-nez v3, :cond_5

    .line 186
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 189
    :cond_3
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    if-nez v3, :cond_6

    .line 190
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    if-nez v3, :cond_0

    :cond_4
    move v1, v2

    .line 193
    goto :goto_0

    .line 187
    :cond_5
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 188
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    iget-object v4, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_0

    .line 191
    :cond_6
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    if-eqz v3, :cond_0

    .line 192
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    iget-object v4, v0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_4

    goto :goto_0
.end method

.method public getData()[B
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    return-object v0
.end method

.method public getDataLength()I
    .locals 1

    .prologue
    .line 123
    iget v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    return v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getLength()I
    .locals 1

    .prologue
    .line 127
    iget v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    add-int/lit8 v0, v0, 0xa

    return v0
.end method

.method public hasCompression()Z
    .locals 1

    .prologue
    .line 145
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->compression:Z

    return v0
.end method

.method public hasDataLengthIndicator()Z
    .locals 1

    .prologue
    .line 141
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLengthIndicator:Z

    return v0
.end method

.method public hasEncryption()Z
    .locals 1

    .prologue
    .line 149
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->encryption:Z

    return v0
.end method

.method public hasGroup()Z
    .locals 1

    .prologue
    .line 153
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->group:Z

    return v0
.end method

.method public hasPreserveFile()Z
    .locals 1

    .prologue
    .line 157
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveFile:Z

    return v0
.end method

.method public hasPreserveTag()Z
    .locals 1

    .prologue
    .line 161
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->preserveTag:Z

    return v0
.end method

.method public hasUnsynchronisation()Z
    .locals 1

    .prologue
    .line 169
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->unsynchronisation:Z

    return v0
.end method

.method public isReadOnly()Z
    .locals 1

    .prologue
    .line 165
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->readOnly:Z

    return v0
.end method

.method protected packDataLength()[B
    .locals 1

    .prologue
    .line 102
    iget v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    invoke-static {v0}, Lcom/mpatric/mp3agic/BufferTools;->packInteger(I)[B

    move-result-object v0

    return-object v0
.end method

.method public packFrame([BI)V
    .locals 4
    .parameter "bytes"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-direct {p0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2Frame;->packHeader([BI)V

    .line 92
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    array-length v2, v2

    add-int/lit8 v3, p2, 0xa

    invoke-static {v0, v1, v2, p1, v3}, Lcom/mpatric/mp3agic/BufferTools;->copyIntoByteBuffer([BII[BI)V

    .line 93
    return-void
.end method

.method protected sanityCheckUnpackedHeader()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 73
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 78
    return-void

    .line 74
    :cond_0
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x41

    if-lt v1, v2, :cond_1

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x5a

    if-le v1, v2, :cond_3

    :cond_1
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x30

    if-lt v1, v2, :cond_2

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x39

    if-le v1, v2, :cond_3

    .line 75
    :cond_2
    new-instance v1, Lcom/mpatric/mp3agic/InvalidDataException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Not a valid frame - invalid tag "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mpatric/mp3agic/InvalidDataException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 73
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public setData([B)V
    .locals 1
    .parameter "data"

    .prologue
    .line 135
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    .line 136
    if-nez p1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    .line 138
    :goto_0
    return-void

    .line 137
    :cond_0
    array-length v0, p1

    iput v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    goto :goto_0
.end method

.method public toBytes([BI)V
    .locals 0
    .parameter "bytes"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-virtual {p0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2Frame;->packFrame([BI)V

    .line 88
    return-void
.end method

.method public toBytes()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/ID3v2Frame;->getLength()I

    move-result v1

    new-array v0, v1, [B

    .line 82
    .local v0, bytes:[B
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mpatric/mp3agic/ID3v2Frame;->packFrame([BI)V

    .line 83
    return-object v0
.end method

.method protected unpackDataLength([BI)V
    .locals 4
    .parameter "buffer"
    .parameter "offset"

    .prologue
    .line 58
    add-int/lit8 v0, p2, 0x4

    aget-byte v0, p1, v0

    add-int/lit8 v1, p2, 0x4

    add-int/lit8 v1, v1, 0x1

    aget-byte v1, p1, v1

    add-int/lit8 v2, p2, 0x4

    add-int/lit8 v2, v2, 0x2

    aget-byte v2, p1, v2

    add-int/lit8 v3, p2, 0x4

    add-int/lit8 v3, v3, 0x3

    aget-byte v3, p1, v3

    invoke-static {v0, v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->unpackInteger(BBBB)I

    move-result v0

    iput v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    .line 59
    return-void
.end method

.method protected unpackFrame([BI)V
    .locals 2
    .parameter "buffer"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2Frame;->unpackHeader([BI)I

    move-result v0

    .line 46
    .local v0, dataOffset:I
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/ID3v2Frame;->sanityCheckUnpackedHeader()V

    .line 47
    iget v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->dataLength:I

    invoke-static {p1, v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->copyBuffer([BII)[B

    move-result-object v1

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->data:[B

    .line 48
    return-void
.end method

.method protected unpackHeader([BI)I
    .locals 2
    .parameter "buffer"
    .parameter "offset"

    .prologue
    .line 51
    add-int/lit8 v0, p2, 0x0

    const/4 v1, 0x4

    invoke-static {p1, v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mpatric/mp3agic/ID3v2Frame;->id:Ljava/lang/String;

    .line 52
    invoke-virtual {p0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2Frame;->unpackDataLength([BI)V

    .line 53
    invoke-direct {p0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2Frame;->unpackFlags([BI)V

    .line 54
    add-int/lit8 v0, p2, 0xa

    return v0
.end method
