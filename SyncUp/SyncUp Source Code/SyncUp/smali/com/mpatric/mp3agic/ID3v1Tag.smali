.class public Lcom/mpatric/mp3agic/ID3v1Tag;
.super Ljava/lang/Object;
.source "ID3v1Tag.java"

# interfaces
.implements Lcom/mpatric/mp3agic/ID3v1;


# static fields
.field private static final ALBUM_LENGTH:I = 0x1e

.field private static final ALBUM_OFFSET:I = 0x3f

.field private static final ARTIST_LENGTH:I = 0x1e

.field private static final ARTIST_OFFSET:I = 0x21

.field private static final COMMENT_LENGTH_V1_0:I = 0x1e

.field private static final COMMENT_LENGTH_V1_1:I = 0x1c

.field private static final COMMENT_OFFSET:I = 0x61

.field private static final GENRE_OFFSET:I = 0x7f

.field private static final TAG:Ljava/lang/String; = "TAG"

.field public static final TAG_LENGTH:I = 0x80

.field private static final TITLE_LENGTH:I = 0x1e

.field private static final TITLE_OFFSET:I = 0x3

.field private static final TRACK_MARKER_OFFSET:I = 0x7d

.field private static final TRACK_OFFSET:I = 0x7e

.field private static final VERSION_0:Ljava/lang/String; = "0"

.field private static final VERSION_1:Ljava/lang/String; = "1"

.field private static final YEAR_LENGTH:I = 0x4

.field private static final YEAR_OFFSET:I = 0x5d


# instance fields
.field private album:Ljava/lang/String;

.field private artist:Ljava/lang/String;

.field private comment:Ljava/lang/String;

.field private genre:I

.field private title:Ljava/lang/String;

.field private track:Ljava/lang/String;

