.class Lcom/bv/wifisync/SyncFile;
.super Ljava/lang/Object;
.source "SyncFile.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x3f67e3564c9ccf6fL


# instance fields
.field final isFolder:Ljava/lang/Boolean;

.field final modifiedTime:J

.field final path:Ljava/lang/String;

.field final size:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JJZ)V
    .locals 1
    .parameter "path"
    .parameter "size"
    .parameter "modifiedTime"
    .parameter "isFolder"

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/bv/wifisync/SyncFile;->path:Ljava/lang/String;

    .line 20
    iput-wide p2, p0, Lcom/bv/wifisync/SyncFile;->size:J

    .line 21
    iput-wide p4, p0, Lcom/bv/wifisync/SyncFile;->modifiedTime:J

    .line 22
    invoke-static {p6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/wifisync/SyncFile;->isFolder:Ljava/lang/Boolean;

    .line 23
    return-void
.end method

.method public static read(Ljava/io/File;)Ljava/util/List;
    .locals 1
    .parameter "file"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/SyncFile;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/StreamCorruptedException;,
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 27
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/bv/wifisync/Utils;->readObjectFromFile(Ljava/io/File;Z)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method
