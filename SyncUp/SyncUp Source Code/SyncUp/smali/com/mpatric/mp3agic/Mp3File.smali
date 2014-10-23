.class public Lcom/mpatric/mp3agic/Mp3File;
.super Lcom/mpatric/mp3agic/FileWrapper;
.source "Mp3File.java"


# static fields
.field private static final DEFAULT_BUFFER_LENGTH:I = 0x10000

.field private static final MINIMUM_BUFFER_LENGTH:I = 0x28

.field private static final XING_MARKER_OFFSET_1:I = 0xd

.field private static final XING_MARKER_OFFSET_2:I = 0x15

.field private static final XING_MARKER_OFFSET_3:I = 0x24


# instance fields
.field private bitrate:D

.field private bitrates:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/mpatric/mp3agic/MutableInteger;",
            ">;"
        }
    .end annotation
.end field

.field protected bufferLength:I

.field private channelMode:Ljava/lang/String;

.field private copyright:Z

.field private customTag:[B

.field private emphasis:Ljava/lang/String;

.field private endOffset:I

.field private frameCount:I

.field private id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

.field private id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

.field private layer:Ljava/lang/String;

.field private modeExtension:Ljava/lang/String;

.field private original:Z

.field private sampleRate:I

.field private scanFile:Z

.field private startOffset:I

.field private version:Ljava/lang/String;

.field private xingBitrate:I

.field private xingOffset:I


# direct methods
.method protected constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, -0x1

    .line 37
    invoke-direct {p0}, Lcom/mpatric/mp3agic/FileWrapper;-><init>()V

    .line 17
    iput v0, p0, Lcom/mpatric/mp3agic/Mp3File;->xingOffset:I

    .line 18
    iput v0, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    .line 19
    iput v0, p0, Lcom/mpatric/mp3agic/Mp3File;->endOffset:I

    .line 20
    const/4 v0, 0x0

    iput v0, p0, Lcom/mpatric/mp3agic/Mp3File;->frameCount:I

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrates:Ljava/util/Map;

    .line 23
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrate:D

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .parameter "filename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 41
    const/high16 v0, 0x1

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/mpatric/mp3agic/Mp3File;-><init>(Ljava/lang/String;IZ)V

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .parameter "filename"
    .parameter "bufferLength"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 45
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/mpatric/mp3agic/Mp3File;-><init>(Ljava/lang/String;IZ)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IZ)V
    .locals 2
    .parameter "filename"
    .parameter "bufferLength"
    .parameter "scanFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    const/4 v0, -0x1

    .line 53
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/FileWrapper;-><init>(Ljava/lang/String;)V

    .line 17
    iput v0, p0, Lcom/mpatric/mp3agic/Mp3File;->xingOffset:I

    .line 18
    iput v0, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    .line 19
    iput v0, p0, Lcom/mpatric/mp3agic/Mp3File;->endOffset:I

    .line 20
    const/4 v0, 0x0

    iput v0, p0, Lcom/mpatric/mp3agic/Mp3File;->frameCount:I

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrates:Ljava/util/Map;

    .line 23
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrate:D

    .line 54
    const/16 v0, 0x29

    if-ge p2, v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Buffer too small"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_0
    iput p2, p0, Lcom/mpatric/mp3agic/Mp3File;->bufferLength:I

    .line 56
    iput-boolean p3, p0, Lcom/mpatric/mp3agic/Mp3File;->scanFile:Z

    .line 57
    invoke-direct {p0}, Lcom/mpatric/mp3agic/Mp3File;->init()V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .parameter "filename"
    .parameter "scanFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 49
    const/high16 v0, 0x1

    invoke-direct {p0, p1, v0, p2}, Lcom/mpatric/mp3agic/Mp3File;-><init>(Ljava/lang/String;IZ)V

    .line 50
    return-void
.end method

