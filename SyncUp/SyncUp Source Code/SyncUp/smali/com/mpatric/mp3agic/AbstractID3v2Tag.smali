.class public abstract Lcom/mpatric/mp3agic/AbstractID3v2Tag;
.super Ljava/lang/Object;
.source "AbstractID3v2Tag.java"

# interfaces
.implements Lcom/mpatric/mp3agic/ID3v2;


# static fields
.field protected static final COMPRESSION_BIT:I = 0x6

.field protected static final DATA_LENGTH_OFFSET:I = 0x6

.field protected static final EXPERIMENTAL_BIT:I = 0x5

.field protected static final EXTENDED_HEADER_BIT:I = 0x6

.field protected static final FLAGS_OFFSET:I = 0x5

.field protected static final FOOTER_BIT:I = 0x4

.field protected static final FOOTER_LENGTH:I = 0xa

.field protected static final FOOTER_TAG:Ljava/lang/String; = "3DI"

.field protected static final HEADER_LENGTH:I = 0xa

.field public static final ID_ALBUM:Ljava/lang/String; = "TALB"

.field public static final ID_ALBUM_OBSELETE:Ljava/lang/String; = "TAL"

.field public static final ID_ARTIST:Ljava/lang/String; = "TPE1"

.field public static final ID_ARTIST_OBSELETE:Ljava/lang/String; = "TP1"

.field public static final ID_COMMENT:Ljava/lang/String; = "COMM"

.field public static final ID_COMMENT_OBSELETE:Ljava/lang/String; = "COM"

.field public static final ID_COMPOSER:Ljava/lang/String; = "TCOM"

.field public static final ID_COMPOSER_OBSELETE:Ljava/lang/String; = "TCM"

.field public static final ID_COPYRIGHT:Ljava/lang/String; = "TCOP"

.field public static final ID_COPYRIGHT_OBSELETE:Ljava/lang/String; = "TCR"

.field public static final ID_ENCODER:Ljava/lang/String; = "TENC"

.field public static final ID_ENCODER_OBSELETE:Ljava/lang/String; = "TEN"

.field public static final ID_GENRE:Ljava/lang/String; = "TCON"

.field public static final ID_GENRE_OBSELETE:Ljava/lang/String; = "TCO"

.field public static final ID_IMAGE:Ljava/lang/String; = "APIC"

.field public static final ID_IMAGE_OBSELETE:Ljava/lang/String; = "PIC"

.field public static final ID_ORIGINAL_ARTIST:Ljava/lang/String; = "TOPE"

.field public static final ID_ORIGINAL_ARTIST_OBSELETE:Ljava/lang/String; = "TOA"

.field public static final ID_PUBLISHER:Ljava/lang/String; = "TPUB"

.field public static final ID_PUBLISHER_OBSELETE:Ljava/lang/String; = "TBP"

.field public static final ID_TITLE:Ljava/lang/String; = "TIT2"

.field public static final ID_TITLE_OBSELETE:Ljava/lang/String; = "TT2"

.field public static final ID_TRACK:Ljava/lang/String; = "TRCK"

.field public static final ID_TRACK_OBSELETE:Ljava/lang/String; = "TRK"

.field public static final ID_URL:Ljava/lang/String; = "WXXX"

.field public static final ID_URL_OBSELETE:Ljava/lang/String; = "WXX"

.field public static final ID_YEAR:Ljava/lang/String; = "TYER"

.field public static final ID_YEAR_OBSELETE:Ljava/lang/String; = "TYE"

.field private static final ITUNES_COMMENT_DESCRIPTION:Ljava/lang/String; = "iTunNORM"

.field protected static final MAJOR_VERSION_OFFSET:I = 0x3

.field protected static final MINOR_VERSION_OFFSET:I = 0x4

.field protected static final PADDING_LENGTH:I = 0x100

.field protected static final TAG:Ljava/lang/String; = "ID3"

.field protected static final UNSYNCHRONISATION_BIT:I = 0x7


# instance fields
.field protected compression:Z

.field private dataLength:I

.field protected experimental:Z

.field protected extendedHeader:Z

.field private extendedHeaderData:[B

.field private extendedHeaderLength:I

.field protected footer:Z

.field private final frameSets:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/mpatric/mp3agic/ID3v2FrameSet;",
            ">;"
        }
    .end annotation
.end field

.field private obseleteFormat:Z

.field protected padding:Z

.field protected unsynchronisation:Z

.field protected version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unsynchronisation:Z

    .line 55
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeader:Z

    .line 56
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->experimental:Z

    .line 57
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->footer:Z

    .line 58
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->compression:Z

    .line 59
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->padding:Z

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    .line 61
    iput v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    .line 64
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    .line 69
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    .line 70
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NoSuchTagException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 73
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;-><init>([BZ)V

    .line 74
    return-void
.end method

.method public constructor <init>([BZ)V
    .locals 2
    .parameter "bytes"
    .parameter "obseleteFormat"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NoSuchTagException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unsynchronisation:Z

    .line 55
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeader:Z

    .line 56
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->experimental:Z

    .line 57
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->footer:Z

    .line 58
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->compression:Z

    .line 59
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->padding:Z

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    .line 61
    iput v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    .line 64
    iput-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    .line 77
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    .line 78
    iput-boolean p2, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    .line 79
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unpackTag([B)V

    .line 80
    return-void
.end method

.method private addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V
    .locals 3
    .parameter "frame"
    .parameter "replace"

    .prologue
    .line 138
    iget-object v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/mpatric/mp3agic/ID3v2Frame;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mpatric/mp3agic/ID3v2FrameSet;

    .line 139
    .local v0, frameSet:Lcom/mpatric/mp3agic/ID3v2FrameSet;
    if-nez v0, :cond_0

    .line 140
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2FrameSet;

    .end local v0           #frameSet:Lcom/mpatric/mp3agic/ID3v2FrameSet;
    invoke-virtual {p1}, Lcom/mpatric/mp3agic/ID3v2Frame;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mpatric/mp3agic/ID3v2FrameSet;-><init>(Ljava/lang/String;)V

    .line 141
    .restart local v0       #frameSet:Lcom/mpatric/mp3agic/ID3v2FrameSet;
    invoke-virtual {v0, p1}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;)V

    .line 142
    iget-object v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/mpatric/mp3agic/ID3v2Frame;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    :goto_0
    return-void

    .line 143
    :cond_0
    if-eqz p2, :cond_1

    .line 144
    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->clear()V

    .line 145
    invoke-virtual {v0, p1}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;)V

    goto :goto_0

    .line 147
    :cond_1
    invoke-virtual {v0, p1}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;)V

    goto :goto_0
