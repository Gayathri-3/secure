.class public Lcom/mpatric/mp3agic/NotSupportedException;
.super Lcom/mpatric/mp3agic/BaseException;
.source "NotSupportedException.java"


# static fields
.field private static final serialVersionUID:J = -0x65994b098b1a2103L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/mpatric/mp3agic/BaseException;-><init>()V

    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/mpatric/mp3agic/BaseException;-><init>(Ljava/lang/String;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "message"
    .parameter "cause"

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Lcom/mpatric/mp3agic/BaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    return-void
.end method
