.class Lcom/bv/wifisync/JpegParser;
.super Ljava/lang/Object;
.source "JpegParser.java"

# interfaces
.implements Lcom/bv/sync/ImageScanner$Parser;


# instance fields
.field private address:Ljava/lang/String;

.field private final context:Landroid/content/Context;

.field private exif:Landroid/media/ExifInterface;

.field private latitude:Ljava/lang/Double;

.field private longitude:Ljava/lang/Double;

.field private time:Ljava/util/Date;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/bv/wifisync/JpegParser;->context:Landroid/content/Context;

    .line 25
    return-void
.end method

.method private getAddress(DD)Ljava/lang/String;
    .locals 10
    .parameter "latitude"
    .parameter "longitude"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    new-instance v0, Landroid/location/Geocoder;

    iget-object v1, p0, Lcom/bv/wifisync/JpegParser;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    .line 77
    .local v0, coder:Landroid/location/Geocoder;
    const/4 v5, 0x1

    move-wide v1, p1

    move-wide v3, p3

    invoke-virtual/range {v0 .. v5}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object v7

    .line 78
    .local v7, addresses:Ljava/util/List;,"Ljava/util/List<Landroid/location/Address;>;"
    const/4 v9, 0x0

    .line 79
    .local v9, result:Ljava/lang/String;
    if-eqz v7, :cond_1

    .line 80
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 83
    :cond_1
    return-object v9

    .line 80
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/location/Address;

    .line 81
    .local v6, address:Landroid/location/Address;
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    invoke-virtual {v6}, Landroid/location/Address;->getMaxAddressLineIndex()I

    move-result v2

    if-ge v8, v2, :cond_0

    .line 82
    if-nez v9, :cond_3

    invoke-virtual {v6, v8}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    move-result-object v9

    .line 81
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 82
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v6, v8}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_1
.end method

