.class public Lcom/mpatric/mp3agic/ID3Wrapper;
.super Ljava/lang/Object;
.source "ID3Wrapper.java"


# instance fields
.field private id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

.field private id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;


# direct methods
.method public constructor <init>(Lcom/mpatric/mp3agic/ID3v1;Lcom/mpatric/mp3agic/ID3v2;)V
    .locals 0
    .parameter "id3v1Tag"
    .parameter "id3v2Tag"

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    .line 10
    iput-object p2, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    .line 11
    return-void
.end method


# virtual methods
.method public clearComment()V
    .locals 2

    .prologue
    .line 257
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 258
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    const-string v1, "COMM"

    invoke-interface {v0, v1}, Lcom/mpatric/mp3agic/ID3v2;->clearFrameSet(Ljava/lang/String;)V

    .line 260
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 261
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/mpatric/mp3agic/ID3v1;->setComment(Ljava/lang/String;)V

    .line 263
    :cond_1
    return-void
.end method

.method public clearCopyright()V
    .locals 2

    .prologue
    .line 266
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 267
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    const-string v1, "TCOP"

    invoke-interface {v0, v1}, Lcom/mpatric/mp3agic/ID3v2;->clearFrameSet(Ljava/lang/String;)V

    .line 269
    :cond_0
    return-void
.end method

.method public clearEncoder()V
    .locals 2

    .prologue
    .line 272
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 273
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    const-string v1, "TENC"

    invoke-interface {v0, v1}, Lcom/mpatric/mp3agic/ID3v2;->clearFrameSet(Ljava/lang/String;)V

    .line 275
    :cond_0
    return-void
.end method

.method public getAlbum()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getAlbum()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getAlbum()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getAlbum()Ljava/lang/String;

    move-result-object v0

    .line 84
    :goto_0
    return-object v0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 82
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v1;->getAlbum()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 84
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAlbumImage()[B
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 236
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getAlbumImage()[B

    move-result-object v0

    .line 238
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAlbumImageMimeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 250
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getAlbumImageMimeType()Ljava/lang/String;

    move-result-object v0

    .line 252
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getArtist()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getArtist()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getArtist()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 42
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getArtist()Ljava/lang/String;

    move-result-object v0

    .line 46
    :goto_0
    return-object v0

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 44
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v1;->getArtist()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 46
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getComment()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getComment()Ljava/lang/String;

    move-result-object v0

    .line 151
    :goto_0
    return-object v0

    .line 148
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 149
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v1;->getComment()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 151
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getComposer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 166
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getComposer()Ljava/lang/String;

    move-result-object v0

    .line 168
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCopyright()Ljava/lang/String;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getCopyright()Ljava/lang/String;

    move-result-object v0

    .line 196
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getEncoder()Ljava/lang/String;
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getEncoder()Ljava/lang/String;

    move-result-object v0

    .line 224
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getGenre()I
    .locals 2

    .prologue
    const/4 v0, -0x1

    .line 117
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v1}, Lcom/mpatric/mp3agic/ID3v1;->getGenre()I

    move-result v1

    if-eq v1, v0, :cond_1

    .line 118
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v1;->getGenre()I

    move-result v0

    .line 122
    :cond_0
    :goto_0
    return v0

    .line 119
    :cond_1
    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v1, :cond_0

    .line 120
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getGenre()I

    move-result v0

    goto :goto_0
.end method

.method public getGenreDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v1;->getGenreDescription()Ljava/lang/String;

    move-result-object v0

    .line 141
    :goto_0
    return-object v0

    .line 138
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_1

    .line 139
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getGenreDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 141
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getId3v1Tag()Lcom/mpatric/mp3agic/ID3v1;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    return-object v0
.end method

.method public getId3v2Tag()Lcom/mpatric/mp3agic/ID3v2;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    return-object v0
.end method

.method public getOriginalArtist()Ljava/lang/String;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getOriginalArtist()Ljava/lang/String;

    move-result-object v0

    .line 182
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getTitle()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getTitle()Ljava/lang/String;

    move-result-object v0

    .line 65
    :goto_0
    return-object v0

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 63
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v1;->getTitle()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 65
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTrack()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getTrack()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getTrack()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 23
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getTrack()Ljava/lang/String;

    move-result-object v0

    .line 27
    :goto_0
    return-object v0

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 25
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v1;->getTrack()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 27
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 210
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getYear()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getYear()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getYear()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v2;->getYear()Ljava/lang/String;

    move-result-object v0

    .line 103
    :goto_0
    return-object v0

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 101
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0}, Lcom/mpatric/mp3agic/ID3v1;->getYear()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 103
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAlbum(Ljava/lang/String;)V
    .locals 1
    .parameter "album"

    .prologue
    .line 89
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setAlbum(Ljava/lang/String;)V

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 93
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v1;->setAlbum(Ljava/lang/String;)V

    .line 95
    :cond_1
    return-void
