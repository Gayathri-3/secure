.class public Lcom/bv/sync/ImageScanner$Options;
.super Ljava/lang/Object;
.source "ImageScanner.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/ImageScanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Options"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3b8353e67591fd5dL


# instance fields
.field public doubleDigitDay:Z

.field public groupByAddress:Z

.field public groupByDay:Z

.field public groupByMonth:Z

.field public groupByYear:Z

.field public groupVideos:Z

.field public numericMonth:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
