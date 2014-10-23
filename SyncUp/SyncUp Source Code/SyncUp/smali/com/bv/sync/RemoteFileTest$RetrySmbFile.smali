.class Lcom/bv/sync/RemoteFileTest$RetrySmbFile;
.super Ljcifs/smb/SmbFile;
.source "RemoteFileTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/RemoteFileTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RetrySmbFile"
.end annotation


# instance fields
.field private final exception:Ljcifs/smb/SmbException;

.field retryCount:I

.field final synthetic this$0:Lcom/bv/sync/RemoteFileTest;


# direct methods
.method public constructor <init>(Lcom/bv/sync/RemoteFileTest;Ljcifs/smb/SmbException;)V
    .locals 1
    .parameter
    .parameter "exception"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 72
    iput-object p1, p0, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->this$0:Lcom/bv/sync/RemoteFileTest;

    .line 73
    const-string v0, "smb://some/file"

    invoke-direct {p0, v0}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;)V

    .line 74
    iput-object p2, p0, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->exception:Ljcifs/smb/SmbException;

    .line 75
    return-void
.end method

.method private throwException()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 78
    iget v0, p0, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->retryCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->retryCount:I

    .line 79
    iget-object v0, p0, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->exception:Ljcifs/smb/SmbException;

    throw v0
.end method


# virtual methods
.method public canRead()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 103
    const/4 v0, 0x1

    return v0
.end method

.method public canWrite()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 109
    const/4 v0, 0x1

    return v0
.end method

.method public connect()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 115
    return-void
.end method

.method public copyTo(Ljcifs/smb/SmbFile;)V
    .locals 0
    .parameter "dest"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 148
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 149
    invoke-super {p0, p1}, Ljcifs/smb/SmbFile;->copyTo(Ljcifs/smb/SmbFile;)V

    .line 150
    return-void
.end method

.method public createNewFile()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 143
    invoke-super {p0}, Ljcifs/smb/SmbFile;->createNewFile()V

    .line 144
    return-void
.end method

.method public delete()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 120
    return-void
.end method

.method public exists()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 90
    const/4 v0, 0x1

    return v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 125
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 131
    invoke-super {p0}, Ljcifs/smb/SmbFile;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public getType()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 84
    const/16 v0, 0x8

    return v0
.end method

.method public isDirectory()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 97
    const/4 v0, 0x1

    return v0
.end method

.method public isHidden()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 160
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 161
    invoke-super {p0}, Ljcifs/smb/SmbFile;->isHidden()Z

    move-result v0

    return v0
.end method

.method public lastModified()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 136
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 137
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public length()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 154
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 155
    invoke-super {p0}, Ljcifs/smb/SmbFile;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public listFiles()[Ljcifs/smb/SmbFile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 166
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 167
    invoke-super {p0}, Ljcifs/smb/SmbFile;->listFiles()[Ljcifs/smb/SmbFile;

    move-result-object v0

    return-object v0
.end method

.method public mkdir()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 172
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 173
    invoke-super {p0}, Ljcifs/smb/SmbFile;->mkdir()V

    .line 174
    return-void
.end method

.method public renameTo(Ljcifs/smb/SmbFile;)V
    .locals 0
    .parameter "dest"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 178
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 179
    invoke-super {p0, p1}, Ljcifs/smb/SmbFile;->renameTo(Ljcifs/smb/SmbFile;)V

    .line 180
    return-void
.end method

.method public setLastModified(J)V
    .locals 0
    .parameter "time"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 184
    invoke-direct {p0}, Lcom/bv/sync/RemoteFileTest$RetrySmbFile;->throwException()V

    .line 185
    invoke-super {p0, p1, p2}, Ljcifs/smb/SmbFile;->setLastModified(J)V

    .line 186
    return-void
.end method
