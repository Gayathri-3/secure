.class public Lcom/bv/sync/Mp3Scanner;
.super Ljava/lang/Object;
.source "Mp3Scanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/Mp3Scanner$DefaultParser;,
        Lcom/bv/sync/Mp3Scanner$FieldType;,
        Lcom/bv/sync/Mp3Scanner$Options;,
        Lcom/bv/sync/Mp3Scanner$Parser;
    }
.end annotation


# instance fields
.field private final changed:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/bv/sync/MovedItem;",
            ">;"
        }
    .end annotation
.end field

.field private fileIndex:I

.field private filesCount:I

.field private final parser:Lcom/bv/sync/Mp3Scanner$Parser;

.field private progressNotification:Lcom/bv/sync/ProgressNotification;

.field private root:Lcom/bv/sync/IFile;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bv/sync/Mp3Scanner;->changed:Ljava/util/List;

    .line 77
    new-instance v0, Lcom/bv/sync/Mp3Scanner$DefaultParser;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/bv/sync/Mp3Scanner$DefaultParser;-><init>(Lcom/bv/sync/Mp3Scanner;Lcom/bv/sync/Mp3Scanner$DefaultParser;)V

    iput-object v0, p0, Lcom/bv/sync/Mp3Scanner;->parser:Lcom/bv/sync/Mp3Scanner$Parser;

    .line 78
    return-void
.end method

.method constructor <init>(Lcom/bv/sync/Mp3Scanner$Parser;)V
    .locals 1
    .parameter "parser"

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bv/sync/Mp3Scanner;->changed:Ljava/util/List;

    .line 81
    iput-object p1, p0, Lcom/bv/sync/Mp3Scanner;->parser:Lcom/bv/sync/Mp3Scanner$Parser;

    .line 82
    return-void
.end method

