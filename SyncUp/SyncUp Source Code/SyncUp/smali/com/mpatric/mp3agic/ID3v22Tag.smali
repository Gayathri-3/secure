.class public Lcom/mpatric/mp3agic/ID3v22Tag;
.super Lcom/mpatric/mp3agic/AbstractID3v2Tag;
.source "ID3v22Tag.java"


# static fields
.field public static final VERSION:Ljava/lang/String; = "2.0"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;-><init>()V

    .line 9
    const-string v0, "2.0"

    iput-object v0, p0, Lcom/mpatric/mp3agic/ID3v22Tag;->version:Ljava/lang/String;

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

.method public constructor <init>([BZ)V
    .locals 0
    .parameter "buffer"
    .parameter "obseleteFormat"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NoSuchTagException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;-><init>([BZ)V

    .line 18
    return-void
.end method


# virtual methods
.method protected packFlags([BI)V
    .locals 4
    .parameter "bytes"
    .parameter "offset"

    .prologue
    .line 26
    add-int/lit8 v0, p2, 0x5

    add-int/lit8 v1, p2, 0x5

    aget-byte v1, p1, v1

    const/4 v2, 0x7

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v22Tag;->unsynchronisation:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, p1, v0

    .line 27
    add-int/lit8 v0, p2, 0x5

    add-int/lit8 v1, p2, 0x5

    aget-byte v1, p1, v1

    const/4 v2, 0x6

    iget-boolean v3, p0, Lcom/mpatric/mp3agic/ID3v22Tag;->compression:Z

    invoke-static {v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->setBit(BIZ)B

    move-result v1

    aput-byte v1, p1, v0

    .line 28
    return-void
.end method

.method protected unpackFlags([B)V
    .locals 3
    .parameter "bytes"

    .prologue
    const/4 v2, 0x5

    .line 21
    aget-byte v0, p1, v2

    const/4 v1, 0x7

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v22Tag;->unsynchronisation:Z

    .line 22
    aget-byte v0, p1, v2

    const/4 v1, 0x6

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->checkBit(BI)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mpatric/mp3agic/ID3v22Tag;->compression:Z

    .line 23
    return-void
.end method
