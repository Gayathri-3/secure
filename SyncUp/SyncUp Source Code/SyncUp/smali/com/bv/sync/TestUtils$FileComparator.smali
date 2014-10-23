.class Lcom/bv/sync/TestUtils$FileComparator;
.super Ljava/lang/Object;
.source "TestUtils.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/TestUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FileComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/bv/sync/IFile;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)I
    .locals 3
    .parameter "file1"
    .parameter "file2"

    .prologue
    .line 63
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 64
    .local v0, result:I
    if-nez v0, :cond_0

    .line 65
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 66
    :cond_0
    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/sync/IFile;

    check-cast p2, Lcom/bv/sync/IFile;

    invoke-virtual {p0, p1, p2}, Lcom/bv/sync/TestUtils$FileComparator;->compare(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)I

    move-result v0

    return v0
.end method
