.class public Lcom/bv/sync/ImageScanner;
.super Ljava/lang/Object;
.source "ImageScanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/ImageScanner$Options;,
        Lcom/bv/sync/ImageScanner$Parser;,
        Lcom/bv/sync/ImageScanner$Point;,
        Lcom/bv/sync/ImageScanner$VideoParser;
    }
.end annotation


# instance fields
.field private final addressCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/bv/sync/ImageScanner$Point;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final changed:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/bv/sync/MovedItem;",
            ">;"
        }
    .end annotation
.end field

.field private fileIndex:I

.field private filesCount:I

.field private imageParser:Lcom/bv/sync/ImageScanner$Parser;

.field private progressNotification:Lcom/bv/sync/ProgressNotification;

.field private root:Lcom/bv/sync/IFile;


# direct methods
.method public constructor <init>(Lcom/bv/sync/ImageScanner$Parser;)V
    .locals 1
    .parameter "imageParser"

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/bv/sync/ImageScanner;->changed:Ljava/util/LinkedList;

    .line 229
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bv/sync/ImageScanner;->addressCache:Ljava/util/HashMap;

    .line 45
    iput-object p1, p0, Lcom/bv/sync/ImageScanner;->imageParser:Lcom/bv/sync/ImageScanner$Parser;

    .line 46
    return-void
.end method

