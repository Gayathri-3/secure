.class Lcom/bv/sync/Mp3ScannerTest$FileInfo;
.super Ljava/lang/Object;
.source "Mp3ScannerTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/Mp3ScannerTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileInfo"
.end annotation


# instance fields
.field final album:Ljava/lang/String;

.field final artist:Ljava/lang/String;

.field final title:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "artist"
    .parameter "album"
    .parameter "title"

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/bv/sync/Mp3ScannerTest$FileInfo;->artist:Ljava/lang/String;

    .line 52
    iput-object p2, p0, Lcom/bv/sync/Mp3ScannerTest$FileInfo;->album:Ljava/lang/String;

    .line 53
    iput-object p3, p0, Lcom/bv/sync/Mp3ScannerTest$FileInfo;->title:Ljava/lang/String;

    .line 54
    return-void
.end method
