.class interface abstract Lcom/bv/sync/FileManagerTest$Action;
.super Ljava/lang/Object;
.source "FileManagerTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/FileManagerTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "Action"
.end annotation


# virtual methods
.method public abstract execute([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/bv/sync/IFile;",
            "Lcom/bv/sync/IFile;",
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/SyncItem;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
