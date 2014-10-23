.class public Lcom/mpatric/mp3agic/ID3v2TagFactory;
.super Ljava/lang/Object;
.source "ID3v2TagFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createID3v22Tag([B)Lcom/mpatric/mp3agic/AbstractID3v2Tag;
    .locals 2
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NoSuchTagException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 17
    new-instance v0, Lcom/mpatric/mp3agic/ID3v22Tag;

    invoke-direct {v0, p0}, Lcom/mpatric/mp3agic/ID3v22Tag;-><init>([B)V

    .line 18
    .local v0, tag:Lcom/mpatric/mp3agic/ID3v22Tag;
    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v22Tag;->getFrameSets()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 19
    new-instance v0, Lcom/mpatric/mp3agic/ID3v22Tag;

    .end local v0           #tag:Lcom/mpatric/mp3agic/ID3v22Tag;
    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/mpatric/mp3agic/ID3v22Tag;-><init>([BZ)V

    .line 21
    .restart local v0       #tag:Lcom/mpatric/mp3agic/ID3v22Tag;
    :cond_0
    return-object v0
.end method

.method public static createTag([B)Lcom/mpatric/mp3agic/AbstractID3v2Tag;
    .locals 3
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NoSuchTagException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 6
    invoke-static {p0}, Lcom/mpatric/mp3agic/ID3v2TagFactory;->sanityCheckTag([B)V

    .line 7
    const/4 v1, 0x3

    aget-byte v0, p0, v1

    .line 8
    .local v0, majorVersion:I
    packed-switch v0, :pswitch_data_0

    .line 13
    new-instance v1, Lcom/mpatric/mp3agic/UnsupportedTagException;

    const-string v2, "Tag version not supported"

    invoke-direct {v1, v2}, Lcom/mpatric/mp3agic/UnsupportedTagException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 9
    :pswitch_0
    invoke-static {p0}, Lcom/mpatric/mp3agic/ID3v2TagFactory;->createID3v22Tag([B)Lcom/mpatric/mp3agic/AbstractID3v2Tag;

    move-result-object v1

    .line 11
    :goto_0
    return-object v1

    .line 10
    :pswitch_1
    new-instance v1, Lcom/mpatric/mp3agic/ID3v23Tag;

    invoke-direct {v1, p0}, Lcom/mpatric/mp3agic/ID3v23Tag;-><init>([B)V

    goto :goto_0

    .line 11
    :pswitch_2
    new-instance v1, Lcom/mpatric/mp3agic/ID3v24Tag;

    invoke-direct {v1, p0}, Lcom/mpatric/mp3agic/ID3v24Tag;-><init>([B)V

    goto :goto_0

    .line 8
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static sanityCheckTag([B)V
    .locals 7
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NoSuchTagException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    .line 25
    array-length v2, p0

    const/16 v3, 0xa

    if-ge v2, v3, :cond_0

    .line 26
    new-instance v2, Lcom/mpatric/mp3agic/NoSuchTagException;

    const-string v3, "Buffer too short"

    invoke-direct {v2, v3}, Lcom/mpatric/mp3agic/NoSuchTagException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 28
    :cond_0
    const-string v2, "ID3"

    const/4 v3, 0x0

    const-string v4, "ID3"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-static {p0, v3, v4}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 29
    new-instance v2, Lcom/mpatric/mp3agic/NoSuchTagException;

    invoke-direct {v2}, Lcom/mpatric/mp3agic/NoSuchTagException;-><init>()V

    throw v2

    .line 31
    :cond_1
    aget-byte v0, p0, v5

    .line 32
    .local v0, majorVersion:I
    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    if-eq v0, v5, :cond_2

    if-eq v0, v6, :cond_2

    .line 33
    aget-byte v1, p0, v6

    .line 34
    .local v1, minorVersion:I
    new-instance v2, Lcom/mpatric/mp3agic/UnsupportedTagException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unsupported version 2."

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mpatric/mp3agic/UnsupportedTagException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 36
    .end local v1           #minorVersion:I
    :cond_2
    return-void
.end method
