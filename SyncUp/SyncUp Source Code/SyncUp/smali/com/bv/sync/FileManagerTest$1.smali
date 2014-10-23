.class Lcom/bv/sync/FileManagerTest$1;
.super Ljava/lang/Object;
.source "FileManagerTest.java"

# interfaces
.implements Lcom/bv/sync/FileManagerTest$Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/FileManagerTest;->testCopy(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/FileManagerTest;


# direct methods
.method constructor <init>(Lcom/bv/sync/FileManagerTest;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/FileManagerTest$1;->this$0:Lcom/bv/sync/FileManagerTest;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public execute([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Ljava/util/List;)V
    .locals 4
    .parameter "files"
    .parameter "destination"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/bv/sync/IFile;",
            "Lcom/bv/sync/IFile;",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    .local p3, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    new-instance v1, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v1}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-static {p1, p2, v1, p3}, Lcom/bv/sync/FileManager;->copy([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;Ljava/util/List;)V

    .line 44
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_0

    .line 46
    return-void

    .line 44
    :cond_0
    aget-object v0, p1, v1

    .line 45
    .local v0, dir:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->exists()Z

    move-result v3

    invoke-static {v3}, Lcom/bv/sync/FileManagerTest;->assertTrue(Z)V

    .line 44
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