.method private append(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "path"
    .parameter "name"

    .prologue
    .line 260
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 262
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 263
    return-object p1
.end method

.method private buildPath(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Parser;Lcom/bv/sync/ImageScanner$Options;)Ljava/lang/String;
    .locals 7
    .parameter "file"
    .parameter "parser"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 176
    const-string v2, ""

    .line 177
    .local v2, result:Ljava/lang/String;
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v4}, Lcom/bv/sync/ImageScanner$Parser;->parse(Ljava/lang/String;)V

    .line 178
    iget-boolean v4, p3, Lcom/bv/sync/ImageScanner$Options;->groupByYear:Z

    if-nez v4, :cond_0

    iget-boolean v4, p3, Lcom/bv/sync/ImageScanner$Options;->groupByMonth:Z

    if-nez v4, :cond_0

    iget-boolean v4, p3, Lcom/bv/sync/ImageScanner$Options;->groupByDay:Z

    if-eqz v4, :cond_3

    .line 179
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 180
    .local v1, calendar:Ljava/util/Calendar;
    invoke-interface {p2}, Lcom/bv/sync/ImageScanner$Parser;->getTime()Ljava/util/Date;

    move-result-object v3

    .line 182
    .local v3, time:Ljava/util/Date;
    if-eqz v3, :cond_3

    .line 183
    invoke-virtual {v1, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 184
    iget-boolean v4, p3, Lcom/bv/sync/ImageScanner$Options;->groupByYear:Z

    if-eqz v4, :cond_1

    if-eqz v3, :cond_1

    .line 185
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v2, v4}, Lcom/bv/sync/ImageScanner;->append(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 186
    :cond_1
    iget-boolean v4, p3, Lcom/bv/sync/ImageScanner$Options;->groupByMonth:Z

    if-eqz v4, :cond_2

    if-eqz v3, :cond_2

    .line 187
    const/4 v4, 0x2

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    iget-boolean v5, p3, Lcom/bv/sync/ImageScanner$Options;->numericMonth:Z

    invoke-static {v4, v5}, Lcom/bv/sync/ImageScanner;->getMonthName(IZ)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v2, v4}, Lcom/bv/sync/ImageScanner;->append(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 188
    :cond_2
    iget-boolean v4, p3, Lcom/bv/sync/ImageScanner$Options;->groupByDay:Z

    if-eqz v4, :cond_3

    if-eqz v3, :cond_3

    .line 189
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x5

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    iget-boolean v6, p3, Lcom/bv/sync/ImageScanner$Options;->doubleDigitDay:Z

    invoke-direct {p0, v5, v6}, Lcom/bv/sync/ImageScanner;->getDay(IZ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v2, v4}, Lcom/bv/sync/ImageScanner;->append(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 192
    .end local v1           #calendar:Ljava/util/Calendar;
    .end local v3           #time:Ljava/util/Date;
    :cond_3
    iget-boolean v4, p3, Lcom/bv/sync/ImageScanner$Options;->groupByAddress:Z

    if-eqz v4, :cond_4

    .line 193
    invoke-direct {p0, p2}, Lcom/bv/sync/ImageScanner;->getAddress(Lcom/bv/sync/ImageScanner$Parser;)Ljava/lang/String;

    move-result-object v0

    .line 194
    .local v0, address:Ljava/lang/String;
    if-eqz v0, :cond_4

    invoke-static {v0}, Lcom/bv/sync/Utils;->isValidFileName(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 195
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v2, v4}, Lcom/bv/sync/ImageScanner;->append(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 198
    .end local v0           #address:Ljava/lang/String;
    :cond_4
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 199
    :cond_5
    const/4 v2, 0x0

    .line 200
    .end local v2           #result:Ljava/lang/String;
    :cond_6
    return-object v2
.end method

.method private calculateFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;)I
    .locals 6
    .parameter "dir"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    const/4 v1, 0x0

    .line 63
    .local v1, result:I
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_0

    .line 67
    return v1

    .line 63
    :cond_0
    aget-object v0, v3, v2

    .line 64
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-direct {p0, v0, p2}, Lcom/bv/sync/ImageScanner;->isMovable(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 65
    add-int/lit8 v1, v1, 0x1

    .line 63
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static contains(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 6
    .parameter "path"
    .parameter "extensions"

    .prologue
    const/4 v2, 0x0

    .line 81
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 82
    .local v1, lowerCase:Ljava/lang/String;
    array-length v4, p1

    move v3, v2

    :goto_0
    if-lt v3, v4, :cond_0

    .line 85
    :goto_1
    return v2

    .line 82
    :cond_0
    aget-object v0, p1, v3

    .line 83
    .local v0, extension:Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 84
    const/4 v2, 0x1

    goto :goto_1

    .line 82
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private getAddress(Lcom/bv/sync/ImageScanner$Parser;)Ljava/lang/String;
    .locals 9
    .parameter "parser"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    .line 232
    invoke-interface {p1}, Lcom/bv/sync/ImageScanner$Parser;->getLatitude()D

    move-result-wide v2

    .line 233
    .local v2, x:D
    invoke-interface {p1}, Lcom/bv/sync/ImageScanner$Parser;->getLongitude()D

    move-result-wide v4

    .line 234
    .local v4, y:D
    cmpl-double v1, v2, v7

    if-nez v1, :cond_0

    cmpl-double v1, v4, v7

    if-eqz v1, :cond_2

    .line 235
    :cond_0
    new-instance v0, Lcom/bv/sync/ImageScanner$Point;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/bv/sync/ImageScanner$Point;-><init>(Lcom/bv/sync/ImageScanner;DD)V

    .line 236
    .local v0, point:Lcom/bv/sync/ImageScanner$Point;
    iget-object v1, p0, Lcom/bv/sync/ImageScanner;->addressCache:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 237
    .local v6, result:Ljava/lang/String;
    if-nez v6, :cond_1

    .line 238
    invoke-interface {p1}, Lcom/bv/sync/ImageScanner$Parser;->getAddress()Ljava/lang/String;

    move-result-object v6

    .line 239
    if-eqz v6, :cond_1

    .line 240
    iget-object v1, p0, Lcom/bv/sync/ImageScanner;->addressCache:Ljava/util/HashMap;

    invoke-virtual {v1, v0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    .end local v0           #point:Lcom/bv/sync/ImageScanner$Point;
    .end local v6           #result:Ljava/lang/String;
    :cond_1
    :goto_0
    return-object v6

    :cond_2
    const/4 v6, 0x0

    goto :goto_0
.end method

.method private getDay(IZ)Ljava/lang/String;
    .locals 4
    .parameter "day"
    .parameter "doubleDigitDay"

    .prologue
    .line 254
    if-eqz p2, :cond_0

    .line 255
    const-string v0, "%02d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 256
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static getMonthName(IZ)Ljava/lang/String;
    .locals 4
    .parameter "month"
    .parameter "numericMonth"

    .prologue
    .line 248
    if-eqz p1, :cond_0

    .line 249
    const-string v0, "%02d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    add-int/lit8 v3, p0, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 250
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/text/DateFormatSymbols;

    invoke-direct {v0}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v0}, Ljava/text/DateFormatSymbols;->getMonths()[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, p0

    goto :goto_0
.end method

.method private getType(Lcom/bv/sync/IFile;)Lcom/bv/sync/SyncItem$Type;
    .locals 1
    .parameter "result"

    .prologue
    .line 159
    instance-of v0, p1, Lcom/bv/sync/RemoteFile;

    if-eqz v0, :cond_0

    .line 160
    sget-object v0, Lcom/bv/sync/SyncItem$Type;->RemoteFile:Lcom/bv/sync/SyncItem$Type;

    .line 161
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/bv/sync/SyncItem$Type;->LocalFile:Lcom/bv/sync/SyncItem$Type;

    goto :goto_0
.end method

.method public static isJpeg(Ljava/lang/String;)Z
    .locals 3
    .parameter "path"

    .prologue
    .line 71
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, ".jpg"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, ".jpeg"

    aput-object v2, v0, v1

    .line 72
    .local v0, extensions:[Ljava/lang/String;
    invoke-static {p0, v0}, Lcom/bv/sync/ImageScanner;->contains(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method private isMovable(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;)Z
    .locals 1
    .parameter "file"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/bv/sync/ImageScanner;->isJpeg(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p2, Lcom/bv/sync/ImageScanner$Options;->groupVideos:Z

    if-eqz v0, :cond_1

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/bv/sync/ImageScanner;->isVideo(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isVideo(Ljava/lang/String;)Z
    .locals 3
    .parameter "path"

    .prologue
    .line 76
    const/4 v1, 0x6

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, ".3gp"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, ".mp4"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, ".avi"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, ".mov"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, ".mpg"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, ".mpeg"

    aput-object v2, v0, v1

    .line 77
    .local v0, extensions:[Ljava/lang/String;
    invoke-static {p0, v0}, Lcom/bv/sync/ImageScanner;->contains(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method private mkDirs(Ljava/lang/String;)Lcom/bv/sync/IFile;
    .locals 3
    .parameter "destination"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    new-instance v1, Ljava/util/StringTokenizer;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-direct {v1, p1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .local v1, tokenizer:Ljava/util/StringTokenizer;
    iget-object v0, p0, Lcom/bv/sync/ImageScanner;->root:Lcom/bv/sync/IFile;

    .line 167
    .local v0, result:Lcom/bv/sync/IFile;
    :cond_0
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-nez v2, :cond_1

    .line 172
    return-object v0

    .line 168
    :cond_1
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 169
    invoke-interface {v0}, Lcom/bv/sync/IFile;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 170
    invoke-interface {v0}, Lcom/bv/sync/IFile;->mkdir()V

    goto :goto_0
.end method

.method private move(Lcom/bv/sync/IFile;Ljava/lang/String;)V
    .locals 12
    .parameter "source"
    .parameter "destination"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-direct {p0, p2}, Lcom/bv/sync/ImageScanner;->mkDirs(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v9

    .line 151
    .local v9, folder:Lcom/bv/sync/IFile;
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v9, v0}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v10

    .line 152
    .local v10, result:Lcom/bv/sync/IFile;
    invoke-interface {v10}, Lcom/bv/sync/IFile;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 153
    invoke-interface {p1, v10}, Lcom/bv/sync/IFile;->renameTo(Lcom/bv/sync/IFile;)V

    .line 154
    iget-object v11, p0, Lcom/bv/sync/ImageScanner;->changed:Ljava/util/LinkedList;

    new-instance v0, Lcom/bv/sync/MovedItem;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    invoke-direct {p0, p1}, Lcom/bv/sync/ImageScanner;->getType(Lcom/bv/sync/IFile;)Lcom/bv/sync/SyncItem$Type;

    move-result-object v4

    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v5

    invoke-interface {v10}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Lcom/bv/sync/MovedItem;-><init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JLjava/lang/String;Z)V

    invoke-virtual {v11, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 156
    :cond_0
    return-void
.end method

.method private process([Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;)V
    .locals 4
    .parameter "files"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_1

    .line 92
    :cond_0
    return-void

    .line 89
    :cond_1
    aget-object v0, p1, v1

    .line 90
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-direct {p0, v0, p2}, Lcom/bv/sync/ImageScanner;->process(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 89
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private process(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;)Z
    .locals 4
    .parameter "file"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    const/4 v2, 0x1

    .line 125
    .local v2, result:Z
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/ImageScanner;->isMovable(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 126
    iget-object v3, p0, Lcom/bv/sync/ImageScanner;->progressNotification:Lcom/bv/sync/ProgressNotification;

    if-eqz v3, :cond_0

    .line 127
    iget v3, p0, Lcom/bv/sync/ImageScanner;->fileIndex:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/bv/sync/ImageScanner;->fileIndex:I

    invoke-direct {p0, p1, v3}, Lcom/bv/sync/ImageScanner;->updateProgress(Lcom/bv/sync/IFile;I)Z

    move-result v2

    .line 128
    :cond_0
    if-eqz v2, :cond_1

    .line 129
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/bv/sync/ImageScanner;->isJpeg(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v1, p0, Lcom/bv/sync/ImageScanner;->imageParser:Lcom/bv/sync/ImageScanner$Parser;

    .line 130
    .local v1, parser:Lcom/bv/sync/ImageScanner$Parser;
    :goto_0
    invoke-direct {p0, p1, v1, p2}, Lcom/bv/sync/ImageScanner;->buildPath(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Parser;Lcom/bv/sync/ImageScanner$Options;)Ljava/lang/String;

    move-result-object v0

    .line 131
    .local v0, newFile:Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 132
    invoke-direct {p0, p1, v0}, Lcom/bv/sync/ImageScanner;->move(Lcom/bv/sync/IFile;Ljava/lang/String;)V

    .line 135
    .end local v0           #newFile:Ljava/lang/String;
    .end local v1           #parser:Lcom/bv/sync/ImageScanner$Parser;
    :cond_1
    return v2

    .line 129
    :cond_2
    new-instance v1, Lcom/bv/sync/ImageScanner$VideoParser;

    const/4 v3, 0x0

    invoke-direct {v1, v3}, Lcom/bv/sync/ImageScanner$VideoParser;-><init>(Lcom/bv/sync/ImageScanner$VideoParser;)V

    goto :goto_0
.end method

.method private updateProgress(Lcom/bv/sync/IFile;I)Z
    .locals 3
    .parameter "file"
    .parameter "index"

    .prologue
    .line 143
    const/4 v0, 0x0

    .line 144
    .local v0, progress:I
    iget v1, p0, Lcom/bv/sync/ImageScanner;->filesCount:I

    if-eqz v1, :cond_0

    .line 145
    int-to-float v1, p2

    iget v2, p0, Lcom/bv/sync/ImageScanner;->filesCount:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x42c8

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 146
    :cond_0
    iget-object v1, p0, Lcom/bv/sync/ImageScanner;->progressNotification:Lcom/bv/sync/ProgressNotification;

    sget-object v2, Lcom/bv/sync/ProgressNotification$ProgressAction;->Grouping:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-interface {v1, v2, v0, p1}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    move-result v1

    return v1
.end method


# virtual methods
.method public getChanged()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/MovedItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Lcom/bv/sync/ImageScanner;->changed:Ljava/util/LinkedList;

    return-object v0
.end method

.method public run(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;Lcom/bv/sync/ProgressNotification;)V
    .locals 1
    .parameter "dir"
    .parameter "options"
    .parameter "progressNotification"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    iput-object p3, p0, Lcom/bv/sync/ImageScanner;->progressNotification:Lcom/bv/sync/ProgressNotification;

    .line 50
    iput-object p1, p0, Lcom/bv/sync/ImageScanner;->root:Lcom/bv/sync/IFile;

    .line 51
    iget-object v0, p0, Lcom/bv/sync/ImageScanner;->changed:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/bv/sync/ImageScanner;->fileIndex:I

    .line 53
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/ImageScanner;->calculateFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;)I

    move-result v0

    iput v0, p0, Lcom/bv/sync/ImageScanner;->filesCount:I

    .line 54
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/bv/sync/ImageScanner;->process([Lcom/bv/sync/IFile;Lcom/bv/sync/ImageScanner$Options;)V

    .line 55
    return-void
.end method
