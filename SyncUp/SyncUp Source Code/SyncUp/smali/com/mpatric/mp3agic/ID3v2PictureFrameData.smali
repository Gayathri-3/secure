.class public Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
.super Lcom/mpatric/mp3agic/AbstractID3v2FrameData;
.source "ID3v2PictureFrameData.java"


# instance fields
.field protected description:Lcom/mpatric/mp3agic/EncodedText;

.field protected imageData:[B

.field protected mimeType:Ljava/lang/String;

.field protected pictureType:B


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .parameter "unsynchronisation"

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 14
    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;BLcom/mpatric/mp3agic/EncodedText;[B)V
    .locals 0
    .parameter "unsynchronisation"
    .parameter "mimeType"
    .parameter "pictureType"
    .parameter "description"
    .parameter "imageData"

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 18
    iput-object p2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    .line 19
    iput-byte p3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->pictureType:B

    .line 20
    iput-object p4, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    .line 21
    iput-object p5, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    .line 22
    return-void
.end method

.method public constructor <init>(Z[B)V
    .locals 0
    .parameter "unsynchronisation"
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 26
    invoke-virtual {p0, p2}, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->synchroniseAndUnpackFrameData([B)V

    .line 27
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "obj"

    .prologue
    const/4 v1, 0x0

    .line 109
    instance-of v2, p1, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;

    if-nez v2, :cond_1

    .line 125
    :cond_0
    :goto_0
    return v1

    .line 110
    :cond_1
    invoke-super {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 111
    check-cast v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;

    .line 112
    .local v0, other:Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    iget-byte v2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->pictureType:B

    iget-byte v3, v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->pictureType:B

    if-ne v2, v3, :cond_0

    .line 113
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    if-nez v2, :cond_5

    .line 114
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 117
    :cond_2
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-nez v2, :cond_6

    .line 118
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-nez v2, :cond_0

    .line 121
    :cond_3
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    if-nez v2, :cond_7

    .line 122
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    if-nez v2, :cond_0

    .line 125
    :cond_4
    const/4 v1, 0x1

    goto :goto_0

    .line 115
    :cond_5
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 116
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    .line 119
    :cond_6
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v2, :cond_0

    .line 120
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v2, v3}, Lcom/mpatric/mp3agic/EncodedText;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0

    .line 123
    :cond_7
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    if-eqz v2, :cond_0

    .line 124
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_0
.end method

.method public getDescription()Lcom/mpatric/mp3agic/EncodedText;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    return-object v0
.end method

.method public getImageData()[B
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    return-object v0
.end method

.method protected getLength()I
    .locals 2

    .prologue
    .line 69
    const/4 v0, 0x4

    .line 70
    .local v0, length:I
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v0, v1

    .line 71
    :cond_0
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v1

    array-length v1, v1

    add-int/2addr v0, v1

    .line 72
    :cond_1
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    array-length v1, v1

    add-int/2addr v0, v1

    .line 73
    :cond_2
    return v0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getPictureType()B
    .locals 1

    .prologue
    .line 85
    iget-byte v0, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->pictureType:B

    return v0
.end method

.method protected packFrameData()[B
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 46
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->getLength()I

    move-result v3

    new-array v0, v3, [B

    .line 47
    .local v0, bytes:[B
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/EncodedText;->getTextEncoding()B

    move-result v3

    aput-byte v3, v0, v6

    .line 49
    :goto_0
    const/4 v2, 0x0

    .line 50
    .local v2, mimeTypeLength:I
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 51
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    .line 52
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-static {v3, v6, v2, v0, v4}, Lcom/mpatric/mp3agic/BufferTools;->stringIntoByteBuffer(Ljava/lang/String;II[BI)V

    .line 54
    :cond_0
    add-int/lit8 v3, v2, 0x1

    aput-byte v6, v0, v3

    .line 55
    add-int/lit8 v3, v2, 0x2

    iget-byte v4, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->pictureType:B

    aput-byte v4, v0, v3

    .line 56
    const/4 v1, 0x0

    .line 57
    .local v1, descriptionLength:I
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v3

    array-length v3, v3

    if-lez v3, :cond_1

    .line 58
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v3

    array-length v1, v3

    .line 59
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v3

    add-int/lit8 v4, v2, 0x3

    invoke-static {v3, v6, v1, v0, v4}, Lcom/mpatric/mp3agic/BufferTools;->copyIntoByteBuffer([BII[BI)V

    .line 61
    :cond_1
    add-int v3, v2, v1

    add-int/lit8 v3, v3, 0x3

    aput-byte v6, v0, v3

    .line 62
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    array-length v3, v3

    if-lez v3, :cond_2

    .line 63
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    iget-object v4, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    array-length v4, v4

    add-int v5, v2, v1

    add-int/lit8 v5, v5, 0x4

    invoke-static {v3, v6, v4, v0, v5}, Lcom/mpatric/mp3agic/BufferTools;->copyIntoByteBuffer([BII[BI)V

    .line 65
    :cond_2
    return-object v0

    .line 48
    .end local v1           #descriptionLength:I
    .end local v2           #mimeTypeLength:I
    :cond_3
    aput-byte v6, v0, v6

    goto :goto_0
.end method

.method public setDescription(Lcom/mpatric/mp3agic/EncodedText;)V
    .locals 0
    .parameter "description"

    .prologue
    .line 97
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    .line 98
    return-void
.end method

.method public setImageData([B)V
    .locals 0
    .parameter "imageData"

    .prologue
    .line 105
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    .line 106
    return-void
.end method

.method public setMimeType(Ljava/lang/String;)V
    .locals 0
    .parameter "mimeType"

    .prologue
    .line 81
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public setPictureType(B)V
    .locals 0
    .parameter "pictureType"

    .prologue
    .line 89
    iput-byte p1, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->pictureType:B

    .line 90
    return-void
.end method

.method protected unpackFrameData([B)V
    .locals 5
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 31
    const/4 v0, 0x1

    .local v0, marker:I
    :goto_0
    array-length v2, p1

    if-lt v0, v2, :cond_2

    .line 34
    :cond_0
    const/4 v2, 0x1

    add-int/lit8 v3, v0, -0x1

    invoke-static {p1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->mimeType:Ljava/lang/String;

    .line 35
    add-int/lit8 v2, v0, 0x1

    aget-byte v2, p1, v2

    iput-byte v2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->pictureType:B

    .line 36
    add-int/lit8 v0, v0, 0x2

    .line 38
    move v1, v0

    .local v1, marker2:I
    :goto_1
    array-length v2, p1

    if-lt v1, v2, :cond_3

    .line 41
    :cond_1
    new-instance v2, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v3, 0x0

    aget-byte v3, p1, v3

    sub-int v4, v1, v0

    invoke-static {p1, v0, v4}, Lcom/mpatric/mp3agic/BufferTools;->copyBuffer([BII)[B

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/mpatric/mp3agic/EncodedText;-><init>(B[B)V

    iput-object v2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    .line 42
    add-int/lit8 v2, v1, 0x1

    array-length v3, p1

    sub-int/2addr v3, v1

    add-int/lit8 v3, v3, -0x1

    invoke-static {p1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->copyBuffer([BII)[B

    move-result-object v2

    iput-object v2, p0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->imageData:[B

    .line 43
    return-void

    .line 32
    .end local v1           #marker2:I
    :cond_2
    aget-byte v2, p1, v0

    if-eqz v2, :cond_0

    .line 31
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 39
    .restart local v1       #marker2:I
    :cond_3
    aget-byte v2, p1, v1

    if-eqz v2, :cond_1

    .line 38
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method
