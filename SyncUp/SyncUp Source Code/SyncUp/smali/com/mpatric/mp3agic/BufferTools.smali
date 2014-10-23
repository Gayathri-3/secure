.class public Lcom/mpatric/mp3agic/BufferTools;
.super Ljava/lang/Object;
.source "BufferTools.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asciiOnly(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "s"

    .prologue
    .line 213
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 214
    .local v2, newString:Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v1, v3, :cond_0

    .line 222
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 215
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 216
    .local v0, ch:C
    const/16 v3, 0x20

    if-lt v0, v3, :cond_1

    const/16 v3, 0x7e

    if-le v0, v3, :cond_2

    .line 217
    :cond_1
    const/16 v3, 0x3f

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 214
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 219
    :cond_2
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method public static byteBufferToString([BII)Ljava/lang/String;
    .locals 4
    .parameter "bytes"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 6
    const/4 v3, 0x1

    if-ge p2, v3, :cond_0

    const-string v3, ""

    .line 14
    :goto_0
    return-object v3

    .line 7
    :cond_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 8
    .local v2, stringBuffer:Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-lt v1, p2, :cond_1

    .line 14
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 10
    :cond_1
    add-int v3, p1, v1

    aget-byte v3, p0, v3

    if-ltz v3, :cond_2

    add-int v3, p1, v1

    aget-byte v3, p0, v3

    int-to-char v0, v3

    .line 12
    .local v0, ch:C
    :goto_2
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 8
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 11
    .end local v0           #ch:C
    :cond_2
    add-int v3, p1, v1

    aget-byte v3, p0, v3

    add-int/lit16 v3, v3, 0x100

    int-to-char v0, v3

    .restart local v0       #ch:C
    goto :goto_2
.end method

.method public static checkBit(BI)Z
    .locals 2
    .parameter "b"
    .parameter "bitPosition"

    .prologue
    const/4 v0, 0x1

    .line 58
    shl-int v1, v0, p1

    and-int/2addr v1, p0

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static copyBuffer([BII)[B
    .locals 3
    .parameter "bytes"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 120
    new-array v0, p2, [B

    .line 121
    .local v0, copy:[B
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-lt v1, p2, :cond_0

    .line 124
    return-object v0

    .line 122
    :cond_0
    add-int v2, p1, v1

    aget-byte v2, p0, v2

    aput-byte v2, v0, v1

    .line 121
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static copyIntoByteBuffer([BII[BI)V
    .locals 3
    .parameter "bytes"
    .parameter "offset"
    .parameter "length"
    .parameter "destBuffer"
    .parameter "destOffset"

    .prologue
    .line 128
    move v0, p1

    .local v0, i:I
    :goto_0
    if-lt v0, p2, :cond_0

    .line 131
    return-void

    .line 129
    :cond_0
    add-int v1, p4, v0

    aget-byte v2, p0, v0

    aput-byte v2, p3, v1

    .line 128
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static packInteger(I)[B
    .locals 3
    .parameter "i"

    .prologue
    .line 90
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 91
    .local v0, bytes:[B
    const/4 v1, 0x3

    and-int/lit16 v2, p0, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 92
    const/4 v1, 0x2

    shr-int/lit8 v2, p0, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 93
    const/4 v1, 0x1

    shr-int/lit8 v2, p0, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 94
    const/4 v1, 0x0

    shr-int/lit8 v2, p0, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 95
    return-object v0
.end method

.method public static packSynchsafeInteger(I[BI)V
    .locals 2
    .parameter "i"
    .parameter "bytes"
    .parameter "offset"

    .prologue
    .line 113
    add-int/lit8 v0, p2, 0x3

    and-int/lit8 v1, p0, 0x7f

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 114
    add-int/lit8 v0, p2, 0x2

    shr-int/lit8 v1, p0, 0x7

    and-int/lit8 v1, v1, 0x7f

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 115
    add-int/lit8 v0, p2, 0x1

    shr-int/lit8 v1, p0, 0xe

    and-int/lit8 v1, v1, 0x7f

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 116
    add-int/lit8 v0, p2, 0x0

    shr-int/lit8 v1, p0, 0x15

    and-int/lit8 v1, v1, 0x7f

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 117
    return-void
.end method

.method public static packSynchsafeInteger(I)[B
    .locals 2
    .parameter "i"

    .prologue
    .line 107
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 108
    .local v0, bytes:[B
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/mpatric/mp3agic/BufferTools;->packSynchsafeInteger(I[BI)V

    .line 109
    return-object v0
.end method

.method public static padStringRight(Ljava/lang/String;IC)Ljava/lang/String;
    .locals 2
    .parameter "s"
    .parameter "length"
    .parameter "padWith"

    .prologue
    .line 49
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, p1, :cond_0

    .line 54
    .end local p0
    :goto_0
    return-object p0

    .line 50
    .restart local p0
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 51
    .local v0, stringBuffer:Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-lt v1, p1, :cond_1

    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method public static setBit(BIZ)B
    .locals 2
    .parameter "b"
    .parameter "bitPosition"
    .parameter "value"

    .prologue
    const/4 v1, 0x1

    .line 63
    if-eqz p2, :cond_0

    .line 64
    shl-int/2addr v1, p1

    or-int/2addr v1, p0

    int-to-byte v0, v1

    .line 68
    .local v0, newByte:B
    :goto_0
    return v0

    .line 66
    .end local v0           #newByte:B
    :cond_0
    shl-int/2addr v1, p1

    xor-int/lit8 v1, v1, -0x1

    and-int/2addr v1, p0

    int-to-byte v0, v1

    .restart local v0       #newByte:B
    goto :goto_0
.end method

.method public static shiftByte(BI)I
    .locals 2
    .parameter "c"
    .parameter "places"

    .prologue
    .line 72
    and-int/lit16 v0, p0, 0xff

    .line 73
    .local v0, i:I
    if-gez p1, :cond_1

    .line 74
    neg-int v1, p1

    shl-int/2addr v0, v1

    .line 78
    .end local v0           #i:I
    :cond_0
    :goto_0
    return v0

    .line 75
    .restart local v0       #i:I
    :cond_1
    if-lez p1, :cond_0

    .line 76
    shr-int/2addr v0, p1

    goto :goto_0
.end method

.method public static sizeSynchronisationWouldSubtract([B)I
    .locals 5
    .parameter "bytes"

    .prologue
    const/4 v4, -0x1

    .line 163
    const/4 v0, 0x0

    .line 164
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, p0

    add-int/lit8 v2, v2, -0x2

    if-lt v1, v2, :cond_1

    .line 169
    array-length v2, p0

    const/4 v3, 0x1

    if-le v2, v3, :cond_0

    array-length v2, p0

    add-int/lit8 v2, v2, -0x2

    aget-byte v2, p0, v2

    if-ne v2, v4, :cond_0

    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, p0, v2

    if-nez v2, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 170
    :cond_0
    return v0

    .line 165
    :cond_1
    aget-byte v2, p0, v1

    if-ne v2, v4, :cond_3

    add-int/lit8 v2, v1, 0x1

    aget-byte v2, p0, v2

    if-nez v2, :cond_3

    add-int/lit8 v2, v1, 0x2

    aget-byte v2, p0, v2

    and-int/lit8 v2, v2, -0x20

    const/16 v3, -0x20

    if-eq v2, v3, :cond_2

    add-int/lit8 v2, v1, 0x2

    aget-byte v2, p0, v2

    if-nez v2, :cond_3

    .line 166
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 164
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static sizeUnsynchronisationWouldAdd([B)I
    .locals 5
    .parameter "bytes"

    .prologue
    const/4 v4, -0x1

    .line 134
    const/4 v0, 0x0

    .line 135
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    if-lt v1, v2, :cond_1

    .line 140
    array-length v2, p0

    if-lez v2, :cond_0

    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, p0, v2

    if-ne v2, v4, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 141
    :cond_0
    return v0

    .line 136
    :cond_1
    aget-byte v2, p0, v1

    if-ne v2, v4, :cond_3

    add-int/lit8 v2, v1, 0x1

    aget-byte v2, p0, v2

    and-int/lit8 v2, v2, -0x20

    const/16 v3, -0x20

    if-eq v2, v3, :cond_2

    add-int/lit8 v2, v1, 0x1

    aget-byte v2, p0, v2

    if-nez v2, :cond_3

    .line 137
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 135
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static stringIntoByteBuffer(Ljava/lang/String;II[BI)V
    .locals 4
    .parameter "s"
    .parameter "offset"
    .parameter "length"
    .parameter "bytes"
    .parameter "destOffset"

    .prologue
    .line 24
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-lt v2, p2, :cond_0

    .line 31
    return-void

    .line 25
    :cond_0
    add-int v3, p1, v2

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 27
    .local v1, ch:C
    const/16 v3, 0x80

    if-ge v1, v3, :cond_1

    int-to-byte v0, v1

    .line 29
    .local v0, by:B
    :goto_1
    add-int v3, p4, v2

    aput-byte v0, p3, v3

    .line 24
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 28
    .end local v0           #by:B
    :cond_1
    add-int/lit16 v3, v1, -0x100

    int-to-byte v0, v3

    .restart local v0       #by:B
    goto :goto_1
.end method

.method public static stringToByteBuffer(Ljava/lang/String;II)[B
    .locals 3
    .parameter "s"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 18
    add-int v2, p1, p2

    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 19
    .local v1, stringToCopy:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 20
    .local v0, bytes:[B
    return-object v0
.end method

.method public static substitute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "s"
    .parameter "replaceThis"
    .parameter "withThis"

    .prologue
    .line 190
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-lt v3, v4, :cond_0

    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_1

    .line 209
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 193
    .restart local p0
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 194
    .local v1, newString:Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .line 195
    .local v0, lastPosition:I
    const/4 v2, 0x0

    .line 196
    .local v2, position:I
    :goto_1
    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    if-gez v2, :cond_3

    .line 206
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 207
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 209
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 197
    :cond_3
    if-le v2, v0, :cond_4

    .line 198
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 200
    :cond_4
    if-eqz p2, :cond_5

    .line 201
    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 203
    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int v0, v2, v3

    .line 204
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static synchroniseBuffer([B)[B
    .locals 6
    .parameter "bytes"

    .prologue
    .line 174
    invoke-static {p0}, Lcom/mpatric/mp3agic/BufferTools;->sizeSynchronisationWouldSubtract([B)I

    move-result v0

    .line 175
    .local v0, count:I
    if-nez v0, :cond_0

    .line 186
    .end local p0
    :goto_0
    return-object p0

    .line 176
    .restart local p0
    :cond_0
    array-length v4, p0

    sub-int/2addr v4, v0

    new-array v3, v4, [B

    .line 177
    .local v3, newBuffer:[B
    const/4 v1, 0x0

    .line 178
    .local v1, i:I
    const/4 v2, 0x0

    .local v2, j:I
    :goto_1
    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    if-lt v2, v4, :cond_1

    .line 185
    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    aget-byte v5, p0, v1

    aput-byte v5, v3, v4

    move-object p0, v3

    .line 186
    goto :goto_0

    .line 179
    :cond_1
    aget-byte v4, p0, v1

    aput-byte v4, v3, v2

    .line 180
    aget-byte v4, p0, v1

    const/4 v5, -0x1

    if-ne v4, v5, :cond_3

    add-int/lit8 v4, v1, 0x1

    aget-byte v4, p0, v4

    if-nez v4, :cond_3

    add-int/lit8 v4, v1, 0x2

    aget-byte v4, p0, v4

    and-int/lit8 v4, v4, -0x20

    const/16 v5, -0x20

    if-eq v4, v5, :cond_2

    add-int/lit8 v4, v1, 0x2

    aget-byte v4, p0, v4

    if-nez v4, :cond_3

    .line 181
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 183
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 178
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static trimStringRight(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "s"

    .prologue
    .line 34
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .line 36
    .local v1, endPosition:I
    :goto_0
    if-gez v1, :cond_1

    .line 43
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_2

    .line 45
    .end local p0
    :goto_1
    return-object p0

    .line 37
    .restart local p0
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 38
    .local v0, endChar:C
    const/16 v2, 0x20

    if-gt v0, v2, :cond_0

    .line 41
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 44
    .end local v0           #endChar:C
    :cond_2
    if-gez v1, :cond_3

    const-string p0, ""

    goto :goto_1

    .line 45
    :cond_3
    const/4 v2, 0x0

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_1
.end method

.method public static unpackInteger(BBBB)I
    .locals 2
    .parameter "b1"
    .parameter "b2"
    .parameter "b3"
    .parameter "b4"

    .prologue
    .line 82
    and-int/lit16 v0, p3, 0xff

    .line 83
    .local v0, value:I
    const/4 v1, -0x8

    invoke-static {p2, v1}, Lcom/mpatric/mp3agic/BufferTools;->shiftByte(BI)I

    move-result v1

    add-int/2addr v0, v1

    .line 84
    const/16 v1, -0x10

    invoke-static {p1, v1}, Lcom/mpatric/mp3agic/BufferTools;->shiftByte(BI)I

    move-result v1

    add-int/2addr v0, v1

    .line 85
    const/16 v1, -0x18

    invoke-static {p0, v1}, Lcom/mpatric/mp3agic/BufferTools;->shiftByte(BI)I

    move-result v1

    add-int/2addr v0, v1

    .line 86
    return v0
.end method

.method public static unpackSynchsafeInteger(BBBB)I
    .locals 3
    .parameter "b1"
    .parameter "b2"
    .parameter "b3"
    .parameter "b4"

    .prologue
    .line 99
    and-int/lit8 v1, p3, 0x7f

    int-to-byte v0, v1

    .line 100
    .local v0, value:I
    and-int/lit8 v1, p2, 0x7f

    int-to-byte v1, v1

    const/4 v2, -0x7

    invoke-static {v1, v2}, Lcom/mpatric/mp3agic/BufferTools;->shiftByte(BI)I

    move-result v1

    add-int/2addr v0, v1

    .line 101
    and-int/lit8 v1, p1, 0x7f

    int-to-byte v1, v1

    const/16 v2, -0xe

    invoke-static {v1, v2}, Lcom/mpatric/mp3agic/BufferTools;->shiftByte(BI)I

    move-result v1

    add-int/2addr v0, v1

    .line 102
    and-int/lit8 v1, p0, 0x7f

    int-to-byte v1, v1

    const/16 v2, -0x15

    invoke-static {v1, v2}, Lcom/mpatric/mp3agic/BufferTools;->shiftByte(BI)I

    move-result v1

    add-int/2addr v0, v1

    .line 103
    return v0
.end method

.method public static unsynchroniseBuffer([B)[B
    .locals 9
    .parameter "bytes"

    .prologue
    const/4 v8, 0x0

    const/4 v7, -0x1

    .line 145
    invoke-static {p0}, Lcom/mpatric/mp3agic/BufferTools;->sizeUnsynchronisationWouldAdd([B)I

    move-result v0

    .line 146
    .local v0, count:I
    if-nez v0, :cond_0

    .line 159
    .end local p0
    :goto_0
    return-object p0

    .line 147
    .restart local p0
    :cond_0
    array-length v5, p0

    add-int/2addr v5, v0

    new-array v4, v5, [B

    .line 148
    .local v4, newBuffer:[B
    const/4 v2, 0x0

    .line 149
    .local v2, j:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v5, p0

    add-int/lit8 v5, v5, -0x1

    if-lt v1, v5, :cond_1

    .line 155
    add-int/lit8 v3, v2, 0x1

    .end local v2           #j:I
    .local v3, j:I
    array-length v5, p0

    add-int/lit8 v5, v5, -0x1

    aget-byte v5, p0, v5

    aput-byte v5, v4, v2

    .line 156
    array-length v5, p0

    add-int/lit8 v5, v5, -0x1

    aget-byte v5, p0, v5

    if-ne v5, v7, :cond_3

    .line 157
    add-int/lit8 v2, v3, 0x1

    .end local v3           #j:I
    .restart local v2       #j:I
    aput-byte v8, v4, v3

    :goto_2
    move-object p0, v4

    .line 159
    goto :goto_0

    .line 150
    :cond_1
    add-int/lit8 v3, v2, 0x1

    .end local v2           #j:I
    .restart local v3       #j:I
    aget-byte v5, p0, v1

    aput-byte v5, v4, v2

    .line 151
    aget-byte v5, p0, v1

    if-ne v5, v7, :cond_4

    add-int/lit8 v5, v1, 0x1

    aget-byte v5, p0, v5

    and-int/lit8 v5, v5, -0x20

    const/16 v6, -0x20

    if-eq v5, v6, :cond_2

    add-int/lit8 v5, v1, 0x1

    aget-byte v5, p0, v5

    if-nez v5, :cond_4

    .line 152
    :cond_2
    add-int/lit8 v2, v3, 0x1

    .end local v3           #j:I
    .restart local v2       #j:I
    aput-byte v8, v4, v3

    .line 149
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v2           #j:I
    .restart local v3       #j:I
    :cond_3
    move v2, v3

    .end local v3           #j:I
    .restart local v2       #j:I
    goto :goto_2

    .end local v2           #j:I
    .restart local v3       #j:I
    :cond_4
    move v2, v3

    .end local v3           #j:I
    .restart local v2       #j:I
    goto :goto_3
.end method