.end method

.method private calculateDataLength()I
    .locals 6

    .prologue
    .line 251
    const/4 v3, 0x0

    .line 252
    .local v3, length:I
    iget-boolean v5, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeader:Z

    if-eqz v5, :cond_0

    iget v5, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeaderLength:I

    add-int/2addr v3, v5

    .line 253
    :cond_0
    iget-boolean v5, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->footer:Z

    if-eqz v5, :cond_3

    add-int/lit8 v3, v3, 0xa

    .line 255
    :cond_1
    :goto_0
    iget-object v5, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 256
    .local v4, setIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mpatric/mp3agic/ID3v2FrameSet;>;"
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_4

    .line 264
    return v3

    .line 254
    .end local v4           #setIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mpatric/mp3agic/ID3v2FrameSet;>;"
    :cond_3
    iget-boolean v5, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->padding:Z

    if-eqz v5, :cond_1

    add-int/lit16 v3, v3, 0x100

    goto :goto_0

    .line 257
    .restart local v4       #setIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mpatric/mp3agic/ID3v2FrameSet;>;"
    :cond_4
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mpatric/mp3agic/ID3v2FrameSet;

    .line 258
    .local v2, frameSet:Lcom/mpatric/mp3agic/ID3v2FrameSet;
    invoke-virtual {v2}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->getFrames()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 259
    .local v1, frameIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mpatric/mp3agic/ID3v2Frame;>;"
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 260
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mpatric/mp3agic/ID3v2Frame;

    .line 261
    .local v0, frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2Frame;->getLength()I

    move-result v5

    add-int/2addr v3, v5

    goto :goto_1
.end method

