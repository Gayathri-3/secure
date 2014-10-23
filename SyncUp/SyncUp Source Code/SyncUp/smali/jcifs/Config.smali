.class public Ljcifs/Config;
.super Ljava/lang/Object;
.source "Config.java"


# static fields
.field public static DEFAULT_OEM_ENCODING:Ljava/lang/String;

.field private static log:Ljcifs/util/LogStream;

.field private static prp:Ljava/util/Properties;

.field public static socketCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, -0x1

    .line 48
    const/4 v6, 0x0

    sput v6, Ljcifs/Config;->socketCount:I

    .line 54
    new-instance v6, Ljava/util/Properties;

    invoke-direct {v6}, Ljava/util/Properties;-><init>()V

    sput-object v6, Ljcifs/Config;->prp:Ljava/util/Properties;

    .line 56
    const-string v6, "Cp850"

    sput-object v6, Ljcifs/Config;->DEFAULT_OEM_ENCODING:Ljava/lang/String;

    .line 61
    const/4 v1, 0x0

    .line 63
    .local v1, in:Ljava/io/FileInputStream;
    invoke-static {}, Ljcifs/util/LogStream;->getInstance()Ljcifs/util/LogStream;

    move-result-object v6

    sput-object v6, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    .line 66
    :try_start_0
    const-string v6, "jcifs.properties"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, filename:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x1

    if-le v6, v7, :cond_0

    .line 68
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .end local v1           #in:Ljava/io/FileInputStream;
    .local v2, in:Ljava/io/FileInputStream;
    move-object v1, v2

    .line 70
    .end local v2           #in:Ljava/io/FileInputStream;
    .restart local v1       #in:Ljava/io/FileInputStream;
    :cond_0
    invoke-static {v1}, Ljcifs/Config;->load(Ljava/io/InputStream;)V

    .line 71
    if-eqz v1, :cond_1

    .line 72
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .end local v0           #filename:Ljava/lang/String;
    :cond_1
    :goto_0
    const-string v6, "jcifs.util.loglevel"

    invoke-static {v6, v8}, Ljcifs/Config;->getInt(Ljava/lang/String;I)I

    move-result v4

    .local v4, level:I
    if-eq v4, v8, :cond_2

    .line 79
    invoke-static {v4}, Ljcifs/util/LogStream;->setLevel(I)V

    .line 83
    :cond_2
    :try_start_1
    const-string v6, ""

    sget-object v7, Ljcifs/Config;->DEFAULT_OEM_ENCODING:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 92
    :goto_1
    sget v6, Ljcifs/util/LogStream;->level:I

    const/4 v7, 0x4

    if-lt v6, v7, :cond_3

    .line 94
    :try_start_2
    sget-object v6, Ljcifs/Config;->prp:Ljava/util/Properties;

    sget-object v7, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    const-string v8, "JCIFS PROPERTIES"

    invoke-virtual {v6, v7, v8}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 98
    :cond_3
    :goto_2
    return-void

    .line 73
    .end local v4           #level:I
    :catch_0
    move-exception v3

    .line 74
    .local v3, ioe:Ljava/io/IOException;
    sget v6, Ljcifs/util/LogStream;->level:I

    if-lez v6, :cond_1

    .line 75
    sget-object v6, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    invoke-virtual {v3, v6}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0

    .line 84
    .end local v3           #ioe:Ljava/io/IOException;
    .restart local v4       #level:I
    :catch_1
    move-exception v5

    .line 85
    .local v5, uee:Ljava/io/UnsupportedEncodingException;
    sget v6, Ljcifs/util/LogStream;->level:I

    const/4 v7, 0x2

    if-lt v6, v7, :cond_4

    .line 86
    sget-object v6, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "WARNING: The default OEM encoding "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Ljcifs/Config;->DEFAULT_OEM_ENCODING:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 87
    const-string v8, " does not appear to be supported by this JRE. The default encoding will be US-ASCII."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 86
    invoke-virtual {v6, v7}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 89
    :cond_4
    const-string v6, "US-ASCII"

    sput-object v6, Ljcifs/Config;->DEFAULT_OEM_ENCODING:Ljava/lang/String;

    goto :goto_1

    .line 95
    .end local v5           #uee:Ljava/io/UnsupportedEncodingException;
    :catch_2
    move-exception v6

    goto :goto_2
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .parameter "key"

    .prologue
    .line 200
    sget-object v0, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v0, p0}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getBoolean(Ljava/lang/String;Z)Z
    .locals 3
    .parameter "key"
    .parameter "def"

    .prologue
    .line 318
    invoke-static {p0}, Ljcifs/Config;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 319
    .local v0, b:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 320
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    .line 322
    :cond_0
    return p1
