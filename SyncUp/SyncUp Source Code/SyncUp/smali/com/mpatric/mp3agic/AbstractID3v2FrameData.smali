.class public abstract Lcom/mpatric/mp3agic/AbstractID3v2FrameData;
.super Ljava/lang/Object;
.source "AbstractID3v2FrameData.java"


# instance fields
.field unsynchronisation:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .parameter "unsynchronisation"

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-boolean p1, p0, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->unsynchronisation:Z

    .line 9
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "obj"

    .prologue
    const/4 v1, 0x0

    .line 33
    instance-of v2, p1, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;

    if-nez v2, :cond_1

    .line 36
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 34
    check-cast v0, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;

    .line 35
    .local v0, other:Lcom/mpatric/mp3agic/AbstractID3v2FrameData;
    iget-boolean v2, p0, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->unsynchronisation:Z

    iget-boolean v3, v0, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->unsynchronisation:Z

    if-ne v2, v3, :cond_0

    .line 36
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected abstract getLength()I
.end method

.method protected packAndUnsynchroniseFrameData()[B
    .locals 2

    .prologue
    .line 21
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->packFrameData()[B

    move-result-object v0

    .line 22
    .local v0, bytes:[B
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->unsynchronisation:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/mpatric/mp3agic/BufferTools;->sizeUnsynchronisationWouldAdd([B)I

    move-result v1

    if-lez v1, :cond_0

    .line 23
    invoke-static {v0}, Lcom/mpatric/mp3agic/BufferTools;->unsynchroniseBuffer([B)[B

    move-result-object v0

    .line 25
    .end local v0           #bytes:[B
    :cond_0
    return-object v0
.end method

.method protected abstract packFrameData()[B
.end method

.method protected synchroniseAndUnpackFrameData([B)V
    .locals 2
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 12
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->unsynchronisation:Z

    if-eqz v1, :cond_0

    invoke-static {p1}, Lcom/mpatric/mp3agic/BufferTools;->sizeSynchronisationWouldSubtract([B)I

    move-result v1

    if-lez v1, :cond_0

    .line 13
    invoke-static {p1}, Lcom/mpatric/mp3agic/BufferTools;->synchroniseBuffer([B)[B

    move-result-object v0

    .line 14
    .local v0, synchronisedBytes:[B
    invoke-virtual {p0, v0}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->unpackFrameData([B)V

    .line 18
    .end local v0           #synchronisedBytes:[B
    :goto_0
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->unpackFrameData([B)V

    goto :goto_0
.end method

.method protected toBytes()[B
    .locals 1

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2FrameData;->packAndUnsynchroniseFrameData()[B

    move-result-object v0

    return-object v0
.end method

.method protected abstract unpackFrameData([B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation
.end method
