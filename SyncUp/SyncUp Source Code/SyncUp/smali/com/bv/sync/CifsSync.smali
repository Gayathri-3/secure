.class public Lcom/bv/sync/CifsSync;
.super Ljava/lang/Object;
.source "CifsSync.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/CifsSync$DeletionTracker;,
        Lcom/bv/sync/CifsSync$Options;,
        Lcom/bv/sync/CifsSync$SyncCancellationException;,
        Lcom/bv/sync/CifsSync$SyncException;,
        Lcom/bv/sync/CifsSync$SyncStats;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$bv$sync$CifsSync$Options$Direction:[I = null

.field static final BUFFER_SIZE:I = 0x3c

.field private static final MAX_TIMEZONES:I = 0x19

.field private static final RESOLUTION_SEC:J = 0x2L

.field private static final SECOND:I = 0x3e8

.field private static final SMB_PREFIX:Ljava/lang/String; = "smb://"

.field public static final TMP_EXTENTION:Ljava/lang/String; = "_(!).(!)_tmp"


# instance fields
.field private canceled:Z

.field private currentSize:J

.field private final deletionTrackMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final fileComparator:Lcom/bv/sync/Utils$FileComparator;

.field private freeSpace:[J

.field protected leftCount:I

.field private final options:Lcom/bv/sync/CifsSync$Options;

.field private progress:Lcom/bv/sync/ProgressNotification;

.field protected rightCount:I

.field private final roots:[Lcom/bv/sync/IFile;

.field private sizeCalculator:Lcom/bv/sync/SizeCalculator;

.field private syncResult:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;"
        }
    .end annotation
.end field

.field private syncStats:Lcom/bv/sync/CifsSync$SyncStats;


# direct methods
.method static synthetic $SWITCH_TABLE$com$bv$sync$CifsSync$Options$Direction()[I
    .locals 3

    .prologue
    .line 27
    sget-object v0, Lcom/bv/sync/CifsSync;->$SWITCH_TABLE$com$bv$sync$CifsSync$Options$Direction:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/bv/sync/CifsSync$Options$Direction;->values()[Lcom/bv/sync/CifsSync$Options$Direction;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-virtual {v1}, Lcom/bv/sync/CifsSync$Options$Direction;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_4

    :goto_1
    :try_start_1
    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-virtual {v1}, Lcom/bv/sync/CifsSync$Options$Direction;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_3

    :goto_2
    :try_start_2
    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-virtual {v1}, Lcom/bv/sync/CifsSync$Options$Direction;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :goto_3
    :try_start_3
    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-virtual {v1}, Lcom/bv/sync/CifsSync$Options$Direction;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_1

    :goto_4
    :try_start_4
    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-virtual {v1}, Lcom/bv/sync/CifsSync$Options$Direction;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_0

    :goto_5
    sput-object v0, Lcom/bv/sync/CifsSync;->$SWITCH_TABLE$com$bv$sync$CifsSync$Options$Direction:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_5

    :catch_1
    move-exception v1

    goto :goto_4

    :catch_2
    move-exception v1

    goto :goto_3

    :catch_3
    move-exception v1

    goto :goto_2

    :catch_4
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V
    .locals 2
    .parameter "options"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/CifsSync$Options;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, deletionTrackMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    const/4 v1, 0x2

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-array v0, v1, [Lcom/bv/sync/IFile;

    iput-object v0, p0, Lcom/bv/sync/CifsSync;->roots:[Lcom/bv/sync/IFile;

    .line 45
    new-instance v0, Lcom/bv/sync/Utils$FileComparator;

    invoke-direct {v0}, Lcom/bv/sync/Utils$FileComparator;-><init>()V

    iput-object v0, p0, Lcom/bv/sync/CifsSync;->fileComparator:Lcom/bv/sync/Utils$FileComparator;

    .line 46
    new-array v0, v1, [J

    iput-object v0, p0, Lcom/bv/sync/CifsSync;->freeSpace:[J

    .line 107
    iput-object p1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    .line 108
    iput-object p2, p0, Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;

    .line 109
    new-instance v0, Lcom/bv/sync/CifsSync$SyncStats;

    invoke-direct {v0}, Lcom/bv/sync/CifsSync$SyncStats;-><init>()V

    iput-object v0, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    .line 110
    const/4 v0, 0x0

    sput v0, Lcom/bv/sync/RemoteFile;->totalRetryCount:I

    .line 111
    return-void
.end method

.method static synthetic access$0(Lcom/bv/sync/CifsSync;)Lcom/bv/sync/CifsSync$Options;
    .locals 1
    .parameter

    .prologue
    .line 42
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    return-object v0
.end method

.method static synthetic access$1(Lcom/bv/sync/CifsSync;)[Lcom/bv/sync/IFile;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->roots:[Lcom/bv/sync/IFile;

    return-object v0
.end method

.method static synthetic access$10(Lcom/bv/sync/CifsSync;)Lcom/bv/sync/Utils$FileComparator;
    .locals 1
    .parameter

    .prologue
    .line 45
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->fileComparator:Lcom/bv/sync/Utils$FileComparator;

    return-object v0
.end method

.method static synthetic access$2(Lcom/bv/sync/CifsSync;Lcom/bv/sync/IFile;)Z
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 312
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->isSyncable(Lcom/bv/sync/IFile;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$3(Lcom/bv/sync/CifsSync;Lcom/bv/sync/IFile;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 560
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->getRelativePath(Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/sync/CifsSync;)Ljava/util/Map;
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$5(Lcom/bv/sync/CifsSync;)Lcom/bv/sync/ProgressNotification;
    .locals 1
    .parameter

    .prologue
    .line 33
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->progress:Lcom/bv/sync/ProgressNotification;

    return-object v0
.end method

.method static synthetic access$6(Lcom/bv/sync/CifsSync;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 36
    iput-boolean p1, p0, Lcom/bv/sync/CifsSync;->canceled:Z

    return-void
.end method

.method static synthetic access$7(Lcom/bv/sync/CifsSync;)Z
    .locals 1
    .parameter

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/bv/sync/CifsSync;->canceled:Z

    return v0
.end method

.method static synthetic access$8(Lcom/bv/sync/CifsSync;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 37
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$9(Lcom/bv/sync/CifsSync;Lcom/bv/sync/IFile;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 400
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->deleteTempFile(Lcom/bv/sync/IFile;)V

    return-void
.end method

.method private calcSize(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 5
    .parameter "first"
    .parameter "second"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 235
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v0, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v0, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v0, v1, :cond_1

    .line 236
    :cond_0
    new-instance v0, Lcom/bv/sync/SizeCalculator;

    iget-object v1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v1, v1, Lcom/bv/sync/CifsSync$Options;->filters:[Lcom/bv/sync/IFileFilter;

    new-array v2, v4, [Lcom/bv/sync/IFile;

    aput-object p2, v2, v3

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/SizeCalculator;-><init>([Lcom/bv/sync/IFileFilter;[Lcom/bv/sync/IFile;)V

    iput-object v0, p0, Lcom/bv/sync/CifsSync;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    .line 243
    :goto_0
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v0}, Lcom/bv/sync/SizeCalculator;->start()V

    .line 244
    return-void

    .line 237
    :cond_1
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v0, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v0, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v0, v1, :cond_3

    .line 238
    :cond_2
    new-instance v0, Lcom/bv/sync/SizeCalculator;

    iget-object v1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v1, v1, Lcom/bv/sync/CifsSync$Options;->filters:[Lcom/bv/sync/IFileFilter;

    new-array v2, v4, [Lcom/bv/sync/IFile;

    aput-object p1, v2, v3

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/SizeCalculator;-><init>([Lcom/bv/sync/IFileFilter;[Lcom/bv/sync/IFile;)V

    iput-object v0, p0, Lcom/bv/sync/CifsSync;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    goto :goto_0

    .line 239
    :cond_3
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v0, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v0, v1, :cond_4

    .line 240
    new-instance v0, Lcom/bv/sync/SizeCalculator;

    iget-object v1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v1, v1, Lcom/bv/sync/CifsSync$Options;->filters:[Lcom/bv/sync/IFileFilter;

    const/4 v2, 0x2

    new-array v2, v2, [Lcom/bv/sync/IFile;

    aput-object p1, v2, v3

    aput-object p2, v2, v4

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/SizeCalculator;-><init>([Lcom/bv/sync/IFileFilter;[Lcom/bv/sync/IFile;)V

    iput-object v0, p0, Lcom/bv/sync/CifsSync;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    goto :goto_0

    .line 242
    :cond_4
    new-instance v0, Ljava/lang/EnumConstantNotPresentException;

    const-class v1, Lcom/bv/sync/CifsSync$Options$Direction;

    iget-object v2, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v2, v2, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-virtual {v2}, Lcom/bv/sync/CifsSync$Options$Direction;->name()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/lang/EnumConstantNotPresentException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    throw v0
.end method

.method private checkFreeSpace(Lcom/bv/sync/IFile;)V
    .locals 6
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 671
    iget-object v2, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-wide v2, v2, Lcom/bv/sync/CifsSync$Options;->minFreeSpace:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    .line 672
    instance-of v2, p1, Lcom/bv/sync/LocalFile;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/bv/sync/CifsSync;->freeSpace:[J

    const/4 v3, 0x0

    aget-wide v0, v2, v3

    .line 673
    .local v0, diskFree:J
    :goto_0
    iget-object v2, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-wide v2, v2, Lcom/bv/sync/CifsSync$Options;->minFreeSpace:J

    cmp-long v2, v0, v2

    if-gez v2, :cond_1

    .line 674
    new-instance v2, Lcom/bv/sync/ErrorCodeException;

    const/16 v3, 0x8

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/bv/sync/ErrorCodeException;-><init>(ILjava/lang/String;)V

    throw v2

    .line 672
    .end local v0           #diskFree:J
    :cond_0
    iget-object v2, p0, Lcom/bv/sync/CifsSync;->freeSpace:[J

    const/4 v3, 0x1

    aget-wide v0, v2, v3

    goto :goto_0

    .line 676
    :cond_1
    return-void
.end method

.method private compare(JJ)J
    .locals 13
    .parameter "leftModified"
    .parameter "rightModified"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 474
    const/16 v0, 0xe10

    .line 476
    .local v0, HOUR:I
    const-wide/16 v9, 0x3e8

    div-long v9, p1, v9

    const-wide/16 v11, 0x3e8

    div-long v11, p3, v11

    sub-long v5, v9, v11

    .line 477
    .local v5, result:J
    const-wide/16 v9, 0x0

    cmp-long v9, v5, v9

    if-ltz v9, :cond_1

    move-wide v1, v5

    .line 478
    .local v1, absoluteDiff:J
    :goto_0
    const-wide/16 v9, 0x2

    cmp-long v9, v1, v9

    if-gtz v9, :cond_2

    .line 479
    const-wide/16 v5, 0x0

    .line 494
    :cond_0
    :goto_1
    return-wide v5

    .line 477
    .end local v1           #absoluteDiff:J
    :cond_1
    neg-long v1, v5

    goto :goto_0

    .line 480
    .restart local v1       #absoluteDiff:J
    :cond_2
    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->verifyTimeZone:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->None:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    if-eq v9, v10, :cond_0

    .line 481
    const-wide/16 v9, 0xe10

    rem-long v7, v1, v9

    .line 482
    .local v7, secs:J
    const-wide/16 v9, 0x2

    cmp-long v9, v7, v9

    if-gtz v9, :cond_0

    .line 483
    sub-long/2addr v1, v7

    .line 484
    const-wide/16 v9, 0xe10

    div-long v3, v1, v9

    .line 485
    .local v3, diffHours:J
    const-wide/16 v9, 0x19

    cmp-long v9, v3, v9

    if-gtz v9, :cond_0

    .line 486
    iget-object v9, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$SyncStats;->timeZoneConflicts:[I

    long-to-int v10, v3

    add-int/lit8 v10, v10, -0x1

    aget v11, v9, v10

    add-int/lit8 v11, v11, 0x1

    aput v11, v9, v10

    .line 487
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Android bug or Time zone change detected: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 488
    const-wide/16 v9, 0x1

    cmp-long v9, v3, v9

    if-nez v9, :cond_3

    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->verifyTimeZone:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    if-eq v9, v10, :cond_4

    .line 489
    :cond_3
    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->verifyTimeZone:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->All:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    if-ne v9, v10, :cond_0

    .line 490
    :cond_4
    const-wide/16 v5, 0x0

    goto :goto_1
.end method

.method private compare(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)J
    .locals 8
    .parameter "leftFile"
    .parameter "rightFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 433
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->exists(Lcom/bv/sync/IFile;)Z

    move-result v0

    .line 434
    .local v0, leftExists:Z
    invoke-direct {p0, p2}, Lcom/bv/sync/CifsSync;->exists(Lcom/bv/sync/IFile;)Z

    move-result v3

    .line 437
    .local v3, rightExists:Z
    if-eqz v0, :cond_1

    if-eqz v3, :cond_1

    .line 438
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/CifsSync;->compareTimes(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)J

    move-result-wide v1

    .line 439
    .local v1, result:J
    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-eqz v4, :cond_0

    .line 440
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Syncing "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 441
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Local modified: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", remote modified: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 452
    :cond_0
    :goto_0
    return-wide v1

    .line 443
    .end local v1           #result:J
    :cond_1
    if-eqz v0, :cond_2

    .line 444
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "File was deleted during sync "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 445
    const-wide/16 v1, 0x1

    .line 446
    .restart local v1       #result:J
    goto :goto_0

    .end local v1           #result:J
    :cond_2
    if-eqz v3, :cond_3

    .line 447
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "File was deleted during sync "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 448
    const-wide/16 v1, -0x1

    .line 449
    .restart local v1       #result:J
    goto :goto_0

    .line 450
    .end local v1           #result:J
    :cond_3
    new-instance v4, Ljava/io/FileNotFoundException;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private compareTimes(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)J
    .locals 8
    .parameter "leftFile"
    .parameter "rightFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 456
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v0

    .line 457
    .local v0, leftModified:J
    invoke-interface {p2}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    .line 458
    .local v2, rightModified:J
    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v4

    invoke-interface {p2}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-eqz v4, :cond_0

    .line 459
    sub-long v4, v0, v2

    .line 460
    :goto_0
    return-wide v4

    :cond_0
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/bv/sync/CifsSync;->compare(JJ)J

    move-result-wide v4

    goto :goto_0
.end method

.method private copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 5
    .parameter "source"
    .parameter "dest"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 510
    :try_start_0
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->isSyncable(Lcom/bv/sync/IFile;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0, p2}, Lcom/bv/sync/CifsSync;->isSyncable(Lcom/bv/sync/IFile;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 511
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 512
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/CifsSync;->copyDir(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Lcom/bv/sync/IFile;

    .line 521
    :cond_0
    :goto_0
    return-void

    .line 514
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/CifsSync;->copyFile(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Lcom/bv/sync/IFile;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 516
    :catch_0
    move-exception v0

    .line 517
    .local v0, e:Ljava/io/IOException;
    instance-of v1, v0, Lcom/bv/sync/CifsSync$SyncException;

    if-eqz v1, :cond_2

    .line 518
    throw v0

    .line 519
    :cond_2
    new-instance v1, Lcom/bv/sync/CifsSync$SyncException;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    invoke-direct {v1, v2, v3, v4, v0}, Lcom/bv/sync/CifsSync$SyncException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/io/IOException;)V

    throw v1
.end method

.method private copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V
    .locals 11
    .parameter "file"
    .parameter "targetDir"
    .parameter "fromLeft"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 287
    if-eqz p3, :cond_5

    move v1, v7

    .line 289
    .local v1, fromRight:Z
    :goto_0
    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v9, v10, :cond_6

    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v9, v10, :cond_6

    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v9, v10, :cond_6

    move v2, v7

    .line 290
    .local v2, leftIsWritable:Z
    :goto_1
    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v9, v10, :cond_7

    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v9, v10, :cond_7

    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v9, v10, :cond_7

    move v4, v7

    .line 292
    .local v4, rightIsWritable:Z
    :goto_2
    if-eqz p3, :cond_0

    if-nez v4, :cond_8

    :cond_0
    if-eqz v1, :cond_1

    if-nez v2, :cond_8

    :cond_1
    move v6, v7

    .line 293
    .local v6, targetIsWritable:Z
    :goto_3
    if-eqz p3, :cond_2

    if-nez v2, :cond_9

    :cond_2
    if-eqz v1, :cond_3

    if-nez v4, :cond_9

    :cond_3
    move v5, v7

    .line 295
    .local v5, sourceIsWritable:Z
    :goto_4
    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v9, v10, :cond_a

    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v9, v10, :cond_a

    move v3, v7

    .line 296
    .local v3, moveOption:Z
    :goto_5
    if-eqz v5, :cond_b

    if-nez v3, :cond_b

    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->isDeleted(Lcom/bv/sync/IFile;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 297
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->delete(Lcom/bv/sync/IFile;)Z

    .line 305
    :cond_4
    :goto_6
    return-void

    .end local v1           #fromRight:Z
    .end local v2           #leftIsWritable:Z
    .end local v3           #moveOption:Z
    .end local v4           #rightIsWritable:Z
    .end local v5           #sourceIsWritable:Z
    .end local v6           #targetIsWritable:Z
    :cond_5
    move v1, v8

    .line 287
    goto :goto_0

    .restart local v1       #fromRight:Z
    :cond_6
    move v2, v8

    .line 289
    goto :goto_1

    .restart local v2       #leftIsWritable:Z
    :cond_7
    move v4, v8

    .line 290
    goto :goto_2

    .restart local v4       #rightIsWritable:Z
    :cond_8
    move v6, v8

    .line 292
    goto :goto_3

    .restart local v6       #targetIsWritable:Z
    :cond_9
    move v5, v8

    .line 293
    goto :goto_4

    .restart local v5       #sourceIsWritable:Z
    :cond_a
    move v3, v8

    .line 295
    goto :goto_5

    .line 298
    .restart local v3       #moveOption:Z
    :cond_b
    if-eqz v6, :cond_4

    .line 299
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/CifsSync;->copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 300
    if-eqz p3, :cond_c

    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v9, v10, :cond_e

    .line 301
    :cond_c
    if-eqz v1, :cond_d

    iget-object v9, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v9, v9, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v10, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v9, v10, :cond_e

    :cond_d
    move v0, v7

    .line 302
    .local v0, deleteSource:Z
    :goto_7
    if-eqz v0, :cond_4

    .line 303
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->delete(Lcom/bv/sync/IFile;)Z

    goto :goto_6

    .end local v0           #deleteSource:Z
    :cond_e
    move v0, v8

    .line 300
    goto :goto_7
.end method

.method private copyBytes(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 13
    .parameter "source"
    .parameter "destination"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v11, 0x3e8

    const/high16 v10, 0x4480

    .line 717
    const v5, 0xf000

    new-array v0, v5, [B

    .line 718
    .local v0, buffer:[B
    const/4 v1, 0x0

    .line 719
    .local v1, finished:Z
    invoke-interface {p2}, Lcom/bv/sync/IFile;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    .line 721
    .local v3, out:Ljava/io/OutputStream;
    :try_start_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v2

    .line 724
    .local v2, in:Ljava/io/InputStream;
    :goto_0
    :try_start_1
    invoke-direct {p0, v0, v2}, Lcom/bv/sync/CifsSync;->read([BLjava/io/InputStream;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    .local v4, size:I
    const/4 v5, -0x1

    if-ne v4, v5, :cond_1

    .line 729
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 731
    const/4 v1, 0x1

    .line 733
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 734
    if-nez v1, :cond_0

    .line 735
    invoke-interface {p2}, Lcom/bv/sync/IFile;->delete()V

    .line 737
    :cond_0
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Write speed KB/sec: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v7, v7, Lcom/bv/sync/CifsSync$SyncStats;->writeBytes:J

    long-to-float v7, v7

    div-float/2addr v7, v10

    iget-object v8, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v8, v8, Lcom/bv/sync/CifsSync$SyncStats;->writeTime:J

    div-long/2addr v8, v11

    long-to-float v8, v8

    div-float/2addr v7, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 738
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Read speed KB/sec: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v7, v7, Lcom/bv/sync/CifsSync$SyncStats;->readBytes:J

    long-to-float v7, v7

    div-float/2addr v7, v10

    iget-object v8, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v8, v8, Lcom/bv/sync/CifsSync$SyncStats;->readTime:J

    div-long/2addr v8, v11

    long-to-float v8, v8

    div-float/2addr v7, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 739
    return-void

    .line 725
    :cond_1
    :try_start_3
    invoke-direct {p0, v0, v3, v4}, Lcom/bv/sync/CifsSync;->write([BLjava/io/OutputStream;I)V

    .line 726
    sget-object v5, Lcom/bv/sync/ProgressNotification$ProgressAction;->Synchronizing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    int-to-long v6, v4

    invoke-direct {p0, v5, v6, v7, p1}, Lcom/bv/sync/CifsSync;->updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;JLcom/bv/sync/IFile;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 728
    .end local v4           #size:I
    :catchall_0
    move-exception v5

    .line 729
    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 730
    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 732
    .end local v2           #in:Ljava/io/InputStream;
    :catchall_1
    move-exception v5

    .line 733
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 734
    if-nez v1, :cond_2

    .line 735
    invoke-interface {p2}, Lcom/bv/sync/IFile;->delete()V

    .line 736
    :cond_2
    throw v5
.end method

.method private copyDir(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Lcom/bv/sync/IFile;
    .locals 6
    .parameter "file"
    .parameter "parent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 604
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v3}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v2

    .line 605
    .local v2, result:Lcom/bv/sync/IFile;
    invoke-interface {v2}, Lcom/bv/sync/IFile;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 606
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Creating dir: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 607
    invoke-interface {v2}, Lcom/bv/sync/IFile;->mkdir()V

    .line 608
    sget-object v3, Lcom/bv/sync/ProgressNotification$ProgressAction;->Synchronizing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-wide/16 v4, 0x0

    invoke-direct {p0, v3, v4, v5, v2}, Lcom/bv/sync/CifsSync;->updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;JLcom/bv/sync/IFile;)V

    .line 609
    invoke-direct {p0, v2}, Lcom/bv/sync/CifsSync;->trackCopyDir(Lcom/bv/sync/IFile;)V

    .line 611
    :cond_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v1

    .line 612
    .local v1, files:[Lcom/bv/sync/IFile;
    instance-of v3, p1, Lcom/bv/sync/LocalFile;

    if-eqz v3, :cond_1

    .line 613
    iget v3, p0, Lcom/bv/sync/CifsSync;->leftCount:I

    array-length v4, v1

    add-int/2addr v3, v4

    iput v3, p0, Lcom/bv/sync/CifsSync;->leftCount:I

    .line 617
    :goto_0
    array-length v4, v1

    const/4 v3, 0x0

    :goto_1
    if-lt v3, v4, :cond_2

    .line 619
    return-object v2

    .line 615
    :cond_1
    iget v3, p0, Lcom/bv/sync/CifsSync;->rightCount:I

    array-length v4, v1

    add-int/2addr v3, v4

    iput v3, p0, Lcom/bv/sync/CifsSync;->rightCount:I

    goto :goto_0

    .line 617
    :cond_2
    aget-object v0, v1, v3

    .line 618
    .local v0, child:Lcom/bv/sync/IFile;
    invoke-direct {p0, v0, v2}, Lcom/bv/sync/CifsSync;->copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 617
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method private copyFile(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Lcom/bv/sync/IFile;
    .locals 10
    .parameter "file"
    .parameter "destination"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 637
    invoke-direct {p0, p2}, Lcom/bv/sync/CifsSync;->checkFreeSpace(Lcom/bv/sync/IFile;)V

    .line 638
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "_(!).(!)_tmp"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p2, v6}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v5

    .line 640
    .local v5, tmpFile:Lcom/bv/sync/IFile;
    :try_start_0
    invoke-direct {p0, p1, v5}, Lcom/bv/sync/CifsSync;->copyBytes(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    .line 648
    :goto_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p2, v6}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v4

    .line 649
    .local v4, result:Lcom/bv/sync/IFile;
    invoke-interface {v4}, Lcom/bv/sync/IFile;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 650
    invoke-interface {v4}, Lcom/bv/sync/IFile;->delete()V

    .line 651
    :cond_0
    invoke-interface {v5, v4}, Lcom/bv/sync/IFile;->renameTo(Lcom/bv/sync/IFile;)V

    .line 652
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    .line 653
    .local v2, lastModified:J
    const-wide/16 v6, 0x0

    cmp-long v6, v2, v6

    if-gez v6, :cond_2

    .line 654
    new-instance v6, Lcom/bv/sync/ErrorCodeException;

    const/4 v7, 0x7

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lcom/bv/sync/ErrorCodeException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 641
    .end local v2           #lastModified:J
    .end local v4           #result:Lcom/bv/sync/IFile;
    :catch_0
    move-exception v0

    .line 642
    .local v0, e:Ljcifs/smb/SmbException;
    invoke-virtual {v0}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v6

    const v7, -0x3ffffff8

    if-eq v6, v7, :cond_1

    .line 643
    throw v0

    .line 644
    :cond_1
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v7, "Retrying copy file on invalid handle"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 645
    invoke-direct {p0, p1, v5}, Lcom/bv/sync/CifsSync;->copyBytes(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    goto :goto_0

    .line 656
    .end local v0           #e:Ljcifs/smb/SmbException;
    .restart local v2       #lastModified:J
    .restart local v4       #result:Lcom/bv/sync/IFile;
    :cond_2
    :try_start_1
    invoke-interface {v4, v2, v3}, Lcom/bv/sync/IFile;->setLastModified(J)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 665
    :cond_3
    :goto_1
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Created file:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v4}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", setting modified: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v4}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 666
    invoke-direct {p0, v4}, Lcom/bv/sync/CifsSync;->trackCopyFile(Lcom/bv/sync/IFile;)V

    .line 667
    return-object v4

    .line 657
    :catch_1
    move-exception v0

    .line 659
    .local v0, e:Ljava/io/IOException;
    :try_start_2
    invoke-interface {v4}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v6

    invoke-interface {p1, v6, v7}, Lcom/bv/sync/IFile;->setLastModified(J)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 660
    :catch_2
    move-exception v1

    .line 661
    .local v1, e1:Ljava/io/IOException;
    iget-object v6, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v6, v6, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v7, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v6, v7, :cond_3

    iget-object v6, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v6, v6, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v7, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v6, v7, :cond_3

    .line 662
    throw v1
.end method

.method private delete(Lcom/bv/sync/IFile;)Z
    .locals 1
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 524
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->isSyncable(Lcom/bv/sync/IFile;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 525
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->internalDelete(Lcom/bv/sync/IFile;)Z

    move-result v0

    .line 526
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private deleteTempFile(Lcom/bv/sync/IFile;)V
    .locals 4
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 402
    :try_start_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->delete()V
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    .line 409
    :goto_0
    return-void

    .line 403
    :catch_0
    move-exception v0

    .line 404
    .local v0, e:Ljcifs/smb/SmbException;
    invoke-virtual {v0}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v1

    const v2, -0x3fffffbd

    if-eq v1, v2, :cond_0

    .line 405
    throw v0

    .line 407
    :cond_0
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Got locked temp file: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private exists(Lcom/bv/sync/IFile;)Z
    .locals 6
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 465
    :try_start_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    const/4 v1, 0x1

    .line 468
    :cond_0
    return v1

    .line 466
    :catch_0
    move-exception v0

    .line 467
    .local v0, e:Ljcifs/smb/SmbException;
    invoke-virtual {v0}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v2

    const v3, -0x3ffffddb

    if-eq v2, v3, :cond_0

    .line 469
    throw v0
.end method

.method private getRelativePath(Lcom/bv/sync/IFile;)Ljava/lang/String;
    .locals 7
    .parameter "file"

    .prologue
    .line 561
    const/4 v2, 0x0

    .line 562
    .local v2, result:Ljava/lang/String;
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/bv/sync/CifsSync;->normalizePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 563
    .local v1, path:Ljava/lang/String;
    iget-object v4, p0, Lcom/bv/sync/CifsSync;->roots:[Lcom/bv/sync/IFile;

    array-length v5, v4

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v5, :cond_1

    .line 566
    :cond_0
    return-object v2

    .line 563
    :cond_1
    aget-object v0, v4, v3

    .line 564
    .local v0, parent:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/bv/sync/CifsSync;->normalizePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Lcom/bv/sync/CifsSync;->getRelativePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 563
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public static getRelativePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "path"
    .parameter "parentPath"

    .prologue
    const/16 v5, 0x2f

    .line 570
    const/16 v0, 0x2f

    .line 571
    .local v0, SEPARATOR:C
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 573
    .local v2, trailingChar:C
    if-eq v2, v5, :cond_0

    .line 574
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 575
    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 576
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 577
    .local v1, result:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 578
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 579
    if-ne v2, v5, :cond_1

    .line 580
    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 582
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 584
    .end local v1           #result:Ljava/lang/String;
    :goto_0
    return-object v3

    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private internalDelete(Lcom/bv/sync/IFile;)Z
    .locals 13
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 530
    const/4 v12, 0x1

    .line 531
    .local v12, result:Z
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v7

    .line 532
    .local v7, isDirectory:Z
    if-eqz v7, :cond_0

    .line 533
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v8

    .line 534
    .local v8, files:[Lcom/bv/sync/IFile;
    instance-of v1, p1, Lcom/bv/sync/LocalFile;

    if-eqz v1, :cond_3

    .line 535
    iget v1, p0, Lcom/bv/sync/CifsSync;->leftCount:I

    array-length v2, v8

    add-int/2addr v1, v2

    iput v1, p0, Lcom/bv/sync/CifsSync;->leftCount:I

    .line 538
    :goto_0
    const/4 v9, 0x0

    .local v9, i:I
    :goto_1
    iget-boolean v1, p0, Lcom/bv/sync/CifsSync;->canceled:Z

    if-nez v1, :cond_0

    array-length v1, v8

    if-lt v9, v1, :cond_4

    .line 541
    .end local v8           #files:[Lcom/bv/sync/IFile;
    .end local v9           #i:I
    :cond_0
    iget-boolean v1, p0, Lcom/bv/sync/CifsSync;->canceled:Z

    if-nez v1, :cond_2

    if-eqz v12, :cond_2

    .line 542
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Removing: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 543
    sget-object v4, Lcom/bv/sync/SyncItem$Type;->Deleted:Lcom/bv/sync/SyncItem$Type;

    .line 544
    .local v4, type:Lcom/bv/sync/SyncItem$Type;
    new-instance v0, Lcom/bv/sync/SyncItem;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v5

    invoke-direct/range {v0 .. v7}, Lcom/bv/sync/SyncItem;-><init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JZ)V

    .line 545
    .local v0, syncItem:Lcom/bv/sync/SyncItem;
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->getRelativePath(Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v11

    .line 546
    .local v11, relativePath:Ljava/lang/String;
    invoke-interface {p1}, Lcom/bv/sync/IFile;->delete()V

    .line 548
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-wide v1, v1, Lcom/bv/sync/CifsSync$Options;->minFreeSpace:J

    const-wide/16 v5, 0x0

    cmp-long v1, v1, v5

    if-eqz v1, :cond_1

    .line 549
    instance-of v1, p1, Lcom/bv/sync/LocalFile;

    if-eqz v1, :cond_5

    const/4 v10, 0x0

    .line 550
    .local v10, index:I
    :goto_2
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->freeSpace:[J

    aget-wide v2, v1, v10

    iget-wide v5, v0, Lcom/bv/sync/SyncItem;->size:J

    add-long/2addr v2, v5

    aput-wide v2, v1, v10

    .line 553
    .end local v10           #index:I
    :cond_1
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 554
    invoke-direct {p0, p1, v11}, Lcom/bv/sync/CifsSync;->trackDelete(Lcom/bv/sync/IFile;Ljava/lang/String;)V

    .line 555
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Synchronizing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    const-wide/16 v2, 0x0

    invoke-direct {p0, v1, v2, v3, p1}, Lcom/bv/sync/CifsSync;->updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;JLcom/bv/sync/IFile;)V

    .line 557
    .end local v0           #syncItem:Lcom/bv/sync/SyncItem;
    .end local v4           #type:Lcom/bv/sync/SyncItem$Type;
    .end local v11           #relativePath:Ljava/lang/String;
    :cond_2
    return v12

    .line 537
    .restart local v8       #files:[Lcom/bv/sync/IFile;
    :cond_3
    iget v1, p0, Lcom/bv/sync/CifsSync;->rightCount:I

    array-length v2, v8

    add-int/2addr v1, v2

    iput v1, p0, Lcom/bv/sync/CifsSync;->rightCount:I

    goto :goto_0

    .line 539
    .restart local v9       #i:I
    :cond_4
    aget-object v1, v8, v9

    invoke-direct {p0, v1}, Lcom/bv/sync/CifsSync;->delete(Lcom/bv/sync/IFile;)Z

    move-result v1

    and-int/2addr v12, v1

    .line 538
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 549
    .end local v8           #files:[Lcom/bv/sync/IFile;
    .end local v9           #i:I
    .restart local v0       #syncItem:Lcom/bv/sync/SyncItem;
    .restart local v4       #type:Lcom/bv/sync/SyncItem$Type;
    .restart local v11       #relativePath:Ljava/lang/String;
    :cond_5
    const/4 v10, 0x1

    goto :goto_2
.end method

.method private internalSyncDirs(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 13
    .parameter "leftDir"
    .parameter "rightDir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    const/4 v10, 0x0

    .line 325
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->normalize(Lcom/bv/sync/IFile;)[Lcom/bv/sync/IFile;

    move-result-object v4

    .line 326
    .local v4, leftFiles:[Lcom/bv/sync/IFile;
    invoke-direct {p0, p2}, Lcom/bv/sync/CifsSync;->normalize(Lcom/bv/sync/IFile;)[Lcom/bv/sync/IFile;

    move-result-object v7

    .line 328
    .local v7, rightFiles:[Lcom/bv/sync/IFile;
    iget v8, p0, Lcom/bv/sync/CifsSync;->leftCount:I

    array-length v9, v4

    add-int/2addr v8, v9

    iput v8, p0, Lcom/bv/sync/CifsSync;->leftCount:I

    .line 329
    iget v8, p0, Lcom/bv/sync/CifsSync;->rightCount:I

    array-length v9, v7

    add-int/2addr v8, v9

    iput v8, p0, Lcom/bv/sync/CifsSync;->rightCount:I

    .line 330
    const/4 v0, 0x0

    .local v0, i:I
    const/4 v1, 0x0

    .line 331
    .local v1, j:I
    :goto_0
    array-length v8, v4

    if-ge v0, v8, :cond_0

    array-length v8, v7

    if-lt v1, v8, :cond_1

    .line 352
    :cond_0
    move v2, v0

    .local v2, k:I
    :goto_1
    array-length v8, v4

    if-lt v2, v8, :cond_4

    .line 356
    move v2, v1

    :goto_2
    array-length v8, v7

    if-lt v2, v8, :cond_5

    .line 360
    return-void

    .line 332
    .end local v2           #k:I
    :cond_1
    aget-object v3, v4, v0

    .line 333
    .local v3, leftChild:Lcom/bv/sync/IFile;
    aget-object v6, v7, v1

    .line 335
    .local v6, rightChild:Lcom/bv/sync/IFile;
    iget-object v8, p0, Lcom/bv/sync/CifsSync;->fileComparator:Lcom/bv/sync/Utils$FileComparator;

    invoke-virtual {v8, v3, v6}, Lcom/bv/sync/Utils$FileComparator;->compare(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)I

    move-result v5

    .line 336
    .local v5, res:I
    if-gez v5, :cond_2

    .line 337
    invoke-direct {p0, v3, p2, v12}, Lcom/bv/sync/CifsSync;->copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V

    .line 338
    aput-object v10, v4, v0

    .line 339
    add-int/lit8 v0, v0, 0x1

    .line 340
    goto :goto_0

    :cond_2
    if-lez v5, :cond_3

    .line 341
    invoke-direct {p0, v6, p1, v11}, Lcom/bv/sync/CifsSync;->copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V

    .line 342
    aput-object v10, v7, v1

    .line 343
    add-int/lit8 v1, v1, 0x1

    .line 344
    goto :goto_0

    .line 345
    :cond_3
    invoke-direct {p0, v3, v6}, Lcom/bv/sync/CifsSync;->sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 346
    aput-object v10, v7, v1

    aput-object v10, v4, v0

    .line 347
    add-int/lit8 v0, v0, 0x1

    .line 348
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 353
    .end local v3           #leftChild:Lcom/bv/sync/IFile;
    .end local v5           #res:I
    .end local v6           #rightChild:Lcom/bv/sync/IFile;
    .restart local v2       #k:I
    :cond_4
    aget-object v8, v4, v2

    invoke-direct {p0, v8, p2, v12}, Lcom/bv/sync/CifsSync;->copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V

    .line 354
    aput-object v10, v4, v2

    .line 352
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 357
    :cond_5
    aget-object v8, v7, v2

    invoke-direct {p0, v8, p1, v11}, Lcom/bv/sync/CifsSync;->copy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Z)V

    .line 358
    aput-object v10, v7, v2

    .line 356
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method private isDeleted(Lcom/bv/sync/IFile;)Z
    .locals 7
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 592
    iget-object v3, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-boolean v3, v3, Lcom/bv/sync/CifsSync$Options;->mirror:Z

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v3, v3, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v4, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v3, v4, :cond_1

    .line 600
    :cond_0
    :goto_0
    return v2

    .line 594
    :cond_1
    iget-object v3, p0, Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;

    if-eqz v3, :cond_2

    .line 595
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->getRelativePath(Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v1

    .line 596
    .local v1, relativePath:Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 597
    .local v0, modifiedTime:Ljava/lang/Long;
    if-eqz v0, :cond_2

    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v3

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/bv/sync/CifsSync;->compare(JJ)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-eqz v3, :cond_0

    .line 600
    .end local v0           #modifiedTime:Ljava/lang/Long;
    .end local v1           #relativePath:Ljava/lang/String;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private isSyncable(Lcom/bv/sync/IFile;)Z
    .locals 6
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 313
    iget-object v2, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v2, v2, Lcom/bv/sync/CifsSync$Options;->filters:[Lcom/bv/sync/IFileFilter;

    if-eqz v2, :cond_0

    .line 314
    iget-object v2, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v3, v2, Lcom/bv/sync/CifsSync$Options;->filters:[Lcom/bv/sync/IFileFilter;

    array-length v4, v3

    move v2, v1

    :goto_0
    if-lt v2, v4, :cond_2

    .line 317
    :cond_0
    iget-object v2, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-boolean v2, v2, Lcom/bv/sync/CifsSync$Options;->ignoreSymLinks:Z

    if-eqz v2, :cond_3

    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p1}, Lcom/bv/sync/IFile;->isSymlink()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 318
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " is symlink, skipping"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 321
    :cond_1
    :goto_1
    return v1

    .line 314
    :cond_2
    aget-object v0, v3, v2

    .line 315
    .local v0, filter:Lcom/bv/sync/IFileFilter;
    invoke-interface {v0, p1}, Lcom/bv/sync/IFileFilter;->accept(Lcom/bv/sync/IFile;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 314
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 321
    .end local v0           #filter:Lcom/bv/sync/IFileFilter;
    :cond_3
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private isTrackedFile(Lcom/bv/sync/IFile;)Z
    .locals 3
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 623
    invoke-static {}, Lcom/bv/sync/CifsSync;->$SWITCH_TABLE$com$bv$sync$CifsSync$Options$Direction()[I

    move-result-object v0

    iget-object v1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v1, v1, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-virtual {v1}, Lcom/bv/sync/CifsSync$Options$Direction;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 632
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown sync direction: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v2, v2, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 627
    :pswitch_0
    instance-of v0, p1, Lcom/bv/sync/LocalFile;

    .line 630
    :goto_0
    return v0

    :pswitch_1
    instance-of v0, p1, Lcom/bv/sync/RemoteFile;

    goto :goto_0

    .line 623
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static listComputers(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .parameter "domain"
    .parameter "user"
    .parameter "password"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 768
    const-string v2, "smb://"

    .line 769
    .local v2, url:Ljava/lang/String;
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_0

    .line 770
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 772
    :cond_0
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    .line 773
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    .line 774
    new-instance v1, Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v1, p0, p1, p2}, Ljcifs/smb/NtlmPasswordAuthentication;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 775
    .local v1, ntlm:Ljcifs/smb/NtlmPasswordAuthentication;
    new-instance v0, Ljcifs/smb/SmbFile;

    invoke-direct {v0, v2, v1}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 779
    .end local v1           #ntlm:Ljcifs/smb/NtlmPasswordAuthentication;
    .local v0, file:Ljcifs/smb/SmbFile;
    :goto_0
    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->list()[Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 777
    .end local v0           #file:Ljcifs/smb/SmbFile;
    :cond_1
    new-instance v0, Ljcifs/smb/SmbFile;

    invoke-direct {v0, v2}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;)V

    .restart local v0       #file:Ljcifs/smb/SmbFile;
    goto :goto_0
.end method

.method public static listDomains(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 4
    .parameter "user"
    .parameter "password"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 759
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 760
    new-instance v1, Ljcifs/smb/NtlmPasswordAuthentication;

    const/4 v2, 0x0

    invoke-direct {v1, v2, p0, p1}, Ljcifs/smb/NtlmPasswordAuthentication;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 761
    .local v1, ntlm:Ljcifs/smb/NtlmPasswordAuthentication;
    new-instance v0, Ljcifs/smb/SmbFile;

    const-string v2, "smb://"

    invoke-direct {v0, v2, v1}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 764
    .end local v1           #ntlm:Ljcifs/smb/NtlmPasswordAuthentication;
    .local v0, file:Ljcifs/smb/SmbFile;
    :goto_0
    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->list()[Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 763
    .end local v0           #file:Ljcifs/smb/SmbFile;
    :cond_0
    new-instance v0, Ljcifs/smb/SmbFile;

    const-string v2, "smb://"

    sget-object v3, Ljcifs/smb/NtlmPasswordAuthentication;->ANONYMOUS:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v0, v2, v3}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .restart local v0       #file:Ljcifs/smb/SmbFile;
    goto :goto_0
.end method

.method private normalize(Lcom/bv/sync/IFile;)[Lcom/bv/sync/IFile;
    .locals 11
    .parameter "dir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 364
    :try_start_0
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->removeTempFiles(Lcom/bv/sync/IFile;)Ljava/util/TreeMap;

    move-result-object v2

    .line 365
    .local v2, permanentFiles:Ljava/util/TreeMap;,"Ljava/util/TreeMap<Ljava/lang/String;Lcom/bv/sync/IFile;>;"
    invoke-virtual {v2}, Ljava/util/TreeMap;->size()I

    move-result v5

    new-array v3, v5, [Lcom/bv/sync/IFile;

    .line 366
    .local v3, result:[Lcom/bv/sync/IFile;
    invoke-virtual {v2}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/bv/sync/IFile;
    :try_end_0
    .catch Lcom/bv/sync/CifsSync$SyncCancellationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    return-object v5

    .line 367
    .end local v2           #permanentFiles:Ljava/util/TreeMap;,"Ljava/util/TreeMap<Ljava/lang/String;Lcom/bv/sync/IFile;>;"
    .end local v3           #result:[Lcom/bv/sync/IFile;
    :catch_0
    move-exception v0

    .line 368
    .local v0, c:Lcom/bv/sync/CifsSync$SyncCancellationException;
    throw v0

    .line 369
    .end local v0           #c:Lcom/bv/sync/CifsSync$SyncCancellationException;
    :catch_1
    move-exception v1

    .line 370
    .local v1, e:Ljava/io/IOException;
    new-instance v5, Lcom/bv/sync/CifsSync$SyncException;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    invoke-direct {v5, v6, v10, v7, v1}, Lcom/bv/sync/CifsSync$SyncException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/io/IOException;)V

    throw v5

    .line 371
    .end local v1           #e:Ljava/io/IOException;
    :catch_2
    move-exception v4

    .line 372
    .local v4, t:Ljava/lang/Throwable;
    new-instance v5, Lcom/bv/sync/CifsSync$SyncException;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    new-instance v8, Ljcifs/util/transport/TransportException;

    invoke-virtual {v4}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v4}, Ljcifs/util/transport/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {v5, v6, v10, v7, v8}, Lcom/bv/sync/CifsSync$SyncException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/io/IOException;)V

    throw v5
.end method

.method private printStats()V
    .locals 4

    .prologue
    .line 224
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-object v1, v1, Lcom/bv/sync/CifsSync$SyncStats;->timeZoneConflicts:[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 227
    return-void

    .line 225
    :cond_0
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-object v1, v1, Lcom/bv/sync/CifsSync$SyncStats;->timeZoneConflicts:[I

    aget v1, v1, v0

    if-eqz v1, :cond_1

    .line 226
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Time zone conflicts "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " hours diff: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-object v3, v3, Lcom/bv/sync/CifsSync$SyncStats;->timeZoneConflicts:[I

    aget v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 224
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private read([BLjava/io/InputStream;)I
    .locals 8
    .parameter "buffer"
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 749
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 750
    .local v1, time:J
    invoke-virtual {p2, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .line 751
    .local v0, result:I
    iget-object v3, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v4, v3, Lcom/bv/sync/CifsSync$SyncStats;->readTime:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v1

    add-long/2addr v4, v6

    iput-wide v4, v3, Lcom/bv/sync/CifsSync$SyncStats;->readTime:J

    .line 752
    iget-object v3, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v4, v3, Lcom/bv/sync/CifsSync$SyncStats;->readBytes:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, v3, Lcom/bv/sync/CifsSync$SyncStats;->readBytes:J

    .line 753
    return v0
.end method

.method private removeTempFiles(Lcom/bv/sync/IFile;)Ljava/util/TreeMap;
    .locals 2
    .parameter "dir"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/IFile;",
            ")",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/bv/sync/IFile;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 377
    new-instance v0, Ljava/util/TreeMap;

    new-instance v1, Lcom/bv/sync/CifsSync$1;

    invoke-direct {v1, p0}, Lcom/bv/sync/CifsSync$1;-><init>(Lcom/bv/sync/CifsSync;)V

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 383
    .local v0, result:Ljava/util/TreeMap;,"Ljava/util/TreeMap<Ljava/lang/String;Lcom/bv/sync/IFile;>;"
    new-instance v1, Lcom/bv/sync/CifsSync$2;

    invoke-direct {v1, p0, v0}, Lcom/bv/sync/CifsSync$2;-><init>(Lcom/bv/sync/CifsSync;Ljava/util/TreeMap;)V

    invoke-interface {p1, v1}, Lcom/bv/sync/IFile;->listFiles(Lcom/bv/sync/IFileFilter;)[Lcom/bv/sync/IFile;

    .line 397
    return-object v0
.end method

.method private sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 9
    .parameter "left"
    .parameter "right"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 252
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v7

    .line 253
    .local v7, leftIsDirectory:Z
    invoke-interface {p2}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v8

    .line 254
    .local v8, rightIsDirectory:Z
    if-eqz v7, :cond_2

    if-eqz v8, :cond_2

    .line 255
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/CifsSync;->syncDirs(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 264
    :goto_0
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-boolean v0, v0, Lcom/bv/sync/CifsSync$Options;->overwrite:Z

    if-eqz v0, :cond_1

    .line 265
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v0, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v0, v1, :cond_0

    .line 266
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->delete(Lcom/bv/sync/IFile;)Z

    .line 267
    :cond_0
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v0, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v1, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v0, v1, :cond_1

    .line 268
    invoke-direct {p0, p2}, Lcom/bv/sync/CifsSync;->delete(Lcom/bv/sync/IFile;)Z

    .line 270
    :cond_1
    return-void

    .line 256
    :cond_2
    if-nez v7, :cond_4

    if-nez v8, :cond_4

    .line 257
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-boolean v0, v0, Lcom/bv/sync/CifsSync$Options;->overwrite:Z

    if-eqz v0, :cond_3

    .line 258
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/CifsSync;->syncFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    goto :goto_0

    .line 260
    :cond_3
    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v1

    invoke-interface {p2}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v3

    move-object v0, p0

    move-object v5, p1

    move-object v6, p2

    invoke-virtual/range {v0 .. v6}, Lcom/bv/sync/CifsSync;->updateProgress(JJLcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    goto :goto_0

    .line 262
    :cond_4
    new-instance v0, Lcom/bv/sync/ErrorCodeException;

    const/4 v1, 0x6

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/bv/sync/ErrorCodeException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method private syncDirs(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 1
    .parameter "leftDir"
    .parameter "rightDir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->isSyncable(Lcom/bv/sync/IFile;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p2}, Lcom/bv/sync/CifsSync;->isSyncable(Lcom/bv/sync/IFile;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 309
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/CifsSync;->internalSyncDirs(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 310
    :cond_0
    return-void
.end method

.method private syncFiles(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 12
    .parameter "leftFile"
    .parameter "rightFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v10, 0x0

    .line 413
    :try_start_0
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->isSyncable(Lcom/bv/sync/IFile;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p2}, Lcom/bv/sync/CifsSync;->isSyncable(Lcom/bv/sync/IFile;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 414
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/CifsSync;->compare(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)J

    move-result-wide v7

    .line 415
    .local v7, diff:J
    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v1

    .line 416
    .local v1, leftLength:J
    invoke-interface {p2}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v3

    .line 418
    .local v3, rightLength:J
    cmp-long v0, v7, v10

    if-nez v0, :cond_1

    move-object v0, p0

    move-object v5, p1

    move-object v6, p2

    .line 419
    invoke-virtual/range {v0 .. v6}, Lcom/bv/sync/CifsSync;->updateProgress(JJLcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 430
    .end local v1           #leftLength:J
    .end local v3           #rightLength:J
    .end local v7           #diff:J
    :cond_0
    :goto_0
    return-void

    .line 420
    .restart local v1       #leftLength:J
    .restart local v3       #rightLength:J
    .restart local v7       #diff:J
    :cond_1
    cmp-long v0, v7, v10

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v0, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v5, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v0, v5, :cond_2

    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v0, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v5, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v0, v5, :cond_2

    .line 421
    invoke-interface {p2}, Lcom/bv/sync/IFile;->getParent()Lcom/bv/sync/IFile;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/bv/sync/CifsSync;->copyFile(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Lcom/bv/sync/IFile;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 427
    .end local v1           #leftLength:J
    .end local v3           #rightLength:J
    .end local v7           #diff:J
    :catch_0
    move-exception v9

    .line 428
    .local v9, e:Ljava/io/IOException;
    new-instance v0, Lcom/bv/sync/CifsSync$SyncException;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    iget-object v10, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    invoke-direct {v0, v5, v6, v10, v9}, Lcom/bv/sync/CifsSync$SyncException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/io/IOException;)V

    throw v0

    .line 422
    .end local v9           #e:Ljava/io/IOException;
    .restart local v1       #leftLength:J
    .restart local v3       #rightLength:J
    .restart local v7       #diff:J
    :cond_2
    cmp-long v0, v7, v10

    if-gez v0, :cond_3

    :try_start_1
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v0, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v5, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v0, v5, :cond_3

    iget-object v0, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v0, v0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v5, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v0, v5, :cond_3

    .line 423
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getParent()Lcom/bv/sync/IFile;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lcom/bv/sync/CifsSync;->copyFile(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)Lcom/bv/sync/IFile;

    goto :goto_0

    :cond_3
    move-object v0, p0

    move-object v5, p1

    move-object v6, p2

    .line 425
    invoke-virtual/range {v0 .. v6}, Lcom/bv/sync/CifsSync;->updateProgress(JJLcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private trackCopy(Lcom/bv/sync/IFile;)V
    .locals 6
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 691
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;

    if-eqz v1, :cond_0

    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->isTrackedFile(Lcom/bv/sync/IFile;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 692
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;

    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->getRelativePath(Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 693
    instance-of v1, p1, Lcom/bv/sync/LocalFile;

    if-eqz v1, :cond_1

    .line 694
    iget v1, p0, Lcom/bv/sync/CifsSync;->leftCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/bv/sync/CifsSync;->leftCount:I

    .line 697
    :goto_0
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-wide v1, v1, Lcom/bv/sync/CifsSync$Options;->minFreeSpace:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 698
    instance-of v1, p1, Lcom/bv/sync/LocalFile;

    if-eqz v1, :cond_2

    const/4 v0, 0x0

    .line 699
    .local v0, index:I
    :goto_1
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->freeSpace:[J

    aget-wide v2, v1, v0

    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v4

    sub-long/2addr v2, v4

    aput-wide v2, v1, v0

    .line 702
    .end local v0           #index:I
    :cond_0
    return-void

    .line 696
    :cond_1
    iget v1, p0, Lcom/bv/sync/CifsSync;->rightCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/bv/sync/CifsSync;->rightCount:I

    goto :goto_0

    .line 698
    :cond_2
    const/4 v0, 0x1

    goto :goto_1
.end method

.method private trackCopyDir(Lcom/bv/sync/IFile;)V
    .locals 9
    .parameter "dir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 685
    instance-of v0, p1, Lcom/bv/sync/RemoteFile;

    if-eqz v0, :cond_0

    sget-object v4, Lcom/bv/sync/SyncItem$Type;->RemoteFile:Lcom/bv/sync/SyncItem$Type;

    .line 686
    .local v4, type:Lcom/bv/sync/SyncItem$Type;
    :goto_0
    iget-object v8, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    new-instance v0, Lcom/bv/sync/SyncItem;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    const-wide/16 v5, 0x0

    const/4 v7, 0x1

    invoke-direct/range {v0 .. v7}, Lcom/bv/sync/SyncItem;-><init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JZ)V

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 687
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->trackCopy(Lcom/bv/sync/IFile;)V

    .line 688
    return-void

    .line 685
    .end local v4           #type:Lcom/bv/sync/SyncItem$Type;
    :cond_0
    sget-object v4, Lcom/bv/sync/SyncItem$Type;->LocalFile:Lcom/bv/sync/SyncItem$Type;

    goto :goto_0
.end method

.method private trackCopyFile(Lcom/bv/sync/IFile;)V
    .locals 9
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 679
    instance-of v0, p1, Lcom/bv/sync/RemoteFile;

    if-eqz v0, :cond_0

    sget-object v4, Lcom/bv/sync/SyncItem$Type;->RemoteFile:Lcom/bv/sync/SyncItem$Type;

    .line 680
    .local v4, type:Lcom/bv/sync/SyncItem$Type;
    :goto_0
    iget-object v8, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    new-instance v0, Lcom/bv/sync/SyncItem;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v5

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/bv/sync/SyncItem;-><init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JZ)V

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 681
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->trackCopy(Lcom/bv/sync/IFile;)V

    .line 682
    return-void

    .line 679
    .end local v4           #type:Lcom/bv/sync/SyncItem$Type;
    :cond_0
    sget-object v4, Lcom/bv/sync/SyncItem$Type;->LocalFile:Lcom/bv/sync/SyncItem$Type;

    goto :goto_0
.end method

.method private trackDelete(Lcom/bv/sync/IFile;Ljava/lang/String;)V
    .locals 1
    .parameter "file"
    .parameter "relativePath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 705
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->isTrackedFile(Lcom/bv/sync/IFile;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 706
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 707
    instance-of v0, p1, Lcom/bv/sync/LocalFile;

    if-eqz v0, :cond_1

    .line 708
    iget v0, p0, Lcom/bv/sync/CifsSync;->leftCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/bv/sync/CifsSync;->leftCount:I

    .line 712
    :cond_0
    :goto_0
    return-void

    .line 710
    :cond_1
    iget v0, p0, Lcom/bv/sync/CifsSync;->rightCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/bv/sync/CifsSync;->rightCount:I

    goto :goto_0
.end method

.method private updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;JLcom/bv/sync/IFile;)V
    .locals 5
    .parameter "action"
    .parameter "size"
    .parameter "file"

    .prologue
    .line 273
    iget-wide v1, p0, Lcom/bv/sync/CifsSync;->currentSize:J

    add-long/2addr v1, p2

    iput-wide v1, p0, Lcom/bv/sync/CifsSync;->currentSize:J

    .line 274
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->progress:Lcom/bv/sync/ProgressNotification;

    if-eqz v1, :cond_3

    .line 275
    const/4 v0, 0x0

    .line 276
    .local v0, percent:I
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v1}, Lcom/bv/sync/SizeCalculator;->getSize()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 277
    iget-wide v1, p0, Lcom/bv/sync/CifsSync;->currentSize:J

    long-to-float v1, v1

    iget-object v2, p0, Lcom/bv/sync/CifsSync;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v2}, Lcom/bv/sync/SizeCalculator;->getSize()J

    move-result-wide v2

    long-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x42c8

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 278
    :cond_0
    const/16 v1, 0x64

    if-le v0, v1, :cond_1

    .line 279
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid percent, done "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v3, p0, Lcom/bv/sync/CifsSync;->currentSize:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " total "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/sync/CifsSync;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v3}, Lcom/bv/sync/SizeCalculator;->getSize()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 280
    :cond_1
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->progress:Lcom/bv/sync/ProgressNotification;

    invoke-interface {v1, p1, v0, p4}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/bv/sync/CifsSync;->canceled:Z

    .line 281
    iget-boolean v1, p0, Lcom/bv/sync/CifsSync;->canceled:Z

    if-eqz v1, :cond_3

    .line 282
    new-instance v1, Lcom/bv/sync/CifsSync$SyncCancellationException;

    iget-object v2, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Lcom/bv/sync/CifsSync$SyncCancellationException;-><init>(Ljava/util/List;)V

    throw v1

    .line 280
    :cond_2
    const/4 v1, 0x1

    goto :goto_0

    .line 284
    .end local v0           #percent:I
    :cond_3
    return-void
.end method

.method private validateDir(Lcom/bv/sync/IFile;)V
    .locals 2
    .parameter "dir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 247
    invoke-interface {p1}, Lcom/bv/sync/IFile;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_1

    .line 248
    :cond_0
    new-instance v0, Ljava/io/FileNotFoundException;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 249
    :cond_1
    return-void
.end method

.method private write([BLjava/io/OutputStream;I)V
    .locals 7
    .parameter "buffer"
    .parameter "out"
    .parameter "size"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 742
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 743
    .local v0, time:J
    const/4 v2, 0x0

    invoke-virtual {p2, p1, v2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 744
    iget-object v2, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v3, v2, Lcom/bv/sync/CifsSync$SyncStats;->writeTime:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    add-long/2addr v3, v5

    iput-wide v3, v2, Lcom/bv/sync/CifsSync$SyncStats;->writeTime:J

    .line 745
    iget-object v2, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    iget-wide v3, v2, Lcom/bv/sync/CifsSync$SyncStats;->writeBytes:J

    int-to-long v5, p3

    add-long/2addr v3, v5

    iput-wide v3, v2, Lcom/bv/sync/CifsSync$SyncStats;->writeBytes:J

    .line 746
    return-void
.end method


# virtual methods
.method public getStats()Lcom/bv/sync/CifsSync$SyncStats;
    .locals 3

    .prologue
    .line 230
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    sget v1, Lcom/bv/sync/RemoteFile;->totalRetryCount:I

    int-to-long v1, v1

    iput-wide v1, v0, Lcom/bv/sync/CifsSync$SyncStats;->reconnects:J

    .line 231
    iget-object v0, p0, Lcom/bv/sync/CifsSync;->syncStats:Lcom/bv/sync/CifsSync$SyncStats;

    return-object v0
.end method

.method normalizePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "absolutePath"

    .prologue
    .line 588
    return-object p1
.end method

.method public sync(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;
    .locals 10
    .parameter "first"
    .parameter "second"
    .parameter "progress"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/IFile;",
            "Lcom/bv/sync/IFile;",
            "Lcom/bv/sync/ProgressNotification;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 114
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/bv/sync/CifsSync;->canceled:Z

    .line 115
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/bv/sync/CifsSync;->currentSize:J

    .line 116
    const/4 v4, 0x0

    iput v4, p0, Lcom/bv/sync/CifsSync;->rightCount:I

    iput v4, p0, Lcom/bv/sync/CifsSync;->leftCount:I

    .line 117
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    .line 118
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Validating directories"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 119
    invoke-direct {p0, p1}, Lcom/bv/sync/CifsSync;->validateDir(Lcom/bv/sync/IFile;)V

    .line 120
    invoke-direct {p0, p2}, Lcom/bv/sync/CifsSync;->validateDir(Lcom/bv/sync/IFile;)V

    .line 121
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/CifsSync;->calcSize(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 122
    const-wide/16 v4, 0xa

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 123
    iget-object v4, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-wide v4, v4, Lcom/bv/sync/CifsSync$Options;->minFreeSpace:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_0

    .line 124
    iget-object v4, p0, Lcom/bv/sync/CifsSync;->freeSpace:[J

    const/4 v5, 0x0

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getFreeSpace()J

    move-result-wide v6

    aput-wide v6, v4, v5

    .line 125
    iget-object v4, p0, Lcom/bv/sync/CifsSync;->freeSpace:[J

    const/4 v5, 0x1

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getFreeSpace()J

    move-result-wide v6

    aput-wide v6, v4, v5

    .line 127
    :cond_0
    iput-object p3, p0, Lcom/bv/sync/CifsSync;->progress:Lcom/bv/sync/ProgressNotification;

    .line 128
    iget-object v4, p0, Lcom/bv/sync/CifsSync;->roots:[Lcom/bv/sync/IFile;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    .line 129
    iget-object v4, p0, Lcom/bv/sync/CifsSync;->roots:[Lcom/bv/sync/IFile;

    const/4 v5, 0x1

    aput-object p2, v4, v5

    .line 132
    :try_start_0
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Starting sync"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 133
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 135
    .local v1, now:J
    :try_start_1
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/CifsSync;->internalSyncDirs(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V

    .line 136
    invoke-virtual {p0}, Lcom/bv/sync/CifsSync;->trackDeletions()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lcom/bv/sync/CifsSync$SyncException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 142
    :try_start_2
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Sync finished, duration "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v1

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " seconds"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 143
    iget-object v3, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    .line 144
    .local v3, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    invoke-direct {p0}, Lcom/bv/sync/CifsSync;->printStats()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 147
    iget-object v4, p0, Lcom/bv/sync/CifsSync;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    if-eqz v4, :cond_1

    .line 148
    iget-object v4, p0, Lcom/bv/sync/CifsSync;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v4}, Lcom/bv/sync/SizeCalculator;->cancel()V

    .line 149
    :cond_1
    const/4 p3, 0x0

    .line 150
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    .line 145
    return-object v3

    .line 137
    .end local v3           #result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    :catch_0
    move-exception v0

    .line 138
    .local v0, e:Lcom/bv/sync/CifsSync$SyncException;
    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 146
    .end local v0           #e:Lcom/bv/sync/CifsSync$SyncException;
    .end local v1           #now:J
    :catchall_0
    move-exception v4

    .line 147
    iget-object v5, p0, Lcom/bv/sync/CifsSync;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    if-eqz v5, :cond_2

    .line 148
    iget-object v5, p0, Lcom/bv/sync/CifsSync;->sizeCalculator:Lcom/bv/sync/SizeCalculator;

    invoke-virtual {v5}, Lcom/bv/sync/SizeCalculator;->cancel()V

    .line 149
    :cond_2
    const/4 p3, 0x0

    .line 150
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    .line 151
    throw v4

    .line 139
    .restart local v1       #now:J
    :catch_1
    move-exception v0

    .line 140
    .local v0, e:Ljava/io/IOException;
    :try_start_4
    new-instance v4, Lcom/bv/sync/CifsSync$SyncException;

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/bv/sync/CifsSync;->syncResult:Ljava/util/ArrayList;

    invoke-direct {v4, v5, v6, v7, v0}, Lcom/bv/sync/CifsSync$SyncException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/io/IOException;)V

    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method protected trackDeletions()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v1, v1, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v2, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v1, v2, :cond_1

    .line 156
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v1, v1, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v2, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-boolean v1, v1, Lcom/bv/sync/CifsSync$Options;->mirror:Z

    if-eqz v1, :cond_1

    .line 157
    :cond_0
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v1, v1, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v2, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-boolean v1, v1, Lcom/bv/sync/CifsSync$Options;->mirror:Z

    if-nez v1, :cond_2

    .line 158
    :cond_1
    new-instance v1, Lcom/bv/sync/CifsSync$DeletionTracker;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/bv/sync/CifsSync$DeletionTracker;-><init>(Lcom/bv/sync/CifsSync;Lcom/bv/sync/CifsSync$DeletionTracker;)V

    invoke-virtual {v1}, Lcom/bv/sync/CifsSync$DeletionTracker;->track()Ljava/util/Map;

    move-result-object v0

    .line 159
    .local v0, newTrack:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 160
    iget-object v1, p0, Lcom/bv/sync/CifsSync;->deletionTrackMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 162
    .end local v0           #newTrack:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    :cond_2
    return-void
.end method

.method updateProgress(JJLcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
    .locals 4
    .parameter "localSize"
    .parameter "remoteSize"
    .parameter "leftFile"
    .parameter "rightFile"

    .prologue
    .line 498
    iget-object v2, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v2, v2, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v3, Lcom/bv/sync/CifsSync$Options$Direction;->moveToLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v2, v2, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v3, Lcom/bv/sync/CifsSync$Options$Direction;->toLocal:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v2, v3, :cond_3

    .line 499
    :cond_0
    const-wide/16 p1, 0x0

    .line 503
    :cond_1
    :goto_0
    add-long v0, p1, p3

    .line 504
    .local v0, size:J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_2

    if-eqz p5, :cond_2

    .line 505
    sget-object v2, Lcom/bv/sync/ProgressNotification$ProgressAction;->Synchronizing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-direct {p0, v2, v0, v1, p5}, Lcom/bv/sync/CifsSync;->updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;JLcom/bv/sync/IFile;)V

    .line 506
    :cond_2
    return-void

    .line 500
    .end local v0           #size:J
    :cond_3
    iget-object v2, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v2, v2, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v3, Lcom/bv/sync/CifsSync$Options$Direction;->moveToRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-eq v2, v3, :cond_4

    iget-object v2, p0, Lcom/bv/sync/CifsSync;->options:Lcom/bv/sync/CifsSync$Options;

    iget-object v2, v2, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    sget-object v3, Lcom/bv/sync/CifsSync$Options$Direction;->toRemote:Lcom/bv/sync/CifsSync$Options$Direction;

    if-ne v2, v3, :cond_1

    .line 501
    :cond_4
    const-wide/16 p3, 0x0

    goto :goto_0
.end method
