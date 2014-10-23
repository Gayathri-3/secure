.class Lcom/bv/sync/Mp3Scanner$DefaultParser;
.super Ljava/lang/Object;
.source "Mp3Scanner.java"

# interfaces
.implements Lcom/bv/sync/Mp3Scanner$Parser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/Mp3Scanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DefaultParser"
.end annotation


# instance fields
.field private file:Lcom/mpatric/mp3agic/Mp3File;

.field final synthetic this$0:Lcom/bv/sync/Mp3Scanner;


# direct methods
.method private constructor <init>(Lcom/bv/sync/Mp3Scanner;)V
    .locals 0
    .parameter

    .prologue
    .line 41
    iput-object p1, p0, Lcom/bv/sync/Mp3Scanner$DefaultParser;->this$0:Lcom/bv/sync/Mp3Scanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/sync/Mp3Scanner;Lcom/bv/sync/Mp3Scanner$DefaultParser;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/bv/sync/Mp3Scanner$DefaultParser;-><init>(Lcom/bv/sync/Mp3Scanner;)V

    return-void
.end method


# virtual methods
.method public getField(Lcom/bv/sync/Mp3Scanner$FieldType;)Ljava/lang/String;
    .locals 5
    .parameter "fieldType"

    .prologue
    .line 57
    const/4 v1, 0x0

    .line 58
    .local v1, result:Ljava/lang/String;
    iget-object v4, p0, Lcom/bv/sync/Mp3Scanner$DefaultParser;->file:Lcom/mpatric/mp3agic/Mp3File;

    if-eqz v4, :cond_1

    .line 60
    :try_start_0
    iget-object v4, p0, Lcom/bv/sync/Mp3Scanner$DefaultParser;->file:Lcom/mpatric/mp3agic/Mp3File;

    invoke-virtual {v4}, Lcom/mpatric/mp3agic/Mp3File;->getId3v2Tag()Lcom/mpatric/mp3agic/ID3v2;

    move-result-object v3

    .line 61
    .local v3, tag2:Lcom/mpatric/mp3agic/ID3v2;
    if-eqz v3, :cond_0

    .line 62
    invoke-virtual {p1, v3}, Lcom/bv/sync/Mp3Scanner$FieldType;->getValue(Lcom/mpatric/mp3agic/ID3v1;)Ljava/lang/String;

    move-result-object v1

    .line 63
    :cond_0
    if-nez v1, :cond_1

    .line 64
    iget-object v4, p0, Lcom/bv/sync/Mp3Scanner$DefaultParser;->file:Lcom/mpatric/mp3agic/Mp3File;

    invoke-virtual {v4}, Lcom/mpatric/mp3agic/Mp3File;->getId3v1Tag()Lcom/mpatric/mp3agic/ID3v1;

    move-result-object v2

    .line 65
    .local v2, tag1:Lcom/mpatric/mp3agic/ID3v1;
    if-eqz v2, :cond_1

    .line 66
    invoke-virtual {p1, v2}, Lcom/bv/sync/Mp3Scanner$FieldType;->getValue(Lcom/mpatric/mp3agic/ID3v1;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 72
    .end local v2           #tag1:Lcom/mpatric/mp3agic/ID3v1;
    .end local v3           #tag2:Lcom/mpatric/mp3agic/ID3v2;
    :cond_1
    :goto_0
    return-object v1

    .line 68
    :catch_0
    move-exception v0

    .line 69
    .local v0, e:Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0
.end method

.method public parse(Ljava/lang/String;)V
    .locals 3
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    :try_start_0
    new-instance v1, Lcom/mpatric/mp3agic/Mp3File;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lcom/mpatric/mp3agic/Mp3File;-><init>(Ljava/lang/String;Z)V

    iput-object v1, p0, Lcom/bv/sync/Mp3Scanner$DefaultParser;->file:Lcom/mpatric/mp3agic/Mp3File;
    :try_end_0
    .catch Lcom/mpatric/mp3agic/UnsupportedTagException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/mpatric/mp3agic/InvalidDataException; {:try_start_0 .. :try_end_0} :catch_1

    .line 53
    :goto_0
    return-void

    .line 48
    :catch_0
    move-exception v0

    .line 49
    .local v0, e:Lcom/mpatric/mp3agic/UnsupportedTagException;
    invoke-virtual {v0}, Lcom/mpatric/mp3agic/UnsupportedTagException;->printStackTrace()V

    goto :goto_0

    .line 50
    .end local v0           #e:Lcom/mpatric/mp3agic/UnsupportedTagException;
    :catch_1
    move-exception v0

    .line 51
    .local v0, e:Lcom/mpatric/mp3agic/InvalidDataException;
    invoke-virtual {v0}, Lcom/mpatric/mp3agic/InvalidDataException;->printStackTrace()V

    goto :goto_0
.end method
