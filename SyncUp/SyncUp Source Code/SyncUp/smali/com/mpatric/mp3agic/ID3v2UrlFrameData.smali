.class public Lcom/mpatric/mp3agic/ID3v2UrlFrameData;
.super Lcom/mpatric/mp3agic/AbstractID3v2FrameData;
.source "ID3v2UrlFrameData.java"


# instance fields
.field protected description:Lcom/mpatric/mp3agic/EncodedText;

.field protected url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .parameter "unsynchronisation"

    .prologue
    .line 9
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 10
    return-void
.end method

.method public constructor <init>(ZLcom/mpatric/mp3agic/EncodedText;Ljava/lang/String;)V
    .locals 0
    .parameter "unsynchronisation"
    .parameter "description"
    .parameter "url"

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 14
    iput-object p2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    .line 15
    iput-object p3, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    .line 16
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
    .line 19
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 20
    invoke-virtual {p0, p2}, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->synchroniseAndUnpackFrameData([B)V

    .line 21
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "obj"

    .prologue
    const/4 v1, 0x0

    .line 77
    instance-of v2, p1, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;

    if-nez v2, :cond_1

    .line 88
    :cond_0
    :goto_0
    return v1

    .line 78
    :cond_1
    invoke-super {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 79
    check-cast v0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;

    .line 80
    .local v0, other:Lcom/mpatric/mp3agic/ID3v2UrlFrameData;
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 81
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 84
    :cond_2
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-nez v2, :cond_5

    .line 85
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-nez v2, :cond_0

    .line 88
    :cond_3
    const/4 v1, 0x1

    goto :goto_0

    .line 82
    :cond_4
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 83
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    .line 86
    :cond_5
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v2, :cond_0

    .line 87
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v2, v3}, Lcom/mpatric/mp3agic/EncodedText;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0
.end method

.method public getDescription()Lcom/mpatric/mp3agic/EncodedText;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    return-object v0
.end method

.method protected getLength()I
    .locals 2

    .prologue
    .line 54
    const/4 v0, 0x2

    .line 55
    .local v0, length:I
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v1

    array-length v1, v1

    add-int/2addr v0, v1

    .line 56
    :cond_0
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v0, v1

    .line 57
    :cond_1
    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    return-object v0
.end method

.method protected packFrameData()[B
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 38
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->getLength()I

    move-result v2

    new-array v0, v2, [B

    .line 39
    .local v0, bytes:[B
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v2}, Lcom/mpatric/mp3agic/EncodedText;->getTextEncoding()B

    move-result v2

    aput-byte v2, v0, v5

    .line 41
    :goto_0
    const/4 v1, 0x0

    .line 42
    .local v1, descriptionLength:I
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v2}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v2

    array-length v2, v2

    if-lez v2, :cond_0

    .line 43
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v2}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v2

    array-length v1, v2

    .line 44
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v2}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v2, v5, v1, v0, v3}, Lcom/mpatric/mp3agic/BufferTools;->copyIntoByteBuffer([BII[BI)V

    .line 46
    :cond_0
    add-int/lit8 v2, v1, 0x1

    aput-byte v5, v0, v2

    .line 47
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 48
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v4, v1, 0x2

    invoke-static {v2, v5, v3, v0, v4}, Lcom/mpatric/mp3agic/BufferTools;->stringIntoByteBuffer(Ljava/lang/String;II[BI)V

    .line 50
    :cond_1
    return-object v0

    .line 40
    .end local v1           #descriptionLength:I
    :cond_2
    aput-byte v5, v0, v5

    goto :goto_0
.end method

.method public setDescription(Lcom/mpatric/mp3agic/EncodedText;)V
    .locals 0
    .parameter "description"

    .prologue
    .line 65
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    .line 66
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0
    .parameter "url"

    .prologue
    .line 73
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    .line 74
    return-void
.end method

.method protected unpackFrameData([B)V
    .locals 7
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 25
    const/4 v2, 0x1

    .local v2, marker:I
    :goto_0
    array-length v3, p1

    if-lt v2, v3, :cond_2

    .line 28
    :cond_0
    new-instance v3, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v4, 0x0

    aget-byte v4, p1, v4

    const/4 v5, 0x1

    add-int/lit8 v6, v2, -0x1

    invoke-static {p1, v5, v6}, Lcom/mpatric/mp3agic/BufferTools;->copyBuffer([BII)[B

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/mpatric/mp3agic/EncodedText;-><init>(B[B)V

    iput-object v3, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    .line 29
    const/4 v1, 0x0

    .line 30
    .local v1, length:I
    add-int/lit8 v0, v2, 0x1

    .local v0, i:I
    :goto_1
    array-length v3, p1

    if-lt v0, v3, :cond_3

    .line 34
    :cond_1
    add-int/lit8 v3, v2, 0x1

    invoke-static {p1, v3, v1}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->url:Ljava/lang/String;

    .line 35
    return-void

    .line 26
    .end local v0           #i:I
    .end local v1           #length:I
    :cond_2
    aget-byte v3, p1, v2

    if-eqz v3, :cond_0

    .line 25
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 31
    .restart local v0       #i:I
    .restart local v1       #length:I
    :cond_3
    aget-byte v3, p1, v0

    if-eqz v3, :cond_1

    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 30
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
