.class public Lcom/bv/sync/TestUtils;
.super Ljava/lang/Object;
.source "TestUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/TestUtils$FileComparator;,
        Lcom/bv/sync/TestUtils$TestProgress;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static createFile(Lcom/bv/sync/IFile;Ljava/lang/String;Ljava/lang/String;)Lcom/bv/sync/IFile;
    .locals 3
    .parameter "dir"
    .parameter "name"
    .parameter "content"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-interface {p0, p1}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 51
    .local v0, result:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 53
    .local v1, stream:Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 57
    return-object v0

    .line 54
    :catchall_0
    move-exception v2

    .line 55
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 56
    throw v2
.end method

.method static exec(Ljava/lang/String;)V
    .locals 5
    .parameter "command"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v1

    .line 72
    .local v1, process:Ljava/lang/Process;
    invoke-virtual {v1}, Ljava/lang/Process;->waitFor()I

    move-result v0

    .line 73
    .local v0, exitCode:I
    if-eqz v0, :cond_0

    .line 74
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Failed to execute command: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", exit code: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 75
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v2

    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-static {v2, v3}, Lcom/bv/sync/TestUtils;->printStream(Ljava/io/InputStream;Ljava/io/PrintStream;)V

    .line 76
    invoke-virtual {v1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v2, v3}, Lcom/bv/sync/TestUtils;->printStream(Ljava/io/InputStream;Ljava/io/PrintStream;)V

    .line 77
    return-void
.end method

.method private static printStream(Ljava/io/InputStream;Ljava/io/PrintStream;)V
    .locals 4
    .parameter "stream"
    .parameter "printStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    const/16 v2, 0x400

    new-array v0, v2, [B

    .line 81
    .local v0, buffer:[B
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 82
    .local v1, size:I
    if-lez v1, :cond_0

    .line 83
    new-instance v2, Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3, v1}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {p1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 84
    :cond_0
    return-void
.end method

.method static remove(Lcom/bv/sync/IFile;Ljava/util/List;)V
    .locals 4
    .parameter "file"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/IFile;",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/IFile;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    .local p1, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/sync/IFile;>;"
    invoke-interface {p0}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 41
    invoke-interface {p0}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v3, :cond_2

    .line 43
    :cond_0
    invoke-interface {p0}, Lcom/bv/sync/IFile;->delete()V

    .line 44
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Test deleting: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 45
    if-eqz p1, :cond_1

    .line 46
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    :cond_1
    return-void

    .line 41
    :cond_2
    aget-object v0, v2, v1

    .line 42
    .local v0, child:Lcom/bv/sync/IFile;
    invoke-static {v0, p1}, Lcom/bv/sync/TestUtils;->remove(Lcom/bv/sync/IFile;Ljava/util/List;)V

    .line 41
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static remove([Lcom/bv/sync/IFile;)V
    .locals 4
    .parameter "files"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    if-eqz p0, :cond_0

    .line 35
    array-length v2, p0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_1

    .line 37
    :cond_0
    return-void

    .line 35
    :cond_1
    aget-object v0, p0, v1

    .line 36
    .local v0, file:Lcom/bv/sync/IFile;
    const/4 v3, 0x0

    invoke-static {v0, v3}, Lcom/bv/sync/TestUtils;->remove(Lcom/bv/sync/IFile;Ljava/util/List;)V

    .line 35
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method static varargs wipe([Lcom/bv/sync/IFile;)V
    .locals 4
    .parameter "dirs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    array-length v2, p0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_0

    .line 31
    return-void

    .line 29
    :cond_0
    aget-object v0, p0, v1

    .line 30
    .local v0, dir:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v3

    invoke-static {v3}, Lcom/bv/sync/TestUtils;->remove([Lcom/bv/sync/IFile;)V

    .line 29
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
