.class Lcom/bv/sync/DeleteTest$1;
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


# direct methods
.method constructor <init>(Lcom/bv/sync/DeleteTest;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/sync/DeleteTest$1;->this$0:Lcom/bv/sync/DeleteTest;

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z
    .locals 1
    .parameter "action"
    .parameter "percent"
    .parameter "file"

    .prologue
    .line 174
    const/4 v0, 0x0

    return v0
.end method
