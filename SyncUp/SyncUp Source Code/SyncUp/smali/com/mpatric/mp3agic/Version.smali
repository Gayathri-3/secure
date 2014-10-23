.class public Lcom/mpatric/mp3agic/Version;
.super Ljava/lang/Object;
.source "Version.java"


# static fields
.field private static final MAJOR_VERSION:I = 0x0

.field private static final MINOR_VERSION:I = 0x6

.field private static final URL:Ljava/lang/String; = "http://github.com/mpatric/mp3agic"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/mpatric/mp3agic/Version;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/mpatric/mp3agic/Version;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMajorVersion()I
    .locals 1

    .prologue
    .line 12
    const/4 v0, 0x0

    return v0
.end method

.method public static getMinorVersion()I
    .locals 1

    .prologue
    .line 15
    const/4 v0, 0x6

    return v0
.end method

.method public static getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    const-string v0, "http://github.com/mpatric/mp3agic"

    return-object v0
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    const-string v0, "0.6"

    return-object v0
.end method
