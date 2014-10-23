.class public Lcom/bv/sync/MovedItem;
.super Lcom/bv/sync/SyncItem;
.source "MovedItem.java"


# instance fields
.field public final newPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JLjava/lang/String;Z)V
    .locals 8
    .parameter "absolutePath"
    .parameter "lastModified"
    .parameter "type"
    .parameter "size"
    .parameter "newPath"
    .parameter "isDirectory"

    .prologue
    .line 8
    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    move-wide v5, p5

    move/from16 v7, p8

    invoke-direct/range {v0 .. v7}, Lcom/bv/sync/SyncItem;-><init>(Ljava/lang/String;JLcom/bv/sync/SyncItem$Type;JZ)V

    .line 9
    iput-object p7, p0, Lcom/bv/sync/MovedItem;->newPath:Ljava/lang/String;

    .line 10
    return-void
.end method
