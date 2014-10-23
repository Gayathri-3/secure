.class public Lcom/bv/sync/CifsSync$Options;
.super Ljava/lang/Object;
.source "CifsSync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/CifsSync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Options"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/CifsSync$Options$Direction;,
        Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;
    }
.end annotation


# instance fields
.field public direction:Lcom/bv/sync/CifsSync$Options$Direction;

.field public filters:[Lcom/bv/sync/IFileFilter;

.field public ignoreSymLinks:Z

.field public minFreeSpace:J

.field public mirror:Z

.field public overwrite:Z

.field public verifyTimeZone:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    sget-object v0, Lcom/bv/sync/CifsSync$Options$Direction;->Both:Lcom/bv/sync/CifsSync$Options$Direction;

    iput-object v0, p0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    .line 90
    sget-object v0, Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;->OneHour:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    iput-object v0, p0, Lcom/bv/sync/CifsSync$Options;->verifyTimeZone:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    .line 95
    return-void
.end method

.method public constructor <init>(Lcom/bv/sync/CifsSync$Options$Direction;ZLcom/bv/sync/CifsSync$Options$VerifyTimeZone;[Lcom/bv/sync/IFileFilter;)V
    .locals 0
    .parameter "direction"
    .parameter "overwrite"
    .parameter "verifyTimeZone"
    .parameter "filters"

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/bv/sync/CifsSync$Options;-><init>()V

    .line 99
    iput-object p1, p0, Lcom/bv/sync/CifsSync$Options;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    .line 100
    iput-boolean p2, p0, Lcom/bv/sync/CifsSync$Options;->overwrite:Z

    .line 101
    iput-object p3, p0, Lcom/bv/sync/CifsSync$Options;->verifyTimeZone:Lcom/bv/sync/CifsSync$Options$VerifyTimeZone;

    .line 102
    iput-object p4, p0, Lcom/bv/sync/CifsSync$Options;->filters:[Lcom/bv/sync/IFileFilter;

    .line 103
    return-void
.end method