.end method

.method public setAlbumImage([BLjava/lang/String;)V
    .locals 1
    .parameter "albumImage"
    .parameter "mimeType"

    .prologue
    .line 243
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 244
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1, p2}, Lcom/mpatric/mp3agic/ID3v2;->setAlbumImage([BLjava/lang/String;)V

    .line 246
    :cond_0
    return-void
.end method

.method public setArtist(Ljava/lang/String;)V
    .locals 1
    .parameter "artist"

    .prologue
    .line 51
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setArtist(Ljava/lang/String;)V

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 55
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v1;->setArtist(Ljava/lang/String;)V

    .line 57
    :cond_1
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 1
    .parameter "comment"

    .prologue
    .line 156
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setComment(Ljava/lang/String;)V

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 160
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v1;->setComment(Ljava/lang/String;)V

    .line 162
    :cond_1
    return-void
.end method

.method public setComposer(Ljava/lang/String;)V
    .locals 1
    .parameter "composer"

    .prologue
    .line 173
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setComposer(Ljava/lang/String;)V

    .line 176
    :cond_0
    return-void
.end method

.method public setCopyright(Ljava/lang/String;)V
    .locals 1
    .parameter "copyright"

    .prologue
    .line 201
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setCopyright(Ljava/lang/String;)V

    .line 204
    :cond_0
    return-void
.end method

.method public setEncoder(Ljava/lang/String;)V
    .locals 1
    .parameter "encoder"

    .prologue
    .line 229
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 230
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setEncoder(Ljava/lang/String;)V

    .line 232
    :cond_0
    return-void
.end method

.method public setGenre(I)V
    .locals 1
    .parameter "genre"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setGenre(I)V

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 131
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v1;->setGenre(I)V

    .line 133
    :cond_1
    return-void
.end method

.method public setOriginalArtist(Ljava/lang/String;)V
    .locals 1
    .parameter "originalArtist"

    .prologue
    .line 187
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setOriginalArtist(Ljava/lang/String;)V

    .line 190
    :cond_0
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1
    .parameter "title"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setTitle(Ljava/lang/String;)V

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 74
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v1;->setTitle(Ljava/lang/String;)V

    .line 76
    :cond_1
    return-void
.end method

.method public setTrack(Ljava/lang/String;)V
    .locals 1
    .parameter "track"

    .prologue
    .line 32
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 33
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setTrack(Ljava/lang/String;)V

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 36
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v1;->setTrack(Ljava/lang/String;)V

    .line 38
    :cond_1
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 1
    .parameter "url"

    .prologue
    .line 215
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 216
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setUrl(Ljava/lang/String;)V

    .line 218
    :cond_0
    return-void
.end method

.method public setYear(Ljava/lang/String;)V
    .locals 1
    .parameter "year"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v2Tag:Lcom/mpatric/mp3agic/ID3v2;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v2;->setYear(Ljava/lang/String;)V

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    if-eqz v0, :cond_1

    .line 112
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3Wrapper;->id3v1Tag:Lcom/mpatric/mp3agic/ID3v1;

    invoke-interface {v0, p1}, Lcom/mpatric/mp3agic/ID3v1;->setYear(Ljava/lang/String;)V

    .line 114
    :cond_1
    return-void
.end method
