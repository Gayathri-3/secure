.class Lcom/bv/wifisync/AddExtensions$ExtensionScanner;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "AddExtensions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddExtensions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExtensionScanner"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddExtensions;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddExtensions;)V
    .locals 1
    .parameter

    .prologue
    .line 182
    iput-object p1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    .line 183
    const-string v0, "ExtensionScanner"

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 184
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddExtensions;->setProgressVisible(Z)V

    .line 185
    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/AddExtensions$ExtensionScanner;)Lcom/bv/wifisync/AddExtensions;
    .locals 1
    .parameter

    .prologue
    .line 181
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    return-object v0
.end method

.method private add(Ljava/lang/String;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 242
    if-eqz p1, :cond_0

    .line 243
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    new-instance v1, Lcom/bv/wifisync/AddExtensions$ExtensionScanner$1;

    invoke-direct {v1, p0, p1}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner$1;-><init>(Lcom/bv/wifisync/AddExtensions$ExtensionScanner;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddExtensions;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 249
    :cond_0
    return-void
.end method

.method private extractExtension(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "path"

    .prologue
    .line 252
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 253
    .local v0, index:I
    if-lez v0, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private fill(Lcom/bv/sync/IFile;)V
    .locals 8
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 221
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->isCancelled()Z

    move-result v4

    if-nez v4, :cond_1

    .line 222
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 223
    .local v1, now:J
    iget-object v4, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->lastAddTime:J
    invoke-static {v4}, Lcom/bv/wifisync/AddExtensions;->access$8(Lcom/bv/wifisync/AddExtensions;)J

    move-result-wide v4

    sub-long v4, v1, v4

    const-wide/16 v6, 0x32

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 224
    iget-object v4, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    #setter for: Lcom/bv/wifisync/AddExtensions;->lastAddTime:J
    invoke-static {v4, v1, v2}, Lcom/bv/wifisync/AddExtensions;->access$9(Lcom/bv/wifisync/AddExtensions;J)V

    .line 225
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-virtual {p0, v4}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->publishProgress([Ljava/lang/Object;)V

    .line 227
    :cond_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_2

    .line 228
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->extractExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->add(Ljava/lang/String;)V

    .line 233
    .end local v1           #now:J
    :cond_1
    return-void

    .line 229
    .restart local v1       #now:J
    :cond_2
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->isValidDir(Lcom/bv/sync/IFile;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 230
    invoke-interface {p1}, Lcom/bv/sync/IFile;->listFiles()[Lcom/bv/sync/IFile;

    move-result-object v4

    array-length v5, v4

    :goto_0
    if-ge v3, v5, :cond_1

    aget-object v0, v4, v3

    .line 231
    .local v0, child:Lcom/bv/sync/IFile;
    invoke-direct {p0, v0}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->fill(Lcom/bv/sync/IFile;)V

    .line 230
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private isValidDir(Lcom/bv/sync/IFile;)Z
    .locals 1
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    invoke-static {v0}, Lcom/bv/wifisync/Config;->getIgnoreSymLinks(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/bv/sync/IFile;->isSymlink()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-interface {p1}, Lcom/bv/sync/IFile;->canRead()Z

    move-result v0

    if-nez v0, :cond_2

    .line 237
    :cond_1
    const/4 v0, 0x0

    .line 238
    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected bridge varargs synthetic atBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->atBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs atBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 4
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 190
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddExtensions;->access$7(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/Job;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 191
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddExtensions;->access$7(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/Job;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Job;->getLocalFolder(Landroid/content/Context;)Lcom/bv/sync/LocalFile;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->fill(Lcom/bv/sync/IFile;)V

    .line 192
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddExtensions;->access$7(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/Job;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 193
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddExtensions;->access$7(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/Job;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/Job;->getRemoteFolder(Landroid/content/Context;)Lcom/bv/sync/RemoteFile;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->fill(Lcom/bv/sync/IFile;)V
    :try_end_0
    .catch Ljava/lang/StackOverflowError; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    :cond_1
    const/4 v1, 0x0

    return-object v1

    .line 194
    :catch_0
    move-exception v0

    .line 195
    .local v0, e:Ljava/lang/StackOverflowError;
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    .line 196
    new-instance v1, Ljava/io/IOException;

    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    const v3, 0x7f0600af

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddExtensions;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected onCancelled()V
    .locals 2

    .prologue
    .line 208
    invoke-super {p0}, Lcom/bv/wifisync/Utils$ProgressTask;->onCancelled()V

    .line 209
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddExtensions;->setProgressVisible(Z)V

    .line 210
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddExtensions;->access$5(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->notifyDataSetChanged()V

    .line 211
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2
    .parameter "result"

    .prologue
    .line 215
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 216
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddExtensions;->setProgressVisible(Z)V

    .line 217
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddExtensions;->access$5(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->notifyDataSetChanged()V

    .line 218
    return-void
.end method

.method protected bridge varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->onProgressUpdate([Ljava/lang/String;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/String;)V
    .locals 3
    .parameter "values"

    .prologue
    const/4 v2, 0x0

    .line 203
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;

    aget-object v1, p1, v2

    invoke-virtual {v0, v2, v1}, Lcom/bv/wifisync/AddExtensions;->setProgress(ILjava/lang/String;)V

    .line 204
    return-void
.end method
