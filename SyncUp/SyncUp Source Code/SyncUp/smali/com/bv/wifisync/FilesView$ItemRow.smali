.class Lcom/bv/wifisync/FilesView$ItemRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "FilesView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/FilesView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ItemRow"
.end annotation


# instance fields
.field private file:Lcom/bv/wifisync/SyncFile;

.field final synthetic this$0:Lcom/bv/wifisync/FilesView;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/FilesView;Lcom/bv/wifisync/SyncFile;)V
    .locals 2
    .parameter
    .parameter "file"

    .prologue
    .line 21
    iput-object p1, p0, Lcom/bv/wifisync/FilesView$ItemRow;->this$0:Lcom/bv/wifisync/FilesView;

    .line 22
    new-instance v0, Ljava/io/File;

    iget-object v1, p2, Lcom/bv/wifisync/SyncFile;->path:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 23
    iput-object p2, p0, Lcom/bv/wifisync/FilesView$ItemRow;->file:Lcom/bv/wifisync/SyncFile;

    .line 24
    return-void
.end method


# virtual methods
.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 3

    .prologue
    .line 39
    iget-object v0, p0, Lcom/bv/wifisync/FilesView$ItemRow;->file:Lcom/bv/wifisync/SyncFile;

    iget-object v0, v0, Lcom/bv/wifisync/SyncFile;->isFolder:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/bv/wifisync/FilesView$ItemRow;->this$0:Lcom/bv/wifisync/FilesView;

    invoke-virtual {v0}, Lcom/bv/wifisync/FilesView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020012

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 43
    :goto_0
    return-object v0

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/FilesView$ItemRow;->file:Lcom/bv/wifisync/SyncFile;

    iget-object v0, v0, Lcom/bv/wifisync/SyncFile;->isFolder:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 42
    iget-object v0, p0, Lcom/bv/wifisync/FilesView$ItemRow;->this$0:Lcom/bv/wifisync/FilesView;

    invoke-virtual {v0}, Lcom/bv/wifisync/FilesView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02001a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    .line 43
    :cond_1
    iget-object v0, p0, Lcom/bv/wifisync/FilesView$ItemRow;->this$0:Lcom/bv/wifisync/FilesView;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/bv/wifisync/FilesView$ItemRow;->file:Lcom/bv/wifisync/SyncFile;

    iget-object v2, v2, Lcom/bv/wifisync/SyncFile;->path:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/bv/wifisync/Utils;->getFileImage(Landroid/content/Context;Ljava/io/File;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 12

    .prologue
    const-wide/16 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 28
    iget-object v1, p0, Lcom/bv/wifisync/FilesView$ItemRow;->this$0:Lcom/bv/wifisync/FilesView;

    const v2, 0x7f06015e

    new-array v3, v9, [Ljava/lang/Object;

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/bv/wifisync/FilesView$ItemRow;->file:Lcom/bv/wifisync/SyncFile;

    iget-object v5, v5, Lcom/bv/wifisync/SyncFile;->path:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-virtual {v1, v2, v3}, Lcom/bv/wifisync/FilesView;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 29
    .local v0, result:Ljava/lang/String;
    iget-object v1, p0, Lcom/bv/wifisync/FilesView$ItemRow;->file:Lcom/bv/wifisync/SyncFile;

    iget-wide v1, v1, Lcom/bv/wifisync/SyncFile;->modifiedTime:J

    cmp-long v1, v1, v10

    if-lez v1, :cond_0

    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/FilesView$ItemRow;->this$0:Lcom/bv/wifisync/FilesView;

    const v3, 0x7f06015f

    new-array v4, v9, [Ljava/lang/Object;

    .line 31
    iget-object v5, p0, Lcom/bv/wifisync/FilesView$ItemRow;->this$0:Lcom/bv/wifisync/FilesView;

    iget-object v6, p0, Lcom/bv/wifisync/FilesView$ItemRow;->file:Lcom/bv/wifisync/SyncFile;

    iget-wide v6, v6, Lcom/bv/wifisync/SyncFile;->modifiedTime:J

    invoke-static {v5, v6, v7}, Lcom/bv/wifisync/Utils;->toDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    .line 30
    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/FilesView;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 32
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/FilesView$ItemRow;->file:Lcom/bv/wifisync/SyncFile;

    iget-wide v1, v1, Lcom/bv/wifisync/SyncFile;->size:J

    cmp-long v1, v1, v10

    if-lez v1, :cond_1

    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bv/wifisync/FilesView$ItemRow;->this$0:Lcom/bv/wifisync/FilesView;

    const v3, 0x7f060160

    new-array v4, v9, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/bv/wifisync/FilesView$ItemRow;->file:Lcom/bv/wifisync/SyncFile;

    iget-wide v5, v5, Lcom/bv/wifisync/SyncFile;->size:J

    invoke-static {v5, v6}, Lcom/bv/wifisync/Utils;->humanReadableSize(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/FilesView;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 34
    :cond_1
    return-object v0
.end method
