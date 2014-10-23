.class Lcom/bv/wifisync/Utils$DeleteFileScanner;
.super Lcom/bv/wifisync/Utils$FileScanner;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeleteFileScanner"
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V
    .locals 0
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

    .prologue
    .line 683
    .local p2, files:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/bv/wifisync/Utils$FileScanner;-><init>(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V

    .line 684
    return-void
.end method

.method private removeFile(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 11
    .parameter "file"
    .parameter "uri"

    .prologue
    const/4 v5, 0x0

    const/4 v10, 0x1

    .line 700
    iget-object v0, p0, Lcom/bv/wifisync/Utils$DeleteFileScanner;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 701
    new-array v2, v10, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v2, v5

    .line 702
    const-string v3, "_data=?"

    new-array v4, v10, [Ljava/lang/String;

    aput-object p1, v4, v5

    const/4 v5, 0x0

    move-object v1, p2

    .line 700
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 703
    .local v7, cursor:Landroid/database/Cursor;
    if-eqz v7, :cond_1

    .line 705
    :try_start_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 706
    const-string v0, "_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    .line 707
    .local v9, index:I
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 708
    .local v8, id:Ljava/lang/String;
    iget-object v0, p0, Lcom/bv/wifisync/Utils$DeleteFileScanner;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 709
    const-string v1, "_id=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v8, v2, v3

    .line 708
    invoke-virtual {v0, p2, v1, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 710
    .local v6, count:I
    if-eq v6, v10, :cond_0

    .line 711
    const-string v0, "Utils"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Deleted media store count is: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 714
    .end local v6           #count:I
    .end local v8           #id:Ljava/lang/String;
    .end local v9           #index:I
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 717
    :cond_1
    return-void

    .line 713
    :catchall_0
    move-exception v0

    .line 714
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 715
    throw v0
.end method


# virtual methods
.method protected doScan(Ljava/lang/String;)V
    .locals 2
    .parameter "file"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 690
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 691
    .local v0, path:Ljava/lang/String;
    invoke-static {}, Lcom/bv/wifisync/Utils;->access$0()[Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/bv/wifisync/Utils;->endsWith(Ljava/lang/String;[Ljava/lang/String;)Z
    invoke-static {v0, v1}, Lcom/bv/wifisync/Utils;->access$1(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 692
    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, p1, v1}, Lcom/bv/wifisync/Utils$DeleteFileScanner;->removeFile(Ljava/lang/String;Landroid/net/Uri;)V

    .line 697
    :goto_0
    return-void

    .line 693
    :cond_0
    invoke-static {}, Lcom/bv/wifisync/Utils;->access$2()[Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/bv/wifisync/Utils;->endsWith(Ljava/lang/String;[Ljava/lang/String;)Z
    invoke-static {v0, v1}, Lcom/bv/wifisync/Utils;->access$1(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 694
    sget-object v1, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, p1, v1}, Lcom/bv/wifisync/Utils$DeleteFileScanner;->removeFile(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_0

    .line 696
    :cond_1
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$FileScanner;->doScan(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 6
    .parameter "path"
    .parameter "uri"

    .prologue
    .line 722
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 723
    .local v1, file:Ljava/io/File;
    if-nez p2, :cond_1

    .line 724
    const-string v2, "Utils"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Failed to scan: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 730
    .end local v1           #file:Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 725
    .restart local v1       #file:Ljava/io/File;
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 726
    iget-object v2, p0, Lcom/bv/wifisync/Utils$DeleteFileScanner;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, p2, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 727
    .end local v1           #file:Ljava/io/File;
    :catch_0
    move-exception v0

    .line 728
    .local v0, e:Ljava/lang/Exception;
    iget-object v2, p0, Lcom/bv/wifisync/Utils$DeleteFileScanner;->context:Landroid/content/Context;

    invoke-static {v2, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
