.class public Lcom/bv/sync/ExtensionFilter;
.super Ljava/lang/Object;
.source "ExtensionFilter.java"

# interfaces
.implements Lcom/bv/sync/IFileFilter;


# instance fields
.field private final action:Lcom/bv/sync/IFileFilter$Action;

.field private final expressions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/util/regex/Pattern;",
            ">;"
        }
    .end annotation
.end field

.field private final extensions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;)V
    .locals 4
    .parameter
    .parameter "action"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/bv/sync/IFileFilter$Action;",
            ")V"
        }
    .end annotation

    .prologue
    .line 14
    .local p1, extensions:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/bv/sync/ExtensionFilter;->extensions:Ljava/util/Set;

    .line 11
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/bv/sync/ExtensionFilter;->expressions:Ljava/util/Set;

    .line 15
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 20
    iput-object p2, p0, Lcom/bv/sync/ExtensionFilter;->action:Lcom/bv/sync/IFileFilter$Action;

    .line 21
    return-void

    .line 15
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 16
    .local v0, extension:Ljava/lang/String;
    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 17
    iget-object v2, p0, Lcom/bv/sync/ExtensionFilter;->extensions:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 19
    :cond_1
    iget-object v2, p0, Lcom/bv/sync/ExtensionFilter;->expressions:Ljava/util/Set;

    invoke-static {v0}, Lcom/bv/sync/ExtensionFilter;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public static compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    .locals 5
    .parameter "glob"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/regex/PatternSyntaxException;
        }
    .end annotation

    .prologue
    .line 58
    const-string v2, "^"

    .line 59
    .local v2, result:Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v1, v3, :cond_0

    .line 78
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v4, 0x24

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-static {v3, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v3

    return-object v3

    .line 60
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 61
    .local v0, c:C
    sparse-switch v0, :sswitch_data_0

    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 59
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 63
    :sswitch_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ".*"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 64
    goto :goto_1

    .line 66
    :sswitch_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v4, 0x2e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 67
    goto :goto_1

    .line 69
    :sswitch_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "\\."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 70
    goto :goto_1

    .line 72
    :sswitch_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "\\\\"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 73
    goto :goto_1

    .line 61
    nop

    :sswitch_data_0
    .sparse-switch
        0x2a -> :sswitch_0
        0x2e -> :sswitch_2
        0x3f -> :sswitch_1
        0x5c -> :sswitch_3
    .end sparse-switch
.end method

.method private getExtension(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "name"

    .prologue
    .line 47
    const-string v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 48
    .local v1, index:I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 49
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 50
    .local v0, end:I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2f

    if-ne v2, v3, :cond_0

    .line 51
    add-int/lit8 v0, v0, -0x1

    .line 52
    :cond_0
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 54
    .end local v0           #end:I
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private matches(Lcom/bv/sync/IFile;)Z
    .locals 6
    .parameter "file"

    .prologue
    const/4 v3, 0x1

    .line 34
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v2

    .line 35
    .local v2, name:Ljava/lang/String;
    iget-object v4, p0, Lcom/bv/sync/ExtensionFilter;->extensions:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    if-eqz v4, :cond_0

    .line 36
    invoke-direct {p0, v2}, Lcom/bv/sync/ExtensionFilter;->getExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 37
    .local v1, extension:Ljava/lang/String;
    if-eqz v1, :cond_0

    iget-object v4, p0, Lcom/bv/sync/ExtensionFilter;->extensions:Ljava/util/Set;

    invoke-interface {v4, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 43
    .end local v1           #extension:Ljava/lang/String;
    :goto_0
    return v3

    .line 40
    :cond_0
    iget-object v4, p0, Lcom/bv/sync/ExtensionFilter;->expressions:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 43
    const/4 v3, 0x0

    goto :goto_0

    .line 40
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/regex/Pattern;

    .line 41
    .local v0, expression:Ljava/util/regex/Pattern;
    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_0
.end method


# virtual methods
.method public accept(Lcom/bv/sync/IFile;)Z
    .locals 4
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 25
    iget-object v2, p0, Lcom/bv/sync/ExtensionFilter;->action:Lcom/bv/sync/IFileFilter$Action;

    sget-object v3, Lcom/bv/sync/IFileFilter$Action;->Include:Lcom/bv/sync/IFileFilter$Action;

    if-ne v2, v3, :cond_0

    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 30
    :goto_0
    return v1

    .line 27
    :cond_0
    invoke-direct {p0, p1}, Lcom/bv/sync/ExtensionFilter;->matches(Lcom/bv/sync/IFile;)Z

    move-result v0

    .line 28
    .local v0, result:Z
    iget-object v2, p0, Lcom/bv/sync/ExtensionFilter;->action:Lcom/bv/sync/IFileFilter$Action;

    sget-object v3, Lcom/bv/sync/IFileFilter$Action;->Exclude:Lcom/bv/sync/IFileFilter$Action;

    if-ne v2, v3, :cond_1

    .line 29
    if-eqz v0, :cond_2

    const/4 v0, 0x0

    :cond_1
    :goto_1
    move v1, v0

    .line 30
    goto :goto_0

    :cond_2
    move v0, v1

    .line 29
    goto :goto_1
.end method
