.class Lcom/bv/sync/DeleteTest$TestSync;
.super Lcom/bv/sync/CifsSync;
.source "DeleteTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/DeleteTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TestSync"
.end annotation


# direct methods
.method public constructor <init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V
    .locals 0
    .parameter "options"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bv/sync/CifsSync$Options;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 23
    .local p2, trackDeletions:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/CifsSync;-><init>(Lcom/bv/sync/CifsSync$Options;Ljava/util/Map;)V

    .line 24
    return-void
.end method


# virtual methods
.method normalizePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "absolutePath"

    .prologue
    .line 28
    invoke-super {p0, p1}, Lcom/bv/sync/CifsSync;->normalizePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/bv/sync/DeleteTest;->replaceSeparator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected trackDeletions()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Left count: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/bv/sync/DeleteTest$TestSync;->leftCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 34
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Right count: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/bv/sync/DeleteTest$TestSync;->rightCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 35
    invoke-super {p0}, Lcom/bv/sync/CifsSync;->trackDeletions()V

    .line 36
    return-void
.end method
