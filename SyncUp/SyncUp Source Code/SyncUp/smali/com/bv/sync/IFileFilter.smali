.class public interface abstract Lcom/bv/sync/IFileFilter;
.super Ljava/lang/Object;
.source "IFileFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/IFileFilter$Action;
    }
.end annotation


# virtual methods
.method public abstract accept(Lcom/bv/sync/IFile;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