.field private year:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    .line 28
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->artist:Ljava/lang/String;

    .line 29
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->title:Ljava/lang/String;

    .line 30
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->album:Ljava/lang/String;

    .line 31
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->year:Ljava/lang/String;

    .line 32
    const/4 v0, -0x1

    iput v0, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    .line 33
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public constructor <init>([B)V
    .locals 2
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NoSuchTagException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    .line 28
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->artist:Ljava/lang/String;

    .line 29
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->title:Ljava/lang/String;

    .line 30
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->album:Ljava/lang/String;

    .line 31
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->year:Ljava/lang/String;

    .line 32
    const/4 v0, -0x1

    iput v0, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    .line 33
    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    .line 39
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/ID3v1Tag;->unpackTag([B)V

    .line 40
    return-void
.end method

.method private numericsOnly(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "s"

    .prologue
    .line 120
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 121
    .local v2, stringBuffer:Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v1, v3, :cond_1

    .line 129
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 122
    :cond_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 123
    .local v0, ch:C
    const/16 v3, 0x30

    if-lt v0, v3, :cond_0

    const/16 v3, 0x39

    if-gt v0, v3, :cond_0

    .line 124
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 121
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private packField([BLjava/lang/String;II)V
    .locals 2
    .parameter "bytes"
    .parameter "value"
    .parameter "maxLength"
    .parameter "offset"

    .prologue
    .line 114
    if-eqz p2, :cond_0

    .line 115
    const/4 v0, 0x0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {p2, v0, v1, p1, p4}, Lcom/mpatric/mp3agic/BufferTools;->stringIntoByteBuffer(Ljava/lang/String;II[BI)V

    .line 117
    :cond_0
    return-void
.end method

.method private sanityCheckTag([B)V
    .locals 3
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NoSuchTagException;
        }
    .end annotation

    .prologue
    .line 67
    array-length v0, p1

    const/16 v1, 0x80

    if-eq v0, v1, :cond_0

    .line 68
    new-instance v0, Lcom/mpatric/mp3agic/NoSuchTagException;

    const-string v1, "Buffer length wrong"

    invoke-direct {v0, v1}, Lcom/mpatric/mp3agic/NoSuchTagException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_0
    const-string v0, "TAG"

    const/4 v1, 0x0

    const-string v2, "TAG"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {p1, v1, v2}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 71
    new-instance v0, Lcom/mpatric/mp3agic/NoSuchTagException;

    invoke-direct {v0}, Lcom/mpatric/mp3agic/NoSuchTagException;-><init>()V

    throw v0

    .line 73
    :cond_1
    return-void
.end method

.method private unpackTag([B)V
    .locals 5
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NoSuchTagException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x61

    const/16 v3, 0x1e

    .line 43
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/ID3v1Tag;->sanityCheckTag([B)V

    .line 44
    const/4 v1, 0x3

    invoke-static {p1, v1, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mpatric/mp3agic/BufferTools;->trimStringRight(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->title:Ljava/lang/String;

    .line 45
    const/16 v1, 0x21

    invoke-static {p1, v1, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mpatric/mp3agic/BufferTools;->trimStringRight(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->artist:Ljava/lang/String;

    .line 46
    const/16 v1, 0x3f

    invoke-static {p1, v1, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mpatric/mp3agic/BufferTools;->trimStringRight(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->album:Ljava/lang/String;

    .line 47
    const/16 v1, 0x5d

    const/4 v2, 0x4

    invoke-static {p1, v1, v2}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mpatric/mp3agic/BufferTools;->trimStringRight(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->year:Ljava/lang/String;

    .line 48
    const/16 v1, 0x7f

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    iput v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    .line 49
    iget v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    const/16 v2, 0xff

    if-ne v1, v2, :cond_0

    .line 50
    const/4 v1, -0x1

    iput v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    .line 52
    :cond_0
    const/16 v1, 0x7d

    aget-byte v1, p1, v1

    if-eqz v1, :cond_1

    .line 53
    invoke-static {p1, v4, v3}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mpatric/mp3agic/BufferTools;->trimStringRight(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    .line 54
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    .line 64
    :goto_0
    return-void

    .line 56
    :cond_1
    const/16 v1, 0x1c

    invoke-static {p1, v4, v1}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mpatric/mp3agic/BufferTools;->trimStringRight(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    .line 57
    const/16 v1, 0x7e

    aget-byte v0, p1, v1

    .line 58
    .local v0, trackInt:I
    if-nez v0, :cond_2

    .line 59
    const-string v1, ""

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    goto :goto_0

    .line 61
    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 205
    instance-of v3, p1, Lcom/mpatric/mp3agic/ID3v1Tag;

    if-nez v3, :cond_1

    .line 233
    :cond_0
    :goto_0
    return v1

    .line 206
    :cond_1
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 207
    check-cast v0, Lcom/mpatric/mp3agic/ID3v1Tag;

    .line 208
    .local v0, other:Lcom/mpatric/mp3agic/ID3v1Tag;
    iget v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    iget v4, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    if-ne v3, v4, :cond_0

    .line 209
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    if-nez v3, :cond_9

    .line 210
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 213
    :cond_3
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->artist:Ljava/lang/String;

    if-nez v3, :cond_a

    .line 214
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->artist:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 217
    :cond_4
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->title:Ljava/lang/String;

    if-nez v3, :cond_b

    .line 218
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->title:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 221
    :cond_5
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->album:Ljava/lang/String;

    if-nez v3, :cond_c

    .line 222
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->album:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 225
    :cond_6
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->year:Ljava/lang/String;

    if-nez v3, :cond_d

    .line 226
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->year:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 229
    :cond_7
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    if-nez v3, :cond_e

    .line 230
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    if-nez v3, :cond_0

    :cond_8
    move v1, v2

    .line 233
    goto :goto_0

    .line 211
    :cond_9
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 212
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    iget-object v4, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_0

    .line 215
    :cond_a
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->artist:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 216
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->artist:Ljava/lang/String;

    iget-object v4, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->artist:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    goto :goto_0

    .line 219
    :cond_b
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->title:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 220
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->title:Ljava/lang/String;

    iget-object v4, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_0

    .line 223
    :cond_c
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->album:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 224
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->album:Ljava/lang/String;

    iget-object v4, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->album:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    goto :goto_0

    .line 227
    :cond_d
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->year:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 228
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->year:Ljava/lang/String;

    iget-object v4, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->year:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    goto/16 :goto_0

    .line 231
    :cond_e
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 232
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    iget-object v4, v0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    goto/16 :goto_0
.end method

.method public getAlbum()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->album:Ljava/lang/String;

    return-object v0
.end method

.method public getArtist()Ljava/lang/String;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->artist:Ljava/lang/String;

    return-object v0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public getGenre()I
    .locals 1

    .prologue
    .line 181
    iget v0, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    return v0
.end method

.method public getGenreDescription()Ljava/lang/String;
    .locals 3

    .prologue
    .line 190
    :try_start_0
    sget-object v1, Lcom/mpatric/mp3agic/ID3v1Genres;->GENRES:[Ljava/lang/String;

    iget v2, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    aget-object v1, v1, v2
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 192
    :goto_0
    return-object v1

    .line 191
    :catch_0
    move-exception v0

    .line 192
    .local v0, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    const-string v1, "Unknown"

    goto :goto_0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getTrack()Ljava/lang/String;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 134
    const-string v0, "0"

    .line 136
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "1"

    goto :goto_0
.end method

.method public getYear()Ljava/lang/String;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->year:Ljava/lang/String;

    return-object v0
.end method

.method public packTag([B)V
    .locals 8
    .parameter "bytes"

    .prologue
    const/16 v7, 0x7e

    const/16 v6, 0x61

    const/4 v4, 0x3

    const/4 v3, 0x0

    const/16 v5, 0x1e

    .line 86
    invoke-static {p1, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 87
    const-string v2, "TAG"

    invoke-static {v2, v3, v4, p1, v3}, Lcom/mpatric/mp3agic/BufferTools;->stringIntoByteBuffer(Ljava/lang/String;II[BI)V

    .line 88
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->title:Ljava/lang/String;

    invoke-direct {p0, p1, v2, v5, v4}, Lcom/mpatric/mp3agic/ID3v1Tag;->packField([BLjava/lang/String;II)V

    .line 89
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->artist:Ljava/lang/String;

    const/16 v3, 0x21

    invoke-direct {p0, p1, v2, v5, v3}, Lcom/mpatric/mp3agic/ID3v1Tag;->packField([BLjava/lang/String;II)V

    .line 90
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->album:Ljava/lang/String;

    const/16 v3, 0x3f

    invoke-direct {p0, p1, v2, v5, v3}, Lcom/mpatric/mp3agic/ID3v1Tag;->packField([BLjava/lang/String;II)V

    .line 91
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->year:Ljava/lang/String;

    const/4 v3, 0x4

    const/16 v4, 0x5d

    invoke-direct {p0, p1, v2, v3, v4}, Lcom/mpatric/mp3agic/ID3v1Tag;->packField([BLjava/lang/String;II)V

    .line 92
    iget v2, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    const/16 v3, 0x80

    if-ge v2, v3, :cond_1

    .line 93
    const/16 v2, 0x7f

    iget v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    int-to-byte v3, v3

    aput-byte v3, p1, v2

    .line 97
    :goto_0
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    if-nez v2, :cond_2

    .line 98
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    invoke-direct {p0, p1, v2, v5, v6}, Lcom/mpatric/mp3agic/ID3v1Tag;->packField([BLjava/lang/String;II)V

    .line 111
    :cond_0
    :goto_1
    return-void

    .line 95
    :cond_1
    const/16 v2, 0x7f

    iget v3, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    add-int/lit16 v3, v3, -0x100

    int-to-byte v3, v3

    aput-byte v3, p1, v2

    goto :goto_0

    .line 100
    :cond_2
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    const/16 v3, 0x1c

    invoke-direct {p0, p1, v2, v3, v6}, Lcom/mpatric/mp3agic/ID3v1Tag;->packField([BLjava/lang/String;II)V

    .line 101
    iget-object v2, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/mpatric/mp3agic/ID3v1Tag;->numericsOnly(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 102
    .local v1, trackTemp:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 103
    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 104
    .local v0, trackInt:I
    const/16 v2, 0x80

    if-ge v0, v2, :cond_3

    .line 105
    int-to-byte v2, v0

    aput-byte v2, p1, v7

    goto :goto_1

    .line 107
    :cond_3
    add-int/lit16 v2, v0, -0x100

    int-to-byte v2, v2

    aput-byte v2, p1, v7

    goto :goto_1
.end method

.method public setAlbum(Ljava/lang/String;)V
    .locals 0
    .parameter "album"

    .prologue
    .line 169
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->album:Ljava/lang/String;

    .line 170
    return-void
.end method

.method public setArtist(Ljava/lang/String;)V
    .locals 0
    .parameter "artist"

    .prologue
    .line 153
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->artist:Ljava/lang/String;

    .line 154
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .parameter "comment"

    .prologue
    .line 201
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->comment:Ljava/lang/String;

    .line 202
    return-void
.end method

.method public setGenre(I)V
    .locals 0
    .parameter "genre"

    .prologue
    .line 185
    iput p1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->genre:I

    .line 186
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 161
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->title:Ljava/lang/String;

    .line 162
    return-void
.end method

.method public setTrack(Ljava/lang/String;)V
    .locals 0
    .parameter "track"

    .prologue
    .line 145
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->track:Ljava/lang/String;

    .line 146
    return-void
.end method

.method public setYear(Ljava/lang/String;)V
    .locals 0
    .parameter "year"

    .prologue
    .line 177
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v1Tag;->year:Ljava/lang/String;

    .line 178
    return-void
.end method

.method public toBytes([B)V
    .locals 0
    .parameter "bytes"

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/mpatric/mp3agic/ID3v1Tag;->packTag([B)V

    .line 83
    return-void
.end method

.method public toBytes()[B
    .locals 2

    .prologue
    .line 76
    const/16 v1, 0x80

    new-array v0, v1, [B

    .line 77
    .local v0, bytes:[B
    invoke-virtual {p0, v0}, Lcom/mpatric/mp3agic/ID3v1Tag;->packTag([B)V

    .line 78
    return-object v0
.end method
