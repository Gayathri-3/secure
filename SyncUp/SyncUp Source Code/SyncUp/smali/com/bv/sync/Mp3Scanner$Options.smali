.class public Lcom/bv/sync/Mp3Scanner$Options;
.super Ljava/lang/Object;
.source "Mp3Scanner.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/Mp3Scanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Options"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x6d83df330edfafe5L


# instance fields
.field public groupByAlbum:Z

.field public groupByArtist:Z

.field public renameSongs:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
