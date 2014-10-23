.class public Lcom/bv/sync/DateFilter;
.super Ljava/lang/Object;
.source "DateFilter.java"

# interfaces
.implements Lcom/bv/sync/IFileFilter;


# instance fields
.field private final action:Lcom/bv/sync/IFileFilter$Action;

.field private final date:J


# direct methods
.method public constructor <init>(JLcom/bv/sync/IFileFilter$Action;)V
    .locals 0
    .parameter "date"
    .parameter "action"

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-wide p1, p0, Lcom/bv/sync/DateFilter;->date:J

    .line 11
    iput-object p3, p0, Lcom/bv/sync/DateFilter;->action:Lcom/bv/sync/IFileFilter$Action;

    .line 12
    return-void
.end method


# virtual methods
.method public accept(Lcom/bv/sync/IFile;)Z
    .locals 7
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 16
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 19
    :goto_0
    return v1

    .line 18
    :cond_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/bv/sync/DateFilter;->date:J

    cmp-long v3, v3, v5

    if-ltz v3, :cond_1

    move v0, v1

    .line 19
    .local v0, result:Z
    :goto_1
    iget-object v3, p0, Lcom/bv/sync/DateFilter;->action:Lcom/bv/sync/IFileFilter$Action;

    sget-object v4, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    if-ne v3, v4, :cond_2

    .end local v0           #result:Z
    :goto_2
    move v1, v0

    goto :goto_0

    :cond_1
    move v0, v2

    .line 18
    goto :goto_1

    .line 19
    .restart local v0       #result:Z
    :cond_2
    if-eqz v0, :cond_3

    move v0, v2

    goto :goto_2

    :cond_3
    move v0, v1

    goto :goto_2
.end method
