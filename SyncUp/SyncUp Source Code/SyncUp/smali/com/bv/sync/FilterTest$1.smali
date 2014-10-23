.class Lcom/bv/sync/FilterTest$1;
.super Lcom/bv/sync/ExtensionFilter;
.source "FilterTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/FilterTest;->testExtensionsFilter(Lcom/bv/sync/IFileFilter$Action;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/FilterTest;


# direct methods
.method constructor <init>(Lcom/bv/sync/FilterTest;Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;)V
    .locals 0
    .parameter
    .parameter
    .parameter "$anonymous1"

    .prologue
    .line 1
    .local p2, $anonymous0:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/bv/sync/FilterTest$1;->this$0:Lcom/bv/sync/FilterTest;

    .line 179
    invoke-direct {p0, p2, p3}, Lcom/bv/sync/ExtensionFilter;-><init>(Ljava/util/Set;Lcom/bv/sync/IFileFilter$Action;)V

    return-void
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
    .line 182
    invoke-super {p0, p1}, Lcom/bv/sync/ExtensionFilter;->accept(Lcom/bv/sync/IFile;)Z

    move-result v0

    .line 183
    .local v0, result:Z
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Accept "

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

    .line 184
    return v0
.end method
