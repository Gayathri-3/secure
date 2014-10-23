.class Lcom/bv/sync/Mp3ScannerTest$TestParser;
.super Ljava/lang/Object;
.source "Mp3ScannerTest.java"

# interfaces
.implements Lcom/bv/sync/Mp3Scanner$Parser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/Mp3ScannerTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TestParser"
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$bv$sync$Mp3Scanner$FieldType:[I


# instance fields
.field private fileInfo:Lcom/bv/sync/Mp3ScannerTest$FileInfo;

.field private final files:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/bv/sync/Mp3ScannerTest$FileInfo;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/bv/sync/Mp3ScannerTest;


# direct methods
.method static synthetic $SWITCH_TABLE$com$bv$sync$Mp3Scanner$FieldType()[I
    .locals 3

    .prologue
    .line 57
    sget-object v0, Lcom/bv/sync/Mp3ScannerTest$TestParser;->$SWITCH_TABLE$com$bv$sync$Mp3Scanner$FieldType:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/bv/sync/Mp3Scanner$FieldType;->values()[Lcom/bv/sync/Mp3Scanner$FieldType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/bv/sync/Mp3Scanner$FieldType;->Album:Lcom/bv/sync/Mp3Scanner$FieldType;

    invoke-virtual {v1}, Lcom/bv/sync/Mp3Scanner$FieldType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_1
    :try_start_1
    sget-object v1, Lcom/bv/sync/Mp3Scanner$FieldType;->Artist:Lcom/bv/sync/Mp3Scanner$FieldType;

    invoke-virtual {v1}, Lcom/bv/sync/Mp3Scanner$FieldType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_2
    :try_start_2
    sget-object v1, Lcom/bv/sync/Mp3Scanner$FieldType;->Title:Lcom/bv/sync/Mp3Scanner$FieldType;

    invoke-virtual {v1}, Lcom/bv/sync/Mp3Scanner$FieldType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_3
    sput-object v0, Lcom/bv/sync/Mp3ScannerTest$TestParser;->$SWITCH_TABLE$com$bv$sync$Mp3Scanner$FieldType:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1
.end method

.method private constructor <init>(Lcom/bv/sync/Mp3ScannerTest;)V
    .locals 1
    .parameter

    .prologue
    .line 57
    iput-object p1, p0, Lcom/bv/sync/Mp3ScannerTest$TestParser;->this$0:Lcom/bv/sync/Mp3ScannerTest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bv/sync/Mp3ScannerTest$TestParser;->files:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/sync/Mp3ScannerTest;Lcom/bv/sync/Mp3ScannerTest$TestParser;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/bv/sync/Mp3ScannerTest$TestParser;-><init>(Lcom/bv/sync/Mp3ScannerTest;)V

    return-void
.end method


# virtual methods
.method add(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "path"
    .parameter "artist"
    .parameter "album"
    .parameter "title"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/bv/sync/Mp3ScannerTest$TestParser;->files:Ljava/util/HashMap;

    new-instance v1, Lcom/bv/sync/Mp3ScannerTest$FileInfo;

    invoke-direct {v1, p2, p3, p4}, Lcom/bv/sync/Mp3ScannerTest$FileInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    return-void
.end method

.method public getField(Lcom/bv/sync/Mp3Scanner$FieldType;)Ljava/lang/String;
    .locals 2
    .parameter "fieldType"

    .prologue
    .line 67
    invoke-static {}, Lcom/bv/sync/Mp3ScannerTest$TestParser;->$SWITCH_TABLE$com$bv$sync$Mp3Scanner$FieldType()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/bv/sync/Mp3Scanner$FieldType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 72
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 68
    :pswitch_0
    iget-object v0, p0, Lcom/bv/sync/Mp3ScannerTest$TestParser;->fileInfo:Lcom/bv/sync/Mp3ScannerTest$FileInfo;

    iget-object v0, v0, Lcom/bv/sync/Mp3ScannerTest$FileInfo;->artist:Ljava/lang/String;

    goto :goto_0

    .line 69
    :pswitch_1
    iget-object v0, p0, Lcom/bv/sync/Mp3ScannerTest$TestParser;->fileInfo:Lcom/bv/sync/Mp3ScannerTest$FileInfo;

    iget-object v0, v0, Lcom/bv/sync/Mp3ScannerTest$FileInfo;->album:Ljava/lang/String;

    goto :goto_0

    .line 70
    :pswitch_2
    iget-object v0, p0, Lcom/bv/sync/Mp3ScannerTest$TestParser;->fileInfo:Lcom/bv/sync/Mp3ScannerTest$FileInfo;

    iget-object v0, v0, Lcom/bv/sync/Mp3ScannerTest$FileInfo;->title:Ljava/lang/String;

    goto :goto_0

    .line 67
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
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
    .line 77
    iget-object v0, p0, Lcom/bv/sync/Mp3ScannerTest$TestParser;->files:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/Mp3ScannerTest$FileInfo;

    iput-object v0, p0, Lcom/bv/sync/Mp3ScannerTest$TestParser;->fileInfo:Lcom/bv/sync/Mp3ScannerTest$FileInfo;

    .line 78
    return-void
.end method
