.class public Lcom/mpatric/mp3agic/FileWrapper;
.super Ljava/lang/Object;
.source "FileWrapper.java"


# instance fields
.field protected file:Ljava/io/File;

.field protected filename:Ljava/lang/String;

.field protected lastModified:J

.field protected length:J


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .parameter "filename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/mpatric/mp3agic/FileWrapper;->filename:Ljava/lang/String;

    .line 19
    invoke-direct {p0}, Lcom/mpatric/mp3agic/FileWrapper;->init()V

    .line 20
    iget-object v0, p0, Lcom/mpatric/mp3agic/FileWrapper;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mpatric/mp3agic/FileWrapper;->length:J

    .line 21
    iget-object v0, p0, Lcom/mpatric/mp3agic/FileWrapper;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mpatric/mp3agic/FileWrapper;->lastModified:J

    .line 22
    return-void
.end method

.method private init()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/mpatric/mp3agic/FileWrapper;->filename:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mpatric/mp3agic/FileWrapper;->file:Ljava/io/File;

    .line 26
    iget-object v0, p0, Lcom/mpatric/mp3agic/FileWrapper;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "File not found "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/mpatric/mp3agic/FileWrapper;->filename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/FileWrapper;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/io/IOException;

    const-string v1, "File not readable"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 28
    :cond_1
    return-void
.end method


# virtual methods
.method public getFilename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mpatric/mp3agic/FileWrapper;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getLastModified()J
    .locals 2

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/mpatric/mp3agic/FileWrapper;->lastModified:J

    return-wide v0
.end method

.method public getLength()J
    .locals 2

    .prologue
    .line 35
    iget-wide v0, p0, Lcom/mpatric/mp3agic/FileWrapper;->length:J

    return-wide v0
.end method