.method private getSeparator(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "string"

    .prologue
    const/4 v2, 0x0

    .line 133
    const/4 v3, 0x5

    new-array v0, v3, [Ljava/lang/String;

    const-string v3, ":"

    aput-object v3, v0, v2

    const/4 v3, 0x1

    const-string v4, "/"

    aput-object v4, v0, v3

    const/4 v3, 0x2

    const-string v4, "\\"

    aput-object v4, v0, v3

    const/4 v3, 0x3

    const-string v4, "."

    aput-object v4, v0, v3

    const/4 v3, 0x4

    const-string v4, "-"

    aput-object v4, v0, v3

    .line 134
    .local v0, knownSeparators:[Ljava/lang/String;
    array-length v3, v0

    :goto_0
    if-lt v2, v3, :cond_1

    .line 137
    const/4 v1, 0x0

    :cond_0
    return-object v1

    .line 134
    :cond_1
    aget-object v1, v0, v2

    .line 135
    .local v1, separator:Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 134
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private parseCoordinate(Ljava/lang/String;)D
    .locals 9
    .parameter "coordinate"

    .prologue
    const/4 v6, 0x0

    .line 52
    const-string v5, ","

    invoke-virtual {p1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 53
    .local v2, parts:[Ljava/lang/String;
    aget-object v5, v2, v6

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, fields:[Ljava/lang/String;
    const/4 v5, 0x0

    :try_start_0
    aget-object v5, v1, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    int-to-double v5, v5

    const/4 v7, 0x1

    aget-object v7, v1, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    int-to-double v7, v7

    div-double v3, v5, v7

    .line 56
    .local v3, result:D
    const/4 v5, 0x1

    aget-object v5, v2, v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 57
    const/4 v5, 0x0

    aget-object v5, v1, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    int-to-double v5, v5

    const/4 v7, 0x1

    aget-object v7, v1, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    mul-int/lit8 v7, v7, 0x3c

    int-to-double v7, v7

    div-double/2addr v5, v7

    add-double/2addr v3, v5

    .line 58
    const/4 v5, 0x2

    aget-object v5, v2, v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 59
    const/4 v5, 0x0

    aget-object v5, v1, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    int-to-double v5, v5

    const/4 v7, 0x1

    aget-object v7, v1, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    mul-int/lit16 v7, v7, 0xe10

    int-to-double v7, v7

    div-double/2addr v5, v7

    add-double/2addr v3, v5

    .line 62
    .end local v3           #result:D
    :goto_0
    return-wide v3

    .line 61
    :catch_0
    move-exception v0

    .line 62
    .local v0, e:Ljava/lang/NumberFormatException;
    const-wide/16 v3, 0x0

    goto :goto_0
.end method

.method private parseCoordinate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)D
    .locals 4
    .parameter "tag"
    .parameter "signTag"
    .parameter "sign"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    iget-object v3, p0, Lcom/bv/wifisync/JpegParser;->exif:Landroid/media/ExifInterface;

    invoke-virtual {v3, p1}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 42
    .local v2, value:Ljava/lang/String;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    .line 43
    invoke-direct {p0, v2}, Lcom/bv/wifisync/JpegParser;->parseCoordinate(Ljava/lang/String;)D

    move-result-wide v0

    .line 44
    .local v0, result:D
    iget-object v3, p0, Lcom/bv/wifisync/JpegParser;->exif:Landroid/media/ExifInterface;

    invoke-virtual {v3, p2}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 45
    neg-double v0, v0

    .line 48
    .end local v0           #result:D
    :cond_0
    :goto_0
    return-wide v0

    :cond_1
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method private parseDate(Ljava/lang/String;)Ljava/util/Date;
    .locals 5
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    const-string v4, " "

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, parts:[Ljava/lang/String;
    const/4 v4, 0x0

    aget-object v1, v2, v4

    .line 100
    .local v1, date:Ljava/lang/String;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 102
    .local v0, calendar:Ljava/util/Calendar;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_1

    .line 103
    invoke-direct {p0, v1}, Lcom/bv/wifisync/JpegParser;->getSeparator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 104
    .local v3, separator:Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 105
    invoke-direct {p0, v1, v0, v3}, Lcom/bv/wifisync/JpegParser;->parseDate(Ljava/lang/String;Ljava/util/Calendar;Ljava/lang/String;)V

    .line 106
    :cond_0
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v4

    .line 108
    .end local v3           #separator:Ljava/lang/String;
    :goto_0
    return-object v4

    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private parseDate(Ljava/lang/String;Ljava/util/Calendar;Ljava/lang/String;)V
    .locals 9
    .parameter "date"
    .parameter "calendar"
    .parameter "separator"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    const/16 v7, 0xc

    new-array v4, v7, [I

    const/4 v7, 0x1

    .line 113
    const/4 v8, 0x1

    aput v8, v4, v7

    const/4 v7, 0x2

    const/4 v8, 0x2

    aput v8, v4, v7

    const/4 v7, 0x3

    const/4 v8, 0x3

    aput v8, v4, v7

    const/4 v7, 0x4

    const/4 v8, 0x4

    aput v8, v4, v7

    const/4 v7, 0x5

    .line 114
    const/4 v8, 0x5

    aput v8, v4, v7

    const/4 v7, 0x6

    const/4 v8, 0x6

    aput v8, v4, v7

    const/4 v7, 0x7

    const/4 v8, 0x7

    aput v8, v4, v7

    const/16 v7, 0x8

    const/16 v8, 0x8

    aput v8, v4, v7

    const/16 v7, 0x9

    const/16 v8, 0x9

    aput v8, v4, v7

    const/16 v7, 0xa

    .line 115
    const/16 v8, 0xa

    aput v8, v4, v7

    const/16 v7, 0xb

    const/16 v8, 0xb

    aput v8, v4, v7

    .line 118
    .local v4, months:[I
    const/4 v7, 0x0

    invoke-virtual {p2, v7}, Ljava/util/Calendar;->setLenient(Z)V

    .line 120
    invoke-virtual {p1, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 122
    .local v5, parts:[Ljava/lang/String;
    const/4 v7, 0x0

    :try_start_0
    aget-object v7, v5, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 123
    .local v6, year:I
    const/4 v7, 0x1

    aget-object v7, v5, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    aget v3, v4, v7

    .line 124
    .local v3, month:I
    const/4 v7, 0x2

    aget-object v7, v5, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 125
    .local v0, day:I
    invoke-virtual {p2, v6, v3, v0}, Ljava/util/Calendar;->set(III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    return-void

    .line 126
    .end local v0           #day:I
    .end local v3           #month:I
    .end local v6           #year:I
    :catch_0
    move-exception v1

    .line 127
    .local v1, e:Ljava/lang/Exception;
    new-instance v2, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Invalid exif date format "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 128
    .local v2, ioException:Ljava/io/IOException;
    throw v2
.end method

.method private parseLocation()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    .line 67
    invoke-virtual {p0}, Lcom/bv/wifisync/JpegParser;->getLatitude()D

    move-result-wide v0

    .line 68
    .local v0, latitude:D
    invoke-virtual {p0}, Lcom/bv/wifisync/JpegParser;->getLongitude()D

    move-result-wide v2

    .line 69
    .local v2, longitude:D
    const/4 v4, 0x0

    .line 70
    .local v4, result:Ljava/lang/String;
    cmpl-double v5, v2, v6

    if-eqz v5, :cond_0

    cmpl-double v5, v0, v6

    if-eqz v5, :cond_0

    .line 71
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/bv/wifisync/JpegParser;->getAddress(DD)Ljava/lang/String;

    move-result-object v4

    .line 72
    :cond_0
    if-nez v4, :cond_1

    const/4 v5, 0x0

    :goto_0
    return-object v5

    :cond_1
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method

.method private parseTime()Ljava/util/Date;
    .locals 4

    .prologue
    .line 87
    iget-object v2, p0, Lcom/bv/wifisync/JpegParser;->exif:Landroid/media/ExifInterface;

    const-string v3, "DateTime"

    invoke-virtual {v2, v3}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 89
    .local v1, result:Ljava/lang/String;
    if-eqz v1, :cond_0

    :try_start_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 90
    invoke-direct {p0, v1}, Lcom/bv/wifisync/JpegParser;->parseDate(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 94
    :goto_0
    return-object v2

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, e:Ljava/lang/Exception;
    iget-object v2, p0, Lcom/bv/wifisync/JpegParser;->context:Landroid/content/Context;

    invoke-static {v2, v0}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    .line 94
    .end local v0           #e:Ljava/lang/Exception;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    iget-object v0, p0, Lcom/bv/wifisync/JpegParser;->address:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 143
    invoke-direct {p0}, Lcom/bv/wifisync/JpegParser;->parseLocation()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/wifisync/JpegParser;->address:Ljava/lang/String;

    .line 144
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/JpegParser;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getLatitude()D
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    iget-object v0, p0, Lcom/bv/wifisync/JpegParser;->latitude:Ljava/lang/Double;

    if-eqz v0, :cond_0

    .line 30
    iget-object v0, p0, Lcom/bv/wifisync/JpegParser;->latitude:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    .line 31
    :goto_0
    return-wide v0

    :cond_0
    const-string v0, "GPSLatitude"

    const-string v1, "GPSLatitudeRef"

    const-string v2, "N"

    invoke-direct {p0, v0, v1, v2}, Lcom/bv/wifisync/JpegParser;->parseCoordinate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0
.end method

.method public getLongitude()D
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    iget-object v0, p0, Lcom/bv/wifisync/JpegParser;->longitude:Ljava/lang/Double;

    if-eqz v0, :cond_0

    .line 36
    iget-object v0, p0, Lcom/bv/wifisync/JpegParser;->longitude:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    .line 37
    :goto_0
    return-wide v0

    :cond_0
    const-string v0, "GPSLongitude"

    const-string v1, "GPSLongitudeRef"

    const-string v2, "E"

    invoke-direct {p0, v0, v1, v2}, Lcom/bv/wifisync/JpegParser;->parseCoordinate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0
.end method

.method public getTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/bv/wifisync/JpegParser;->time:Ljava/util/Date;

    if-nez v0, :cond_0

    .line 150
    invoke-direct {p0}, Lcom/bv/wifisync/JpegParser;->parseTime()Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/wifisync/JpegParser;->time:Ljava/util/Date;

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/JpegParser;->time:Ljava/util/Date;

    return-object v0
.end method

.method public parse(Ljava/lang/String;)V
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 156
    iput-object v0, p0, Lcom/bv/wifisync/JpegParser;->time:Ljava/util/Date;

    .line 157
    iput-object v0, p0, Lcom/bv/wifisync/JpegParser;->address:Ljava/lang/String;

    .line 158
    iput-object v0, p0, Lcom/bv/wifisync/JpegParser;->latitude:Ljava/lang/Double;

    .line 159
    iput-object v0, p0, Lcom/bv/wifisync/JpegParser;->longitude:Ljava/lang/Double;

    .line 160
    new-instance v0, Landroid/media/ExifInterface;

    invoke-direct {v0, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bv/wifisync/JpegParser;->exif:Landroid/media/ExifInterface;

    .line 161
    return-void
.end method
