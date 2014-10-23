.class Lcom/bv/sync/ImageScannerTest$TestImageParser;
.super Ljava/lang/Object;
.source "ImageScannerTest.java"

# interfaces
.implements Lcom/bv/sync/ImageScanner$Parser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/ImageScannerTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TestImageParser"
.end annotation


# instance fields
.field private fileInfo:Lcom/bv/sync/ImageScannerTest$FileInfo;

.field private final files:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/bv/sync/ImageScannerTest$FileInfo;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/bv/sync/ImageScannerTest;


# direct methods
.method private constructor <init>(Lcom/bv/sync/ImageScannerTest;)V
    .locals 1
    .parameter

    .prologue
    .line 86
    iput-object p1, p0, Lcom/bv/sync/ImageScannerTest$TestImageParser;->this$0:Lcom/bv/sync/ImageScannerTest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bv/sync/ImageScannerTest$TestImageParser;->files:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/sync/ImageScannerTest;Lcom/bv/sync/ImageScannerTest$TestImageParser;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/bv/sync/ImageScannerTest$TestImageParser;-><init>(Lcom/bv/sync/ImageScannerTest;)V

    return-void
.end method


# virtual methods
.method add(Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;DD)V
    .locals 3
    .parameter "path"
    .parameter "time"
    .parameter "address"
    .parameter "x"
    .parameter "y"

    .prologue
    .line 91
    iget-object v0, p0, Lcom/bv/sync/ImageScannerTest$TestImageParser;->files:Ljava/util/HashMap;

    new-instance v1, Lcom/bv/sync/ImageScannerTest$FileInfo;

    iget-object v2, p0, Lcom/bv/sync/ImageScannerTest$TestImageParser;->this$0:Lcom/bv/sync/ImageScannerTest;

    invoke-direct {v1, v2, p3, p2}, Lcom/bv/sync/ImageScannerTest$FileInfo;-><init>(Lcom/bv/sync/ImageScannerTest;Ljava/lang/String;Ljava/util/Date;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    return-void
.end method

.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/bv/sync/ImageScannerTest$TestImageParser;->fileInfo:Lcom/bv/sync/ImageScannerTest$FileInfo;

    iget-object v0, v0, Lcom/bv/sync/ImageScannerTest$FileInfo;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getLatitude()D
    .locals 2

    .prologue
    .line 116
    const-wide/high16 v0, 0x3ff0

    return-wide v0
.end method

.method public getLongitude()D
    .locals 2

    .prologue
    .line 111
    const-wide/high16 v0, 0x3ff0

    return-wide v0
.end method

.method public getTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/bv/sync/ImageScannerTest$TestImageParser;->fileInfo:Lcom/bv/sync/ImageScannerTest$FileInfo;

    iget-object v0, v0, Lcom/bv/sync/ImageScannerTest$FileInfo;->time:Ljava/util/Date;

    return-object v0
.end method

.method public parse(Ljava/lang/String;)V
    .locals 1
    .parameter "path"

    .prologue
    .line 106
    iget-object v0, p0, Lcom/bv/sync/ImageScannerTest$TestImageParser;->files:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/ImageScannerTest$FileInfo;

    iput-object v0, p0, Lcom/bv/sync/ImageScannerTest$TestImageParser;->fileInfo:Lcom/bv/sync/ImageScannerTest$FileInfo;

    .line 107
    return-void
.end method
