.class final Lcom/bv/sync/FilterTest$TestFileFilter;
.super Lcom/bv/sync/FileFilter;
.source "FilterTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/FilterTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "TestFileFilter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/FilterTest;


# direct methods
.method public varargs constructor <init>(Lcom/bv/sync/FilterTest;Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V
    .locals 0
    .parameter
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
    .line 242
    .local p2, paths:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/bv/sync/FilterTest$TestFileFilter;->this$0:Lcom/bv/sync/FilterTest;

    .line 243
    invoke-direct {p0, p2, p3, p4}, Lcom/bv/sync/FileFilter;-><init>(Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;[Lcom/bv/sync/IFile;)V

    .line 244
    return-void
.end method


# virtual methods
.method public accept(Lcom/bv/sync/IFile;)Z
    .locals 4
    .parameter "file"

    .prologue
    .line 248
    invoke-super {p0, p1}, Lcom/bv/sync/FileFilter;->accept(Lcom/bv/sync/IFile;)Z

    move-result v0

    .line 249
    .local v0, result:Z
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Accepting "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 250
    return v0
.end method

.method protected getFilePath(Lcom/bv/sync/IFile;)Ljava/lang/String;
    .locals 2
    .parameter "file"

    .prologue
    .line 255
    invoke-super {p0, p1}, Lcom/bv/sync/FileFilter;->getFilePath(Lcom/bv/sync/IFile;)Ljava/lang/String;

    move-result-object v0

    .line 256
    .local v0, result:Ljava/lang/String;
    invoke-static {}, Lcom/bv/sync/Utils;->isWindows()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 257
    invoke-static {v0}, Lcom/bv/sync/FilterTest;->replaceSeparator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 258
    :cond_0
    return-object v0
.end method
