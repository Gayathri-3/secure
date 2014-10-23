.class Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
.super Lcom/bv/wifisync/DirBrowser$Options;
.source "MultiSelectDirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/MultiSelectDirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MultiSelectOptions"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x596a867f8653745dL


# instance fields
.field selected:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser$Options;-><init>()V

    .line 32
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    .line 30
    return-void
.end method
