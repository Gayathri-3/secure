.class Lcom/bv/sync/FileManagerTest$2;
.super Ljava/lang/Object;
.source "FileManagerTest.java"

# interfaces
.implements Lcom/bv/sync/FileManagerTest$Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/FileManagerTest;->testCut(Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;)V
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
    iput-object p1, p0, Lcom/bv/sync/FileManagerTest$2;->this$0:Lcom/bv/sync/FileManagerTest;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public execute([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Ljava/util/List;)V
    .locals 6
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
    .local p3, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/SyncItem;>;"
    const/4 v2, 0x0

    .line 62
    new-instance v3, Lcom/bv/sync/TestUtils$TestProgress;

    invoke-direct {v3}, Lcom/bv/sync/TestUtils$TestProgress;-><init>()V

    invoke-static {p1, p2, v3, p3}, Lcom/bv/sync/FileManager;->move([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;Ljava/util/List;)V

    .line 63
    aget-object v3, p1, v2

    instance-of v3, v3, Lcom/bv/sync/RemoteFile;

    if-eqz v3, :cond_0

    .line 65
    const-wide/16 v3, 0x1388

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    :cond_0
    :goto_0
    array-length v3, p1

    :goto_1
    if-lt v2, v3, :cond_1

    .line 71
    return-void

    .line 66
    :catch_0
    move-exception v0

    .line 67
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 69
    .end local v0           #e:Ljava/lang/InterruptedException;
    :cond_1
    aget-object v1, p1, v2

    .line 70
    .local v1, file:Lcom/bv/sync/IFile;
    invoke-interface {v1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1}, Lcom/bv/sync/IFile;->exists()Z

    move-result v5

    invoke-static {v4, v5}, Lcom/bv/sync/FileManagerTest;->assertFalse(Ljava/lang/String;Z)V

    .line 69
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method
