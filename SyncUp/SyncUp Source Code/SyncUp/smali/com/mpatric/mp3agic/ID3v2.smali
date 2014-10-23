.class public interface abstract Lcom/mpatric/mp3agic/ID3v2;
.super Ljava/lang/Object;
.source "ID3v2.java"

# interfaces
.implements Lcom/mpatric/mp3agic/ID3v1;


# virtual methods
.method public abstract clearFrameSet(Ljava/lang/String;)V
.end method

.method public abstract getAlbumImage()[B
.end method

.method public abstract getAlbumImageMimeType()Ljava/lang/String;
.end method

.method public abstract getComposer()Ljava/lang/String;
.end method

.method public abstract getCopyright()Ljava/lang/String;
.end method

.method public abstract getDataLength()I
.end method

.method public abstract getEncoder()Ljava/lang/String;
.end method

.method public abstract getFrameSets()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/mpatric/mp3agic/ID3v2FrameSet;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getItunesComment()Ljava/lang/String;
.end method

.method public abstract getLength()I
.end method

.method public abstract getObseleteFormat()Z
.end method

.method public abstract getOriginalArtist()Ljava/lang/String;
.end method

.method public abstract getPadding()Z
.end method

.method public abstract getPublisher()Ljava/lang/String;
.end method

.method public abstract getUrl()Ljava/lang/String;
.end method

.method public abstract hasFooter()Z
.end method

.method public abstract hasUnsynchronisation()Z
.end method

.method public abstract setAlbumImage([BLjava/lang/String;)V
.end method

.method public abstract setComposer(Ljava/lang/String;)V
.end method

.method public abstract setCopyright(Ljava/lang/String;)V
.end method

.method public abstract setEncoder(Ljava/lang/String;)V
.end method

.method public abstract setFooter(Z)V
.end method

.method public abstract setItunesComment(Ljava/lang/String;)V
.end method

.method public abstract setOriginalArtist(Ljava/lang/String;)V
.end method

.method public abstract setPadding(Z)V
.end method

.method public abstract setPublisher(Ljava/lang/String;)V
.end method

.method public abstract setUnsynchronisation(Z)V
.end method

.method public abstract setUrl(Ljava/lang/String;)V
.end method
