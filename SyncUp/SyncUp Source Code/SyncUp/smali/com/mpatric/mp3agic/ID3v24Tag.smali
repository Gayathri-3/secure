.class public Lcom/mpatric/mp3agic/ID3v24Tag;
.super Lcom/mpatric/mp3agic/AbstractID3v2Tag;
.source "ID3v24Tag.java"


# static fields
.field public static final VERSION:Ljava/lang/String; = "4.0"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;-><init>()V

    .line 9
    const-string v0, "4.0"

    iput-object v0, p0, Lcom/mpatric/mp3agic/ID3v24Tag;->version:Ljava/lang/String;

    .line 10
    return-void
.end method

.method public constructor <init>([B)V
    .locals 0
    .parameter "buffer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NoSuchTagException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;-><init>([B)V

    .line 14
    return-void
.end method


# virtual methods
.method protected createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;
    .locals 1
    .parameter "id"
    .parameter "data"

    .prologue
    .line 39
    new-instance v0, Lcom/mpatric/mp3agic/ID3v24Frame;

    invoke-direct {v0, p1, p2}, Lcom/mpatric/mp3agic/ID3v24Frame;-><init>(Ljava/lang/String;[B)V

    return-object v0
.end method

.method protected createFrame([BI)Lcom/mpatric/mp3agic/ID3v2Frame;
    .locals 1
    .parameter "buffer"
    .parameter "currentOffset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 35
    new-instance v0, Lcom/mpatric/mp3agic/ID3v24Frame;

    invoke-direct {v0, p1, p2}, Lcom/mpatric/mp3agic/ID3v24Frame;-><init>([BI)V

    return-object v0
.end method

.method protected packFlags([BI)V
    .locals 4
    .parameter "bytes"
    .parameter "offset"

    .prologue
    .line 24
    add-int/lit8 v0, p2, 0x5

    add-int/lit8 v1, p2, 0x5

    aget-byte v1, p1, v1

    const/4 v2, 0x7

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v24Tag;->unsynchronisation:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, p1, v0

    .line 25
    add-int/lit8 v0, p2, 0x5

    add-int/lit8 v1, p2, 0x5

    aget-byte v1, p1, v1

    const/4 v2, 0x6

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v24Tag;->extendedHeader:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, p1, v0

    .line 26
    add-int/lit8 v0, p2, 0x5

    add-int/lit8 v1, p2, 0x5

    aget-byte v1, p1, v1

    const/4 v2, 0x5

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v24Tag;->experimental:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, p1, v0

    .line 27
    add-int/lit8 v0, p2, 0x5

    add-int/lit8 v1, p2, 0x5

    aget-byte v1, p1, v1

    const/4 v2, 0x4

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v24Tag;->footer:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, p1, v0

    .line 28
    return-void
.end method

.method protected unpackFlags([B)V
    .locals 3
    .parameter "buffer"

    .prologue
    const/4 v2, 0x5

    .line 17
    aget-byte v0, p1, v2

    const/4 v1, 0x7

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v24Tag;->unsynchronisation:Z

    .line 18
    aget-byte v0, p1, v2

    const/4 v1, 0x6

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v24Tag;->extendedHeader:Z

    .line 19
    aget-byte v0, p1, v2

    invoke-static {v0, v2}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v24Tag;->experimental:Z

    .line 20
    aget-byte v0, p1, v2

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v24Tag;->footer:Z

    .line 21
    return-void
.end method

.method protected useFrameUnsynchronisation()Z
    .locals 1

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v24Tag;->unsynchronisation:Z

    return v0
.end method
