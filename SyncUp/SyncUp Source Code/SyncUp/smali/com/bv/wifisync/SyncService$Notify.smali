.class interface abstract Lcom/bv/wifisync/SyncService$Notify;
.super Ljava/lang/Object;
.source "SyncService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/SyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "Notify"
.end annotation


# virtual methods
.method public abstract onProgress(Lcom/bv/wifisync/Job;Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z
.end method

.method public abstract update(Lcom/bv/wifisync/Job;Z)V
.end method