.end method

.method public static getInetAddress(Ljava/lang/String;Ljava/net/InetAddress;)Ljava/net/InetAddress;
    .locals 3
    .parameter "key"
    .parameter "def"

    .prologue
    .line 283
    sget-object v2, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v2, p0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 284
    .local v0, addr:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 286
    :try_start_0
    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    .line 294
    :cond_0
    :goto_0
    return-object p1

    .line 287
    :catch_0
    move-exception v1

    .line 288
    .local v1, uhe:Ljava/net/UnknownHostException;
    sget v2, Ljcifs/util/LogStream;->level:I

    if-lez v2, :cond_0

    .line 289
    sget-object v2, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    invoke-virtual {v2, v0}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 290
    sget-object v2, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v2}, Ljava/net/UnknownHostException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method

.method public static getInetAddressArray(Ljava/lang/String;Ljava/lang/String;[Ljava/net/InetAddress;)[Ljava/net/InetAddress;
    .locals 8
    .parameter "key"
    .parameter "delim"
    .parameter "def"

    .prologue
    .line 332
    invoke-static {p0}, Ljcifs/Config;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 333
    .local v4, p:Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 334
    new-instance v5, Ljava/util/StringTokenizer;

    invoke-direct {v5, v4, p1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    .local v5, tok:Ljava/util/StringTokenizer;
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v3

    .line 336
    .local v3, len:I
    new-array v1, v3, [Ljava/net/InetAddress;

    .line 337
    .local v1, arr:[Ljava/net/InetAddress;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-lt v2, v3, :cond_1

    move-object p2, v1

    .line 351
    .end local v1           #arr:[Ljava/net/InetAddress;
    .end local v2           #i:I
    .end local v3           #len:I
    .end local v5           #tok:Ljava/util/StringTokenizer;
    .end local p2
    :cond_0
    :goto_1
    return-object p2

    .line 338
    .restart local v1       #arr:[Ljava/net/InetAddress;
    .restart local v2       #i:I
    .restart local v3       #len:I
    .restart local v5       #tok:Ljava/util/StringTokenizer;
    .restart local p2
    :cond_1
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 340
    .local v0, addr:Ljava/lang/String;
    :try_start_0
    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v7

    aput-object v7, v1, v2
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 341
    :catch_0
    move-exception v6

    .line 342
    .local v6, uhe:Ljava/net/UnknownHostException;
    sget v7, Ljcifs/util/LogStream;->level:I

    if-lez v7, :cond_0

    .line 343
    sget-object v7, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    invoke-virtual {v7, v0}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 344
    sget-object v7, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    invoke-virtual {v6, v7}, Ljava/net/UnknownHostException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_1
.end method

.method public static getInt(Ljava/lang/String;)I
    .locals 4
    .parameter "key"

    .prologue
    .line 244
    sget-object v3, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v3, p0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 245
    .local v2, s:Ljava/lang/String;
    const/4 v1, -0x1

    .line 246
    .local v1, result:I
    if-eqz v2, :cond_0

    .line 248
    :try_start_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 254
    :cond_0
    :goto_0
    return v1

    .line 249
    :catch_0
    move-exception v0

    .line 250
    .local v0, nfe:Ljava/lang/NumberFormatException;
    sget v3, Ljcifs/util/LogStream;->level:I

    if-lez v3, :cond_0

    .line 251
    sget-object v3, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    invoke-virtual {v0, v3}, Ljava/lang/NumberFormatException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method

.method public static getInt(Ljava/lang/String;I)I
    .locals 3
    .parameter "key"
    .parameter "def"

    .prologue
    .line 227
    sget-object v2, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v2, p0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 228
    .local v1, s:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 230
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p1

    .line 236
    :cond_0
    :goto_0
    return p1

    .line 231
    :catch_0
    move-exception v0

    .line 232
    .local v0, nfe:Ljava/lang/NumberFormatException;
    sget v2, Ljcifs/util/LogStream;->level:I

    if-lez v2, :cond_0

    .line 233
    sget-object v2, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    invoke-virtual {v0, v2}, Ljava/lang/NumberFormatException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method

.method public static getLocalHost()Ljava/net/InetAddress;
    .locals 5

    .prologue
    .line 297
    sget-object v2, Ljcifs/Config;->prp:Ljava/util/Properties;

    const-string v3, "jcifs.smb.client.laddr"

    invoke-virtual {v2, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 299
    .local v0, addr:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 301
    :try_start_0
    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 310
    :goto_0
    return-object v2

    .line 302
    :catch_0
    move-exception v1

    .line 303
    .local v1, uhe:Ljava/net/UnknownHostException;
    sget v2, Ljcifs/util/LogStream;->level:I

    if-lez v2, :cond_0

    .line 304
    sget-object v2, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Ignoring jcifs.smb.client.laddr address: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 305
    sget-object v2, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v2}, Ljava/net/UnknownHostException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 310
    .end local v1           #uhe:Ljava/net/UnknownHostException;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getLong(Ljava/lang/String;J)J
    .locals 3
    .parameter "key"
    .parameter "def"

    .prologue
    .line 264
    sget-object v2, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v2, p0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 265
    .local v1, s:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 267
    :try_start_0
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide p1

    .line 273
    :cond_0
    :goto_0
    return-wide p1

    .line 268
    :catch_0
    move-exception v0

    .line 269
    .local v0, nfe:Ljava/lang/NumberFormatException;
    sget v2, Ljcifs/util/LogStream;->level:I

    if-lez v2, :cond_0

    .line 270
    sget-object v2, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    invoke-virtual {v0, v2}, Ljava/lang/NumberFormatException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method

.method public static getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "key"

    .prologue
    .line 217
    sget-object v0, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v0, p0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "key"
    .parameter "def"

    .prologue
    .line 209
    sget-object v0, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v0, p0, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static list(Ljava/io/PrintStream;)V
    .locals 1
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    sget-object v0, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v0, p0}, Ljava/util/Properties;->list(Ljava/io/PrintStream;)V

    .line 185
    return-void
.end method

.method public static load(Ljava/io/InputStream;)V
    .locals 4
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    if-eqz p0, :cond_0

    .line 160
    sget-object v2, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v2, p0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 163
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v0

    .line 164
    .local v0, properties:Ljava/util/Properties;
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    :try_start_1
    sget-object v2, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v2, v0}, Ljava/util/Properties;->putAll(Ljava/util/Map;)V

    .line 164
    monitor-exit v0

    .line 173
    .end local v0           #properties:Ljava/util/Properties;
    :cond_1
    :goto_0
    return-void

    .line 164
    .restart local v0       #properties:Ljava/util/Properties;
    :catchall_0
    move-exception v2

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0

    .line 169
    .end local v0           #properties:Ljava/util/Properties;
    :catch_0
    move-exception v1

    .line 170
    .local v1, se:Ljava/lang/SecurityException;
    sget v2, Ljcifs/util/LogStream;->level:I

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    .line 171
    sget-object v2, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    const-string v3, "SecurityException: jcifs will ignore System properties"

    invoke-virtual {v2, v3}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static registerSmbURLHandler()V
    .locals 5

    .prologue
    .line 118
    const-string v2, "java.version"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 119
    .local v1, ver:Ljava/lang/String;
    const-string v2, "1.1."

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "1.2."

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 120
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "jcifs-0.7.0b4+ requires Java 1.3 or above. You are running "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 122
    :cond_1
    const-string v2, "java.protocol.handler.pkgs"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, pkgs:Ljava/lang/String;
    if-nez v0, :cond_3

    .line 124
    const-string v2, "java.protocol.handler.pkgs"

    const-string v3, "jcifs"

    invoke-static {v2, v3}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 129
    :cond_2
    :goto_0
    return-void

    .line 125
    :cond_3
    const-string v2, "jcifs"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    .line 126
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "|jcifs"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 127
    const-string v2, "java.protocol.handler.pkgs"

    invoke-static {v2, v0}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0
.end method

.method public static setProperties(Ljava/util/Properties;)V
    .locals 3
    .parameter "prp"

    .prologue
    .line 144
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1, p0}, Ljava/util/Properties;-><init>(Ljava/util/Properties;)V

    sput-object v1, Ljcifs/Config;->prp:Ljava/util/Properties;

    .line 146
    :try_start_0
    sget-object v1, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Properties;->putAll(Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    :cond_0
    :goto_0
    return-void

    .line 147
    :catch_0
    move-exception v0

    .line 148
    .local v0, se:Ljava/lang/SecurityException;
    sget v1, Ljcifs/util/LogStream;->level:I

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    .line 149
    sget-object v1, Ljcifs/Config;->log:Ljcifs/util/LogStream;

    const-string v2, "SecurityException: jcifs will ignore System properties"

    invoke-virtual {v1, v2}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .parameter "key"
    .parameter "value"

    .prologue
    .line 192
    sget-object v0, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v0, p0, p1}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static store(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 1
    .parameter "out"
    .parameter "header"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 176
    sget-object v0, Ljcifs/Config;->prp:Ljava/util/Properties;

    invoke-virtual {v0, p0, p1}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 177
    return-void
.end method
