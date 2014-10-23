.class public Lcom/mpatric/mp3agic/ID3v23Tag;
.super Lcom/mpatric/mp3agic/AbstractID3v2Tag;
.source "ID3v23Tag.java"


# static fields
.field public static final VERSION:Ljava/lang/String; = "3.0"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;-><init>()V

    .line 9
    const-string v0, "3.0"

    iput-object v0, p0, Lcom/mpatric/mp3agic/ID3v23Tag;->version:Ljava/lang/String;

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
.method protected packFlags([BI)V
    .locals 4
    .parameter "bytes"
    .parameter "offset"

    .prologue
    .line 23
    add-int/lit8 v0, p2, 0x5

    add-int/lit8 v1, p2, 0x5

    aget-byte v1, p1, v1

    const/4 v2, 0x7

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v23Tag;->unsynchronisation:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, p1, v0

    .line 24
    add-int/lit8 v0, p2, 0x5

    add-int/lit8 v1, p2, 0x5

    aget-byte v1, p1, v1

    const/4 v2, 0x6

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v23Tag;->extendedHeader:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, p1, v0

    .line 25
    add-int/lit8 v0, p2, 0x5

    add-int/lit8 v1, p2, 0x5

    aget-byte v1, p1, v1

    const/4 v2, 0x5

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v23Tag;->experimental:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, p1, v0

    .line 26
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

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v23Tag;->unsynchronisation:Z

    .line 18
    aget-byte v0, p1, v2

    const/4 v1, 0x6

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v23Tag;->extendedHeader:Z

    .line 19
    aget-byte v0, p1, v2

    invoke-static {v0, v2}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v23Tag;->experimental:Z

    .line 20
    return-void
.end method
