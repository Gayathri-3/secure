.class Lcom/bv/sync/ImageScannerTest$FileInfo;
.super Ljava/lang/Object;
.source "ImageScannerTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/ImageScannerTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FileInfo"
.end annotation


# instance fields
.field final address:Ljava/lang/String;

.field final synthetic this$0:Lcom/bv/sync/ImageScannerTest;

.field final time:Ljava/util/Date;


# direct methods
.method constructor <init>(Lcom/bv/sync/ImageScannerTest;Ljava/lang/String;Ljava/util/Date;)V
    .locals 0
    .parameter
    .parameter "address"
    .parameter "time"

    .prologue
    .line 80
    iput-object p1, p0, Lcom/bv/sync/ImageScannerTest$FileInfo;->this$0:Lcom/bv/sync/ImageScannerTest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p2, p0, Lcom/bv/sync/ImageScannerTest$FileInfo;->address:Ljava/lang/String;

    .line 82
    iput-object p3, p0, Lcom/bv/sync/ImageScannerTest$FileInfo;->time:Ljava/util/Date;

    .line 83
    return-void
.end method
