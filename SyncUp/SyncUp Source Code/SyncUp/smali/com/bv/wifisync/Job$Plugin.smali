.class interface abstract Lcom/bv/wifisync/Job$Plugin;
.super Ljava/lang/Object;
.source "Job.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Job;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "Plugin"
.end annotation


# virtual methods
.method public abstract clear()V
.end method

.method public abstract getChangedItems()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/bv/sync/MovedItem;",
            ">;"
        }
    .end annotation
.end method

.method public abstract run(Lcom/bv/wifisync/Job;Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
