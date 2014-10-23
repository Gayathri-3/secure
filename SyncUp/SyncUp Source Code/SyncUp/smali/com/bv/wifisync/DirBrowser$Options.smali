.class Lcom/bv/wifisync/DirBrowser$Options;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Options"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x6eee883315febc42L


# instance fields
.field readOnly:Z

.field requestCode:Ljava/lang/Integer;

.field showButton:Z

.field showSelection:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/wifisync/DirBrowser$Options;->showButton:Z

    .line 82
    return-void
.end method
