.class public Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
.super Lcom/mpatric/mp3agic/AbstractID3v2FrameData;
.source "ID3v2CommentFrameData.java"


# static fields
.field private static final DEFAULT_LANGUAGE:Ljava/lang/String; = "eng"


# instance fields
.field private comment:Lcom/mpatric/mp3agic/EncodedText;

.field private description:Lcom/mpatric/mp3agic/EncodedText;

.field private language:Ljava/lang/String;


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .parameter "unsynchronisation"

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 13
    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;Lcom/mpatric/mp3agic/EncodedText;Lcom/mpatric/mp3agic/EncodedText;)V
    .locals 0
    .parameter "unsynchronisation"
    .parameter "language"
    .parameter "description"
    .parameter "comment"

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 17
    iput-object p2, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    .line 18
    iput-object p3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    .line 19
    iput-object p4, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    .line 20
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
    .line 23
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;-><init>(Z)V

    .line 24
    invoke-virtual {p0, p2}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->synchroniseAndUnpackFrameData([B)V

    .line 25
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "obj"

    .prologue
    const/4 v1, 0x0

    .line 99
    instance-of v2, p1, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;

    if-nez v2, :cond_1

    .line 114
    :cond_0
    :goto_0
    return v1

    .line 100
    :cond_1
    invoke-super {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 101
    check-cast v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;

    .line 102
    .local v0, other:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    if-nez v2, :cond_5

    .line 103
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 106
    :cond_2
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-nez v2, :cond_6

    .line 107
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-nez v2, :cond_0

    .line 110
    :cond_3
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    if-nez v2, :cond_7

    .line 111
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    if-nez v2, :cond_0

    .line 114
    :cond_4
    const/4 v1, 0x1

    goto :goto_0

    .line 104
    :cond_5
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 105
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    .line 108
    :cond_6
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v2, :cond_0

    .line 109
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v2, v3}, Lcom/mpatric/mp3agic/EncodedText;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0

    .line 112
    :cond_7
    iget-object v2, v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v2, :cond_0

    .line 113
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v2, v3}, Lcom/mpatric/mp3agic/EncodedText;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_0
.end method

.method public getComment()Lcom/mpatric/mp3agic/EncodedText;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    return-object v0
.end method

.method public getDescription()Lcom/mpatric/mp3agic/EncodedText;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    return-object v0
.end method

.method protected getLength()I
    .locals 2

    .prologue
    .line 68
    const/4 v0, 0x5

    .line 69
    .local v0, length:I
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v1

    array-length v1, v1

    add-int/2addr v0, v1

    .line 70
    :cond_0
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v1

    array-length v1, v1

    add-int/2addr v0, v1

    .line 71
    :cond_1
    return v0
.end method