.method private append(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "path"
    .parameter "name"

    .prologue
    .line 206
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 208
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 209
    return-object p1
.end method

.method private buildPath(Lcom/bv/sync/IFile;Lcom/bv/sync/Mp3Scanner$Options;)Ljava/lang/String;
    .locals 5
    .parameter "file"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    const-string v2, ""

    .line 179
    .local v2, result:Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/sync/Mp3Scanner;->parser:Lcom/bv/sync/Mp3Scanner$Parser;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/bv/sync/Mp3Scanner$Parser;->parse(Ljava/lang/String;)V

    .line 181
    const/4 v1, 0x0

    .line 182
    .local v1, name:Ljava/lang/String;
    iget-boolean v3, p2, Lcom/bv/sync/Mp3Scanner$Options;->groupByArtist:Z

    if-eqz v3, :cond_0

    .line 183
    iget-object v3, p0, Lcom/bv/sync/Mp3Scanner;->parser:Lcom/bv/sync/Mp3Scanner$Parser;

    sget-object v4, Lcom/bv/sync/Mp3Scanner$FieldType;->Artist:Lcom/bv/sync/Mp3Scanner$FieldType;

    invoke-interface {v3, v4}, Lcom/bv/sync/Mp3Scanner$Parser;->getField(Lcom/bv/sync/Mp3Scanner$FieldType;)Ljava/lang/String;

    move-result-object v0

    .local v0, field:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 184
    invoke-static {v0}, Lcom/bv/sync/Utils;->isValidFileName(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 185
    invoke-direct {p0, v2, v0}, Lcom/bv/sync/Mp3Scanner;->append(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 186
    .end local v0           #field:Ljava/lang/String;
    :cond_0
    iget-boolean v3, p2, Lcom/bv/sync/Mp3Scanner$Options;->groupByAlbum:Z

    if-eqz v3, :cond_1

    .line 187
    iget-object v3, p0, Lcom/bv/sync/Mp3Scanner;->parser:Lcom/bv/sync/Mp3Scanner$Parser;

    sget-object v4, Lcom/bv/sync/Mp3Scanner$FieldType;->Album:Lcom/bv/sync/Mp3Scanner$FieldType;

    invoke-interface {v3, v4}, Lcom/bv/sync/Mp3Scanner$Parser;->getField(Lcom/bv/sync/Mp3Scanner$FieldType;)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #field:Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 188
    invoke-static {v0}, Lcom/bv/sync/Utils;->isValidFileName(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 189
    invoke-direct {p0, v2, v0}, Lcom/bv/sync/Mp3Scanner;->append(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 190
    .end local v0           #field:Ljava/lang/String;
    :cond_1
    iget-boolean v3, p2, Lcom/bv/sync/Mp3Scanner$Options;->renameSongs:Z

    if-eqz v3, :cond_2

    .line 191
    iget-object v3, p0, Lcom/bv/sync/Mp3Scanner;->parser:Lcom/bv/sync/Mp3Scanner$Parser;

    sget-object v4, Lcom/bv/sync/Mp3Scanner$FieldType;->Title:Lcom/bv/sync/Mp3Scanner$FieldType;

    invoke-interface {v3, v4}, Lcom/bv/sync/Mp3Scanner$Parser;->getField(Lcom/bv/sync/Mp3Scanner$FieldType;)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #field:Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 192
    invoke-static {v0}, Lcom/bv/sync/Utils;->isValidFileName(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 193
    move-object v1, v0

    .line 195
    .end local v0           #field:Ljava/lang/String;
    :cond_2
    if-eqz v1, :cond_5

    .line 196
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ".mp3"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/bv/sync/Mp3Scanner;->append(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 200
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 201
    :cond_3
    const/4 v2, 0x0

    .line 202
    .end local v2           #result:Ljava/lang/String;
    :cond_4
    return-object v2

    .line 198
    .restart local v2       #result:Ljava/lang/String;
    :cond_5
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/bv/sync/Mp3Scanner;->append(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private calculateFiles(Lcom/bv/sync/IFile;)I
    .locals 6
    .parameter "dir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    const/4 v1, 0x0

    .line 99
    .local v1, result:I
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_0

    .line 103
    return v1

    .line 99
    :cond_0
    aget-object v0, v3, v2

    .line 100
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-interface {v0}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/bv/sync/Mp3Scanner;->isMp3(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 101
    add-int/lit8 v1, v1, 0x1

    .line 99
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private getType(Lcom/bv/sync/IFile;)Lcom/bv/sync/SyncItem$Type;
    .locals 1
    .parameter "result"

    .prologue
    .line 148
    instance-of v0, p1, Lcom/bv/sync/RemoteFile;

    if-eqz v0, :cond_0

    .line 149
    sget-object v0, Lcom/bv/sync/SyncItem$Type;->RemoteFile:Lcom/bv/sync/SyncItem$Type;

    .line 150
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/bv/sync/SyncItem$Type;->LocalFile:Lcom/bv/sync/SyncItem$Type;

    goto :goto_0
.end method

.method private static isMp3(Ljava/lang/String;)Z
    .locals 2
    .parameter "path"

    .prologue
    .line 107
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".mp3"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private mkDirs(Ljava/lang/String;)Lcom/bv/sync/IFile;
    .locals 6
    .parameter "destination"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 154
    new-instance v3, Ljava/util/StringTokenizer;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-direct {v3, p1, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .local v3, tokenizer:Ljava/util/StringTokenizer;
    iget-object v2, p0, Lcom/bv/sync/Mp3Scanner;->root:Lcom/bv/sync/IFile;

    .line 156
    .local v2, result:Lcom/bv/sync/IFile;
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 157
    .local v1, dirs:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :goto_0
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-nez v4, :cond_1

    .line 160
    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 161
    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 166
    return-object v2

    .line 158
    :cond_1
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 161
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 162
    .local v0, dir:Ljava/lang/String;
    invoke-interface {v2, v0}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v2

    .line 163
    invoke-interface {v2}, Lcom/bv/sync/IFile;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 164
    invoke-interface {v2}, Lcom/bv/sync/IFile;->mkdir()V

    goto :goto_1
.end method

.method private move(Lcom/bv/sync/IFile;Ljava/lang/String;)V
    .locals 13
    .parameter "source"
    .parameter "destination"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-direct {p0, p2}, Lcom/bv/sync/Mp3Scanner;->mkDirs(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v9

    .line 139
    .local v9, folder:Lcom/bv/sync/IFile;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    .line 140
    .local v10, name:Ljava/lang/String;
    invoke-interface {v9, v10}, Lcom/bv/sync/IFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;

    move-result-object v11

    .line 141
    .local v11, result:Lcom/bv/sync/IFile;
    invoke-interface {v11}, Lcom/bv/sync/IFile;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 142
    invoke-interface {p1, v11}, Lcom/bv/sync/IFile;->renameTo(Lcom/bv/sync/IFile;)V

    .line 143
    iget-object v12, p0, Lcom/bv/sync/Mp3Scanner;->changed:Ljava/util/List;

    new-instance v0, Lcom/bv/sync/MovedItem;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    invoke-direct {p0, p1}, Lcom/bv/sync/Mp3Scanner;->getType(Lcom/bv/sync/IFile;)Lcom/bv/sync/SyncItem$Type;

    move-result-object v4

    invoke-interface {p1}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v5

    invoke-interface {v11}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Lcom/bv/sync/MovedItem;-><init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JLjava/lang/String;Z)V

    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    :cond_0
    return-void
.end method

.method private process([Lcom/bv/sync/IFile;Lcom/bv/sync/Mp3Scanner$Options;)V
    .locals 4
    .parameter "files"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_1

    .line 114
    :cond_0
    return-void

    .line 111
    :cond_1
    aget-object v0, p1, v1

    .line 112
    .local v0, file:Lcom/bv/sync/IFile;
    invoke-direct {p0, v0, p2}, Lcom/bv/sync/Mp3Scanner;->process(Lcom/bv/sync/IFile;Lcom/bv/sync/Mp3Scanner$Options;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 111
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private process(Lcom/bv/sync/IFile;Lcom/bv/sync/Mp3Scanner$Options;)Z
    .locals 3
    .parameter "file"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    const/4 v1, 0x1

    .line 118
    .local v1, result:Z
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isFile()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/bv/sync/Mp3Scanner;->isMp3(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 119
    iget-object v2, p0, Lcom/bv/sync/Mp3Scanner;->progressNotification:Lcom/bv/sync/ProgressNotification;

    if-eqz v2, :cond_0

    .line 120
    iget v2, p0, Lcom/bv/sync/Mp3Scanner;->fileIndex:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/bv/sync/Mp3Scanner;->fileIndex:I

    invoke-direct {p0, p1, v2}, Lcom/bv/sync/Mp3Scanner;->updateProgress(Lcom/bv/sync/IFile;I)Z

    move-result v1

    .line 121
    :cond_0
    if-eqz v1, :cond_1

    .line 122
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/Mp3Scanner;->buildPath(Lcom/bv/sync/IFile;Lcom/bv/sync/Mp3Scanner$Options;)Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, newFile:Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 124
    invoke-direct {p0, p1, v0}, Lcom/bv/sync/Mp3Scanner;->move(Lcom/bv/sync/IFile;Ljava/lang/String;)V

    .line 127
    .end local v0           #newFile:Ljava/lang/String;
    :cond_1
    return v1
.end method

.method private updateProgress(Lcom/bv/sync/IFile;I)Z
    .locals 3
    .parameter "file"
    .parameter "index"

    .prologue
    .line 131
    const/4 v0, 0x0

    .line 132
    .local v0, progress:I
    iget v1, p0, Lcom/bv/sync/Mp3Scanner;->filesCount:I

    if-eqz v1, :cond_0

    .line 133
    int-to-float v1, p2

    iget v2, p0, Lcom/bv/sync/Mp3Scanner;->filesCount:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x42c8

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 134
    :cond_0
    iget-object v1, p0, Lcom/bv/sync/Mp3Scanner;->progressNotification:Lcom/bv/sync/ProgressNotification;

    sget-object v2, Lcom/bv/sync/ProgressNotification$ProgressAction;->Grouping:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-interface {v1, v2, v0, p1}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    move-result v1

    return v1
.end method


# virtual methods
.method public getChanged()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/MovedItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lcom/bv/sync/Mp3Scanner;->changed:Ljava/util/List;

    return-object v0
.end method

.method public run(Lcom/bv/sync/IFile;Lcom/bv/sync/Mp3Scanner$Options;Lcom/bv/sync/ProgressNotification;)V
    .locals 1
    .parameter "dir"
    .parameter "options"
    .parameter "progressNotification"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    iput-object p3, p0, Lcom/bv/sync/Mp3Scanner;->progressNotification:Lcom/bv/sync/ProgressNotification;

    .line 86
    iput-object p1, p0, Lcom/bv/sync/Mp3Scanner;->root:Lcom/bv/sync/IFile;

    .line 87
    const/4 v0, 0x0

    iput v0, p0, Lcom/bv/sync/Mp3Scanner;->fileIndex:I

    .line 88
    iget-object v0, p0, Lcom/bv/sync/Mp3Scanner;->changed:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 89
    invoke-direct {p0, p1}, Lcom/bv/sync/Mp3Scanner;->calculateFiles(Lcom/bv/sync/IFile;)I

    move-result v0

    iput v0, p0, Lcom/bv/sync/Mp3Scanner;->filesCount:I

    .line 90
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/bv/sync/Mp3Scanner;->process([Lcom/bv/sync/IFile;Lcom/bv/sync/Mp3Scanner$Options;)V

    .line 91
    return-void
.end method
