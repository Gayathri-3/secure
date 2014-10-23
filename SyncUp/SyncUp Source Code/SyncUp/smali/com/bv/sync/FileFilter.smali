.class public Lcom/bv/sync/FileFilter;
.super Ljava/lang/Object;
.source "FileFilter.java"

# interfaces
.implements Lcom/bv/sync/IFileFilter;


# instance fields
.field private final action:Lcom/bv/sync/IFileFilter$Action;

.field private final paths:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final roots:[Lcom/bv/sync/IFile;


# direct methods
.method public varargs constructor <init>(Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V
    .locals 0
    .parameter
    .parameter "action"
    .parameter "roots"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/bv/sync/IFileFilter$Action;",
            "[",
            "Lcom/bv/sync/IFile;",
            ")V"
        }
    .end annotation

    .prologue
    .line 10
    .local p1, paths:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p3, p0, Lcom/bv/sync/FileFilter;->roots:[Lcom/bv/sync/IFile;

    .line 12
    iput-object p1, p0, Lcom/bv/sync/FileFilter;->paths:Ljava/util/Set;

    .line 13
    iput-object p2, p0, Lcom/bv/sync/FileFilter;->action:Lcom/bv/sync/IFileFilter$Action;

    .line 14
    return-void
.end method

.method private isParent(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .parameter "path"
    .parameter "child"

    .prologue
    .line 49
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private matches(Ljava/lang/String;)Z
    .locals 4
    .parameter "relativePath"

    .prologue
    const/4 v1, 0x1

    .line 34
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 39
    :cond_0
    :goto_0
    return v1

    .line 36
    :cond_1
    iget-object v2, p0, Lcom/bv/sync/FileFilter;->paths:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_3

    .line 39
    const/4 v1, 0x0

    goto :goto_0

    .line 36
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 37
    .local v0, path:Ljava/lang/String;
    invoke-direct {p0, p1, v0}, Lcom/bv/sync/FileFilter;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-direct {p0, v0, p1}, Lcom/bv/sync/FileFilter;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0
.end method

.method private matches(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .parameter "relativePath"
    .parameter "path"

    .prologue
    .line 43
    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 44
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 45
    invoke-direct {p0, p2, p1}, Lcom/bv/sync/FileFilter;->isParent(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 43
    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public accept(Lcom/bv/sync/IFile;)Z
    .locals 3
    .parameter "file"

    .prologue
    .line 18
    invoke-virtual {p0, p1}, Lcom/bv/sync/FileFilter;->getRelativePath(Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v0

    .line 19
    .local v0, relativePath:Ljava/lang/String;
    iget-object v1, p0, Lcom/bv/sync/FileFilter;->action:Lcom/bv/sync/IFileFilter$Action;

    sget-object v2, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/bv/sync/FileFilter;->paths:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/bv/sync/FileFilter;->action:Lcom/bv/sync/IFileFilter$Action;

    sget-object v2, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    if-ne v1, v2, :cond_1

    invoke-direct {p0, v0}, Lcom/bv/sync/FileFilter;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 19
    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected getFilePath(Lcom/bv/sync/IFile;)Ljava/lang/String;
    .locals 1
    .parameter "file"

    .prologue
    .line 53
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getRelativePath(Lcom/bv/sync/IFile;)Ljava/lang/String;
    .locals 7
    .parameter "file"

    .prologue
    .line 24
    const/4 v0, 0x0

    .line 25
    .local v0, result:Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/sync/FileFilter;->roots:[Lcom/bv/sync/IFile;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_1

    .line 30
    :cond_0
    return-object v0

    .line 25
    :cond_1
    aget-object v1, v3, v2

    .line 26
    .local v1, root:Lcom/bv/sync/IFile;
    invoke-virtual {p0, p1}, Lcom/bv/sync/FileFilter;->getFilePath(Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v1}, Lcom/bv/sync/FileFilter;->getFilePath(Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/bv/sync/CifsSync;->getRelativePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 27
    if-nez v0, :cond_0

    .line 25
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method
