.class Lcom/bv/sync/RemoteFile$12;
.super Ljava/lang/Object;
.source "RemoteFile.java"

# interfaces
.implements Lcom/bv/sync/RemoteFile$IORunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/RemoteFile;->listFiles(Lcom/bv/sync/IFileFilter;)[Lcom/bv/sync/IFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bv/sync/RemoteFile$IORunnable",
        "<[",
        "Ljcifs/smb/SmbFile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/RemoteFile;

.field private final synthetic val$smbFilter:Ljcifs/smb/SmbFileFilter;


# direct methods
.method constructor <init>(Lcom/bv/sync/RemoteFile;Ljcifs/smb/SmbFileFilter;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/RemoteFile$12;->this$0:Lcom/bv/sync/RemoteFile;

    iput-object p2, p0, Lcom/bv/sync/RemoteFile$12;->val$smbFilter:Ljcifs/smb/SmbFileFilter;

    .line 357
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
    invoke-virtual {p0}, Lcom/bv/sync/RemoteFile$12;->run()[Ljcifs/smb/SmbFile;

    move-result-object v0

    return-object v0
.end method

.method public run()[Ljcifs/smb/SmbFile;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 360
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-static {}, Lcom/bv/sync/RemoteFile;->access$0()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 370
    iget-object v2, p0, Lcom/bv/sync/RemoteFile$12;->this$0:Lcom/bv/sync/RemoteFile;

    #getter for: Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;
    invoke-static {v2}, Lcom/bv/sync/RemoteFile;->access$1(Lcom/bv/sync/RemoteFile;)Ljcifs/smb/SmbFile;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/sync/RemoteFile$12;->val$smbFilter:Ljcifs/smb/SmbFileFilter;

    invoke-virtual {v2, v3}, Ljcifs/smb/SmbFile;->listFiles(Ljcifs/smb/SmbFileFilter;)[Ljcifs/smb/SmbFile;

    move-result-object v2

    :goto_1
    return-object v2

    .line 362
    :cond_0
    if-eqz v1, :cond_1

    .line 363
    :try_start_0
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Retry "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 364
    :cond_1
    iget-object v2, p0, Lcom/bv/sync/RemoteFile$12;->this$0:Lcom/bv/sync/RemoteFile;

    #getter for: Lcom/bv/sync/RemoteFile;->file:Ljcifs/smb/SmbFile;
    invoke-static {v2}, Lcom/bv/sync/RemoteFile;->access$1(Lcom/bv/sync/RemoteFile;)Ljcifs/smb/SmbFile;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/sync/RemoteFile$12;->val$smbFilter:Ljcifs/smb/SmbFileFilter;

    invoke-virtual {v2, v3}, Ljcifs/smb/SmbFile;->listFiles(Ljcifs/smb/SmbFileFilter;)[Ljcifs/smb/SmbFile;
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_1

    .line 365
    :catch_0
    move-exception v0

    .line 366
    .local v0, e:Ljcifs/smb/SmbException;
    invoke-virtual {v0}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v2

    const v3, -0x3ffffff8

    if-eq v2, v3, :cond_2

    .line 367
    throw v0

    .line 360
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
