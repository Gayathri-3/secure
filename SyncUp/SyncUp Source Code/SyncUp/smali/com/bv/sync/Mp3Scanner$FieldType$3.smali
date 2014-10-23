.class enum Lcom/bv/sync/Mp3Scanner$FieldType$3;
.super Lcom/bv/sync/Mp3Scanner$FieldType;
.source "Mp3Scanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/Mp3Scanner$FieldType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4000
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 172
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/bv/sync/Mp3Scanner$FieldType;-><init>(Ljava/lang/String;ILcom/bv/sync/Mp3Scanner$FieldType;)V

    .line 1
    return-void
.end method


# virtual methods
.method getValue(Lcom/mpatric/mp3agic/ID3v1;)Ljava/lang/String;
    .locals 1
    .parameter "tag"

    .prologue
    .line 172
    invoke-interface {p1}, Lcom/mpatric/mp3agic/ID3v1;->getTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
