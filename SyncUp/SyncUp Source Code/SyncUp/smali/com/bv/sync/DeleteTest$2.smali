.class Lcom/bv/sync/DeleteTest$2;
.super Ljava/lang/Object;
.source "DeleteTest.java"

# interfaces
.implements Lcom/bv/sync/ProgressNotification;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/sync/DeleteTest;->testDeleteFail()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/sync/DeleteTest;

.field private final synthetic val$deleted:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/bv/sync/DeleteTest;Ljava/util/List;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/DeleteTest$2;->this$0:Lcom/bv/sync/DeleteTest;

    iput-object p2, p0, Lcom/bv/sync/DeleteTest$2;->val$deleted:Ljava/util/List;

    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z
    .locals 4
    .parameter "action"
    .parameter "percent"
    .parameter "file"

    .prologue
    const/4 v0, 0x1

    .line 183
    sget-object v1, Lcom/bv/sync/ProgressNotification$ProgressAction;->Listing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    if-ne p1, v1, :cond_1

    .line 186
    :cond_0
    :goto_0
    return v0

    .line 185
    :cond_1
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Update: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p3}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 186
    iget-object v1, p0, Lcom/bv/sync/DeleteTest$2;->this$0:Lcom/bv/sync/DeleteTest;

    iget-object v2, p0, Lcom/bv/sync/DeleteTest$2;->val$deleted:Ljava/util/List;

    #calls: Lcom/bv/sync/DeleteTest;->contains(Ljava/util/List;Lcom/bv/sync/IFile;)Z
    invoke-static {v1, v2, p3}, Lcom/bv/sync/DeleteTest;->access$0(Lcom/bv/sync/DeleteTest;Ljava/util/List;Lcom/bv/sync/IFile;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method
