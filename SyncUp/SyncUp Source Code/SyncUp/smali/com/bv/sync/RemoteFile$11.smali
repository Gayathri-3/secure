.class Lcom/bv/sync/RemoteFile$11;
.super Ljava/lang/Object;
.source "RemoteFile.java"

# interfaces
.implements Ljcifs/smb/SmbFileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/RemoteFile;->listFiles(Lcom/bv/sync/IFileFilter;)[Lcom/bv/sync/IFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/RemoteFile;

.field private final synthetic val$filter:Lcom/bv/sync/IFileFilter;


# direct methods
.method constructor <init>(Lcom/bv/sync/RemoteFile;Lcom/bv/sync/IFileFilter;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/RemoteFile$11;->this$0:Lcom/bv/sync/RemoteFile;

    iput-object p2, p0, Lcom/bv/sync/RemoteFile$11;->val$filter:Lcom/bv/sync/IFileFilter;

    .line 341
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljcifs/smb/SmbFile;)Z
    .locals 7
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 345
    :try_start_0
    iget-object v3, p0, Lcom/bv/sync/RemoteFile$11;->val$filter:Lcom/bv/sync/IFileFilter;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/bv/sync/RemoteFile$11;->val$filter:Lcom/bv/sync/IFileFilter;

    new-instance v4, Lcom/bv/sync/RemoteFile;

    iget-object v5, p0, Lcom/bv/sync/RemoteFile$11;->this$0:Lcom/bv/sync/RemoteFile;

    iget-object v6, p0, Lcom/bv/sync/RemoteFile$11;->this$0:Lcom/bv/sync/RemoteFile;

    #getter for: Lcom/bv/sync/RemoteFile;->ntlm:Ljcifs/smb/NtlmPasswordAuthentication;
    invoke-static {v6}, Lcom/bv/sync/RemoteFile;->access$2(Lcom/bv/sync/RemoteFile;)Ljcifs/smb/NtlmPasswordAuthentication;

    move-result-object v6

    invoke-direct {v4, p1, v5, v6}, Lcom/bv/sync/RemoteFile;-><init>(Ljcifs/smb/SmbFile;Lcom/bv/sync/IFile;Ljcifs/smb/NtlmPasswordAuthentication;)V

    invoke-interface {v3, v4}, Lcom/bv/sync/IFileFilter;->accept(Lcom/bv/sync/IFile;)Z
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, 0x0

    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x1

    goto :goto_0

    .line 346
    :catch_0
    move-exception v0

    .line 347
    .local v0, e:Ljcifs/smb/SmbException;
    throw v0

    .line 348
    .end local v0           #e:Ljcifs/smb/SmbException;
    :catch_1
    move-exception v1

    .line 349
    .local v1, e1:Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    .line 350
    .local v2, error:Ljava/lang/RuntimeException;
    invoke-virtual {v2, v1}, Ljava/lang/RuntimeException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 351
    throw v2
.end method
