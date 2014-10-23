.class public Lcom/mpatric/mp3agic/ID3v2TextFrameData;
.super Lcom/mpatric/mp3agic/AbstractID3v2FrameData;
.source "ID3v2TextFrameData.java"


# instance fields
.field protected text:Lcom/mpatric/mp3agic/EncodedText;


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .parameter "unsynchronisation"

    .prologue
    .line 8
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 9
    return-void
.end method

.method public constructor <init>(ZLcom/mpatric/mp3agic/EncodedText;)V
    .locals 0
    .parameter "unsynchronisation"
    .parameter "text"

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 13
    iput-object p2, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    .line 14
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
    .line 17
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 18
    invoke-virtual {p0, p2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->synchroniseAndUnpackFrameData([B)V

    .line 19
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "obj"

    .prologue
    const/4 v1, 0x0

    .line 50
    instance-of v2, p1, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    if-nez v2, :cond_1

    .line 57
    :cond_0
    :goto_0
    return v1

    .line 51
    :cond_1
    invoke-super {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 52
    check-cast v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    .line 53
    .local v0, other:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    if-nez v2, :cond_3

    .line 54
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    if-nez v2, :cond_0

    .line 57
    :cond_2
    const/4 v1, 0x1

    goto :goto_0

    .line 55
    :cond_3
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v2, :cond_0

    .line 56
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v2, v3}, Lcom/mpatric/mp3agic/EncodedText;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0
.end method

.method protected getLength()I
    .locals 2

    .prologue
    .line 36
    const/4 v0, 0x1

    .line 37
    .local v0, length:I
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v1

    array-length v1, v1

    add-int/2addr v0, v1

    .line 38
    :cond_0
    return v0
.end method

.method public getText()Lcom/mpatric/mp3agic/EncodedText;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    return-object v0
.end method

.method protected packFrameData()[B
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 26
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getLength()I

    move-result v1

    new-array v0, v1, [B

    .line 27
    .local v0, bytes:[B
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->getTextEncoding()B

    move-result v1

    aput-byte v1, v0, v4

    .line 29
    :goto_0
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v1

    array-length v1, v1

    if-lez v1, :cond_0

    .line 30
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v1

    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v2}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v2

    array-length v2, v2

    const/4 v3, 0x1

    invoke-static {v1, v4, v2, v0, v3}, Lcom/mpatric/mp3agic/BufferTools;->copyIntoByteBuffer([BII[BI)V

    .line 32
    :cond_0
    return-object v0

    .line 28
    :cond_1
    aput-byte v4, v0, v4

    goto :goto_0
.end method

.method public setText(Lcom/mpatric/mp3agic/EncodedText;)V
    .locals 0
    .parameter "text"

    .prologue
    .line 46
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    .line 47
    return-void
.end method

.method protected unpackFrameData([B)V
    .locals 4
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 22
    new-instance v0, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v1, 0x0

    aget-byte v1, p1, v1

    const/4 v2, 0x1

    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    invoke-static {p1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->copyBuffer([BII)[B

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mpatric/mp3agic/EncodedText;-><init>(B[B)V

    iput-object v0, p0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->text:Lcom/mpatric/mp3agic/EncodedText;

    .line 23
    return-void
.end method