.method protected packFrameData()[B
    .locals 7

    .prologue
    const/4 v5, 0x3

    const/4 v6, 0x0

    .line 43
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->getLength()I

    move-result v3

    new-array v0, v3, [B

    .line 44
    .local v0, bytes:[B
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/EncodedText;->getTextEncoding()B

    move-result v3

    aput-byte v3, v0, v6

    .line 47
    :goto_0
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    if-nez v3, :cond_3

    .line 48
    const-string v2, "eng"

    .line 54
    .local v2, langPadded:Ljava/lang/String;
    :goto_1
    const/4 v3, 0x1

    invoke-static {v2, v6, v5, v0, v3}, Lcom/mpatric/mp3agic/BufferTools;->stringIntoByteBuffer(Ljava/lang/String;II[BI)V

    .line 55
    const/4 v1, 0x0

    .line 56
    .local v1, descriptionLength:I
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v3

    array-length v3, v3

    if-lez v3, :cond_0

    .line 57
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v3

    array-length v1, v3

    .line 58
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v3

    const/4 v4, 0x4

    invoke-static {v3, v6, v1, v0, v4}, Lcom/mpatric/mp3agic/BufferTools;->copyIntoByteBuffer([BII[BI)V

    .line 60
    :cond_0
    add-int/lit8 v3, v1, 0x4

    aput-byte v6, v0, v3

    .line 61
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v3

    array-length v3, v3

    if-lez v3, :cond_1

    .line 62
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v3

    iget-object v4, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    invoke-virtual {v4}, Lcom/mpatric/mp3agic/EncodedText;->toBytes()[B

    move-result-object v4

    array-length v4, v4

    add-int/lit8 v5, v1, 0x5

    invoke-static {v3, v6, v4, v0, v5}, Lcom/mpatric/mp3agic/BufferTools;->copyIntoByteBuffer([BII[BI)V

    .line 64
    :cond_1
    return-object v0

    .line 45
    .end local v1           #descriptionLength:I
    .end local v2           #langPadded:Ljava/lang/String;
    :cond_2
    aput-byte v6, v0, v6

    goto :goto_0

    .line 49
    :cond_3
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v5, :cond_4

    .line 50
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    invoke-virtual {v3, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #langPadded:Ljava/lang/String;
    goto :goto_1

    .line 52
    .end local v2           #langPadded:Ljava/lang/String;
    :cond_4
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    const/16 v4, 0x20

    invoke-static {v3, v5, v4}, Lcom/mpatric/mp3agic/BufferTools;->padStringRight(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #langPadded:Ljava/lang/String;
    goto :goto_1
.end method

.method public setComment(Lcom/mpatric/mp3agic/EncodedText;)V
    .locals 0
    .parameter "comment"

    .prologue
    .line 87
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    .line 88
    return-void
.end method

.method public setDescription(Lcom/mpatric/mp3agic/EncodedText;)V
    .locals 0
    .parameter "description"

    .prologue
    .line 95
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    .line 96
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 0
    .parameter "language"

    .prologue
    .line 79
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    .line 80
    return-void
.end method

.method protected unpackFrameData([B)V
    .locals 8
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 28
    const/4 v3, 0x1

    const/4 v4, 0x3

    invoke-static {p1, v3, v4}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->language:Ljava/lang/String;

    .line 30
    const/4 v2, 0x4

    .local v2, marker:I
    :goto_0
    array-length v3, p1

    if-lt v2, v3, :cond_2

    .line 33
    :cond_0
    new-instance v3, Lcom/mpatric/mp3agic/EncodedText;

    aget-byte v4, p1, v7

    const/4 v5, 0x4

    add-int/lit8 v6, v2, -0x4

    invoke-static {p1, v5, v6}, Lcom/mpatric/mp3agic/BufferTools;->copyBuffer([BII)[B

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/mpatric/mp3agic/EncodedText;-><init>(B[B)V

    iput-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    .line 34
    const/4 v1, 0x0

    .line 35
    .local v1, length:I
    add-int/lit8 v0, v2, 0x1

    .local v0, i:I
    :goto_1
    array-length v3, p1

    if-lt v0, v3, :cond_3

    .line 39
    :cond_1
    new-instance v3, Lcom/mpatric/mp3agic/EncodedText;

    aget-byte v4, p1, v7

    add-int/lit8 v5, v2, 0x1

    invoke-static {p1, v5, v1}, Lcom/mpatric/mp3agic/BufferTools;->copyBuffer([BII)[B

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/mpatric/mp3agic/EncodedText;-><init>(B[B)V

    iput-object v3, p0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->comment:Lcom/mpatric/mp3agic/EncodedText;

    .line 40
    return-void

    .line 31
    .end local v0           #i:I
    .end local v1           #length:I
    :cond_2
    aget-byte v3, p1, v2

    if-eqz v3, :cond_0

    .line 30
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 36
    .restart local v0       #i:I
    .restart local v1       #length:I
    :cond_3
    aget-byte v3, p1, v0

    if-eqz v3, :cond_1

    .line 37
    add-int/lit8 v1, v1, 0x1

    .line 35
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