.method private addBitrate(I)V
    .locals 6
    .parameter "bitrate"

    .prologue
    .line 222
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    .line 223
    .local v1, key:Ljava/lang/Integer;
    iget-object v2, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrates:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mpatric/mp3agic/MutableInteger;

    .line 224
    .local v0, count:Lcom/mpatric/mp3agic/MutableInteger;
    if-eqz v0, :cond_0

    .line 225
    invoke-virtual {v0}, Lcom/mpatric/mp3agic/MutableInteger;->increment()V

    .line 229
    :goto_0
    iget-wide v2, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrate:D

    iget v4, p0, Lcom/mpatric/mp3agic/Mp3File;->frameCount:I

    add-int/lit8 v4, v4, -0x1

    int-to-double v4, v4

    mul-double/2addr v2, v4

    int-to-double v4, p1

    add-double/2addr v2, v4

    iget v4, p0, Lcom/mpatric/mp3agic/Mp3File;->frameCount:I

    int-to-double v4, v4

    div-double/2addr v2, v4

    iput-wide v2, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrate:D

    .line 230
    return-void

    .line 227
    :cond_0
    iget-object v2, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrates:Ljava/util/Map;

    new-instance v3, Lcom/mpatric/mp3agic/MutableInteger;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Lcom/mpatric/mp3agic/MutableInteger;-><init>(I)V

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private init()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 61
    new-instance v0, Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lcom/mpatric/mp3agic/Mp3File;->filename:Ljava/lang/String;

    const-string v2, "r"

    invoke-direct {v0, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .local v0, file:Ljava/io/RandomAccessFile;
    :try_start_0
    invoke-direct {p0, v0}, Lcom/mpatric/mp3agic/Mp3File;->initId3v1Tag(Ljava/io/RandomAccessFile;)V

    .line 64
    invoke-direct {p0, v0}, Lcom/mpatric/mp3agic/Mp3File;->scanFile(Ljava/io/RandomAccessFile;)V

    .line 65
    iget v1, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    if-gez v1, :cond_0

    .line 66
    new-instance v1, Lcom/mpatric/mp3agic/InvalidDataException;

    const-string v2, "No mpegs frames found"

    invoke-direct {v1, v2}, Lcom/mpatric/mp3agic/InvalidDataException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    :catchall_0
    move-exception v1

    .line 73
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 74
    throw v1

    .line 68
    :cond_0
    :try_start_1
    invoke-direct {p0, v0}, Lcom/mpatric/mp3agic/Mp3File;->initId3v2Tag(Ljava/io/RandomAccessFile;)V

    .line 69
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/Mp3File;->scanFile:Z

    if-eqz v1, :cond_1

    .line 70
    invoke-direct {p0, v0}, Lcom/mpatric/mp3agic/Mp3File;->initCustomTag(Ljava/io/RandomAccessFile;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    :cond_1
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 75
    return-void
.end method

.method private initCustomTag(Ljava/io/RandomAccessFile;)V
    .locals 6
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 267
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/Mp3File;->getLength()J

    move-result-wide v2

    iget v4, p0, Lcom/mpatric/mp3agic/Mp3File;->endOffset:I

    add-int/lit8 v4, v4, 0x1

    int-to-long v4, v4

    sub-long/2addr v2, v4

    long-to-int v0, v2

    .line 268
    .local v0, bufferLength:I
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/Mp3File;->hasId3v1Tag()Z

    move-result v2

    if-eqz v2, :cond_0

    add-int/lit8 v0, v0, -0x80

    .line 269
    :cond_0
    if-gtz v0, :cond_2

    .line 270
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mpatric/mp3agic/Mp3File;->customTag:[B

    .line 278
    :cond_1
    return-void

    .line 273
    :cond_2
    new-array v2, v0, [B

    iput-object v2, p0, Lcom/mpatric/mp3agic/Mp3File;->customTag:[B

    .line 274
    iget v2, p0, Lcom/mpatric/mp3agic/Mp3File;->endOffset:I

    add-int/lit8 v2, v2, 0x1

    int-to-long v2, v2

    invoke-virtual {p1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 275
    iget-object v2, p0, Lcom/mpatric/mp3agic/Mp3File;->customTag:[B

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v0}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v1

    .line 276
    .local v1, bytesRead:I
    if-ge v1, v0, :cond_1

    new-instance v2, Ljava/io/IOException;

    const-string v3, "Not enough bytes read"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private initId3v1Tag(Ljava/io/RandomAccessFile;)V
    .locals 10
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x80

    .line 233
    new-array v0, v9, [B

    .line 234
    .local v0, bytes:[B
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/Mp3File;->getLength()J

    move-result-wide v5

    const-wide/16 v7, 0x80

    sub-long v3, v5, v7

    .line 235
    .local v3, pos:J
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-gez v5, :cond_0

    .line 236
    new-instance v5, Lcom/mpatric/mp3agic/InvalidDataException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Length less than mp3 tag length at file: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/mpatric/mp3agic/Mp3File;->filename:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/mpatric/mp3agic/InvalidDataException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 237
    :cond_0
    invoke-virtual {p1, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 238
    const/4 v5, 0x0

    invoke-virtual {p1, v0, v5, v9}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v1

    .line 239
    .local v1, bytesRead:I
    if-ge v1, v9, :cond_1

    new-instance v5, Ljava/io/IOException;

    const-string v6, "Not enough bytes read"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 241
    :cond_1
    :try_start_0
    new-instance v5, Lcom/mpatric/mp3agic/ID3v1Tag;

    invoke-direct {v5, v0}, Lcom/mpatric/mp3agic/ID3v1Tag;-><init>([B)V

    iput-object v5, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;
    :try_end_0
    .catch Lcom/mpatric/mp3agic/NoSuchTagException; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    :goto_0
    return-void

    .line 242
    :catch_0
    move-exception v2

    .line 243
    .local v2, e:Lcom/mpatric/mp3agic/NoSuchTagException;
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    goto :goto_0
.end method

.method private initId3v2Tag(Ljava/io/RandomAccessFile;)V
    .locals 7
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 248
    iget v4, p0, Lcom/mpatric/mp3agic/Mp3File;->xingOffset:I

    if-eqz v4, :cond_0

    iget v4, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    if-nez v4, :cond_1

    .line 249
    :cond_0
    iput-object v6, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    .line 264
    :goto_0
    return-void

    .line 252
    :cond_1
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/Mp3File;->hasXingFrame()Z

    move-result v4

    if-eqz v4, :cond_2

    iget v0, p0, Lcom/mpatric/mp3agic/Mp3File;->xingOffset:I

    .line 254
    .local v0, bufferLength:I
    :goto_1
    new-array v1, v0, [B

    .line 255
    .local v1, bytes:[B
    const-wide/16 v4, 0x0

    invoke-virtual {p1, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 256
    const/4 v4, 0x0

    invoke-virtual {p1, v1, v4, v0}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v2

    .line 257
    .local v2, bytesRead:I
    if-ge v2, v0, :cond_3

    new-instance v4, Ljava/io/IOException;

    const-string v5, "Not enough bytes read"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 253
    .end local v0           #bufferLength:I
    .end local v1           #bytes:[B
    .end local v2           #bytesRead:I
    :cond_2
    iget v0, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    .restart local v0       #bufferLength:I
    goto :goto_1

    .line 259
    .restart local v1       #bytes:[B
    .restart local v2       #bytesRead:I
    :cond_3
    :try_start_0
    invoke-static {v1}, Lcom/mpatric/mp3agic/ID3v2TagFactory;->createTag([B)Lcom/mpatric/mp3agic/AbstractID3v2Tag;

    move-result-object v4

    iput-object v4, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;
    :try_end_0
    .catch Lcom/mpatric/mp3agic/NoSuchTagException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 260
    :catch_0
    move-exception v3

    .line 261
    .local v3, e:Lcom/mpatric/mp3agic/NoSuchTagException;
    iput-object v6, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    goto :goto_0
.end method

.method private isXingFrame([BI)Z
    .locals 4
    .parameter "bytes"
    .parameter "offset"

    .prologue
    const/4 v3, 0x4

    const/4 v0, 0x1

    .line 199
    array-length v1, p1

    add-int/lit8 v2, p2, 0xd

    add-int/lit8 v2, v2, 0x3

    if-lt v1, v2, :cond_2

    .line 200
    const-string v1, "Xing"

    add-int/lit8 v2, p2, 0xd

    invoke-static {p1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 211
    :cond_0
    :goto_0
    return v0

    .line 201
    :cond_1
    const-string v1, "Info"

    add-int/lit8 v2, p2, 0xd

    invoke-static {p1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 202
    array-length v1, p1

    add-int/lit8 v2, p2, 0x15

    add-int/lit8 v2, v2, 0x3

    if-lt v1, v2, :cond_2

    .line 203
    const-string v1, "Xing"

    add-int/lit8 v2, p2, 0x15

    invoke-static {p1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 204
    const-string v1, "Info"

    add-int/lit8 v2, p2, 0x15

    invoke-static {p1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 205
    array-length v1, p1

    add-int/lit8 v2, p2, 0x24

    add-int/lit8 v2, v2, 0x3

    if-lt v1, v2, :cond_2

    .line 206
    const-string v1, "Xing"

    add-int/lit8 v2, p2, 0x24

    invoke-static {p1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 207
    const-string v1, "Info"

    add-int/lit8 v2, p2, 0x24

    invoke-static {p1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 211
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private maxEndOffset()I
    .locals 3

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/Mp3File;->getLength()J

    move-result-wide v1

    long-to-int v0, v1

    .line 194
    .local v0, maxEndOffset:I
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/Mp3File;->hasId3v1Tag()Z

    move-result v1

    if-eqz v1, :cond_0

    add-int/lit8 v0, v0, -0x80

    .line 195
    :cond_0
    return v0
.end method

.method private sanityCheckFrame(Lcom/mpatric/mp3agic/MpegFrame;I)V
    .locals 4
    .parameter "frame"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 215
    iget v0, p0, Lcom/mpatric/mp3agic/Mp3File;->sampleRate:I

    invoke-virtual {p1}, Lcom/mpatric/mp3agic/MpegFrame;->getSampleRate()I

    move-result v1

    if-eq v0, v1, :cond_0

    new-instance v0, Lcom/mpatric/mp3agic/InvalidDataException;

    const-string v1, "Inconsistent frame header"

    invoke-direct {v0, v1}, Lcom/mpatric/mp3agic/InvalidDataException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 216
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->layer:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/mpatric/mp3agic/MpegFrame;->getLayer()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/mpatric/mp3agic/InvalidDataException;

    const-string v1, "Inconsistent frame header"

    invoke-direct {v0, v1}, Lcom/mpatric/mp3agic/InvalidDataException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 217
    :cond_1
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->version:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/mpatric/mp3agic/MpegFrame;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Lcom/mpatric/mp3agic/InvalidDataException;

    const-string v1, "Inconsistent frame header"

    invoke-direct {v0, v1}, Lcom/mpatric/mp3agic/InvalidDataException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 218
    :cond_2
    invoke-virtual {p1}, Lcom/mpatric/mp3agic/MpegFrame;->getLengthInBytes()I

    move-result v0

    add-int/2addr v0, p2

    int-to-long v0, v0

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/Mp3File;->getLength()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_3

    new-instance v0, Lcom/mpatric/mp3agic/InvalidDataException;

    const-string v1, "Frame would extend beyond end of file"

    invoke-direct {v0, v1}, Lcom/mpatric/mp3agic/InvalidDataException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_3
    return-void
.end method

.method private saveMpegFrames(Ljava/io/RandomAccessFile;)V
    .locals 6
    .parameter "saveFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 415
    iget v3, p0, Lcom/mpatric/mp3agic/Mp3File;->xingOffset:I

    .line 416
    .local v3, filePos:I
    if-gez v3, :cond_0

    iget v3, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    .line 417
    :cond_0
    if-gez v3, :cond_2

    .line 436
    :cond_1
    :goto_0
    return-void

    .line 418
    :cond_2
    iget v4, p0, Lcom/mpatric/mp3agic/Mp3File;->endOffset:I

    if-lt v4, v3, :cond_1

    .line 419
    new-instance v2, Ljava/io/RandomAccessFile;

    iget-object v4, p0, Lcom/mpatric/mp3agic/Mp3File;->filename:Ljava/lang/String;

    const-string v5, "r"

    invoke-direct {v2, v4, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 420
    .local v2, file:Ljava/io/RandomAccessFile;
    iget v4, p0, Lcom/mpatric/mp3agic/Mp3File;->bufferLength:I

    new-array v0, v4, [B

    .line 422
    .local v0, bytes:[B
    int-to-long v4, v3

    :try_start_0
    invoke-virtual {v2, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 424
    :goto_1
    const/4 v4, 0x0

    iget v5, p0, Lcom/mpatric/mp3agic/Mp3File;->bufferLength:I

    invoke-virtual {v2, v0, v4, v5}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v1

    .line 425
    .local v1, bytesRead:I
    add-int v4, v3, v1

    iget v5, p0, Lcom/mpatric/mp3agic/Mp3File;->endOffset:I

    if-gt v4, v5, :cond_3

    .line 426
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v1}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 427
    add-int/2addr v3, v1

    goto :goto_1

    .line 429
    :cond_3
    const/4 v4, 0x0

    iget v5, p0, Lcom/mpatric/mp3agic/Mp3File;->endOffset:I

    sub-int/2addr v5, v3

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p1, v0, v4, v5}, Ljava/io/RandomAccessFile;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 434
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    goto :goto_0

    .line 433
    .end local v1           #bytesRead:I
    :catchall_0
    move-exception v4

    .line 434
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    .line 435
    throw v4
.end method

.method private scanBlock([BIII)I
    .locals 6
    .parameter "bytes"
    .parameter "bytesRead"
    .parameter "absoluteOffset"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 176
    :goto_0
    add-int/lit8 v2, p2, -0x28

    if-lt p4, v2, :cond_1

    .line 189
    :cond_0
    return p4

    .line 177
    :cond_1
    new-instance v0, Lcom/mpatric/mp3agic/MpegFrame;

    aget-byte v2, p1, p4

    add-int/lit8 v3, p4, 0x1

    aget-byte v3, p1, v3

    add-int/lit8 v4, p4, 0x2

    aget-byte v4, p1, v4

    add-int/lit8 v5, p4, 0x3

    aget-byte v5, p1, v5

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/mpatric/mp3agic/MpegFrame;-><init>(BBBB)V

    .line 178
    .local v0, frame:Lcom/mpatric/mp3agic/MpegFrame;
    add-int v2, p3, p4

    invoke-direct {p0, v0, v2}, Lcom/mpatric/mp3agic/Mp3File;->sanityCheckFrame(Lcom/mpatric/mp3agic/MpegFrame;I)V

    .line 179
    add-int v2, p3, p4

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/MpegFrame;->getLengthInBytes()I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v1, v2, -0x1

    .line 180
    .local v1, newEndOffset:I
    invoke-direct {p0}, Lcom/mpatric/mp3agic/Mp3File;->maxEndOffset()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 181
    add-int v2, p3, p4

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/MpegFrame;->getLengthInBytes()I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/mpatric/mp3agic/Mp3File;->endOffset:I

    .line 182
    iget v2, p0, Lcom/mpatric/mp3agic/Mp3File;->frameCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/mpatric/mp3agic/Mp3File;->frameCount:I

    .line 183
    invoke-virtual {v0}, Lcom/mpatric/mp3agic/MpegFrame;->getBitrate()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/mpatric/mp3agic/Mp3File;->addBitrate(I)V

    .line 184
    invoke-virtual {v0}, Lcom/mpatric/mp3agic/MpegFrame;->getLengthInBytes()I

    move-result v2

    add-int/2addr p4, v2

    goto :goto_0
.end method

.method private scanBlockForStart([BIII)I
    .locals 7
    .parameter "bytes"
    .parameter "bytesRead"
    .parameter "absoluteOffset"
    .parameter "offset"

    .prologue
    .line 142
    :goto_0
    add-int/lit8 v3, p2, -0x28

    if-lt p4, v3, :cond_0

    move v2, p4

    .line 172
    .end local p4
    .local v2, offset:I
    :goto_1
    return v2

    .line 143
    .end local v2           #offset:I
    .restart local p4
    :cond_0
    aget-byte v3, p1, p4

    const/4 v4, -0x1

    if-ne v3, v4, :cond_2

    add-int/lit8 v3, p4, 0x1

    aget-byte v3, p1, v3

    and-int/lit8 v3, v3, -0x20

    const/16 v4, -0x20

    if-ne v3, v4, :cond_2

    .line 145
    :try_start_0
    new-instance v1, Lcom/mpatric/mp3agic/MpegFrame;

    aget-byte v3, p1, p4

    add-int/lit8 v4, p4, 0x1

    aget-byte v4, p1, v4

    add-int/lit8 v5, p4, 0x2

    aget-byte v5, p1, v5

    add-int/lit8 v6, p4, 0x3

    aget-byte v6, p1, v6

    invoke-direct {v1, v3, v4, v5, v6}, Lcom/mpatric/mp3agic/MpegFrame;-><init>(BBBB)V

    .line 146
    .local v1, frame:Lcom/mpatric/mp3agic/MpegFrame;
    iget v3, p0, Lcom/mpatric/mp3agic/Mp3File;->xingOffset:I

    if-gez v3, :cond_1

    invoke-direct {p0, p1, p4}, Lcom/mpatric/mp3agic/Mp3File;->isXingFrame([BI)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 147
    add-int v3, p3, p4

    iput v3, p0, Lcom/mpatric/mp3agic/Mp3File;->xingOffset:I

    .line 148
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->getBitrate()I

    move-result v3

    iput v3, p0, Lcom/mpatric/mp3agic/Mp3File;->xingBitrate:I

    .line 149
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->getLengthInBytes()I

    move-result v3

    add-int/2addr p4, v3

    goto :goto_0

    .line 151
    :cond_1
    add-int v3, p3, p4

    iput v3, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    .line 152
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->getChannelMode()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mpatric/mp3agic/Mp3File;->channelMode:Ljava/lang/String;

    .line 153
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->getEmphasis()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mpatric/mp3agic/Mp3File;->emphasis:Ljava/lang/String;

    .line 154
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->getLayer()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mpatric/mp3agic/Mp3File;->layer:Ljava/lang/String;

    .line 155
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->getModeExtension()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mpatric/mp3agic/Mp3File;->modeExtension:Ljava/lang/String;

    .line 156
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->getSampleRate()I

    move-result v3

    iput v3, p0, Lcom/mpatric/mp3agic/Mp3File;->sampleRate:I

    .line 157
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->getVersion()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mpatric/mp3agic/Mp3File;->version:Ljava/lang/String;

    .line 158
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->isCopyright()Z

    move-result v3

    iput-boolean v3, p0, Lcom/mpatric/mp3agic/Mp3File;->copyright:Z

    .line 159
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->isOriginal()Z

    move-result v3

    iput-boolean v3, p0, Lcom/mpatric/mp3agic/Mp3File;->original:Z

    .line 160
    iget v3, p0, Lcom/mpatric/mp3agic/Mp3File;->frameCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/mpatric/mp3agic/Mp3File;->frameCount:I

    .line 161
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->getBitrate()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/mpatric/mp3agic/Mp3File;->addBitrate(I)V

    .line 162
    invoke-virtual {v1}, Lcom/mpatric/mp3agic/MpegFrame;->getLengthInBytes()I
    :try_end_0
    .catch Lcom/mpatric/mp3agic/InvalidDataException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    add-int/2addr p4, v3

    move v2, p4

    .line 163
    .end local p4
    .restart local v2       #offset:I
    goto/16 :goto_1

    .line 165
    .end local v1           #frame:Lcom/mpatric/mp3agic/MpegFrame;
    .end local v2           #offset:I
    .restart local p4
    :catch_0
    move-exception v0

    .line 166
    .local v0, e:Lcom/mpatric/mp3agic/InvalidDataException;
    add-int/lit8 p4, p4, 0x1

    goto/16 :goto_0

    .line 169
    .end local v0           #e:Lcom/mpatric/mp3agic/InvalidDataException;
    :cond_2
    add-int/lit8 p4, p4, 0x1

    goto/16 :goto_0
.end method

.method private scanFile(Ljava/io/RandomAccessFile;)V
    .locals 11
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v9, -0x1

    .line 99
    iget v7, p0, Lcom/mpatric/mp3agic/Mp3File;->bufferLength:I

    new-array v0, v7, [B

    .line 100
    .local v0, bytes:[B
    invoke-virtual {p0, p1}, Lcom/mpatric/mp3agic/Mp3File;->preScanFile(Ljava/io/RandomAccessFile;)I

    move-result v3

    .line 101
    .local v3, fileOffset:I
    int-to-long v7, v3

    invoke-virtual {p1, v7, v8}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 102
    const/4 v4, 0x0

    .line 103
    .local v4, lastBlock:Z
    move v5, v3

    .line 104
    .local v5, lastOffset:I
    :cond_0
    :goto_0
    if-eqz v4, :cond_2

    .line 139
    :cond_1
    return-void

    .line 105
    :cond_2
    iget v7, p0, Lcom/mpatric/mp3agic/Mp3File;->bufferLength:I

    invoke-virtual {p1, v0, v10, v7}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v1

    .line 106
    .local v1, bytesRead:I
    iget v7, p0, Lcom/mpatric/mp3agic/Mp3File;->bufferLength:I

    if-ge v1, v7, :cond_3

    const/4 v4, 0x1

    .line 107
    :cond_3
    const/16 v7, 0x28

    if-lt v1, v7, :cond_0

    .line 110
    const/4 v6, 0x0

    .line 111
    .local v6, offset:I
    :try_start_0
    iget v7, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    if-gez v7, :cond_5

    .line 112
    invoke-direct {p0, v0, v1, v3, v6}, Lcom/mpatric/mp3agic/Mp3File;->scanBlockForStart([BIII)I

    move-result v6

    .line 113
    iget v7, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    if-ltz v7, :cond_4

    iget-boolean v7, p0, Lcom/mpatric/mp3agic/Mp3File;->scanFile:Z

    if-eqz v7, :cond_1

    .line 116
    :cond_4
    iget v5, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    .line 118
    :cond_5
    invoke-direct {p0, v0, v1, v3, v6}, Lcom/mpatric/mp3agic/Mp3File;->scanBlock([BIII)I

    move-result v6

    .line 119
    add-int/2addr v3, v6

    .line 120
    int-to-long v7, v3

    invoke-virtual {p1, v7, v8}, Ljava/io/RandomAccessFile;->seek(J)V
    :try_end_0
    .catch Lcom/mpatric/mp3agic/InvalidDataException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 122
    :catch_0
    move-exception v2

    .line 123
    .local v2, e:Lcom/mpatric/mp3agic/InvalidDataException;
    iget v7, p0, Lcom/mpatric/mp3agic/Mp3File;->frameCount:I

    const/4 v8, 0x2

    if-ge v7, v8, :cond_1

    .line 124
    iput v9, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    .line 125
    iput v9, p0, Lcom/mpatric/mp3agic/Mp3File;->xingOffset:I

    .line 126
    iput v10, p0, Lcom/mpatric/mp3agic/Mp3File;->frameCount:I

    .line 127
    iget-object v7, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrates:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->clear()V

    .line 128
    const/4 v4, 0x0

    .line 129
    add-int/lit8 v3, v5, 0x1

    .line 130
    if-nez v3, :cond_6

    new-instance v7, Lcom/mpatric/mp3agic/InvalidDataException;

    const-string v8, "Valid start of mpeg frames not found"

    invoke-direct {v7, v8, v2}, Lcom/mpatric/mp3agic/InvalidDataException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 131
    :cond_6
    int-to-long v7, v3

    invoke-virtual {p1, v7, v8}, Ljava/io/RandomAccessFile;->seek(J)V

    goto :goto_0
.end method


# virtual methods
.method public getBitrate()I
    .locals 4

    .prologue
    .line 306
    iget-wide v0, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrate:D

    const-wide/high16 v2, 0x3fe0

    add-double/2addr v0, v2

    double-to-int v0, v0

    return v0
.end method

.method public getBitrates()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/mpatric/mp3agic/MutableInteger;",
            ">;"
        }
    .end annotation

    .prologue
    .line 310
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrates:Ljava/util/Map;

    return-object v0
.end method

.method public getChannelMode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 314
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->channelMode:Ljava/lang/String;

    return-object v0
.end method

.method public getCustomTag()[B
    .locals 1

    .prologue
    .line 386
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->customTag:[B

    return-object v0
.end method

.method public getEmphasis()Ljava/lang/String;
    .locals 1

    .prologue
    .line 322
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->emphasis:Ljava/lang/String;

    return-object v0
.end method

.method public getEndOffset()I
    .locals 1

    .prologue
    .line 289
    iget v0, p0, Lcom/mpatric/mp3agic/Mp3File;->endOffset:I

    return v0
.end method

.method public getFrameCount()I
    .locals 1

    .prologue
    .line 281
    iget v0, p0, Lcom/mpatric/mp3agic/Mp3File;->frameCount:I

    return v0
.end method

.method public getId3v1Tag()Lcom/mpatric/mp3agic/ID3v1;
    .locals 1

    .prologue
    .line 362
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    return-object v0
.end method

.method public getId3v2Tag()Lcom/mpatric/mp3agic/ID3v2;
    .locals 1

    .prologue
    .line 374
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    return-object v0
.end method

.method public getLayer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 326
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->layer:Ljava/lang/String;

    return-object v0
.end method

.method public getLengthInMilliseconds()J
    .locals 6

    .prologue
    .line 293
    iget v2, p0, Lcom/mpatric/mp3agic/Mp3File;->endOffset:I

    iget v3, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    sub-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x8

    int-to-double v0, v2

    .line 294
    .local v0, d:D
    iget-wide v2, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrate:D

    div-double v2, v0, v2

    const-wide/high16 v4, 0x3fe0

    add-double/2addr v2, v4

    double-to-long v2, v2

    return-wide v2
.end method

.method public getLengthInSeconds()J
    .locals 4

    .prologue
    .line 298
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/Mp3File;->getLengthInMilliseconds()J

    move-result-wide v0

    const-wide/16 v2, 0x1f4

    add-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getModeExtension()Ljava/lang/String;
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->modeExtension:Ljava/lang/String;

    return-object v0
.end method

.method public getSampleRate()I
    .locals 1

    .prologue
    .line 338
    iget v0, p0, Lcom/mpatric/mp3agic/Mp3File;->sampleRate:I

    return v0
.end method

.method public getStartOffset()I
    .locals 1

    .prologue
    .line 285
    iget v0, p0, Lcom/mpatric/mp3agic/Mp3File;->startOffset:I

    return v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 342
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->version:Ljava/lang/String;

    return-object v0
.end method

.method public getXingBitrate()I
    .locals 1

    .prologue
    .line 354
    iget v0, p0, Lcom/mpatric/mp3agic/Mp3File;->xingBitrate:I

    return v0
.end method

.method public getXingOffset()I
    .locals 1

    .prologue
    .line 350
    iget v0, p0, Lcom/mpatric/mp3agic/Mp3File;->xingOffset:I

    return v0
.end method

.method public hasCustomTag()Z
    .locals 1

    .prologue
    .line 382
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->customTag:[B

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasId3v1Tag()Z
    .locals 1

    .prologue
    .line 358
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasId3v2Tag()Z
    .locals 1

    .prologue
    .line 370
    iget-object v0, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasXingFrame()Z
    .locals 1

    .prologue
    .line 346
    iget v0, p0, Lcom/mpatric/mp3agic/Mp3File;->xingOffset:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCopyright()Z
    .locals 1

    .prologue
    .line 318
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/Mp3File;->copyright:Z

    return v0
.end method

.method public isOriginal()Z
    .locals 1

    .prologue
    .line 334
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/Mp3File;->original:Z

    return v0
.end method

.method public isVbr()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 302
    iget-object v1, p0, Lcom/mpatric/mp3agic/Mp3File;->bitrates:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-le v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected preScanFile(Ljava/io/RandomAccessFile;)I
    .locals 7
    .parameter "file"

    .prologue
    const/4 v2, 0x0

    const/16 v5, 0xa

    .line 78
    new-array v0, v5, [B

    .line 80
    .local v0, bytes:[B
    const-wide/16 v3, 0x0

    :try_start_0
    invoke-virtual {p1, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 81
    const/4 v3, 0x0

    const/16 v4, 0xa

    invoke-virtual {p1, v0, v3, v4}, Ljava/io/RandomAccessFile;->read([BII)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 82
    .local v1, bytesRead:I
    if-ne v1, v5, :cond_0

    .line 84
    :try_start_1
    invoke-static {v0}, Lcom/mpatric/mp3agic/ID3v2TagFactory;->sanityCheckTag([B)V

    .line 85
    const/4 v3, 0x6

    aget-byte v3, v0, v3

    const/4 v4, 0x7

    aget-byte v4, v0, v4

    const/16 v5, 0x8

    aget-byte v5, v0, v5

    const/16 v6, 0x9

    aget-byte v6, v0, v6

    invoke-static {v3, v4, v5, v6}, Lcom/mpatric/mp3agic/BufferTools;->unpackSynchsafeInteger(BBBB)I
    :try_end_1
    .catch Lcom/mpatric/mp3agic/NoSuchTagException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lcom/mpatric/mp3agic/UnsupportedTagException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v2

    add-int/lit8 v2, v2, 0xa

    .line 95
    .end local v1           #bytesRead:I
    :cond_0
    :goto_0
    return v2

    .line 92
    :catch_0
    move-exception v3

    goto :goto_0

    .line 88
    .restart local v1       #bytesRead:I
    :catch_1
    move-exception v3

    goto :goto_0

    .line 86
    :catch_2
    move-exception v3

    goto :goto_0
.end method

.method public save(Ljava/lang/String;)V
    .locals 3
    .parameter "newFilename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/mpatric/mp3agic/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 394
    iget-object v1, p0, Lcom/mpatric/mp3agic/Mp3File;->filename:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 395
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Save filename same as source filename"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 397
    :cond_0
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "rw"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    .local v0, saveFile:Ljava/io/RandomAccessFile;
    :try_start_0
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/Mp3File;->hasId3v2Tag()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 400
    iget-object v1, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v1}, Lcom/mpatric/mp3agic/ID3v2;->toBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->write([B)V

    .line 402
    :cond_1
    invoke-direct {p0, v0}, Lcom/mpatric/mp3agic/Mp3File;->saveMpegFrames(Ljava/io/RandomAccessFile;)V

    .line 403
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/Mp3File;->hasCustomTag()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 404
    iget-object v1, p0, Lcom/mpatric/mp3agic/Mp3File;->customTag:[B

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->write([B)V

    .line 406
    :cond_2
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/Mp3File;->hasId3v1Tag()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 407
    iget-object v1, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v1}, Lcom/mpatric/mp3agic/ID3v1;->toBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 410
    :cond_3
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 412
    return-void

    .line 409
    :catchall_0
    move-exception v1

    .line 410
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 411
    throw v1
.end method

.method public setCustomTag([B)V
    .locals 0
    .parameter "customTag"

    .prologue
    .line 390
    iput-object p1, p0, Lcom/mpatric/mp3agic/Mp3File;->customTag:[B

    .line 391
    return-void
.end method

.method public setId3v1Tag(Lcom/mpatric/mp3agic/ID3v1;)V
    .locals 0
    .parameter "id3v1Tag"

    .prologue
    .line 366
    iput-object p1, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    .line 367
    return-void
.end method

.method public setId3v2Tag(Lcom/mpatric/mp3agic/ID3v2;)V
    .locals 0
    .parameter "id3v2Tag"

    .prologue
    .line 378
    iput-object p1, p0, Lcom/mpatric/mp3agic/Mp3File;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    .line 379
    return-void
.end method
