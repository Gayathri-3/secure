.class Lcom/bv/sync/RemoteFile$2;
.super Ljava/lang/Object;
.source "RemoteFile.java"

# interfaces
.implements Lcom/bv/sync/RemoteFile$IORunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/RemoteFile;->createFile(Ljava/lang/String;)Lcom/bv/sync/IFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bv/sync/RemoteFile$IORunnable",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/RemoteFile;

.field private final synthetic val$smbFile:Ljcifs/smb/SmbFile;


# direct methods
.method constructor <init>(Lcom/bv/sync/RemoteFile;Ljcifs/smb/SmbFile;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/RemoteFile$2;->this$0:Lcom/bv/sync/RemoteFile;

    iput-object p2, p0, Lcom/bv/sync/RemoteFile$2;->val$smbFile:Ljcifs/smb/SmbFile;

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile$2;->run()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public run()Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lcom/bv/sync/RemoteFile$2;->val$smbFile:Ljcifs/smb/SmbFile;

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->connect()V

    .line 88
    const/4 v0, 0x0

    return-object v0
.end method
