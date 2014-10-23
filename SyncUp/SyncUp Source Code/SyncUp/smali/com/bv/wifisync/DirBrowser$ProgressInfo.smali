.class Lcom/bv/wifisync/DirBrowser$ProgressInfo;
.super Ljava/lang/Object;
.source "DirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProgressInfo"
.end annotation


# instance fields
.field action:Lcom/bv/sync/ProgressNotification$ProgressAction;

.field file:Lcom/bv/sync/IFile;

.field percent:I

.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/DirBrowser;)V
    .locals 0
    .parameter

    .prologue
    .line 489
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$ProgressInfo;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$ProgressInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 489
    invoke-direct {p0, p1}, Lcom/bv/wifisync/DirBrowser$ProgressInfo;-><init>(Lcom/bv/wifisync/DirBrowser;)V

    return-void
.end method
