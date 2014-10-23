.class public Lcom/mpatric/mp3agic/ID3v2ObseletePictureFrameData;
.super Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
.source "ID3v2ObseletePictureFrameData.java"


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .parameter "unsynchronisation"

    .prologue
    .line 6
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;-><init>(Z)V

    .line 7
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
    .line 10
    invoke-direct/range {p0 .. p5}, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;-><init>(ZLjava/lang/String;BLcom/mpatric/mp3agic/EncodedText;[B)V

    .line 11
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
    .line 14
    invoke-direct {p0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;-><init>(Z[B)V

    .line 15
    return-void
.end method


# virtual methods
.method protected unpackFrameData([B)V
    .locals 5
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "image/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x1

    const/4 v3, 0x3

    invoke-static {p1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v2ObseletePictureFrameData;->mimeType:Ljava/lang/String;

    .line 20
    const/4 v1, 0x4

    aget-byte v1, p1, v1

    iput-byte v1, p0, Lcom/mpatric/mp3agic/ID3v2ObseletePictureFrameData;->pictureType:B

    .line 22
    const/4 v0, 0x5

    .local v0, marker:I
    :goto_0
    array-length v1, p1

    if-lt v0, v1, :cond_1

    .line 25
    :cond_0
    new-instance v1, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v2, 0x0

    aget-byte v2, p1, v2

    const/4 v3, 0x5

    add-int/lit8 v4, v0, -0x5

    invoke-static {p1, v3, v4}, Lcom/mpatric/mp3agic/BufferTools;->copyBuffer([BII)[B

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/mpatric/mp3agic/EncodedText;-><init>(B[B)V

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v2ObseletePictureFrameData;->description:Lcom/mpatric/mp3agic/EncodedText;

    .line 26
    add-int/lit8 v1, v0, 0x1

    array-length v2, p1

    sub-int/2addr v2, v0

    add-int/lit8 v2, v2, -0x1

    invoke-static {p1, v1, v2}, Lcom/mpatric/mp3agic/BufferTools;->copyBuffer([BII)[B

    move-result-object v1

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v2ObseletePictureFrameData;->imageData:[B

    .line 27
    return-void

    .line 23
    :cond_1
    aget-byte v1, p1, v0

    if-eqz v1, :cond_0

    .line 22
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
