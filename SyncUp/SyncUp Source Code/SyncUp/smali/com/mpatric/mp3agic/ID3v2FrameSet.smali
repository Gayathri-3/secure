.class public Lcom/mpatric/mp3agic/ID3v2FrameSet;
.super Ljava/lang/Object;
.source "ID3v2FrameSet.java"


# instance fields
.field private frames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mpatric/mp3agic/ID3v2Frame;",
            ">;"
        }
    .end annotation
.end field

.field private id:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "id"

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->id:Ljava/lang/String;

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->frames:Ljava/util/ArrayList;

    .line 14
    return-void
.end method


# virtual methods
.method public addFrame(Lcom/mpatric/mp3agic/ID3v2Frame;)V
    .locals 1
    .parameter "frame"

    .prologue
    .line 25
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->frames:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->frames:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 22
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 38
    instance-of v3, p1, Lcom/mpatric/mp3agic/ID3v2FrameSet;

    if-nez v3, :cond_1

    .line 49
    :cond_0
    :goto_0
    return v1

    .line 39
    :cond_1
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 40
    check-cast v0, Lcom/mpatric/mp3agic/ID3v2FrameSet;

    .line 41
    .local v0, other:Lcom/mpatric/mp3agic/ID3v2FrameSet;
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->id:Ljava/lang/String;

    if-nez v3, :cond_5

    .line 42
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->id:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 45
    :cond_3
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->frames:Ljava/util/ArrayList;

    if-nez v3, :cond_6

    .line 46
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->frames:Ljava/util/ArrayList;

    if-nez v3, :cond_0

    :cond_4
    move v1, v2

    .line 49
    goto :goto_0

    .line 43
    :cond_5
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->id:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 44
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->id:Ljava/lang/String;

    iget-object v4, v0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_0

    .line 47
    :cond_6
    iget-object v3, v0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->frames:Ljava/util/ArrayList;

    if-eqz v3, :cond_0

    .line 48
    iget-object v3, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->frames:Ljava/util/ArrayList;

    iget-object v4, v0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->frames:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    goto :goto_0
.end method

.method public getFrames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mpatric/mp3agic/ID3v2Frame;",
            ">;"
        }
    .end annotation

    .prologue
    .line 29
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->frames:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->id:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->id:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mpatric/mp3agic/ID3v2FrameSet;->frames:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
