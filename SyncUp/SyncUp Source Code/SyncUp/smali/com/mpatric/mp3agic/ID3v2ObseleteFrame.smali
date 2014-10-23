.class public Lcom/mpatric/mp3agic/ID3v2ObseleteFrame;
.super Lcom/mpatric/mp3agic/ID3v2Frame;
.source "ID3v2ObseleteFrame.java"


# static fields
.field protected static final DATA_LENGTH_OFFSET:I = 0x3

.field private static final HEADER_LENGTH:I = 0x6

.field private static final ID_LENGTH:I = 0x3

.field private static final ID_OFFSET:I


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0
    .parameter "id"
    .parameter "data"

    .prologue
    .line 15
    invoke-direct {p0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2Frame;-><init>(Ljava/lang/String;[B)V

    .line 16
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 0
    .parameter "buffer"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 11
    invoke-direct {p0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2Frame;-><init>([BI)V

    .line 12
    return-void
.end method


# virtual methods
.method public getLength()I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lcom/mpatric/mp3agic/ID3v2ObseleteFrame;->dataLength:I

    add-int/lit8 v0, v0, 0x6

    return v0
.end method

.method public packFrame([BI)V
    .locals 2
    .parameter "bytes"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 29
    new-instance v0, Lcom/mpatric/mp3agic/NotSupportedException;

    const-string v1, "Packing Obselete frames is not supported"

    invoke-direct {v0, v1}, Lcom/mpatric/mp3agic/NotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected unpackDataLength([BI)V
    .locals 4
    .parameter "buffer"
    .parameter "offset"

    .prologue
    .line 25
    const/4 v0, 0x0

    add-int/lit8 v1, p2, 0x3

    aget-byte v1, p1, v1

    add-int/lit8 v2, p2, 0x3

    add-int/lit8 v2, v2, 0x1

    aget-byte v2, p1, v2

    add-int/lit8 v3, p2, 0x3

    add-int/lit8 v3, v3, 0x2

    aget-byte v3, p1, v3

    invoke-static {v0, v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->unpackInteger(BBBB)I

    move-result v0

    iput v0, p0, Lcom/mpatric/mp3agic/ID3v2ObseleteFrame;->dataLength:I

    .line 26
    return-void
.end method

.method protected unpackHeader([BI)I
    .locals 2
    .parameter "buffer"
    .parameter "offset"

    .prologue
    .line 19
    add-int/lit8 v0, p2, 0x0

    const/4 v1, 0x3

    invoke-static {p1, v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mpatric/mp3agic/ID3v2ObseleteFrame;->id:Ljava/lang/String;

    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2ObseleteFrame;->unpackDataLength([BI)V

    .line 21
    add-int/lit8 v0, p2, 0x6

    return v0
.end method
