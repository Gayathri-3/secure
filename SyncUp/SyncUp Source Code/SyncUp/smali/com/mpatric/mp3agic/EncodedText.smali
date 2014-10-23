.class public Lcom/mpatric/mp3agic/EncodedText;
.super Ljava/lang/Object;
.source "EncodedText.java"


# static fields
.field public static final CHARSET_ISO_8859_1:Ljava/lang/String; = "ISO-8859-1"

.field public static final CHARSET_UTF_16:Ljava/lang/String; = "UTF-16"

.field public static final CHARSET_UTF_16BE:Ljava/lang/String; = "UTF-16BE"

.field public static final CHARSET_UTF_8:Ljava/lang/String; = "UTF-8"

.field public static final TEXT_ENCODING_ISO_8859_1:B = 0x0t

.field public static final TEXT_ENCODING_UTF_16:B = 0x1t

.field public static final TEXT_ENCODING_UTF_16BE:B = 0x2t

.field public static final TEXT_ENCODING_UTF_8:B = 0x3t

.field private static final characterSets:[Ljava/lang/String;


# instance fields
.field private textEncoding:B

.field private value:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 23
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 24
    const-string v2, "ISO-8859-1"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 25
    const-string v2, "UTF-16"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 26
    const-string v2, "UTF-16BE"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 27
    const-string v2, "UTF-8"

    aput-object v2, v0, v1

    .line 23
    sput-object v0, Lcom/mpatric/mp3agic/EncodedText;->characterSets:[Ljava/lang/String;

    .line 11
    return-void
.end method

.method public constructor <init>(BLjava/lang/String;)V
    .locals 1
    .parameter "textEncoding"
    .parameter "ascii"

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-byte p1, p0, Lcom/mpatric/mp3agic/EncodedText;->textEncoding:B

    .line 40
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/EncodedText;->characterSetForTextEncoding(B)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/mpatric/mp3agic/EncodedText;->stringToUnicodeBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/mpatric/mp3agic/EncodedText;->value:[B

    .line 41
    return-void
.end method

.method public constructor <init>(B[B)V
    .locals 0
    .parameter "textEncoding"
    .parameter "value"

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-byte p1, p0, Lcom/mpatric/mp3agic/EncodedText;->textEncoding:B

    .line 35
    iput-object p2, p0, Lcom/mpatric/mp3agic/EncodedText;->value:[B

    .line 36
    return-void
.end method

.method private characterSetForTextEncoding(B)Ljava/lang/String;
    .locals 4
    .parameter "textEncoding"

    .prologue
    .line 45
    :try_start_0
    sget-object v1, Lcom/mpatric/mp3agic/EncodedText;->characterSets:[Ljava/lang/String;

    aget-object v1, v1, p1
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 46
    :catch_0
    move-exception v0

    .line 47
    .local v0, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid text encoding "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static stringToUnicodeBytes(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 7
    .parameter "s"
    .parameter "characterSet"

    .prologue
    .line 95
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    .line 96
    .local v1, charset:Ljava/nio/charset/Charset;
    invoke-virtual {v1}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v3

    .line 99
    .local v3, encoder:Ljava/nio/charset/CharsetEncoder;
    :try_start_0
    invoke-static {p0}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 100
    .local v0, byteBuffer:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    invoke-static {v4, v5, v6}, Lcom/mpatric/mp3agic/BufferTools;->copyBuffer([BII)[B
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 102
    .end local v0           #byteBuffer:Ljava/nio/ByteBuffer;
    :goto_0
    return-object v4

    .line 101
    :catch_0
    move-exception v2

    .line 102
    .local v2, e:Ljava/nio/charset/CharacterCodingException;
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public static unicodeBytesToString([BLjava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "bytes"
    .parameter "characterSet"

    .prologue
    .line 81
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    .line 82
    .local v1, charset:Ljava/nio/charset/Charset;
    invoke-virtual {v1}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v2

    .line 84
    .local v2, decoder:Ljava/nio/charset/CharsetDecoder;
    :try_start_0
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v0

    .line 85
    .local v0, cbuf:Ljava/nio/CharBuffer;
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 86
    .local v5, s:Ljava/lang/String;
    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 87
    .local v4, length:I
    const/4 v6, -0x1

    if-ne v4, v6, :cond_0

    .line 90
    .end local v0           #cbuf:Ljava/nio/CharBuffer;
    .end local v4           #length:I
    .end local v5           #s:Ljava/lang/String;
    :goto_0
    return-object v5

    .line 88
    .restart local v0       #cbuf:Ljava/nio/CharBuffer;
    .restart local v4       #length:I
    .restart local v5       #s:Ljava/lang/String;
    :cond_0
    const/4 v6, 0x0

    invoke-virtual {v5, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_0

    .line 89
    .end local v0           #cbuf:Ljava/nio/CharBuffer;
    .end local v4           #length:I
    .end local v5           #s:Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 90
    .local v3, e:Ljava/nio/charset/CharacterCodingException;
    const/4 v5, 0x0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 72
    instance-of v3, p1, Lcom/mpatric/mp3agic/EncodedText;

    if-nez v3, :cond_1

    .line 77
    :cond_0
    :goto_0
    return v1

    .line 73
    :cond_1
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 74
    check-cast v0, Lcom/mpatric/mp3agic/EncodedText;

    .line 75
    .local v0, other:Lcom/mpatric/mp3agic/EncodedText;
    iget-byte v3, p0, Lcom/mpatric/mp3agic/EncodedText;->textEncoding:B

    iget-byte v4, v0, Lcom/mpatric/mp3agic/EncodedText;->textEncoding:B

    if-ne v3, v4, :cond_0

    .line 76
    iget-object v3, p0, Lcom/mpatric/mp3agic/EncodedText;->value:[B

    iget-object v4, v0, Lcom/mpatric/mp3agic/EncodedText;->value:[B

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-eqz v3, :cond_0

    move v1, v2

    .line 77
    goto :goto_0
.end method

.method public getCharacterSet()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-byte v0, p0, Lcom/mpatric/mp3agic/EncodedText;->textEncoding:B

    invoke-direct {p0, v0}, Lcom/mpatric/mp3agic/EncodedText;->characterSetForTextEncoding(B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextEncoding()B
    .locals 1

    .prologue
    .line 52
    iget-byte v0, p0, Lcom/mpatric/mp3agic/EncodedText;->textEncoding:B

    return v0
.end method

.method public setTextEncoding(B)V
    .locals 0
    .parameter "textEncoding"

    .prologue
    .line 56
    iput-byte p1, p0, Lcom/mpatric/mp3agic/EncodedText;->textEncoding:B

    .line 57
    return-void
.end method

.method public toBytes()[B
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mpatric/mp3agic/EncodedText;->value:[B

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mpatric/mp3agic/EncodedText;->value:[B

    iget-byte v1, p0, Lcom/mpatric/mp3agic/EncodedText;->textEncoding:B

    invoke-direct {p0, v1}, Lcom/mpatric/mp3agic/EncodedText;->characterSetForTextEncoding(B)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mpatric/mp3agic/EncodedText;->unicodeBytesToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