.method private createPictureFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    .locals 5
    .parameter "id"

    .prologue
    .line 709
    iget-object v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mpatric/mp3agic/ID3v2FrameSet;

    .line 710
    .local v2, frameSet:Lcom/mpatric/mp3agic/ID3v2FrameSet;
    if-eqz v2, :cond_1

    .line 711
    invoke-virtual {v2}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->getFrames()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mpatric/mp3agic/ID3v2Frame;

    .line 714
    .local v0, frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :try_start_0
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v3, :cond_0

    new-instance v1, Lcom/mpatric/mp3agic/ID3v2ObseletePictureFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v3

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2Frame;->getData()[B

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lcom/mpatric/mp3agic/ID3v2ObseletePictureFrameData;-><init>(Z[B)V

    .line 721
    .end local v0           #frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :goto_0
    return-object v1

    .line 715
    .restart local v0       #frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :cond_0
    new-instance v1, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v3

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2Frame;->getData()[B

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;-><init>(Z[B)V
    :try_end_0
    .catch Lcom/mpatric/mp3agic/InvalidDataException; {:try_start_0 .. :try_end_0} :catch_0

    .local v1, frameData:Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    goto :goto_0

    .line 717
    .end local v1           #frameData:Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    :catch_0
    move-exception v3

    .line 721
    .end local v0           #frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private extractCommentFrameData(Ljava/lang/String;Z)Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    .locals 6
    .parameter "id"
    .parameter "itunes"

    .prologue
    .line 687
    iget-object v4, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mpatric/mp3agic/ID3v2FrameSet;

    .line 688
    .local v2, frameSet:Lcom/mpatric/mp3agic/ID3v2FrameSet;
    if-eqz v2, :cond_1

    .line 689
    invoke-virtual {v2}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->getFrames()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 690
    .local v3, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mpatric/mp3agic/ID3v2Frame;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    .line 705
    .end local v3           #iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mpatric/mp3agic/ID3v2Frame;>;"
    :cond_1
    const/4 v1, 0x0

    :cond_2
    :goto_1
    return-object v1

    .line 691
    .restart local v3       #iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mpatric/mp3agic/ID3v2Frame;>;"
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mpatric/mp3agic/ID3v2Frame;

    .line 694
    .local v0, frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :try_start_0
    new-instance v1, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v4

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2Frame;->getData()[B

    move-result-object v5

    invoke-direct {v1, v4, v5}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;-><init>(Z[B)V

    .line 695
    .local v1, frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    if-eqz p2, :cond_4

    const-string v4, "iTunNORM"

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->getDescription()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/mpatric/mp3agic/InvalidDataException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-nez v4, :cond_2

    .line 697
    :cond_4
    if-nez p2, :cond_0

    goto :goto_1

    .line 700
    .end local v1           #frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    .locals 5
    .parameter "id"

    .prologue
    .line 657
    iget-object v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mpatric/mp3agic/ID3v2FrameSet;

    .line 658
    .local v2, frameSet:Lcom/mpatric/mp3agic/ID3v2FrameSet;
    if-eqz v2, :cond_0

    .line 659
    invoke-virtual {v2}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->getFrames()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mpatric/mp3agic/ID3v2Frame;

    .line 662
    .local v0, frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :try_start_0
    new-instance v1, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v3

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2Frame;->getData()[B

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(Z[B)V
    :try_end_0
    .catch Lcom/mpatric/mp3agic/InvalidDataException; {:try_start_0 .. :try_end_0} :catch_0

    .line 668
    .end local v0           #frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :goto_0
    return-object v1

    .line 664
    .restart local v0       #frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :catch_0
    move-exception v3

    .line 668
    .end local v0           #frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private extractUrlFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2UrlFrameData;
    .locals 5
    .parameter "id"

    .prologue
    .line 672
    iget-object v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mpatric/mp3agic/ID3v2FrameSet;

    .line 673
    .local v2, frameSet:Lcom/mpatric/mp3agic/ID3v2FrameSet;
    if-eqz v2, :cond_0

    .line 674
    invoke-virtual {v2}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->getFrames()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mpatric/mp3agic/ID3v2Frame;

    .line 677
    .local v0, frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :try_start_0
    new-instance v1, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v3

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2Frame;->getData()[B

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;-><init>(Z[B)V
    :try_end_0
    .catch Lcom/mpatric/mp3agic/InvalidDataException; {:try_start_0 .. :try_end_0} :catch_0

    .line 683
    .end local v0           #frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :goto_0
    return-object v1

    .line 679
    .restart local v0       #frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :catch_0
    move-exception v3

    .line 683
    .end local v0           #frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private invalidateDataLength()V
    .locals 1

    .prologue
    .line 276
    const/4 v0, 0x0

    iput v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    .line 277
    return-void
.end method

.method private packExtendedHeader([BI)I
    .locals 4
    .parameter "bytes"
    .parameter "offset"

    .prologue
    .line 204
    iget v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeaderLength:I

    invoke-static {v0, p1, p2}, Lcom/mpatric/mp3agic/BufferTools;->packSynchsafeInteger(I[BI)V

    .line 205
    iget-object v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeaderData:[B

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeaderData:[B

    array-length v2, v2

    add-int/lit8 v3, p2, 0x4

    invoke-static {v0, v1, v2, p1, v3}, Lcom/mpatric/mp3agic/BufferTools;->copyIntoByteBuffer([BII[BI)V

    .line 206
    add-int/lit8 v0, p2, 0x4

    iget-object v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeaderData:[B

    array-length v1, v1

    add-int/2addr v0, v1

    return v0
.end method

.method private packFooter([BI)I
    .locals 6
    .parameter "bytes"
    .parameter "offset"

    .prologue
    const/4 v5, 0x0

    .line 235
    const-string v3, "3DI"

    const-string v4, "3DI"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-static {v3, v5, v4, p1, p2}, Lcom/mpatric/mp3agic/BufferTools;->stringIntoByteBuffer(Ljava/lang/String;II[BI)V

    .line 236
    iget-object v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 237
    .local v2, s:[Ljava/lang/String;
    array-length v3, v2

    if-lez v3, :cond_0

    .line 238
    aget-object v3, v2, v5

    invoke-static {v3}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v0

    .line 239
    .local v0, majorVersion:B
    add-int/lit8 v3, p2, 0x3

    aput-byte v0, p1, v3

    .line 241
    .end local v0           #majorVersion:B
    :cond_0
    array-length v3, v2

    const/4 v4, 0x1

    if-le v3, v4, :cond_1

    .line 242
    aget-object v3, v2, v5

    invoke-static {v3}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v1

    .line 243
    .local v1, minorVersion:B
    add-int/lit8 v3, p2, 0x4

    aput-byte v1, p1, v3

    .line 245
    .end local v1           #minorVersion:B
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->packFlags([BI)V

    .line 246
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->getDataLength()I

    move-result v3

    add-int/lit8 v4, p2, 0x6

    invoke-static {v3, p1, v4}, Lcom/mpatric/mp3agic/BufferTools;->packSynchsafeInteger(I[BI)V

    .line 247
    add-int/lit8 v3, p2, 0xa

    return v3
.end method

.method private packHeader([BI)I
    .locals 7
    .parameter "bytes"
    .parameter "offset"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 186
    const-string v3, "ID3"

    const-string v4, "ID3"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-static {v3, v5, v4, p1, p2}, Lcom/mpatric/mp3agic/BufferTools;->stringIntoByteBuffer(Ljava/lang/String;II[BI)V

    .line 187
    iget-object v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    const-string v4, "\\."

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 188
    .local v2, s:[Ljava/lang/String;
    array-length v3, v2

    if-lez v3, :cond_0

    .line 189
    aget-object v3, v2, v5

    invoke-static {v3}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v0

    .line 190
    .local v0, majorVersion:B
    add-int/lit8 v3, p2, 0x3

    aput-byte v0, p1, v3

    .line 192
    .end local v0           #majorVersion:B
    :cond_0
    array-length v3, v2

    if-le v3, v6, :cond_1

    .line 193
    aget-object v3, v2, v6

    invoke-static {v3}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v1

    .line 194
    .local v1, minorVersion:B
    add-int/lit8 v3, p2, 0x4

    aput-byte v1, p1, v3

    .line 196
    .end local v1           #minorVersion:B
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->packFlags([BI)V

    .line 197
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->getDataLength()I

    move-result v3

    add-int/lit8 v4, p2, 0x6

    invoke-static {v3, p1, v4}, Lcom/mpatric/mp3agic/BufferTools;->packSynchsafeInteger(I[BI)V

    .line 198
    add-int/lit8 v3, p2, 0xa

    return v3
.end method

.method private packSpecifiedFrames([BILjava/lang/String;Ljava/lang/String;)I
    .locals 7
    .parameter "bytes"
    .parameter "offset"
    .parameter "onlyId"
    .parameter "notId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 216
    iget-object v5, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 217
    .local v4, setIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mpatric/mp3agic/ID3v2FrameSet;>;"
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 231
    return p2

    .line 218
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mpatric/mp3agic/ID3v2FrameSet;

    .line 219
    .local v3, frameSet:Lcom/mpatric/mp3agic/ID3v2FrameSet;
    if-eqz p3, :cond_2

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    :cond_2
    if-eqz p4, :cond_3

    invoke-virtual {v3}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 220
    :cond_3
    invoke-virtual {v3}, Lcom/mpatric/mp3agic/ID3v2FrameSet;->getFrames()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 221
    .local v2, frameIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mpatric/mp3agic/ID3v2Frame;>;"
    :cond_4
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 222
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mpatric/mp3agic/ID3v2Frame;

    .line 223
    .local v0, frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2Frame;->getDataLength()I

    move-result v5

    if-lez v5, :cond_4

    .line 224
    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2Frame;->toBytes()[B

    move-result-object v1

    .line 225
    .local v1, frameData:[B
    const/4 v5, 0x0

    array-length v6, v1

    invoke-static {v1, v5, v6, p1, p2}, Lcom/mpatric/mp3agic/BufferTools;->copyIntoByteBuffer([BII[BI)V

    .line 226
    array-length v5, v1

    add-int/2addr p2, v5

    goto :goto_0
.end method

.method private unpackExtendedHeader([BI)I
    .locals 4
    .parameter "bytes"
    .parameter "offset"

    .prologue
    .line 117
    aget-byte v0, p1, p2

    add-int/lit8 v1, p2, 0x1

    aget-byte v1, p1, v1

    add-int/lit8 v2, p2, 0x2

    aget-byte v2, p1, v2

    add-int/lit8 v3, p2, 0x3

    aget-byte v3, p1, v3

    invoke-static {v0, v1, v2, v3}, Lcom/mpatric/mp3agic/BufferTools;->unpackSynchsafeInteger(BBBB)I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeaderLength:I

    .line 118
    add-int/lit8 v0, p2, 0x4

    iget v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeaderLength:I

    invoke-static {p1, v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->copyBuffer([BII)[B

    move-result-object v0

    iput-object v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeaderData:[B

    .line 119
    iget v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeaderLength:I

    return v0
.end method

.method private unpackFooter([BI)I
    .locals 2
    .parameter "bytes"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 162
    const-string v0, "3DI"

    const-string v1, "3DI"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {p1, p2, v1}, Lcom/mpatric/mp3agic/BufferTools;->byteBufferToString([BII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 163
    new-instance v0, Lcom/mpatric/mp3agic/InvalidDataException;

    const-string v1, "Invalid footer"

    invoke-direct {v0, v1}, Lcom/mpatric/mp3agic/InvalidDataException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 165
    :cond_0
    const/16 v0, 0xa

    return v0
.end method

.method private unpackHeader([B)I
    .locals 6
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x3

    .line 101
    aget-byte v0, p1, v4

    .line 102
    .local v0, majorVersion:I
    aget-byte v1, p1, v5

    .line 103
    .local v1, minorVersion:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    .line 104
    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    if-eq v0, v4, :cond_0

    if-eq v0, v5, :cond_0

    .line 105
    new-instance v2, Lcom/mpatric/mp3agic/UnsupportedTagException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unsupported version "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mpatric/mp3agic/UnsupportedTagException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 107
    :cond_0
    invoke-virtual {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unpackFlags([B)V

    .line 108
    const/4 v2, 0x5

    aget-byte v2, p1, v2

    and-int/lit8 v2, v2, 0xf

    if-eqz v2, :cond_1

    new-instance v2, Lcom/mpatric/mp3agic/UnsupportedTagException;

    const-string v3, "Unrecognised bits in header"

    invoke-direct {v2, v3}, Lcom/mpatric/mp3agic/UnsupportedTagException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 109
    :cond_1
    const/4 v2, 0x6

    aget-byte v2, p1, v2

    const/4 v3, 0x7

    aget-byte v3, p1, v3

    const/16 v4, 0x8

    aget-byte v4, p1, v4

    const/16 v5, 0x9

    aget-byte v5, p1, v5

    invoke-static {v2, v3, v4, v5}, Lcom/mpatric/mp3agic/BufferTools;->unpackSynchsafeInteger(BBBB)I

    move-result v2

    iput v2, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    .line 110
    iget v2, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    const/4 v3, 0x1

    if-ge v2, v3, :cond_2

    new-instance v2, Lcom/mpatric/mp3agic/InvalidDataException;

    const-string v3, "Zero size tag"

    invoke-direct {v2, v3}, Lcom/mpatric/mp3agic/InvalidDataException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 111
    :cond_2
    const/16 v2, 0xa

    return v2
.end method

.method private unpackTag([B)V
    .locals 5
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NoSuchTagException;,
            Lcom/mpatric/mp3agic/UnsupportedTagException;,
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 83
    invoke-static {p1}, Lcom/mpatric/mp3agic/ID3v2TagFactory;->sanityCheckTag([B)V

    .line 84
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unpackHeader([B)I

    move-result v2

    .line 86
    .local v2, offset:I
    :try_start_0
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeader:Z

    if-eqz v3, :cond_0

    .line 87
    invoke-direct {p0, p1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unpackExtendedHeader([BI)I

    move-result v2

    .line 89
    :cond_0
    iget v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    .line 90
    .local v1, framesLength:I
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->footer:Z

    if-eqz v3, :cond_1

    add-int/lit8 v1, v1, -0xa

    .line 91
    :cond_1
    invoke-virtual {p0, p1, v2, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unpackFrames([BII)I

    move-result v2

    .line 92
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->footer:Z

    if-eqz v3, :cond_2

    .line 93
    iget v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    invoke-direct {p0, p1, v3}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unpackFooter([BI)I
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 98
    :cond_2
    return-void

    .line 95
    .end local v1           #framesLength:I
    :catch_0
    move-exception v0

    .line 96
    .local v0, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v3, Lcom/mpatric/mp3agic/InvalidDataException;

    const-string v4, "Premature end of tag"

    invoke-direct {v3, v4, v0}, Lcom/mpatric/mp3agic/InvalidDataException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method


# virtual methods
.method public clearFrameSet(Ljava/lang/String;)V
    .locals 1
    .parameter "id"

    .prologue
    .line 651
    iget-object v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 652
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 654
    :cond_0
    return-void
.end method

.method protected createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;
    .locals 1
    .parameter "id"
    .parameter "data"

    .prologue
    .line 157
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/mpatric/mp3agic/ID3v2ObseleteFrame;

    invoke-direct {v0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2ObseleteFrame;-><init>(Ljava/lang/String;[B)V

    .line 158
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2Frame;

    invoke-direct {v0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2Frame;-><init>(Ljava/lang/String;[B)V

    goto :goto_0
.end method

.method protected createFrame([BI)Lcom/mpatric/mp3agic/ID3v2Frame;
    .locals 1
    .parameter "bytes"
    .parameter "currentOffset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/InvalidDataException;
        }
    .end annotation

    .prologue
    .line 152
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/mpatric/mp3agic/ID3v2ObseleteFrame;

    invoke-direct {v0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2ObseleteFrame;-><init>([BI)V

    .line 153
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2Frame;

    invoke-direct {v0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2Frame;-><init>([BI)V

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 725
    instance-of v3, p1, Lcom/mpatric/mp3agic/AbstractID3v2Tag;

    if-nez v3, :cond_1

    .line 743
    :cond_0
    :goto_0
    return v1

    .line 726
    :cond_1
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 727
    check-cast v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;

    .line 728
    .local v0, other:Lcom/mpatric/mp3agic/AbstractID3v2Tag;
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unsynchronisation:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unsynchronisation:Z

    if-ne v3, v4, :cond_0

    .line 729
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeader:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeader:Z

    if-ne v3, v4, :cond_0

    .line 730
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->experimental:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->experimental:Z

    if-ne v3, v4, :cond_0

    .line 731
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->footer:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->footer:Z

    if-ne v3, v4, :cond_0

    .line 732
    iget-boolean v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->compression:Z

    iget-boolean v4, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->compression:Z

    if-ne v3, v4, :cond_0

    .line 733
    iget v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    iget v4, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    if-ne v3, v4, :cond_0

    .line 734
    iget v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeaderLength:I

    iget v4, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeaderLength:I

    if-ne v3, v4, :cond_0

    .line 735
    iget-object v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    if-nez v3, :cond_5

    .line 736
    iget-object v3, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 739
    :cond_3
    iget-object v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    if-nez v3, :cond_6

    .line 740
    iget-object v3, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    if-nez v3, :cond_0

    :cond_4
    move v1, v2

    .line 743
    goto :goto_0

    .line 737
    :cond_5
    iget-object v3, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 738
    iget-object v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    iget-object v4, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_0

    .line 741
    :cond_6
    iget-object v3, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    if-eqz v3, :cond_0

    .line 742
    iget-object v3, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    iget-object v4, v0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    invoke-interface {v3, v4}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    goto :goto_0
.end method

.method protected extractGenreDescription(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "genreValue"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 484
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 485
    .local v1, value:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 486
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x28

    if-ne v2, v3, :cond_0

    .line 487
    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 488
    .local v0, pos:I
    if-lez v0, :cond_0

    .line 489
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 494
    .end local v0           #pos:I
    .end local v1           #value:Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v1

    .restart local v1       #value:Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected extractGenreNumber(Ljava/lang/String;)I
    .locals 4
    .parameter "genreValue"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 471
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 472
    .local v1, value:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 473
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x28

    if-ne v2, v3, :cond_0

    .line 474
    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 475
    .local v0, pos:I
    if-lez v0, :cond_0

    .line 476
    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 480
    .end local v0           #pos:I
    :goto_0
    return v2

    :cond_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_0
.end method

.method public getAlbum()Ljava/lang/String;
    .locals 2

    .prologue
    .line 381
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "TAL"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .line 383
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 384
    :goto_1
    return-object v1

    .line 382
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    const-string v1, "TALB"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_0

    .line 384
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getAlbumImage()[B
    .locals 2

    .prologue
    .line 628
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "PIC"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createPictureFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2PictureFrameData;

    move-result-object v0

    .line 630
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->getImageData()[B

    move-result-object v1

    .line 631
    :goto_1
    return-object v1

    .line 629
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    :cond_0
    const-string v1, "APIC"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createPictureFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2PictureFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    goto :goto_0

    .line 631
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getAlbumImageMimeType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 644
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "PIC"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createPictureFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2PictureFrameData;

    move-result-object v0

    .line 646
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->getMimeType()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->getMimeType()Ljava/lang/String;

    move-result-object v1

    .line 647
    :goto_1
    return-object v1

    .line 645
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    :cond_0
    const-string v1, "APIC"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createPictureFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2PictureFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    goto :goto_0

    .line 647
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getArtist()Ljava/lang/String;
    .locals 2

    .prologue
    .line 349
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "TP1"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .line 351
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 352
    :goto_1
    return-object v1

    .line 350
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    const-string v1, "TPE1"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_0

    .line 352
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getComment()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 500
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "COM"

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractCommentFrameData(Ljava/lang/String;Z)Lcom/mpatric/mp3agic/ID3v2CommentFrameData;

    move-result-object v0

    .line 502
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->getComment()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->getComment()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 503
    :goto_1
    return-object v1

    .line 501
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    :cond_0
    const-string v1, "COMM"

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractCommentFrameData(Ljava/lang/String;Z)Lcom/mpatric/mp3agic/ID3v2CommentFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    goto :goto_0

    .line 503
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getComposer()Ljava/lang/String;
    .locals 2

    .prologue
    .line 532
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "TCM"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .line 534
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 535
    :goto_1
    return-object v1

    .line 533
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    const-string v1, "TCOM"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_0

    .line 535
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getCopyright()Ljava/lang/String;
    .locals 2

    .prologue
    .line 580
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "TCR"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .line 582
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 583
    :goto_1
    return-object v1

    .line 581
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    const-string v1, "TCOP"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_0

    .line 583
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getDataLength()I
    .locals 1

    .prologue
    .line 280
    iget v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    if-nez v0, :cond_0

    .line 281
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->calculateDataLength()I

    move-result v0

    iput v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    .line 283
    :cond_0
    iget v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    return v0
.end method

.method public getEncoder()Ljava/lang/String;
    .locals 2

    .prologue
    .line 612
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "TEN"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .line 614
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 615
    :goto_1
    return-object v1

    .line 613
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    const-string v1, "TENC"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_0

    .line 615
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getFrameSets()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/mpatric/mp3agic/ID3v2FrameSet;",
            ">;"
        }
    .end annotation

    .prologue
    .line 291
    iget-object v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->frameSets:Ljava/util/Map;

    return-object v0
.end method

.method public getGenre()I
    .locals 7

    .prologue
    const/4 v5, -0x1

    .line 413
    iget-boolean v6, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v6, :cond_2

    const-string v6, "TCO"

    invoke-direct {p0, v6}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v2

    .line 415
    .local v2, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_0
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v6

    if-nez v6, :cond_3

    :cond_0
    move v3, v5

    .line 428
    :cond_1
    :goto_1
    return v3

    .line 414
    .end local v2           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_2
    const-string v6, "TCON"

    invoke-direct {p0, v6}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v2

    .restart local v2       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_0

    .line 416
    :cond_3
    invoke-virtual {v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v4

    .line 417
    .local v4, text:Ljava/lang/String;
    if-eqz v4, :cond_4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_5

    :cond_4
    move v3, v5

    goto :goto_1

    .line 419
    :cond_5
    :try_start_0
    invoke-virtual {p0, v4}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractGenreNumber(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    goto :goto_1

    .line 420
    :catch_0
    move-exception v1

    .line 421
    .local v1, e:Ljava/lang/NumberFormatException;
    invoke-virtual {p0, v4}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractGenreDescription(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 422
    .local v0, description:Ljava/lang/String;
    if-eqz v0, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_6

    .line 423
    const/4 v3, 0x0

    .local v3, i:I
    :goto_2
    sget-object v6, Lcom/mpatric/mp3agic/ID3v1Genres;->GENRES:[Ljava/lang/String;

    array-length v6, v6

    if-lt v3, v6, :cond_7

    .end local v3           #i:I
    :cond_6
    move v3, v5

    .line 428
    goto :goto_1

    .line 424
    .restart local v3       #i:I
    :cond_7
    sget-object v6, Lcom/mpatric/mp3agic/ID3v1Genres;->GENRES:[Ljava/lang/String;

    aget-object v6, v6, v3

    invoke-virtual {v6, v0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v6

    if-eqz v6, :cond_1

    .line 423
    add-int/lit8 v3, v3, 0x1

    goto :goto_2
.end method

.method public getGenreDescription()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v8, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 447
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->getGenre()I

    move-result v3

    .line 448
    .local v3, genreNum:I
    if-ltz v3, :cond_1

    .line 450
    :try_start_0
    sget-object v5, Lcom/mpatric/mp3agic/ID3v1Genres;->GENRES:[Ljava/lang/String;

    aget-object v0, v5, v3
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 467
    :cond_0
    :goto_0
    return-object v0

    .line 451
    :catch_0
    move-exception v1

    .local v1, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    move-object v0, v8

    .line 452
    goto :goto_0

    .line 456
    .end local v1           #e:Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_1
    iget-boolean v5, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v5, :cond_3

    const-string v5, "TCO"

    invoke-direct {p0, v5}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v2

    .line 458
    .local v2, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_1
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 459
    invoke-virtual {v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v4

    .line 460
    .local v4, text:Ljava/lang/String;
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 461
    invoke-virtual {p0, v4}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractGenreDescription(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 462
    .local v0, description:Ljava/lang/String;
    if-eqz v0, :cond_4

    move v5, v6

    :goto_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_5

    :goto_3
    and-int/2addr v5, v6

    if-nez v5, :cond_0

    .end local v0           #description:Ljava/lang/String;
    .end local v4           #text:Ljava/lang/String;
    :cond_2
    move-object v0, v8

    .line 467
    goto :goto_0

    .line 457
    .end local v2           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_3
    const-string v5, "TCON"

    invoke-direct {p0, v5}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v2

    .restart local v2       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_1

    .restart local v0       #description:Ljava/lang/String;
    .restart local v4       #text:Ljava/lang/String;
    :cond_4
    move v5, v7

    .line 462
    goto :goto_2

    :cond_5
    move v6, v7

    goto :goto_3
.end method

.method public getItunesComment()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 516
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "COM"

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractCommentFrameData(Ljava/lang/String;Z)Lcom/mpatric/mp3agic/ID3v2CommentFrameData;

    move-result-object v0

    .line 518
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->getComment()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->getComment()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 519
    :goto_1
    return-object v1

    .line 517
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    :cond_0
    const-string v1, "COMM"

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractCommentFrameData(Ljava/lang/String;Z)Lcom/mpatric/mp3agic/ID3v2CommentFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    goto :goto_0

    .line 519
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getLength()I
    .locals 1

    .prologue
    .line 287
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->getDataLength()I

    move-result v0

    add-int/lit8 v0, v0, 0xa

    return v0
.end method

.method public getObseleteFormat()Z
    .locals 1

    .prologue
    .line 328
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    return v0
.end method

.method public getOriginalArtist()Ljava/lang/String;
    .locals 2

    .prologue
    .line 564
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "TOA"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .line 566
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 567
    :goto_1
    return-object v1

    .line 565
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    const-string v1, "TOPE"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_0

    .line 567
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getPadding()Z
    .locals 1

    .prologue
    .line 295
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->padding:Z

    return v0
.end method

.method public getPublisher()Ljava/lang/String;
    .locals 2

    .prologue
    .line 548
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "TBP"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .line 550
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 551
    :goto_1
    return-object v1

    .line 549
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    const-string v1, "TPUB"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_0

    .line 551
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 365
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "TT2"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .line 367
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 368
    :goto_1
    return-object v1

    .line 366
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    const-string v1, "TIT2"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_0

    .line 368
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getTrack()Ljava/lang/String;
    .locals 2

    .prologue
    .line 333
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "TRK"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .line 335
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 336
    :goto_1
    return-object v1

    .line 334
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    const-string v1, "TRCK"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_0

    .line 336
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 596
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "WXX"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractUrlFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2UrlFrameData;

    move-result-object v0

    .line 598
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2UrlFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 599
    :goto_1
    return-object v1

    .line 597
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2UrlFrameData;
    :cond_0
    const-string v1, "WXXX"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractUrlFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2UrlFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2UrlFrameData;
    goto :goto_0

    .line 599
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 272
    iget-object v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->version:Ljava/lang/String;

    return-object v0
.end method

.method public getYear()Ljava/lang/String;
    .locals 2

    .prologue
    .line 397
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->obseleteFormat:Z

    if-eqz v1, :cond_0

    const-string v1, "TYE"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .line 399
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->getText()Lcom/mpatric/mp3agic/EncodedText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mpatric/mp3agic/EncodedText;->toString()Ljava/lang/String;

    move-result-object v1

    .line 400
    :goto_1
    return-object v1

    .line 398
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    const-string v1, "TYER"

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extractTextFrameData(Ljava/lang/String;)Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    move-result-object v0

    .restart local v0       #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    goto :goto_0

    .line 400
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public hasFooter()Z
    .locals 1

    .prologue
    .line 306
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->footer:Z

    return v0
.end method

.method public hasUnsynchronisation()Z
    .locals 1

    .prologue
    .line 317
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unsynchronisation:Z

    return v0
.end method

.method protected abstract packFlags([BI)V
.end method

.method public packFrames([BI)I
    .locals 3
    .parameter "bytes"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NotSupportedException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 210
    const-string v1, "APIC"

    invoke-direct {p0, p1, p2, v2, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->packSpecifiedFrames([BILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 211
    .local v0, newOffset:I
    const-string v1, "APIC"

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->packSpecifiedFrames([BILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 212
    return v0
.end method

.method public packTag([B)V
    .locals 2
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 175
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->packHeader([BI)I

    move-result v0

    .line 176
    .local v0, offset:I
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->extendedHeader:Z

    if-eqz v1, :cond_0

    .line 177
    invoke-direct {p0, p1, v0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->packExtendedHeader([BI)I

    move-result v0

    .line 179
    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->packFrames([BI)I

    move-result v0

    .line 180
    iget-boolean v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->footer:Z

    if-eqz v1, :cond_1

    .line 181
    iget v1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->dataLength:I

    invoke-direct {p0, p1, v1}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->packFooter([BI)I

    move-result v0

    .line 183
    :cond_1
    return-void
.end method

.method public setAlbum(Ljava/lang/String;)V
    .locals 4
    .parameter "album"

    .prologue
    .line 388
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 389
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 390
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    new-instance v2, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;)V

    .line 391
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    const-string v1, "TALB"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 393
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    return-void
.end method

.method public setAlbumImage([BLjava/lang/String;)V
    .locals 6
    .parameter "albumImage"
    .parameter "mimeType"

    .prologue
    .line 635
    if-eqz p1, :cond_0

    array-length v1, p1

    if-lez v1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 636
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 637
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p2

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;-><init>(ZLjava/lang/String;BLcom/mpatric/mp3agic/EncodedText;[B)V

    .line 638
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    const-string v1, "APIC"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2PictureFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 640
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2PictureFrameData;
    :cond_0
    return-void
.end method

.method public setArtist(Ljava/lang/String;)V
    .locals 4
    .parameter "artist"

    .prologue
    .line 356
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 357
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 358
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    new-instance v2, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;)V

    .line 359
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    const-string v1, "TPE1"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 361
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 6
    .parameter "comment"

    .prologue
    .line 507
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 508
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 509
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    const-string v2, "eng"

    const/4 v3, 0x0

    new-instance v4, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v5, 0x0

    invoke-direct {v4, v5, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;-><init>(ZLjava/lang/String;Lcom/mpatric/mp3agic/EncodedText;Lcom/mpatric/mp3agic/EncodedText;)V

    .line 510
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    const-string v1, "COMM"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 512
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    :cond_0
    return-void
.end method

.method public setComposer(Ljava/lang/String;)V
    .locals 4
    .parameter "composer"

    .prologue
    .line 539
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 540
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 541
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    new-instance v2, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;)V

    .line 542
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    const-string v1, "TCOM"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 544
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    return-void
.end method

.method public setCopyright(Ljava/lang/String;)V
    .locals 4
    .parameter "copyright"

    .prologue
    .line 587
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 588
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 589
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    new-instance v2, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;)V

    .line 590
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    const-string v1, "TCOP"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 592
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    return-void
.end method

.method public setEncoder(Ljava/lang/String;)V
    .locals 4
    .parameter "encoder"

    .prologue
    .line 619
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 620
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 621
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    new-instance v2, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;)V

    .line 622
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    const-string v1, "TENC"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 624
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    return-void
.end method

.method public setFooter(Z)V
    .locals 1
    .parameter "footer"

    .prologue
    .line 310
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->footer:Z

    if-eq v0, p1, :cond_0

    .line 311
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 312
    iput-boolean p1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->footer:Z

    .line 314
    :cond_0
    return-void
.end method

.method public setGenre(I)V
    .locals 7
    .parameter "genre"

    .prologue
    .line 432
    if-ltz p1, :cond_0

    .line 433
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 436
    :try_start_0
    sget-object v4, Lcom/mpatric/mp3agic/ID3v1Genres;->GENRES:[Ljava/lang/String;

    aget-object v3, v4, p1
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 440
    .local v3, genreDescription:Ljava/lang/String;
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 441
    .local v0, combinedGenre:Ljava/lang/String;
    new-instance v2, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v4

    new-instance v5, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v6, 0x0

    invoke-direct {v5, v6, v0}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v2, v4, v5}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;)V

    .line 442
    .local v2, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    const-string v4, "TCON"

    invoke-virtual {v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->toBytes()[B

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v4

    const/4 v5, 0x1

    invoke-direct {p0, v4, v5}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 444
    .end local v0           #combinedGenre:Ljava/lang/String;
    .end local v2           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    .end local v3           #genreDescription:Ljava/lang/String;
    :cond_0
    return-void

    .line 437
    :catch_0
    move-exception v1

    .line 438
    .local v1, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    const-string v3, ""

    .restart local v3       #genreDescription:Ljava/lang/String;
    goto :goto_0
.end method

.method public setItunesComment(Ljava/lang/String;)V
    .locals 6
    .parameter "itunesComment"

    .prologue
    .line 523
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 524
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 525
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    const-string v2, "iTunNORM"

    const/4 v3, 0x0

    new-instance v4, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v5, 0x0

    invoke-direct {v4, v5, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;-><init>(ZLjava/lang/String;Lcom/mpatric/mp3agic/EncodedText;Lcom/mpatric/mp3agic/EncodedText;)V

    .line 526
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    const-string v1, "COMM"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2CommentFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 528
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2CommentFrameData;
    :cond_0
    return-void
.end method

.method public setOriginalArtist(Ljava/lang/String;)V
    .locals 4
    .parameter "originalArtist"

    .prologue
    .line 571
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 572
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 573
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    new-instance v2, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;)V

    .line 574
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    const-string v1, "TOPE"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 576
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    return-void
.end method

.method public setPadding(Z)V
    .locals 1
    .parameter "padding"

    .prologue
    .line 299
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->padding:Z

    if-eq v0, p1, :cond_0

    .line 300
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 301
    iput-boolean p1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->padding:Z

    .line 303
    :cond_0
    return-void
.end method

.method public setPublisher(Ljava/lang/String;)V
    .locals 4
    .parameter "publisher"

    .prologue
    .line 555
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 556
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 557
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    new-instance v2, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;)V

    .line 558
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    const-string v1, "TPUB"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 560
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 4
    .parameter "title"

    .prologue
    .line 372
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 373
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 374
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    new-instance v2, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;)V

    .line 375
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    const-string v1, "TIT2"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 377
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    return-void
.end method

.method public setTrack(Ljava/lang/String;)V
    .locals 4
    .parameter "track"

    .prologue
    .line 340
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 341
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 342
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    new-instance v2, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;)V

    .line 343
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    const-string v1, "TRCK"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 345
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    return-void
.end method

.method public setUnsynchronisation(Z)V
    .locals 1
    .parameter "unsynchronisation"

    .prologue
    .line 321
    iget-boolean v0, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unsynchronisation:Z

    if-eq v0, p1, :cond_0

    .line 322
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 323
    iput-boolean p1, p0, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->unsynchronisation:Z

    .line 325
    :cond_0
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 3
    .parameter "url"

    .prologue
    .line 603
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 604
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 605
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p1}, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;Ljava/lang/String;)V

    .line 606
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2UrlFrameData;
    const-string v1, "WXXX"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2UrlFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 608
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2UrlFrameData;
    :cond_0
    return-void
.end method

.method public setYear(Ljava/lang/String;)V
    .locals 4
    .parameter "year"

    .prologue
    .line 404
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 405
    invoke-direct {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->invalidateDataLength()V

    .line 406
    new-instance v0, Lcom/mpatric/mp3agic/ID3v2TextFrameData;

    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->useFrameUnsynchronisation()Z

    move-result v1

    new-instance v2, Lcom/mpatric/mp3agic/EncodedText;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1}, Lcom/mpatric/mp3agic/EncodedText;-><init>(BLjava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;-><init>(ZLcom/mpatric/mp3agic/EncodedText;)V

    .line 407
    .local v0, frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    const-string v1, "TYER"

    invoke-virtual {v0}, Lcom/mpatric/mp3agic/ID3v2TextFrameData;->toBytes()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame(Ljava/lang/String;[B)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 409
    .end local v0           #frameData:Lcom/mpatric/mp3agic/ID3v2TextFrameData;
    :cond_0
    return-void
.end method

.method public toBytes()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mpatric/mp3agic/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 169
    invoke-virtual {p0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->getLength()I

    move-result v1

    new-array v0, v1, [B

    .line 170
    .local v0, bytes:[B
    invoke-virtual {p0, v0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->packTag([B)V

    .line 171
    return-object v0
.end method

.method protected abstract unpackFlags([B)V
.end method

.method protected unpackFrames([BII)I
    .locals 4
    .parameter "bytes"
    .parameter "offset"
    .parameter "framesLength"

    .prologue
    .line 123
    move v0, p2

    .line 124
    .local v0, currentOffset:I
    :goto_0
    if-le v0, p3, :cond_0

    .line 134
    :goto_1
    return v0

    .line 127
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->createFrame([BI)Lcom/mpatric/mp3agic/ID3v2Frame;

    move-result-object v2

    .line 128
    .local v2, frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Lcom/mpatric/mp3agic/AbstractID3v2Tag;->addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;Z)V

    .line 129
    invoke-virtual {v2}, Lcom/mpatric/mp3agic/ID3v2Frame;->getLength()I
    :try_end_0
    .catch Lcom/mpatric/mp3agic/InvalidDataException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    add-int/2addr v0, v3

    goto :goto_0

    .line 130
    .end local v2           #frame:Lcom/mpatric/mp3agic/ID3v2Frame;
    :catch_0
    move-exception v1

    .line 131
    .local v1, e:Lcom/mpatric/mp3agic/InvalidDataException;
    goto :goto_1
.end method

.method protected useFrameUnsynchronisation()Z
    .locals 1

    .prologue
    .line 268
    const/4 v0, 0x0

    return v0
.end method
