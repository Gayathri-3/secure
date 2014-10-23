.class Lcom/bv/sync/RemoteFileTest$RetryException;
.super Ljcifs/smb/SmbException;
.source "RemoteFileTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/RemoteFileTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RetryException"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/RemoteFileTest;


# direct methods
.method private constructor <init>(Lcom/bv/sync/RemoteFileTest;)V
    .locals 2
    .parameter

    .prologue
    .line 25
    iput-object p1, p0, Lcom/bv/sync/RemoteFileTest$RetryException;->this$0:Lcom/bv/sync/RemoteFileTest;

    .line 26
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Ljcifs/smb/SmbException;-><init>(IZ)V

    .line 27
    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/sync/RemoteFileTest;Lcom/bv/sync/RemoteFileTest$RetryException;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/bv/sync/RemoteFileTest$RetryException;-><init>(Lcom/bv/sync/RemoteFileTest;)V

    return-void
.end method
