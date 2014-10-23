.class Lcom/bv/wifisync/Hosts$4;
.super Ljava/lang/Object;
.source "Hosts.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/Hosts;->updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Hosts;

.field private final synthetic val$action:Lcom/bv/sync/ProgressNotification$ProgressAction;

.field private final synthetic val$file:Lcom/bv/sync/IFile;

.field private final synthetic val$percent:I


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Hosts;Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/Hosts$4;->this$0:Lcom/bv/wifisync/Hosts;

    iput-object p2, p0, Lcom/bv/wifisync/Hosts$4;->val$action:Lcom/bv/sync/ProgressNotification$ProgressAction;

    iput p3, p0, Lcom/bv/wifisync/Hosts$4;->val$percent:I

    iput-object p4, p0, Lcom/bv/wifisync/Hosts$4;->val$file:Lcom/bv/sync/IFile;

    .line 784
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/16 v3, 0x64

    .line 787
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$4;->this$0:Lcom/bv/wifisync/Hosts;

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/bv/wifisync/Hosts;->setProgressVisible(Z)V

    .line 788
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$4;->val$action:Lcom/bv/sync/ProgressNotification$ProgressAction;

    iget-object v4, p0, Lcom/bv/wifisync/Hosts$4;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-static {v2, v4}, Lcom/bv/wifisync/Utils;->getActionString(Lcom/bv/sync/ProgressNotification$ProgressAction;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 789
    .local v0, actionString:Ljava/lang/String;
    const-string v2, ""

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 790
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 791
    :cond_0
    move-object v1, v0

    .line 792
    .local v1, title:Ljava/lang/String;
    iget v2, p0, Lcom/bv/wifisync/Hosts$4;->val$percent:I

    if-eqz v2, :cond_1

    .line 793
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/bv/wifisync/Hosts$4;->val$percent:I

    if-le v2, v3, :cond_4

    move v2, v3

    :goto_0
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "%"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 794
    :cond_1
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$4;->val$file:Lcom/bv/sync/IFile;

    if-eqz v2, :cond_2

    .line 795
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/bv/wifisync/Hosts$4;->val$file:Lcom/bv/sync/IFile;

    invoke-interface {v4}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 796
    :cond_2
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$4;->this$0:Lcom/bv/wifisync/Hosts;

    invoke-virtual {v2}, Lcom/bv/wifisync/Hosts;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 797
    iget v2, p0, Lcom/bv/wifisync/Hosts$4;->val$percent:I

    if-gt v2, v3, :cond_3

    .line 798
    iget-object v2, p0, Lcom/bv/wifisync/Hosts$4;->this$0:Lcom/bv/wifisync/Hosts;

    iget v3, p0, Lcom/bv/wifisync/Hosts$4;->val$percent:I

    invoke-virtual {v2, v3, v1}, Lcom/bv/wifisync/Hosts;->setProgress(ILjava/lang/String;)V

    .line 800
    :cond_3
    return-void

    .line 793
    :cond_4
    iget v2, p0, Lcom/bv/wifisync/Hosts$4;->val$percent:I

    goto :goto_0
.end method
