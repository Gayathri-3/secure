.class final Lcom/bv/wifisync/DirBrowser$NameComparator;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "NameComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/bv/wifisync/DirBrowser$FileInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/DirBrowser;)V
    .locals 0
    .parameter

    .prologue
    .line 875
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$NameComparator;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$NameComparator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 875
    invoke-direct {p0, p1}, Lcom/bv/wifisync/DirBrowser$NameComparator;-><init>(Lcom/bv/wifisync/DirBrowser;)V

    return-void
.end method


# virtual methods
.method public compare(Lcom/bv/wifisync/DirBrowser$FileInfo;Lcom/bv/wifisync/DirBrowser$FileInfo;)I
    .locals 2
    .parameter "object1"
    .parameter "object2"

    .prologue
    .line 878
    iget-object v0, p1, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p2, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/wifisync/DirBrowser$FileInfo;

    check-cast p2, Lcom/bv/wifisync/DirBrowser$FileInfo;

    invoke-virtual {p0, p1, p2}, Lcom/bv/wifisync/DirBrowser$NameComparator;->compare(Lcom/bv/wifisync/DirBrowser$FileInfo;Lcom/bv/wifisync/DirBrowser$FileInfo;)I

    move-result v0

    return v0
.end method
