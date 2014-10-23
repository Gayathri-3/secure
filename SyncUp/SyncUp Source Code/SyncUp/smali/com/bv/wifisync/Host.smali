.class Lcom/bv/wifisync/Host;
.super Ljava/lang/Object;
.source "Host.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final IS_UP_CACHE_TIMEOUT:I = 0x3e8

.field private static final TAG:Ljava/lang/String; = "Host"

.field private static final serialVersionUID:J = -0x3791db485417d12cL


# instance fields
.field private transient connected:Z

.field domain:Ljava/lang/String;

.field id:I

.field private ip:Ljava/lang/String;

.field transient isUp:Z

.field transient isUpExpiryTime:J

.field private jobs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/Job;",
            ">;"
        }
    .end annotation
.end field

.field transient lastResolve:J

.field private lastWakeUp:J

.field private mac:J

.field name:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field user:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/Host;->jobs:Ljava/util/List;

    .line 43
    return-void
.end method

.method private bytesToLong([B)J
    .locals 9
    .parameter "addr"

    .prologue
    const-wide/16 v7, 0xff

    .line 113
    if-nez p1, :cond_0

    .line 114
    const-wide/16 v0, 0x0

    .line 121
    :goto_0
    return-wide v0

    .line 115
    :cond_0
    const/4 v2, 0x5

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v7

    .line 116
    const/4 v4, 0x4

    aget-byte v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v7

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    .line 115
    add-long/2addr v2, v4

    .line 117
    const/4 v4, 0x3

    aget-byte v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v7

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    .line 115
    add-long/2addr v2, v4

    .line 118
    const/4 v4, 0x2

    aget-byte v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v7

    const/16 v6, 0x18

    shl-long/2addr v4, v6

    .line 115
    add-long/2addr v2, v4

    .line 119
    const/4 v4, 0x1

    aget-byte v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v7

    const/16 v6, 0x20

    shl-long/2addr v4, v6

    .line 115
    add-long/2addr v2, v4

    .line 120
    const/4 v4, 0x0

    aget-byte v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v7

    const/16 v6, 0x28

    shl-long/2addr v4, v6

    .line 115
    add-long v0, v2, v4

    .line 121
    .local v0, result:J
    goto :goto_0
.end method

.method private getFirstOnline([Ljcifs/netbios/NbtAddress;)Ljava/lang/String;
    .locals 7
    .parameter "addresses"

    .prologue
    .line 204
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 205
    .local v2, ips:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    array-length v5, p1

    const/4 v4, 0x0

    :goto_0
    if-lt v4, v5, :cond_1

    .line 209
    const/4 v3, 0x0

    .line 210
    .local v3, result:Ljava/lang/String;
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_3

    .line 219
    :goto_2
    return-object v3

    .line 205
    .end local v3           #result:Ljava/lang/String;
    :cond_1
    aget-object v0, p1, v4

    .line 206
    .local v0, address:Ljcifs/netbios/NbtAddress;
    invoke-virtual {v0}, Ljcifs/netbios/NbtAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 207
    invoke-virtual {v0}, Ljcifs/netbios/NbtAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 205
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 210
    .end local v0           #address:Ljcifs/netbios/NbtAddress;
    .restart local v3       #result:Ljava/lang/String;
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 212
    .local v1, ip:Ljava/lang/String;
    move-object v3, v1

    :try_start_0
    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 213
    .local v0, address:Ljava/net/InetAddress;
    invoke-static {v0}, Lcom/bv/wifisync/Utils;->setHostName(Ljava/net/InetAddress;)V

    .line 214
    invoke-static {v0}, Lcom/bv/wifisync/Utils;->smbReachable(Ljava/net/InetAddress;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_2

    .line 216
    .end local v0           #address:Ljava/net/InetAddress;
    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method private getIsUp()Z
    .locals 9

    .prologue
    .line 371
    const/4 v4, 0x0

    .line 372
    .local v4, result:Z
    invoke-virtual {p0}, Lcom/bv/wifisync/Host;->getIp()Ljava/lang/String;

    move-result-object v3

    .line 374
    .local v3, ip:Ljava/lang/String;
    :try_start_0
    invoke-static {v3}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 375
    .local v0, address:Ljava/net/InetAddress;
    invoke-static {v0}, Lcom/bv/wifisync/Utils;->setHostName(Ljava/net/InetAddress;)V

    .line 376
    invoke-static {v0}, Lcom/bv/wifisync/Utils;->smbReachable(Ljava/net/InetAddress;)Z

    move-result v4

    .line 377
    if-eqz v4, :cond_0

    .line 378
    invoke-static {v3}, Lcom/bv/sync/CifsUtils;->getNetbiosInfo(Ljava/lang/String;)Lcom/bv/sync/CifsUtils$HostInfo;

    move-result-object v2

    .line 379
    .local v2, hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    if-eqz v2, :cond_1

    iget-object v5, p0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    iget-object v6, v2, Lcom/bv/sync/CifsUtils$HostInfo;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v4, 0x1

    .line 380
    :goto_0
    if-eqz v4, :cond_0

    iget-wide v5, p0, Lcom/bv/wifisync/Host;->mac:J

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-nez v5, :cond_0

    .line 381
    iget-object v5, v2, Lcom/bv/sync/CifsUtils$HostInfo;->mac:[B

    invoke-virtual {p0, v5}, Lcom/bv/wifisync/Host;->setMac([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 386
    .end local v0           #address:Ljava/net/InetAddress;
    .end local v2           #hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    :cond_0
    :goto_1
    return v4

    .line 379
    .restart local v0       #address:Ljava/net/InetAddress;
    .restart local v2       #hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    :cond_1
    const/4 v4, 0x0

    goto :goto_0

    .line 383
    .end local v0           #address:Ljava/net/InetAddress;
    .end local v2           #hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    :catch_0
    move-exception v1

    .line 384
    .local v1, e:Ljava/lang/Exception;
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private isEmpty([B)Z
    .locals 4
    .parameter "macAddress"

    .prologue
    const/4 v1, 0x0

    .line 271
    if-eqz p1, :cond_0

    .line 272
    array-length v3, p1

    move v2, v1

    :goto_0
    if-lt v2, v3, :cond_2

    .line 275
    :cond_0
    const/4 v1, 0x1

    :cond_1
    return v1

    .line 272
    :cond_2
    aget-byte v0, p1, v2

    .line 273
    .local v0, b:B
    if-nez v0, :cond_1

    .line 272
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private longToBytes(J)[B
    .locals 5
    .parameter "value"

    .prologue
    .line 92
    const/4 v2, 0x0

    .line 93
    .local v2, result:[B
    const-wide/16 v3, 0x0

    cmp-long v3, p1, v3

    if-eqz v3, :cond_0

    .line 94
    const/4 v3, 0x6

    new-array v2, v3, [B

    .line 95
    const/4 v0, 0x0

    .line 96
    .local v0, i:I
    add-int/lit8 v1, v0, 0x1

    .end local v0           #i:I
    .local v1, i:I
    const/16 v3, 0x28

    shr-long v3, p1, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 97
    add-int/lit8 v0, v1, 0x1

    .end local v1           #i:I
    .restart local v0       #i:I
    const/16 v3, 0x20

    shr-long v3, p1, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 98
    add-int/lit8 v1, v0, 0x1

    .end local v0           #i:I
    .restart local v1       #i:I
    const/16 v3, 0x18

    shr-long v3, p1, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 99
    add-int/lit8 v0, v1, 0x1

    .end local v1           #i:I
    .restart local v0       #i:I
    const/16 v3, 0x10

    shr-long v3, p1, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 100
    add-int/lit8 v1, v0, 0x1

    .end local v0           #i:I
    .restart local v1       #i:I
    const/16 v3, 0x8

    shr-long v3, p1, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 101
    add-int/lit8 v0, v1, 0x1

    .end local v1           #i:I
    .restart local v0       #i:I
    long-to-int v3, p1

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 103
    .end local v0           #i:I
    :cond_0
    return-object v2
.end method

.method static parseMacAddress(Ljava/lang/String;)[B
    .locals 5
    .parameter "string"

    .prologue
    const/4 v4, 0x6

    .line 312
    const-string v3, ":"

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 313
    .local v0, bytes:[Ljava/lang/String;
    if-eqz v0, :cond_1

    array-length v3, v0

    if-ne v3, v4, :cond_1

    .line 314
    new-array v2, v4, [B

    .line 315
    .local v2, result:[B
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v2

    if-lt v1, v3, :cond_0

    .line 319
    .end local v1           #i:I
    .end local v2           #result:[B
    :goto_1
    return-object v2

    .line 316
    .restart local v1       #i:I
    .restart local v2       #result:[B
    :cond_0
    aget-object v3, v0, v1

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 315
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 319
    .end local v1           #i:I
    .end local v2           #result:[B
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private resolveMacUsingIp(Landroid/content/Context;)[B
    .locals 12
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 279
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "ip neigh show "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v11, p0, Lcom/bv/wifisync/Host;->ip:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 280
    .local v1, command:Ljava/lang/String;
    const/16 v10, 0x400

    new-array v0, v10, [B

    .line 281
    .local v0, buffer:[B
    const/4 v8, 0x0

    .line 283
    .local v8, result:[B
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 285
    .local v7, process:Ljava/lang/Process;
    :try_start_1
    invoke-virtual {v7}, Ljava/lang/Process;->waitFor()I

    move-result v4

    .line 286
    .local v4, exitCode:I
    if-nez v4, :cond_1

    .line 287
    invoke-virtual {v7}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/io/InputStream;->read([B)I

    move-result v9

    .line 288
    .local v9, size:I
    if-lez v9, :cond_0

    .line 289
    new-instance v6, Ljava/lang/String;

    const/4 v10, 0x0

    invoke-direct {v6, v0, v10, v9}, Ljava/lang/String;-><init>([BII)V

    .line 290
    .local v6, line:Ljava/lang/String;
    const-string v10, " "

    invoke-virtual {v6, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 291
    .local v5, fields:[Ljava/lang/String;
    if-eqz v5, :cond_0

    array-length v10, v5

    const/4 v11, 0x5

    if-le v10, v11, :cond_0

    .line 292
    const/4 v10, 0x4

    aget-object v10, v5, v10

    invoke-static {v10}, Lcom/bv/wifisync/Host;->parseMacAddress(Ljava/lang/String;)[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v8

    .line 303
    .end local v5           #fields:[Ljava/lang/String;
    .end local v6           #line:Ljava/lang/String;
    :cond_0
    :goto_0
    :try_start_2
    invoke-virtual {v7}, Ljava/lang/Process;->destroy()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 308
    .end local v4           #exitCode:I
    .end local v7           #process:Ljava/lang/Process;
    .end local v9           #size:I
    :goto_1
    return-object v8

    .line 295
    .restart local v4       #exitCode:I
    .restart local v7       #process:Ljava/lang/Process;
    :cond_1
    :try_start_3
    invoke-virtual {v7}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/io/InputStream;->read([B)I

    move-result v9

    .line 296
    .restart local v9       #size:I
    const-string v3, ""

    .line 297
    .local v3, error:Ljava/lang/String;
    if-lez v9, :cond_2

    .line 298
    new-instance v3, Ljava/lang/String;

    .end local v3           #error:Ljava/lang/String;
    const/4 v10, 0x0

    invoke-direct {v3, v0, v10, v9}, Ljava/lang/String;-><init>([BII)V

    .line 299
    .restart local v3       #error:Ljava/lang/String;
    :cond_2
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, " exit code: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 300
    const-string v10, "Host"

    new-instance v11, Ljava/io/IOException;

    invoke-direct {v11, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v11}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 302
    .end local v3           #error:Ljava/lang/String;
    .end local v4           #exitCode:I
    .end local v9           #size:I
    :catchall_0
    move-exception v10

    .line 303
    :try_start_4
    invoke-virtual {v7}, Ljava/lang/Process;->destroy()V

    .line 304
    throw v10
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 305
    .end local v7           #process:Ljava/lang/Process;
    :catch_0
    move-exception v2

    .line 306
    .local v2, e:Ljava/lang/Exception;
    const-string v10, "Host"

    invoke-static {p1, v2}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private resolveMacUsingProc(Landroid/content/Context;)[B
    .locals 8
    .parameter "context"

    .prologue
    const/4 v6, 0x0

    .line 243
    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/FileReader;

    const-string v7, "/proc/net/arp"

    invoke-direct {v5, v7}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 246
    .local v3, reader:Ljava/io/BufferedReader;
    :cond_0
    :try_start_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .local v1, line:Ljava/lang/String;
    if-nez v1, :cond_1

    .line 259
    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .end local v1           #line:Ljava/lang/String;
    .end local v3           #reader:Ljava/io/BufferedReader;
    :goto_0
    move-object v5, v6

    .line 267
    :goto_1
    return-object v5

    .line 247
    .restart local v1       #line:Ljava/lang/String;
    .restart local v3       #reader:Ljava/io/BufferedReader;
    :cond_1
    :try_start_3
    const-string v5, " +"

    invoke-virtual {v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 248
    .local v4, splitted:[Ljava/lang/String;
    if-eqz v4, :cond_0

    array-length v5, v4

    const/4 v7, 0x4

    if-lt v5, v7, :cond_0

    iget-object v5, p0, Lcom/bv/wifisync/Host;->ip:Ljava/lang/String;

    const/4 v7, 0x0

    aget-object v7, v4, v7

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 250
    const/4 v5, 0x3

    aget-object v2, v4, v5

    .line 251
    .local v2, mac:Ljava/lang/String;
    const-string v5, "..:..:..:..:..:.."

    invoke-virtual {v2, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 252
    invoke-static {v2}, Lcom/bv/wifisync/Host;->parseMacAddress(Ljava/lang/String;)[B
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v5

    .line 259
    :try_start_4
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 260
    :catch_0
    move-exception v0

    .line 261
    .local v0, e:Ljava/io/IOException;
    :try_start_5
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 264
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #line:Ljava/lang/String;
    .end local v2           #mac:Ljava/lang/String;
    .end local v3           #reader:Ljava/io/BufferedReader;
    .end local v4           #splitted:[Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 265
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p1, v0}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    goto :goto_0

    .line 259
    .end local v0           #e:Ljava/lang/Exception;
    .restart local v1       #line:Ljava/lang/String;
    .restart local v2       #mac:Ljava/lang/String;
    .restart local v3       #reader:Ljava/io/BufferedReader;
    .restart local v4       #splitted:[Ljava/lang/String;
    :cond_2
    :try_start_6
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    :goto_2
    move-object v5, v6

    .line 254
    goto :goto_1

    .line 260
    :catch_2
    move-exception v0

    .line 261
    .local v0, e:Ljava/io/IOException;
    :try_start_7
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_2

    .line 257
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #line:Ljava/lang/String;
    .end local v2           #mac:Ljava/lang/String;
    .end local v4           #splitted:[Ljava/lang/String;
    :catchall_0
    move-exception v5

    .line 259
    :try_start_8
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    .line 263
    :goto_3
    :try_start_9
    throw v5

    .line 260
    :catch_3
    move-exception v0

    .line 261
    .restart local v0       #e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 260
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #line:Ljava/lang/String;
    :catch_4
    move-exception v0

    .line 261
    .restart local v0       #e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    goto :goto_0
.end method

.method private resolveNBT(Landroid/content/Context;)Z
    .locals 5
    .parameter "context"

    .prologue
    .line 223
    invoke-virtual {p0}, Lcom/bv/wifisync/Host;->getIp()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/bv/sync/CifsUtils;->getNetbiosInfo(Ljava/lang/String;)Lcom/bv/sync/CifsUtils$HostInfo;

    move-result-object v0

    .line 224
    .local v0, hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    if-eqz v0, :cond_1

    iget-object v1, v0, Lcom/bv/sync/CifsUtils$HostInfo;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 225
    iget-wide v1, p0, Lcom/bv/wifisync/Host;->mac:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 226
    iget-object v1, v0, Lcom/bv/sync/CifsUtils$HostInfo;->mac:[B

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/Host;->setMac([B)V

    .line 227
    :cond_0
    const/4 v1, 0x1

    .line 229
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private resolveNBTBroadcast(Landroid/content/Context;)Z
    .locals 7
    .parameter "context"

    .prologue
    const/4 v3, 0x0

    .line 174
    :try_start_0
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->getBroadcastAddress(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v2

    .line 175
    .local v2, ips:[Ljava/lang/String;
    array-length v5, v2

    move v4, v3

    :goto_0
    if-lt v4, v5, :cond_0

    .line 181
    .end local v2           #ips:[Ljava/lang/String;
    :goto_1
    return v3

    .line 175
    .restart local v2       #ips:[Ljava/lang/String;
    :cond_0
    aget-object v1, v2, v4

    .line 176
    .local v1, ip:Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/bv/wifisync/Host;->resolveNBTBroadcast(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_1

    .line 177
    const/4 v3, 0x1

    goto :goto_1

    .line 175
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 178
    .end local v1           #ip:Ljava/lang/String;
    .end local v2           #ips:[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 179
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private resolveNBTBroadcast(Ljava/lang/String;)Z
    .locals 8
    .parameter "ip"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 186
    :try_start_0
    const-string v5, "jcifs.netbios.baddr"

    invoke-static {v5, p1}, Ljcifs/Config;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 187
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    .line 188
    .local v1, broadcast:Ljava/net/InetAddress;
    iget-object v5, p0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    const/16 v6, 0x20

    const/4 v7, 0x0

    invoke-static {v5, v6, v7, v1}, Ljcifs/netbios/NbtAddress;->getAllByName(Ljava/lang/String;ILjava/lang/String;Ljava/net/InetAddress;)[Ljcifs/netbios/NbtAddress;

    move-result-object v0

    .line 189
    .local v0, addresses:[Ljcifs/netbios/NbtAddress;
    const/4 v2, 0x0

    .line 190
    .local v2, resultIp:Ljava/lang/String;
    array-length v5, v0

    if-ne v5, v3, :cond_0

    .line 191
    const/4 v5, 0x0

    aget-object v5, v0, v5

    invoke-virtual {v5}, Ljcifs/netbios/NbtAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    .line 194
    :goto_0
    if-eqz v2, :cond_1

    .line 195
    const-string v5, "Host"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Resolved broadcast to new ip: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    invoke-virtual {p0, v2}, Lcom/bv/wifisync/Host;->setIp(Ljava/lang/String;)V

    .line 200
    .end local v0           #addresses:[Ljcifs/netbios/NbtAddress;
    .end local v1           #broadcast:Ljava/net/InetAddress;
    .end local v2           #resultIp:Ljava/lang/String;
    :goto_1
    return v3

    .line 193
    .restart local v0       #addresses:[Ljcifs/netbios/NbtAddress;
    .restart local v1       #broadcast:Ljava/net/InetAddress;
    .restart local v2       #resultIp:Ljava/lang/String;
    :cond_0
    invoke-direct {p0, v0}, Lcom/bv/wifisync/Host;->getFirstOnline([Ljcifs/netbios/NbtAddress;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 199
    .end local v0           #addresses:[Ljcifs/netbios/NbtAddress;
    .end local v1           #broadcast:Ljava/net/InetAddress;
    .end local v2           #resultIp:Ljava/lang/String;
    :catch_0
    move-exception v3

    :cond_1
    move v3, v4

    .line 200
    goto :goto_1
.end method

.method private toHex([B)Ljava/lang/String;
    .locals 5
    .parameter "bytes"

    .prologue
    .line 355
    const-string v1, ""

    .line 356
    .local v1, result:Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 357
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, p1

    if-lt v0, v2, :cond_1

    .line 359
    .end local v0           #i:I
    :cond_0
    return-object v1

    .line 358
    .restart local v0       #i:I
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-byte v3, p1, v0

    and-int/lit16 v3, v3, 0xff

    add-int/lit16 v3, v3, 0x100

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 357
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private waitForTerminate(Lcom/bv/wifisync/Job;)V
    .locals 6
    .parameter "job"

    .prologue
    .line 137
    const/16 v0, 0x3e8

    .line 138
    .local v0, GRACE_TIME:I
    const/16 v1, 0x64

    .line 139
    .local v1, GRACE_TIMEOUT:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    iget-boolean v4, p1, Lcom/bv/wifisync/Job;->running:Z

    if-eqz v4, :cond_0

    const/16 v4, 0x3e8

    if-lt v3, v4, :cond_1

    .line 146
    :cond_0
    :goto_1
    return-void

    .line 141
    :cond_1
    const-wide/16 v4, 0x64

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    add-int/lit8 v3, v3, 0x64

    goto :goto_0

    .line 142
    :catch_0
    move-exception v2

    .line 143
    .local v2, e:Ljava/lang/InterruptedException;
    goto :goto_1
.end method


# virtual methods
.method addJob(Lcom/bv/wifisync/Job;)V
    .locals 2
    .parameter "job"

    .prologue
    .line 74
    iget-object v1, p0, Lcom/bv/wifisync/Host;->jobs:Ljava/util/List;

    monitor-enter v1

    .line 75
    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/Host;->jobs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    monitor-exit v1

    .line 77
    return-void

    .line 74
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method declared-synchronized changedSince(J)Z
    .locals 2
    .parameter "time"

    .prologue
    .line 394
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/bv/wifisync/Host;->lastWakeUp:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long v0, v0, p1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getConnected()Z
    .locals 1

    .prologue
    .line 414
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/bv/wifisync/Host;->connected:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getIp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/Host;->ip:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getJobs()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/Job;",
            ">;"
        }
    .end annotation

    .prologue
    .line 398
    iget-object v1, p0, Lcom/bv/wifisync/Host;->jobs:Ljava/util/List;

    monitor-enter v1

    .line 399
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/bv/wifisync/Host;->jobs:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1

    return-object v0

    .line 398
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method declared-synchronized getLastWakeUp()J
    .locals 2

    .prologue
    .line 390
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/bv/wifisync/Host;->lastWakeUp:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getMac()[B
    .locals 2

    .prologue
    .line 88
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/bv/wifisync/Host;->mac:J

    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/Host;->longToBytes(J)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getPassword(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    :try_start_0
    iget-object v2, p0, Lcom/bv/wifisync/Host;->password:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/bv/wifisync/Host;->password:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 48
    iget-object v2, p0, Lcom/bv/wifisync/Host;->password:Ljava/lang/String;

    invoke-static {v2}, Lcom/bv/wifisync/SimpleCrypto;->decrypt(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 54
    :goto_0
    return-object v2

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, e:Ljava/security/GeneralSecurityException;
    new-instance v1, Ljava/io/IOException;

    const v2, 0x7f0600b3

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 51
    .local v1, error:Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 52
    throw v1

    .line 54
    .end local v0           #e:Ljava/security/GeneralSecurityException;
    .end local v1           #error:Ljava/io/IOException;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method isUp()Z
    .locals 4

    .prologue
    .line 363
    iget-wide v0, p0, Lcom/bv/wifisync/Host;->isUpExpiryTime:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 364
    invoke-direct {p0}, Lcom/bv/wifisync/Host;->getIsUp()Z

    move-result v0

    iput-boolean v0, p0, Lcom/bv/wifisync/Host;->isUp:Z

    .line 365
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/bv/wifisync/Host;->isUpExpiryTime:J

    .line 367
    :cond_0
    iget-boolean v0, p0, Lcom/bv/wifisync/Host;->isUp:Z

    return v0
.end method

.method remove(Landroid/content/Context;)V
    .locals 4
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    iget-object v3, p0, Lcom/bv/wifisync/Host;->jobs:Ljava/util/List;

    monitor-enter v3

    .line 127
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/bv/wifisync/Host;->jobs:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 126
    .local v1, jobsCopy:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Job;>;"
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 134
    return-void

    .line 126
    .end local v1           #jobsCopy:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Job;>;"
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 129
    .restart local v1       #jobsCopy:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Job;>;"
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Job;

    .line 130
    .local v0, job:Lcom/bv/wifisync/Job;
    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->cancel()V

    .line 131
    invoke-direct {p0, v0}, Lcom/bv/wifisync/Host;->waitForTerminate(Lcom/bv/wifisync/Job;)V

    .line 132
    invoke-virtual {v0, p1}, Lcom/bv/wifisync/Job;->remove(Landroid/content/Context;)V

    goto :goto_0
.end method

.method remove(Lcom/bv/wifisync/Job;)V
    .locals 2
    .parameter "job"

    .prologue
    .line 404
    iget-object v1, p0, Lcom/bv/wifisync/Host;->jobs:Ljava/util/List;

    monitor-enter v1

    .line 405
    :try_start_0
    iget-object v0, p0, Lcom/bv/wifisync/Host;->jobs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 404
    monitor-exit v1

    .line 407
    return-void

    .line 404
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method resolveMacAddress(Landroid/content/Context;)V
    .locals 3
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 233
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Host;->resolveMacUsingProc(Landroid/content/Context;)[B

    move-result-object v0

    .line 234
    .local v0, macAddress:[B
    invoke-direct {p0, v0}, Lcom/bv/wifisync/Host;->isEmpty([B)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 235
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Host;->resolveMacUsingIp(Landroid/content/Context;)[B

    move-result-object v0

    .line 236
    :cond_0
    invoke-direct {p0, v0}, Lcom/bv/wifisync/Host;->isEmpty([B)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 237
    new-instance v1, Ljava/io/IOException;

    const v2, 0x7f06009e

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 238
    :cond_1
    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Host;->setMac([B)V

    .line 239
    return-void
.end method

.method resolveName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .parameter "context"

    .prologue
    .line 156
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Host;->resolveNBT(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/bv/wifisync/Host;->resolveNBTBroadcast(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 157
    :cond_0
    invoke-virtual {p0}, Lcom/bv/wifisync/Host;->getIp()Ljava/lang/String;

    move-result-object v0

    .line 158
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    goto :goto_0
.end method

.method declared-synchronized setConnected(Z)V
    .locals 1
    .parameter "connected"

    .prologue
    .line 410
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/bv/wifisync/Host;->connected:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 411
    monitor-exit p0

    return-void

    .line 410
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized setIp(Ljava/lang/String;)V
    .locals 1
    .parameter "ip"

    .prologue
    .line 80
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/bv/wifisync/Host;->ip:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    monitor-exit p0

    return-void

    .line 80
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized setMac([B)V
    .locals 4
    .parameter "newMac"

    .prologue
    .line 107
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Host;->bytesToLong([B)J

    move-result-wide v0

    .line 108
    .local v0, bytesToLong:J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 109
    iput-wide v0, p0, Lcom/bv/wifisync/Host;->mac:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    :cond_0
    monitor-exit p0

    return-void

    .line 107
    .end local v0           #bytesToLong:J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method setPassword(Ljava/lang/String;)V
    .locals 1
    .parameter "password"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 58
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 59
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bv/wifisync/Host;->password:Ljava/lang/String;

    .line 62
    :goto_0
    return-void

    .line 61
    :cond_1
    invoke-static {p1}, Lcom/bv/wifisync/SimpleCrypto;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/wifisync/Host;->password:Ljava/lang/String;

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    .line 152
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method update(Lcom/bv/wifisync/Host;)V
    .locals 2
    .parameter "another"

    .prologue
    .line 65
    iget-object v0, p1, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    iput-object v0, p0, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    .line 66
    iget-object v0, p1, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    .line 67
    invoke-virtual {p1}, Lcom/bv/wifisync/Host;->getIp()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Host;->setIp(Ljava/lang/String;)V

    .line 68
    iget-object v0, p1, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    iput-object v0, p0, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    .line 69
    iget-object v0, p1, Lcom/bv/wifisync/Host;->password:Ljava/lang/String;

    iput-object v0, p0, Lcom/bv/wifisync/Host;->password:Ljava/lang/String;

    .line 70
    iget-wide v0, p1, Lcom/bv/wifisync/Host;->mac:J

    iput-wide v0, p0, Lcom/bv/wifisync/Host;->mac:J

    .line 71
    return-void
.end method

.method validate(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 418
    const-string v0, "Host"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Validating host "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/bv/wifisync/Host;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    return-void
.end method

.method wakeup(Landroid/content/Context;)V
    .locals 14
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const-wide/16 v12, 0x0

    const/4 v11, 0x0

    .line 323
    const/16 v0, 0x9

    .line 324
    .local v0, WOL_PORT:I
    monitor-enter p0

    .line 325
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iput-wide v9, p0, Lcom/bv/wifisync/Host;->lastWakeUp:J

    .line 324
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 327
    iget-wide v9, p0, Lcom/bv/wifisync/Host;->mac:J

    cmp-long v9, v9, v12

    if-nez v9, :cond_0

    .line 328
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Host;->resolveMacAddress(Landroid/content/Context;)V

    .line 329
    :cond_0
    iget-wide v9, p0, Lcom/bv/wifisync/Host;->mac:J

    cmp-long v9, v9, v12

    if-nez v9, :cond_1

    .line 330
    new-instance v9, Ljava/io/IOException;

    const v10, 0x7f06009e

    invoke-virtual {p1, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 324
    :catchall_0
    move-exception v9

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v9

    .line 331
    :cond_1
    invoke-virtual {p0}, Lcom/bv/wifisync/Host;->getMac()[B

    move-result-object v5

    .line 332
    .local v5, macAddress:[B
    array-length v9, v5

    mul-int/lit8 v9, v9, 0x10

    add-int/lit8 v9, v9, 0x6

    new-array v2, v9, [B

    .line 333
    .local v2, bytes:[B
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    const/4 v9, 0x6

    if-lt v3, v9, :cond_3

    .line 336
    const/4 v3, 0x6

    :goto_1
    array-length v9, v2

    if-lt v3, v9, :cond_4

    .line 339
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->getNetInfo(Landroid/content/Context;)Ljava/util/List;

    move-result-object v6

    .line 340
    .local v6, netInfos:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    if-lez v9, :cond_2

    .line 341
    invoke-interface {v6, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/bv/wifisync/Utils$NetInfo;

    invoke-static {v9}, Lcom/bv/wifisync/Utils;->getBroadcastBytes(Lcom/bv/wifisync/Utils$NetInfo;)[B

    move-result-object v1

    .line 342
    .local v1, address:[B
    invoke-static {v1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v4

    .line 343
    .local v4, inetAddress:Ljava/net/InetAddress;
    new-instance v7, Ljava/net/DatagramPacket;

    array-length v9, v2

    const/16 v10, 0x9

    invoke-direct {v7, v2, v9, v4, v10}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 344
    .local v7, packet:Ljava/net/DatagramPacket;
    new-instance v8, Ljava/net/DatagramSocket;

    invoke-direct {v8}, Ljava/net/DatagramSocket;-><init>()V

    .line 346
    .local v8, socket:Ljava/net/DatagramSocket;
    :try_start_2
    invoke-virtual {v8, v7}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 348
    invoke-virtual {v8}, Ljava/net/DatagramSocket;->close()V

    .line 350
    const-string v9, "Host"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Send WOL packet to "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " with mac "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-direct {p0, v5}, Lcom/bv/wifisync/Host;->toHex([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    .end local v1           #address:[B
    .end local v4           #inetAddress:Ljava/net/InetAddress;
    .end local v7           #packet:Ljava/net/DatagramPacket;
    .end local v8           #socket:Ljava/net/DatagramSocket;
    :cond_2
    return-void

    .line 334
    .end local v6           #netInfos:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    :cond_3
    const/4 v9, -0x1

    aput-byte v9, v2, v3

    .line 333
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 337
    :cond_4
    array-length v9, v5

    invoke-static {v5, v11, v2, v3, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 336
    array-length v9, v5

    add-int/2addr v3, v9

    goto :goto_1

    .line 347
    .restart local v1       #address:[B
    .restart local v4       #inetAddress:Ljava/net/InetAddress;
    .restart local v6       #netInfos:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    .restart local v7       #packet:Ljava/net/DatagramPacket;
    .restart local v8       #socket:Ljava/net/DatagramSocket;
    :catchall_1
    move-exception v9

    .line 348
    invoke-virtual {v8}, Ljava/net/DatagramSocket;->close()V

    .line 349
    throw v9
.end method
