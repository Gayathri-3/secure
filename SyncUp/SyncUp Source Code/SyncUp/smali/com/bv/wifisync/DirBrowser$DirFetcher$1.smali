.class Lcom/bv/wifisync/DirBrowser$DirFetcher$1;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Lcom/bv/sync/IFileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/DirBrowser$DirFetcher;->atBackground([Lcom/bv/sync/IFile;)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field count:I

.field final synthetic this$1:Lcom/bv/wifisync/DirBrowser$DirFetcher;

.field private final synthetic val$dirs:Ljava/util/TreeSet;

.field private final synthetic val$files:Ljava/util/TreeSet;

.field private final synthetic val$progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser$DirFetcher;Lcom/bv/wifisync/DirBrowser$ProgressInfo;Ljava/util/TreeSet;Ljava/util/TreeSet;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->this$1:Lcom/bv/wifisync/DirBrowser$DirFetcher;

    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->val$progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    iput-object p3, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->val$dirs:Ljava/util/TreeSet;

    iput-object p4, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->val$files:Ljava/util/TreeSet;

    .line 1066
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1067
    const/4 v0, 0x0

    iput v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->count:I

    return-void
.end method


# virtual methods
.method public accept(Lcom/bv/sync/IFile;)Z
    .locals 10
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 1070
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->this$1:Lcom/bv/wifisync/DirBrowser$DirFetcher;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirFetcher;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1071
    new-instance v0, Ljava/util/concurrent/CancellationException;

    invoke-direct {v0}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v0

    .line 1072
    :cond_0
    iget v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->count:I

    rem-int/lit16 v0, v0, 0xc8

    if-nez v0, :cond_1

    .line 1073
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->val$progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    iget v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->count:I

    iput v1, v0, Lcom/bv/wifisync/DirBrowser$ProgressInfo;->percent:I

    .line 1074
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->this$1:Lcom/bv/wifisync/DirBrowser$DirFetcher;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->val$progressInfo:Lcom/bv/wifisync/DirBrowser$ProgressInfo;

    aput-object v2, v1, v9

    #calls: Lcom/bv/wifisync/DirBrowser$DirFetcher;->publishProgress([Ljava/lang/Object;)V
    invoke-static {v0, v1}, Lcom/bv/wifisync/DirBrowser$DirFetcher;->access$3(Lcom/bv/wifisync/DirBrowser$DirFetcher;[Ljava/lang/Object;)V

    .line 1077
    :cond_1
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v3

    .line 1078
    .local v3, isDirectory:Z
    if-eqz v3, :cond_2

    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->val$dirs:Ljava/util/TreeSet;

    move-object v8, v0

    :goto_0
    new-instance v0, Lcom/bv/wifisync/DirBrowser$FileInfo;

    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->this$1:Lcom/bv/wifisync/DirBrowser$DirFetcher;

    #getter for: Lcom/bv/wifisync/DirBrowser$DirFetcher;->this$0:Lcom/bv/wifisync/DirBrowser;
    invoke-static {v1}, Lcom/bv/wifisync/DirBrowser$DirFetcher;->access$4(Lcom/bv/wifisync/DirBrowser$DirFetcher;)Lcom/bv/wifisync/DirBrowser;

    move-result-object v1

    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v4

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v6

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcom/bv/wifisync/DirBrowser$FileInfo;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;ZJJ)V

    invoke-virtual {v8, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 1079
    return v9

    .line 1078
    :cond_2
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirFetcher$1;->val$files:Ljava/util/TreeSet;

    move-object v8, v0

    goto :goto_0
.end method
