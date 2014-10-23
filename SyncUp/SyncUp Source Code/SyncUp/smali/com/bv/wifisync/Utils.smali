.class Lcom/bv/wifisync/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/Utils$ArpTableFullException;,
        Lcom/bv/wifisync/Utils$DeleteFileScanner;,
        Lcom/bv/wifisync/Utils$FileNameInputFilter;,
        Lcom/bv/wifisync/Utils$FileScanner;,
        Lcom/bv/wifisync/Utils$LastNotification;,
        Lcom/bv/wifisync/Utils$NetInfo;,
        Lcom/bv/wifisync/Utils$ProgressTask;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$bv$sync$ProgressNotification$ProgressAction:[I = null

.field static final SMB_TCP_PORT:I = 0x1bd

.field static final SMB_TEST_TIMEOUT:I = 0x190

.field private static final TAG:Ljava/lang/String; = "Utils"

.field static final configReadWriteLock:[Ljava/lang/Object;

.field private static imageExtensions:[Ljava/lang/String;

.field private static isDebugBuild:Ljava/lang/Boolean;

.field private static musicExtensions:[Ljava/lang/String;

.field private static tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

.field private static videoExtensions:[Ljava/lang/String;


# direct methods
.method static synthetic $SWITCH_TABLE$com$bv$sync$ProgressNotification$ProgressAction()[I
    .locals 3

    .prologue
    .line 80
    sget-object v0, Lcom/bv/wifisync/Utils;->$SWITCH_TABLE$com$bv$sync$ProgressNotification$ProgressAction:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/bv/sync/ProgressNotification$ProgressAction;->values()[Lcom/bv/sync/ProgressNotification$ProgressAction;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Connecting:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-virtual {v1}, Lcom/bv/sync/ProgressNotification$ProgressAction;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_9

    :goto_1
    :try_start_1
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Copying:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-virtual {v1}, Lcom/bv/sync/ProgressNotification$ProgressAction;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_8

    :goto_2
    :try_start_2
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Deleting:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-virtual {v1}, Lcom/bv/sync/ProgressNotification$ProgressAction;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_7

    :goto_3
    :try_start_3
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Grouping:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-virtual {v1}, Lcom/bv/sync/ProgressNotification$ProgressAction;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_6

    :goto_4
    :try_start_4
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Listing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-virtual {v1}, Lcom/bv/sync/ProgressNotification$ProgressAction;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_5

    :goto_5
    :try_start_5
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Moving:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-virtual {v1}, Lcom/bv/sync/ProgressNotification$ProgressAction;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_4

    :goto_6
    :try_start_6
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Saving:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-virtual {v1}, Lcom/bv/sync/ProgressNotification$ProgressAction;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_3

    :goto_7
    :try_start_7
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Synchronizing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-virtual {v1}, Lcom/bv/sync/ProgressNotification$ProgressAction;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_2

    :goto_8
    :try_start_8
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->TrackingDeletions:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-virtual {v1}, Lcom/bv/sync/ProgressNotification$ProgressAction;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_1

    :goto_9
    :try_start_9
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->UpdateMediaStore:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-virtual {v1}, Lcom/bv/sync/ProgressNotification$ProgressAction;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_0

    :goto_a
    sput-object v0, Lcom/bv/wifisync/Utils;->$SWITCH_TABLE$com$bv$sync$ProgressNotification$ProgressAction:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_a

    :catch_1
    move-exception v1

    goto :goto_9

    :catch_2
    move-exception v1

    goto :goto_8

    :catch_3
    move-exception v1

    goto :goto_7

    :catch_4
    move-exception v1

    goto :goto_6

    :catch_5
    move-exception v1

    goto :goto_5

    :catch_6
    move-exception v1

    goto :goto_4

    :catch_7
    move-exception v1

    goto :goto_3

    :catch_8
    move-exception v1

    goto :goto_2

    :catch_9
    move-exception v1

    goto :goto_1
.end method

.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 195
    new-array v0, v3, [Ljava/lang/Object;

    sput-object v0, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    .line 608
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, ".jpg"

    aput-object v1, v0, v3

    const-string v1, ".jpeg"

    aput-object v1, v0, v4

    const-string v1, ".png"

    aput-object v1, v0, v5

    const-string v1, ".bmp"

    aput-object v1, v0, v6

    const-string v1, ".ico"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, ".gif"

    aput-object v2, v0, v1

    sput-object v0, Lcom/bv/wifisync/Utils;->imageExtensions:[Ljava/lang/String;

    .line 609
    const/16 v0, 0xb

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, ".mpg"

    aput-object v1, v0, v3

    const-string v1, ".mpeg"

    aput-object v1, v0, v4

    const-string v1, ".avi"

    aput-object v1, v0, v5

    const-string v1, ".mov"

    aput-object v1, v0, v6

    const-string v1, ".flv"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, ".wma"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, ".wmv"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, ".3gp"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, ".mp4"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, ".m4a"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, ".aac"

    aput-object v2, v0, v1

    sput-object v0, Lcom/bv/wifisync/Utils;->videoExtensions:[Ljava/lang/String;

    .line 610
    new-array v0, v6, [Ljava/lang/String;

    const-string v1, ".mp3"

    aput-object v1, v0, v3

    const-string v1, ".mid"

    aput-object v1, v0, v4

    const-string v1, ".ogg"

    aput-object v1, v0, v5

    sput-object v0, Lcom/bv/wifisync/Utils;->musicExtensions:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 608
    sget-object v0, Lcom/bv/wifisync/Utils;->imageExtensions:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 612
    invoke-static {p0, p1}, Lcom/bv/wifisync/Utils;->endsWith(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$2()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 609
    sget-object v0, Lcom/bv/wifisync/Utils;->videoExtensions:[Ljava/lang/String;

    return-object v0
.end method

.method private static addAdress(Ljava/util/List;Ljava/net/NetworkInterface;Ljava/net/InterfaceAddress;)V
    .locals 6
    .parameter
    .parameter "netInterface"
    .parameter "address"
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/Utils$NetInfo;",
            ">;",
            "Ljava/net/NetworkInterface;",
            "Ljava/net/InterfaceAddress;",
            ")V"
        }
    .end annotation

    .prologue
    .line 370
    .local p0, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    invoke-virtual {p2}, Ljava/net/InterfaceAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v4

    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 371
    .local v1, ip:I
    invoke-virtual {p2}, Ljava/net/InterfaceAddress;->getNetworkPrefixLength()S

    move-result v2

    .line 372
    .local v2, mask:S
    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    .line 373
    new-instance v3, Lcom/bv/wifisync/Utils$NetInfo;

    invoke-virtual {p1}, Ljava/net/NetworkInterface;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1, v2}, Lcom/bv/wifisync/Utils$NetInfo;-><init>(Ljava/lang/String;II)V

    .line 374
    .local v3, netInfo:Lcom/bv/wifisync/Utils$NetInfo;
    invoke-static {v3, p0}, Lcom/bv/wifisync/Utils;->find(Lcom/bv/wifisync/Utils$NetInfo;Ljava/util/List;)Lcom/bv/wifisync/Utils$NetInfo;

    move-result-object v0

    .line 375
    .local v0, existing:Lcom/bv/wifisync/Utils$NetInfo;
    if-nez v0, :cond_1

    .line 376
    invoke-interface {p0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 380
    .end local v0           #existing:Lcom/bv/wifisync/Utils$NetInfo;
    .end local v3           #netInfo:Lcom/bv/wifisync/Utils$NetInfo;
    :cond_0
    :goto_0
    return-void

    .line 377
    .restart local v0       #existing:Lcom/bv/wifisync/Utils$NetInfo;
    .restart local v3       #netInfo:Lcom/bv/wifisync/Utils$NetInfo;
    :cond_1
    iget v4, v0, Lcom/bv/wifisync/Utils$NetInfo;->mask:I

    iget v5, v3, Lcom/bv/wifisync/Utils$NetInfo;->mask:I

    if-le v4, v5, :cond_0

    iget v4, v3, Lcom/bv/wifisync/Utils$NetInfo;->mask:I

    if-eqz v4, :cond_0

    .line 378
    iget v4, v3, Lcom/bv/wifisync/Utils$NetInfo;->mask:I

    iput v4, v0, Lcom/bv/wifisync/Utils$NetInfo;->mask:I

    goto :goto_0
.end method

.method private static addInterface(Ljava/util/List;Ljava/net/NetworkInterface;)V
    .locals 4
    .parameter
    .parameter "netInterface"
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/Utils$NetInfo;",
            ">;",
            "Ljava/net/NetworkInterface;",
            ")V"
        }
    .end annotation

    .prologue
    .line 363
    .local p0, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    invoke-virtual {p1}, Ljava/net/NetworkInterface;->getInterfaceAddresses()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 366
    return-void

    .line 363
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InterfaceAddress;

    .line 364
    .local v0, address:Ljava/net/InterfaceAddress;
    invoke-virtual {v0}, Ljava/net/InterfaceAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v2

    array-length v2, v2

    const/4 v3, 0x4

    if-ne v2, v3, :cond_0

    .line 365
    invoke-static {p0, p1, v0}, Lcom/bv/wifisync/Utils;->addAdress(Ljava/util/List;Ljava/net/NetworkInterface;Ljava/net/InterfaceAddress;)V

    goto :goto_0
.end method

.method static animate(Landroid/view/View;)V
    .locals 3
    .parameter "view"

    .prologue
    .line 152
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x7f04

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 153
    .local v0, anim:Landroid/view/animation/Animation;
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 154
    return-void
.end method

.method static checkWifi(Landroid/content/Context;)V
    .locals 2
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getForceWifi(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 143
    new-instance v0, Ljava/io/IOException;

    const v1, 0x7f06009f

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_0
    return-void
.end method

.method static concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "result"
    .parameter "value"
    .parameter "delimeter"

    .prologue
    .line 579
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method static deleteFile(Landroid/content/Context;Ljava/io/File;)V
    .locals 5
    .parameter "context"
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    const-string v0, "Utils"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Removing local file: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 263
    new-instance v0, Ljava/io/IOException;

    const v1, 0x7f060097

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 264
    :cond_0
    return-void
.end method

.method private static endsWith(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 5
    .parameter "path"
    .parameter "extensions"

    .prologue
    const/4 v1, 0x0

    .line 613
    array-length v3, p1

    move v2, v1

    :goto_0
    if-lt v2, v3, :cond_0

    .line 616
    :goto_1
    return v1

    .line 613
    :cond_0
    aget-object v0, p1, v2

    .line 614
    .local v0, ext:Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 615
    const/4 v1, 0x1

    goto :goto_1

    .line 613
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static enumerateInterfaces(Ljava/util/List;)V
    .locals 5
    .parameter
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/Utils$NetInfo;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 355
    .local p0, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    .line 356
    .local v0, interfaces:Ljava/util/Enumeration;,"Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    invoke-static {v0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 359
    return-void

    .line 356
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/NetworkInterface;

    .line 357
    .local v1, netInterface:Ljava/net/NetworkInterface;
    invoke-virtual {v1}, Ljava/net/NetworkInterface;->isUp()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Ljava/net/NetworkInterface;->isLoopback()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "rmnet0"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 358
    invoke-static {p0, v1}, Lcom/bv/wifisync/Utils;->addInterface(Ljava/util/List;Ljava/net/NetworkInterface;)V

    goto :goto_0
.end method

.method private static find(Lcom/bv/wifisync/Utils$NetInfo;Ljava/util/List;)Lcom/bv/wifisync/Utils$NetInfo;
    .locals 4
    .parameter "netInfo"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/wifisync/Utils$NetInfo;",
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/Utils$NetInfo;",
            ">;)",
            "Lcom/bv/wifisync/Utils$NetInfo;"
        }
    .end annotation

    .prologue
    .line 383
    .local p1, list:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 386
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 383
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Utils$NetInfo;

    .line 384
    .local v0, network:Lcom/bv/wifisync/Utils$NetInfo;
    iget v2, p0, Lcom/bv/wifisync/Utils$NetInfo;->ip:I

    iget v3, v0, Lcom/bv/wifisync/Utils$NetInfo;->ip:I

    if-ne v2, v3, :cond_0

    goto :goto_0
.end method

.method static getActionString(Lcom/bv/sync/ProgressNotification$ProgressAction;Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .parameter "action"
    .parameter "context"

    .prologue
    .line 493
    if-eqz p0, :cond_0

    .line 494
    invoke-static {}, Lcom/bv/wifisync/Utils;->$SWITCH_TABLE$com$bv$sync$ProgressNotification$ProgressAction()[I

    move-result-object v0

    invoke-virtual {p0}, Lcom/bv/sync/ProgressNotification$ProgressAction;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 517
    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0

    .line 496
    :pswitch_0
    const v0, 0x7f06012b

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 498
    :pswitch_1
    const v0, 0x7f06012d

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 500
    :pswitch_2
    const v0, 0x7f06012c

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 502
    :pswitch_3
    const v0, 0x7f06016e

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 504
    :pswitch_4
    const v0, 0x7f06012a

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 506
    :pswitch_5
    const v0, 0x7f06012e

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 508
    :pswitch_6
    const v0, 0x7f06010f

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 510
    :pswitch_7
    const v0, 0x7f0601a4

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 512
    :pswitch_8
    const v0, 0x7f0601b2

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 514
    :pswitch_9
    const v0, 0x7f0601a3

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 494
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_0
        :pswitch_1
        :pswitch_5
        :pswitch_3
        :pswitch_2
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method static getAppVersion(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .parameter "context"

    .prologue
    .line 484
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 485
    .local v1, packageInfo:Landroid/content/pm/PackageInfo;
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 489
    .end local v1           #packageInfo:Landroid/content/pm/PackageInfo;
    :goto_0
    return-object v2

    .line 486
    :catch_0
    move-exception v0

    .line 487
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v2, "Utils"

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 489
    const/4 v2, 0x0

    goto :goto_0
.end method

.method static getBroadcastAddress(Landroid/content/Context;)[Ljava/lang/String;
    .locals 9
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 765
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getNetInfo(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    .line 766
    .local v4, netInfos:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    new-array v5, v6, [Ljava/lang/String;

    .line 767
    .local v5, result:[Ljava/lang/String;
    const/4 v1, 0x0

    .line 768
    .local v1, i:I
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 772
    return-object v5

    .line 768
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bv/wifisync/Utils$NetInfo;

    .line 769
    .local v3, netInfo:Lcom/bv/wifisync/Utils$NetInfo;
    invoke-static {v3}, Lcom/bv/wifisync/Utils;->getBroadcastBytes(Lcom/bv/wifisync/Utils$NetInfo;)[B

    move-result-object v0

    .line 770
    .local v0, bytes:[B
    add-int/lit8 v2, v1, 0x1

    .end local v1           #i:I
    .local v2, i:I
    new-instance v7, Ljava/lang/StringBuilder;

    const/4 v8, 0x0

    aget-byte v8, v0, v8

    and-int/lit16 v8, v8, 0xff

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    aget-byte v8, v0, v8

    and-int/lit16 v8, v8, 0xff

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x2

    aget-byte v8, v0, v8

    and-int/lit16 v8, v8, 0xff

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x3

    aget-byte v8, v0, v8

    and-int/lit16 v8, v8, 0xff

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v1

    move v1, v2

    .end local v2           #i:I
    .restart local v1       #i:I
    goto :goto_0
.end method

.method static getBroadcastBytes(Lcom/bv/wifisync/Utils$NetInfo;)[B
    .locals 4
    .parameter "netInfo"

    .prologue
    .line 776
    const/4 v2, -0x1

    iget v3, p0, Lcom/bv/wifisync/Utils$NetInfo;->mask:I

    rsub-int/lit8 v3, v3, 0x20

    shl-int v0, v2, v3

    .line 777
    .local v0, netMask:I
    iget v2, p0, Lcom/bv/wifisync/Utils$NetInfo;->ip:I

    xor-int/lit8 v3, v0, -0x1

    or-int v1, v2, v3

    .line 778
    .local v1, result:I
    invoke-static {v1}, Lcom/bv/wifisync/Utils;->ipToBytes(I)[B

    move-result-object v2

    return-object v2
.end method

.method private static getCidr(I)I
    .locals 2
    .parameter "mask"

    .prologue
    .line 311
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    const/16 v1, 0x20

    if-lt v0, v1, :cond_1

    .line 314
    const/4 v0, 0x0

    .end local v0           #i:I
    :cond_0
    return v0

    .line 312
    .restart local v0       #i:I
    :cond_1
    shl-int v1, v0, v0

    and-int/2addr v1, p0

    if-eqz v1, :cond_0

    .line 311
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static getConfigBackupFile(Landroid/content/Context;)Ljava/io/File;
    .locals 3
    .parameter "context"

    .prologue
    .line 251
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "hosts.dat.bak"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getConfigFile(Landroid/content/Context;)Ljava/io/File;
    .locals 3
    .parameter "context"

    .prologue
    .line 247
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "hosts.dat"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method static getFileImage(Landroid/content/Context;Ljava/io/File;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .parameter "context"
    .parameter "file"

    .prologue
    .line 739
    :try_start_0
    invoke-static {p1}, Lcom/bv/wifisync/Utils;->getFileTypeIntent(Ljava/io/File;)Landroid/content/Intent;

    move-result-object v1

    .line 740
    .local v1, intent:Landroid/content/Intent;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 741
    .local v0, activities:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 742
    new-instance v2, Lcom/bv/wifisync/Utils$1;

    invoke-direct {v2}, Lcom/bv/wifisync/Utils$1;-><init>()V

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 748
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 751
    .end local v0           #activities:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v1           #intent:Landroid/content/Intent;
    :goto_0
    return-object v2

    .line 750
    :catch_0
    move-exception v2

    .line 751
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f020012

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_0
.end method

.method static getFileTypeIntent(Ljava/io/File;)Landroid/content/Intent;
    .locals 6
    .parameter "file"

    .prologue
    .line 755
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 756
    .local v1, intent:Landroid/content/Intent;
    const-string v3, "android.intent.action.VIEW"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 757
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v2

    .line 758
    .local v2, mime:Landroid/webkit/MimeTypeMap;
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 759
    .local v0, extention:Ljava/lang/String;
    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 760
    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v0}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 761
    return-object v1
.end method

.method static getLastNotification(Landroid/content/Context;)Lcom/bv/wifisync/Utils$LastNotification;
    .locals 7
    .parameter "context"

    .prologue
    const/4 v6, 0x0

    const/4 v2, 0x0

    .line 557
    const-string v5, "app"

    invoke-virtual {p0, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 559
    .local v3, settings:Landroid/content/SharedPreferences;
    const-string v5, "notification"

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 560
    .local v1, jobId:I
    if-eqz v1, :cond_0

    .line 561
    const-string v5, "notificationTitle"

    invoke-interface {v3, v5, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 562
    .local v4, title:Ljava/lang/String;
    const-string v5, "notificationDetails"

    invoke-interface {v3, v5, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 563
    .local v0, details:Ljava/lang/String;
    new-instance v2, Lcom/bv/wifisync/Utils$LastNotification;

    invoke-direct {v2, v4, v0, v1}, Lcom/bv/wifisync/Utils$LastNotification;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 566
    .end local v0           #details:Ljava/lang/String;
    .end local v4           #title:Ljava/lang/String;
    :cond_0
    return-object v2
.end method

.method static getNetInfo(Landroid/content/Context;)Ljava/util/List;
    .locals 9
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/Utils$NetInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 330
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 331
    .local v2, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/Utils$NetInfo;>;"
    invoke-static {}, Lcom/bv/wifisync/Utils;->isEmulator()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 333
    const v1, 0xa028a01

    .line 334
    .local v1, ip:I
    new-instance v6, Lcom/bv/wifisync/Utils$NetInfo;

    const-string v7, "Emulator"

    const/16 v8, 0x18

    invoke-direct {v6, v7, v1, v8}, Lcom/bv/wifisync/Utils$NetInfo;-><init>(Ljava/lang/String;II)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 336
    .end local v1           #ip:I
    :cond_0
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 337
    const-string v6, "wifi"

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/wifi/WifiManager;

    .line 338
    .local v5, wifiManager:Landroid/net/wifi/WifiManager;
    invoke-virtual {v5}, Landroid/net/wifi/WifiManager;->getDhcpInfo()Landroid/net/DhcpInfo;

    move-result-object v0

    .line 339
    .local v0, dhcpInfo:Landroid/net/DhcpInfo;
    iget v6, v0, Landroid/net/DhcpInfo;->ipAddress:I

    if-eqz v6, :cond_1

    iget v6, v0, Landroid/net/DhcpInfo;->netmask:I

    if-eqz v6, :cond_1

    .line 340
    new-instance v4, Lcom/bv/wifisync/Utils$NetInfo;

    const-string v6, "wlan0"

    iget v7, v0, Landroid/net/DhcpInfo;->ipAddress:I

    invoke-static {v7}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v7

    iget v8, v0, Landroid/net/DhcpInfo;->netmask:I

    invoke-static {v8}, Lcom/bv/wifisync/Utils;->getCidr(I)I

    move-result v8

    invoke-direct {v4, v6, v7, v8}, Lcom/bv/wifisync/Utils$NetInfo;-><init>(Ljava/lang/String;II)V

    .line 341
    .local v4, wifi:Lcom/bv/wifisync/Utils$NetInfo;
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 345
    .end local v0           #dhcpInfo:Landroid/net/DhcpInfo;
    .end local v4           #wifi:Lcom/bv/wifisync/Utils$NetInfo;
    .end local v5           #wifiManager:Landroid/net/wifi/WifiManager;
    :cond_1
    :try_start_0
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x9

    if-lt v6, v7, :cond_2

    .line 346
    invoke-static {v2}, Lcom/bv/wifisync/Utils;->enumerateInterfaces(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 350
    :cond_2
    :goto_0
    return-object v2

    .line 347
    :catch_0
    move-exception v3

    .line 348
    .local v3, th:Ljava/lang/Throwable;
    invoke-static {p0, v3}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static getStream(Ljava/io/File;Z)Ljava/io/OutputStream;
    .locals 4
    .parameter "file"
    .parameter "compress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 178
    .local v0, result:Ljava/io/OutputStream;
    if-eqz p1, :cond_0

    .line 179
    new-instance v1, Ljava/util/zip/ZipOutputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 180
    .local v1, zipStream:Ljava/util/zip/ZipOutputStream;
    new-instance v2, Ljava/util/zip/ZipEntry;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 183
    .end local v1           #zipStream:Ljava/util/zip/ZipOutputStream;
    :goto_0
    return-object v1

    :cond_0
    move-object v1, v0

    goto :goto_0
.end method

.method static declared-synchronized getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;
    .locals 4
    .parameter "context"

    .prologue
    .line 521
    const-class v1, Lcom/bv/wifisync/Utils;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/bv/wifisync/Utils;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    if-nez v0, :cond_1

    .line 522
    invoke-static {}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->getInstance()Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v0

    sput-object v0, Lcom/bv/wifisync/Utils;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    .line 523
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->isDebugBuild(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 524
    sget-object v0, Lcom/bv/wifisync/Utils;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->setDebug(Z)V

    .line 525
    :cond_0
    sget-object v0, Lcom/bv/wifisync/Utils;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    const-string v2, "UA-27375313-1"

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->startNewSession(Ljava/lang/String;Landroid/content/Context;)V

    .line 527
    :cond_1
    sget-object v0, Lcom/bv/wifisync/Utils;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 521
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static hasData(Ljava/util/Collection;)Z
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .line 843
    .local p0, collection:Ljava/util/Collection;,"Ljava/util/Collection<TT;>;"
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static humanReadableSize(J)Ljava/lang/String;
    .locals 13
    .parameter "bytes"

    .prologue
    const-wide/high16 v11, 0x4090

    .line 847
    const/16 v2, 0x400

    .line 848
    .local v2, unit:I
    const-wide/16 v3, 0x400

    cmp-long v3, p0, v3

    if-gez v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " B"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 851
    :goto_0
    return-object v3

    .line 849
    :cond_0
    long-to-double v3, p0

    invoke-static {v3, v4}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    invoke-static {v11, v12}, Ljava/lang/Math;->log(D)D

    move-result-wide v5

    div-double/2addr v3, v5

    double-to-int v0, v3

    .line 850
    .local v0, exp:I
    const-string v3, "KMGTPE"

    add-int/lit8 v4, v0, -0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 851
    .local v1, pre:C
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    const-string v4, "%.1f %cB"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    long-to-double v7, p0

    int-to-double v9, v0

    invoke-static {v11, v12, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v9

    div-double/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method static ipToBytes(I)[B
    .locals 3
    .parameter "ip"

    .prologue
    .line 305
    const/4 v1, 0x4

    new-array v0, v1, [B

    const/4 v1, 0x0

    shr-int/lit8 v2, p0, 0x18

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x1

    shl-int/lit8 v2, p0, 0x8

    shr-int/lit8 v2, v2, 0x18

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x2

    .line 306
    shl-int/lit8 v2, p0, 0x10

    shr-int/lit8 v2, v2, 0x18

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x3

    shl-int/lit8 v2, p0, 0x18

    shr-int/lit8 v2, v2, 0x18

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 307
    .local v0, bytes:[B
    return-object v0
.end method

.method static isDebugBuild(Landroid/content/Context;)Z
    .locals 6
    .parameter "context"

    .prologue
    const/4 v4, 0x0

    .line 456
    sget-object v3, Lcom/bv/wifisync/Utils;->isDebugBuild:Ljava/lang/Boolean;

    if-nez v3, :cond_0

    .line 457
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 459
    .local v2, pm:Landroid/content/pm/PackageManager;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 460
    .local v1, pi:Landroid/content/pm/PackageInfo;
    iget-object v3, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x2

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    :goto_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    sput-object v3, Lcom/bv/wifisync/Utils;->isDebugBuild:Ljava/lang/Boolean;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 469
    .end local v1           #pi:Landroid/content/pm/PackageInfo;
    .end local v2           #pm:Landroid/content/pm/PackageManager;
    :cond_0
    :goto_1
    sget-object v3, Lcom/bv/wifisync/Utils;->isDebugBuild:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    return v3

    .restart local v1       #pi:Landroid/content/pm/PackageInfo;
    .restart local v2       #pm:Landroid/content/pm/PackageManager;
    :cond_1
    move v3, v4

    .line 460
    goto :goto_0

    .line 463
    .end local v1           #pi:Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v0

    .line 464
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v3, "Utils"

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 465
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    sput-object v3, Lcom/bv/wifisync/Utils;->isDebugBuild:Ljava/lang/Boolean;

    goto :goto_1
.end method

.method static isDrive(Ljava/lang/String;)Z
    .locals 3
    .parameter "path"

    .prologue
    const/4 v0, 0x1

    .line 413
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->stripUrlPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 414
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x24

    if-ne v1, v2, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isEmulator()Z
    .locals 2

    .prologue
    .line 130
    const-string v0, "sdk"

    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "sdk_x86"

    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static isGeoCoderAvailable(Landroid/content/Context;)Z
    .locals 6
    .parameter "context"

    .prologue
    const/4 v2, 0x1

    .line 474
    :try_start_0
    const-string v1, "1600 Amphitheatre Parkway, Mountain View, CA"

    .line 475
    .local v1, locName:Ljava/lang/String;
    new-instance v3, Landroid/location/Geocoder;

    invoke-direct {v3, p0}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    const-string v4, "1600 Amphitheatre Parkway, Mountain View, CA"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Landroid/location/Geocoder;->getFromLocationName(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    .line 476
    .local v0, list:Ljava/util/List;,"Ljava/util/List<Landroid/location/Address;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-nez v3, :cond_0

    .line 479
    .end local v0           #list:Ljava/util/List;,"Ljava/util/List<Landroid/location/Address;>;"
    .end local v1           #locName:Ljava/lang/String;
    :goto_0
    return v2

    .line 478
    :catch_0
    move-exception v2

    .line 479
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static isMediaFile(Lcom/bv/sync/SyncItem;)Z
    .locals 2
    .parameter "item"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 621
    iget-object v1, p0, Lcom/bv/sync/SyncItem;->absolutePath:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 622
    .local v0, path:Ljava/lang/String;
    sget-object v1, Lcom/bv/wifisync/Utils;->imageExtensions:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/bv/wifisync/Utils;->endsWith(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 623
    sget-object v1, Lcom/bv/wifisync/Utils;->videoExtensions:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/bv/wifisync/Utils;->endsWith(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 624
    sget-object v1, Lcom/bv/wifisync/Utils;->musicExtensions:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/bv/wifisync/Utils;->endsWith(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 622
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method static isRootRemoteFolder(Lcom/bv/sync/IFile;)Z
    .locals 3
    .parameter "file"

    .prologue
    .line 423
    instance-of v1, p0, Lcom/bv/sync/RemoteFile;

    .line 424
    .local v1, result:Z
    if-eqz v1, :cond_0

    .line 425
    invoke-interface {p0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->stripUrlPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 426
    .local v0, path:Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x0

    .line 428
    .end local v0           #path:Ljava/lang/String;
    :cond_0
    :goto_0
    return v1

    .line 426
    .restart local v0       #path:Ljava/lang/String;
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method static isShare(Ljava/lang/String;)Z
    .locals 1
    .parameter "path"

    .prologue
    .line 418
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->stripUrlPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 419
    if-eqz p0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isWifiConnected(Landroid/content/Context;)Z
    .locals 4
    .parameter "context"

    .prologue
    const/4 v2, 0x1

    .line 134
    invoke-static {}, Lcom/bv/wifisync/Utils;->isEmulator()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 138
    :cond_0
    :goto_0
    return v2

    .line 136
    :cond_1
    const-string v3, "connectivity"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 137
    .local v0, connManager:Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v1

    .line 138
    .local v1, wifi:Landroid/net/NetworkInfo;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-nez v3, :cond_0

    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method static makeAddress(I)Ljava/net/InetAddress;
    .locals 1
    .parameter "ip"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 301
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->ipToBytes(I)[B

    move-result-object v0

    invoke-static {v0}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method static mkdirs(Landroid/content/Context;Ljava/io/File;)V
    .locals 3
    .parameter "context"
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 538
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 539
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_0

    .line 540
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const v2, 0x7f060091

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 542
    :cond_0
    return-void
.end method

.method private static needsMediaRefresh(Landroid/content/Context;Lcom/bv/sync/SyncItem;)Z
    .locals 5
    .parameter "context"
    .parameter "item"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 600
    iget-object v3, p1, Lcom/bv/sync/SyncItem;->type:Lcom/bv/sync/SyncItem$Type;

    sget-object v4, Lcom/bv/sync/SyncItem$Type;->LocalFile:Lcom/bv/sync/SyncItem$Type;

    if-eq v3, v4, :cond_2

    iget-object v3, p1, Lcom/bv/sync/SyncItem;->type:Lcom/bv/sync/SyncItem$Type;

    sget-object v4, Lcom/bv/sync/SyncItem$Type;->Deleted:Lcom/bv/sync/SyncItem$Type;

    if-eq v3, v4, :cond_2

    move v0, v2

    .line 601
    .local v0, result:Z
    :goto_0
    if-eqz v0, :cond_0

    .line 602
    iget-object v3, p1, Lcom/bv/sync/SyncItem;->absolutePath:Ljava/lang/String;

    const-string v4, "smb://"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-static {p1}, Lcom/bv/wifisync/Utils;->isMediaFile(Lcom/bv/sync/SyncItem;)Z

    move-result v3

    if-eqz v3, :cond_3

    move v0, v1

    .line 603
    :cond_0
    :goto_1
    if-eqz v0, :cond_1

    iget-object v1, p1, Lcom/bv/sync/SyncItem;->type:Lcom/bv/sync/SyncItem$Type;

    sget-object v2, Lcom/bv/sync/SyncItem$Type;->Deleted:Lcom/bv/sync/SyncItem$Type;

    if-ne v1, v2, :cond_1

    invoke-static {p0}, Lcom/bv/wifisync/Config;->getNoMediaRescan(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 604
    const/4 v0, 0x0

    .line 605
    :cond_1
    return v0

    .end local v0           #result:Z
    :cond_2
    move v0, v1

    .line 600
    goto :goto_0

    .restart local v0       #result:Z
    :cond_3
    move v0, v2

    .line 602
    goto :goto_1
.end method

.method static readConfig(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 12
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/bv/wifisync/Host;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    const/4 v6, 0x0

    .line 201
    .local v6, objectFromFile:Ljava/io/Serializable;
    sget-object v10, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v10

    .line 203
    :try_start_0
    new-instance v8, Ljava/io/ObjectInputStream;

    const-string v9, "hosts.dat"

    invoke-virtual {p0, v9}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 205
    .local v8, stream:Ljava/io/ObjectInputStream;
    :try_start_1
    invoke-virtual {v8}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v9

    move-object v0, v9

    check-cast v0, Ljava/io/Serializable;

    move-object v6, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 207
    :try_start_2
    invoke-virtual {v8}, Ljava/io/ObjectInputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 201
    :try_start_3
    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v7, v6

    .line 219
    check-cast v7, Ljava/util/ArrayList;

    .line 220
    .local v7, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Host;>;"
    if-nez v7, :cond_0

    .line 221
    new-instance v7, Ljava/util/ArrayList;

    .end local v7           #result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Host;>;"
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 222
    .restart local v7       #result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Host;>;"
    :cond_0
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_3

    .line 225
    return-object v7

    .line 206
    .end local v7           #result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Host;>;"
    :catchall_0
    move-exception v9

    .line 207
    :try_start_4
    invoke-virtual {v8}, Ljava/io/ObjectInputStream;->close()V

    .line 208
    throw v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 209
    .end local v8           #stream:Ljava/io/ObjectInputStream;
    :catch_0
    move-exception v2

    .line 210
    .local v2, e:Ljava/io/IOException;
    :try_start_5
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getConfigBackupFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 211
    .local v1, backupFile:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 212
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getConfigFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v3

    .line 213
    .local v3, file:Ljava/io/File;
    invoke-static {p0, v3}, Lcom/bv/wifisync/Utils;->deleteFile(Landroid/content/Context;Ljava/io/File;)V

    .line 214
    invoke-static {p0, v1, v3}, Lcom/bv/wifisync/Utils;->renameFile(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)V

    .line 216
    .end local v3           #file:Ljava/io/File;
    :cond_2
    throw v2

    .line 201
    .end local v1           #backupFile:Ljava/io/File;
    .end local v2           #e:Ljava/io/IOException;
    :catchall_1
    move-exception v9

    monitor-exit v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v9

    .line 222
    .restart local v7       #result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Host;>;"
    .restart local v8       #stream:Ljava/io/ObjectInputStream;
    :cond_3
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/wifisync/Host;

    .line 223
    .local v4, host:Lcom/bv/wifisync/Host;
    invoke-virtual {v4}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bv/wifisync/Job;

    .line 224
    .local v5, job:Lcom/bv/wifisync/Job;
    iput-object v4, v5, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    goto :goto_0
.end method

.method static readObjectFromFile(Ljava/io/File;Z)Ljava/io/Serializable;
    .locals 4
    .parameter "file"
    .parameter "compress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/OptionalDataException;,
            Ljava/lang/ClassNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    new-instance v2, Ljava/util/zip/ZipFile;

    invoke-direct {v2, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    .line 159
    .local v2, zipFile:Ljava/util/zip/ZipFile;
    :try_start_0
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/zip/ZipEntry;

    .line 160
    .local v0, entry:Ljava/util/zip/ZipEntry;
    new-instance v1, Ljava/io/ObjectInputStream;

    invoke-virtual {v2, v0}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 162
    .local v1, stream:Ljava/io/ObjectInputStream;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/Serializable;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 164
    :try_start_2
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 167
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V

    .line 162
    return-object v3

    .line 163
    :catchall_0
    move-exception v3

    .line 164
    :try_start_3
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->close()V

    .line 165
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 166
    .end local v0           #entry:Ljava/util/zip/ZipEntry;
    .end local v1           #stream:Ljava/io/ObjectInputStream;
    :catchall_1
    move-exception v3

    .line 167
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V

    .line 168
    throw v3
.end method

.method static refreshDeletedMedia(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V
    .locals 1
    .parameter "context"
    .parameter
    .parameter "progress"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/bv/sync/ProgressNotification;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 734
    .local p1, files:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v0, Lcom/bv/wifisync/Utils$DeleteFileScanner;

    invoke-direct {v0, p0, p1, p2}, Lcom/bv/wifisync/Utils$DeleteFileScanner;-><init>(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    invoke-virtual {v0}, Lcom/bv/wifisync/Utils$DeleteFileScanner;->run()V

    .line 735
    return-void
.end method

.method static refreshMedia(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V
    .locals 1
    .parameter "context"
    .parameter
    .parameter "progress"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/bv/sync/ProgressNotification;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 678
    .local p1, files:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v0, Lcom/bv/wifisync/Utils$FileScanner;

    invoke-direct {v0, p0, p1, p2}, Lcom/bv/wifisync/Utils$FileScanner;-><init>(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    invoke-virtual {v0}, Lcom/bv/wifisync/Utils$FileScanner;->run()V

    .line 679
    return-void
.end method

.method static renameFile(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)V
    .locals 5
    .parameter "context"
    .parameter "file"
    .parameter "newFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    const-string v0, "Utils"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Renaming local file: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 257
    new-instance v0, Ljava/io/IOException;

    const v1, 0x7f060099

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 258
    :cond_0
    return-void
.end method

.method static rmdir(Landroid/content/Context;Ljava/io/File;)V
    .locals 7
    .parameter "context"
    .parameter "dir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v3, 0x0

    .line 440
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Removing local directory: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 442
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 443
    .local v1, files:[Ljava/io/File;
    if-nez v1, :cond_0

    .line 444
    new-instance v2, Ljava/io/IOException;

    const v3, 0x7f0600a5

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 445
    :cond_0
    array-length v4, v1

    move v2, v3

    :goto_0
    if-lt v2, v4, :cond_1

    .line 450
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_4

    .line 451
    new-instance v2, Ljava/io/IOException;

    const v4, 0x7f060098

    new-array v5, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-virtual {p0, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 445
    :cond_1
    aget-object v0, v1, v2

    .line 446
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 447
    invoke-static {p0, v0}, Lcom/bv/wifisync/Utils;->rmdir(Landroid/content/Context;Ljava/io/File;)V

    .line 445
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 448
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v5

    if-nez v5, :cond_2

    .line 449
    new-instance v2, Ljava/io/IOException;

    const v4, 0x7f060097

    new-array v5, v6, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-virtual {p0, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 452
    .end local v0           #file:Ljava/io/File;
    :cond_4
    return-void
.end method

.method static setHostName(Ljava/net/InetAddress;)V
    .locals 4
    .parameter "hostAddress"

    .prologue
    .line 292
    :try_start_0
    const-class v2, Ljava/net/InetAddress;

    const-string v3, "hostName"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 293
    .local v0, field:Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 294
    const-string v2, "unknown"

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 298
    .end local v0           #field:Ljava/lang/reflect/Field;
    :goto_0
    return-void

    .line 295
    :catch_0
    move-exception v1

    .line 296
    .local v1, t:Ljava/lang/Throwable;
    const-string v2, "Utils"

    invoke-virtual {v1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method static setLastNotification(Landroid/content/Context;Lcom/bv/wifisync/Utils$LastNotification;)V
    .locals 5
    .parameter "context"
    .parameter "notification"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 570
    const-string v4, "app"

    invoke-virtual {p0, v4, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 571
    .local v1, settings:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 572
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v4, "notification"

    if-nez p1, :cond_0

    :goto_0
    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 573
    const-string v4, "notificationTitle"

    if-nez p1, :cond_1

    move-object v2, v3

    :goto_1
    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 574
    const-string v2, "notificationDetails"

    if-nez p1, :cond_2

    :goto_2
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 575
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 576
    return-void

    .line 572
    :cond_0
    iget v2, p1, Lcom/bv/wifisync/Utils$LastNotification;->jobId:I

    goto :goto_0

    .line 573
    :cond_1
    iget-object v2, p1, Lcom/bv/wifisync/Utils$LastNotification;->title:Ljava/lang/String;

    goto :goto_1

    .line 574
    :cond_2
    iget-object v3, p1, Lcom/bv/wifisync/Utils$LastNotification;->details:Ljava/lang/String;

    goto :goto_2
.end method

.method static setPostMortem(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 835
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    .line 836
    .local v0, oldHandler:Ljava/lang/Thread$UncaughtExceptionHandler;
    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/bv/wifisync/Utils$1PostMortem;

    if-nez v1, :cond_1

    .line 837
    :cond_0
    new-instance v1, Lcom/bv/wifisync/Utils$1PostMortem;

    invoke-direct {v1, v0, p0}, Lcom/bv/wifisync/Utils$1PostMortem;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;Landroid/content/Context;)V

    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 838
    const-string v1, "Utils"

    const-string v2, "Post mortem initialized"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 840
    :cond_1
    return-void
.end method

.method static smbReachable(Ljava/net/InetAddress;)Z
    .locals 5
    .parameter "address"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bv/wifisync/Utils$ArpTableFullException;
        }
    .end annotation

    .prologue
    .line 276
    :try_start_0
    new-instance v2, Ljava/net/Socket;

    invoke-direct {v2}, Ljava/net/Socket;-><init>()V

    .line 277
    .local v2, socket:Ljava/net/Socket;
    new-instance v1, Ljava/net/InetSocketAddress;

    const/16 v3, 0x1bd

    invoke-direct {v1, p0, v3}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 278
    .local v1, inetSocketAddress:Ljava/net/InetSocketAddress;
    const/16 v3, 0x190

    invoke-virtual {v2, v1, v3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 279
    invoke-virtual {v2}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 280
    const/4 v3, 0x1

    .line 286
    .end local v1           #inetSocketAddress:Ljava/net/InetSocketAddress;
    .end local v2           #socket:Ljava/net/Socket;
    :goto_0
    return v3

    .line 281
    :catch_0
    move-exception v0

    .line 282
    .local v0, e:Ljava/net/SocketException;
    invoke-virtual {v0}, Ljava/net/SocketException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const-string v4, "No buffer space available"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 283
    new-instance v3, Lcom/bv/wifisync/Utils$ArpTableFullException;

    const-string v4, "Arp table is full, waiting one minute"

    invoke-direct {v3, v4}, Lcom/bv/wifisync/Utils$ArpTableFullException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 284
    .end local v0           #e:Ljava/net/SocketException;
    :catch_1
    move-exception v3

    .line 286
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method static declared-synchronized stopTracker()V
    .locals 2

    .prologue
    .line 531
    const-class v1, Lcom/bv/wifisync/Utils;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/bv/wifisync/Utils;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    if-eqz v0, :cond_0

    .line 532
    sget-object v0, Lcom/bv/wifisync/Utils;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    invoke-virtual {v0}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->stopSession()V

    .line 533
    const/4 v0, 0x0

    sput-object v0, Lcom/bv/wifisync/Utils;->tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 535
    :cond_0
    monitor-exit v1

    return-void

    .line 531
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static stripQuotes(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "ssid"

    .prologue
    const/16 v3, 0x22

    .line 801
    const/4 v1, 0x0

    .line 803
    .local v1, start:I
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 811
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 805
    .restart local p0
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v3, :cond_2

    .line 806
    const/4 v1, 0x1

    .line 807
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v3, :cond_3

    .line 808
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .line 811
    .local v0, end:I
    :goto_1
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 810
    .end local v0           #end:I
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .restart local v0       #end:I
    goto :goto_1
.end method

.method static stripUrlPrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "path"

    .prologue
    .line 390
    const-string v2, "//"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 391
    .local v1, pos:I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 392
    const-string v2, "/"

    add-int/lit8 v3, v1, 0x3

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 394
    :cond_0
    add-int/lit8 v0, v1, 0x1

    .line 395
    .local v0, index:I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-le v0, v2, :cond_1

    .line 396
    const/4 v2, 0x0

    .line 397
    :goto_0
    return-object v2

    :cond_1
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method static toDate(Landroid/content/Context;J)Ljava/lang/String;
    .locals 2
    .parameter "context"
    .parameter "time"

    .prologue
    .line 435
    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v0

    .line 436
    .local v0, timeFormat:Ljava/text/DateFormat;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static trimText(Landroid/widget/TextView;)Ljava/lang/String;
    .locals 2
    .parameter "view"

    .prologue
    .line 147
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 148
    .local v0, text:Ljava/lang/CharSequence;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static updateMediaFiles(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V
    .locals 6
    .parameter "context"
    .parameter
    .parameter "progress"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;",
            "Lcom/bv/sync/ProgressNotification;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 583
    .local p1, result:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/bv/sync/SyncItem;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 584
    .local v0, changed:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 585
    .local v1, deleted:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    .line 593
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_1

    .line 594
    invoke-static {p0, v0, p2}, Lcom/bv/wifisync/Utils;->refreshMedia(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    .line 595
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_2

    .line 596
    invoke-static {p0, v1, p2}, Lcom/bv/wifisync/Utils;->refreshDeletedMedia(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    .line 597
    :cond_2
    return-void

    .line 585
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/sync/SyncItem;

    .line 586
    .local v2, item:Lcom/bv/sync/SyncItem;
    invoke-static {p0, v2}, Lcom/bv/wifisync/Utils;->needsMediaRefresh(Landroid/content/Context;Lcom/bv/sync/SyncItem;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 587
    iget-object v4, v2, Lcom/bv/sync/SyncItem;->type:Lcom/bv/sync/SyncItem$Type;

    sget-object v5, Lcom/bv/sync/SyncItem$Type;->Deleted:Lcom/bv/sync/SyncItem$Type;

    if-ne v4, v5, :cond_4

    .line 588
    iget-object v4, v2, Lcom/bv/sync/SyncItem;->absolutePath:Ljava/lang/String;

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 590
    :cond_4
    iget-object v4, v2, Lcom/bv/sync/SyncItem;->absolutePath:Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method static urlToPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "path"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 401
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->stripUrlPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 402
    .local v0, result:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 403
    const/4 v1, 0x0

    .line 409
    :goto_0
    return-object v1

    .line 404
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x3

    if-lt v1, v2, :cond_1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x24

    if-ne v1, v2, :cond_1

    .line 405
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 406
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_2

    .line 407
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 408
    :cond_2
    const-string v1, "/"

    const-string v2, "\\"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .line 409
    goto :goto_0
.end method

.method static writeConfig(Landroid/content/Context;Ljava/util/ArrayList;Landroid/app/backup/BackupManager;)V
    .locals 7
    .parameter "context"
    .parameter
    .parameter "backupManager"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/bv/wifisync/Host;",
            ">;",
            "Landroid/app/backup/BackupManager;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 229
    .local p1, hosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Host;>;"
    sget-object v5, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v5

    .line 230
    :try_start_0
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getConfigFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    .line 231
    .local v2, file:Ljava/io/File;
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getConfigBackupFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 232
    .local v0, backupFile:Ljava/io/File;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Utils;->deleteFile(Landroid/content/Context;Ljava/io/File;)V

    .line 233
    invoke-static {p0, v2, v0}, Lcom/bv/wifisync/Utils;->renameFile(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    :try_start_1
    const-string v4, "hosts.dat"

    const/4 v6, 0x0

    invoke-virtual {p0, v4, v6}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v3

    .line 236
    .local v3, stream:Ljava/io/FileOutputStream;
    invoke-static {v3, p1}, Lcom/bv/wifisync/Utils;->writeStream(Ljava/io/OutputStream;Ljava/io/Serializable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 229
    :try_start_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 243
    invoke-virtual {p2}, Landroid/app/backup/BackupManager;->dataChanged()V

    .line 244
    return-void

    .line 237
    .end local v3           #stream:Ljava/io/FileOutputStream;
    :catch_0
    move-exception v1

    .line 238
    .local v1, e:Ljava/io/IOException;
    :try_start_3
    invoke-static {p0, v2}, Lcom/bv/wifisync/Utils;->deleteFile(Landroid/content/Context;Ljava/io/File;)V

    .line 239
    invoke-static {p0, v0, v2}, Lcom/bv/wifisync/Utils;->renameFile(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)V

    .line 240
    throw v1

    .line 229
    .end local v0           #backupFile:Ljava/io/File;
    .end local v1           #e:Ljava/io/IOException;
    .end local v2           #file:Ljava/io/File;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v4
.end method

.method static writeObjectToFile(Ljava/io/File;Ljava/io/Serializable;Z)V
    .locals 1
    .parameter "file"
    .parameter "object"
    .parameter "compress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    invoke-static {p0, p2}, Lcom/bv/wifisync/Utils;->getStream(Ljava/io/File;Z)Ljava/io/OutputStream;

    move-result-object v0

    .line 173
    .local v0, fileStream:Ljava/io/OutputStream;
    invoke-static {v0, p1}, Lcom/bv/wifisync/Utils;->writeStream(Ljava/io/OutputStream;Ljava/io/Serializable;)V

    .line 174
    return-void
.end method

.method private static writeStream(Ljava/io/OutputStream;Ljava/io/Serializable;)V
    .locals 2
    .parameter "fileStream"
    .parameter "object"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 187
    new-instance v0, Ljava/io/ObjectOutputStream;

    invoke-direct {v0, p0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 189
    .local v0, stream:Ljava/io/ObjectOutputStream;
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    invoke-virtual {v0}, Ljava/io/ObjectOutputStream;->close()V

    .line 193
    return-void

    .line 190
    :catchall_0
    move-exception v1

    .line 191
    invoke-virtual {v0}, Ljava/io/ObjectOutputStream;->close()V

    .line 192
    throw v1
.end method
